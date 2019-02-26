<?php

namespace Application\Modules\Api\Controllers;

use Phalcon\Mvc\Controller;

abstract class ControllerBase extends Controller
{

    public $params;

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

