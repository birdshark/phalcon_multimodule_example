<?php

namespace Application\Modules\Api\Controllers;

use Application\Modules\Api\Plugins\TokenPlugin;
use Phalcon\Acl;
use Phalcon\Mvc\Controller;

abstract class ControllerBase extends Controller
{

    public $params;
    public $roles;
    public $author_id;
    public $deny = false;

    public function beforeExecuteRoute(){
        // deal with request type about payload
        $contentType  = $this->request->getBestAccept();
        if ($contentType === 'application/json') {
            $rawBody = $this->request->getJsonRawBody(true);
            $this->params = $rawBody;
        }else{
            if($this->request->isGet()){
                $this->params = $this->request->getQuery();
            }
            if($this->request->isPost()){
                $this->params = $this->request->getPost();
            }
        }


        if(!$this->request->isOptions()){
            $admin_info = auth_code($this->params['token']);
            list($this->author_id,$this->roles) = explode('|',$admin_info);

            if ($this->roles) {
                $this->roles = explode(',',$this->roles);
            }else{
                $this->roles = array('guest');
            }
            $controller = $this->dispatcher->getControllerName();
            $action = $this->dispatcher->getActionName();
            $acl = TokenPlugin::getInitAcl('acl');
            $allowed_set = array();


            foreach ($this->roles as $index => $role){
                $var_key = 'allowed'.$index;
                $$var_key = $acl->isAllowed($role, $controller, $action);
                $allowed_set[] = $$var_key;
            }

            if (array_sum($allowed_set) == Acl::DENY) {
                $this->deny = true;
            }
        }
    }

    protected function OnConstruct(){

    }

    public function initialize(){

    }

    public function afterExecuteRoute()
    {
        //设置返回头部，允许跨域
        $this->response->setHeader("Access-Control-Allow-Origin", "*");
        $this->response->setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    }

    /**
     * 获取参数
     * @param string $name
     * @param string $filters
     * @param mixed $defaultValue
     * @return mixed|null
     */
    public function getParams($name = null, $filters = null, $defaultValue = null){

        if($name === null){
            return $this->params;
        }

        if(function_exists($filters)){
            $data = call_user_func($filters,$this->params[$name]);
            return $data;
        }
        return isset($this->params[$name])?$this->params[$name]:$defaultValue;
    }
}

