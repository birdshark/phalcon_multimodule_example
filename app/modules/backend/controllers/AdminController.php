<?php
namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Admins;
use Application\Common\Models\Roles;

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
        if($this->request->isAjax()){
            $aid = $this->request->get('aid',null,0);
            $roles = Roles::find();
            $admin_roles = (new Admins())->getRole($aid);
            $admin_roles = pluck($admin_roles,'id');
            $this->view->setVars(['admin_roles'=>$admin_roles,'roles'=>$roles]);
            return $this->view->pick('admin/role');
        }else{
            $aid = $this->request->get('aid',null,0);
            $roles = Roles::find();
            $admin_roles = (new Admins())->getRole($aid);
            $this->view->setVars(['admin_roles'=>$admin_roles,'roles'=>$roles]);
            return $this->view->pick('admin/role');
        }
    }

}

