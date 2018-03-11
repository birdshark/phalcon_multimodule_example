<?php
namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Admins;

class AdminController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function pickAction(){

    }

    public function addAction(){
        if($this->request->isPost()){
            $input = $this->request->getPost();
            $admins = new Admins();
            $validate = $admins->validation($input);
            if(!$validate){
                $first_message = array_shift($admins->getMessages());
                $this->view->setVars(['flag'=>'time','message'=>$first_message->getMessage(),'jumpUrl'=>'']);
            }else{
                if ($this->security->checkToken()) {
                    $input['password'] = $this->security->hash($input['password']);
                    $result = $admins->create($input);
                    if($result){
                        $this->view->setVars(['flag'=>'time','message'=>'添加成功','jumpUrl'=>'']);
                    }else{
                        $this->view->setVars(['flag'=>'time','message'=>'添加失败','jumpUrl'=>'']);
                    }
                }
            }
            return $this->view->pick('public/jump');
        }else{
            $info = new Admins();
            $this->view->setVar('info',$info);
        }
    }

    public function listAction(){
        if($this->request->isAjax()){
            $offset = $this->request->get('offset',null,0);
            $limit = $this->request->get('limit',null,0);
            $where = array();
            $fields = array('id','name','email');
            $total = Admins::adminCount($where);
            $rows = Admins::adminList($where,$offset,$limit,$fields);
            $data = array( 'total'=> $total , 'rows'=> $rows);
            return $this->response->setJsonContent($data);
        }
    }

    public function roleAction(){

    }

}

