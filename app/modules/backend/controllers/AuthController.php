<?php

namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Admins;
use Application\Common\Models\RoleAdmin;

class AuthController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        if($this->session->has('auth')){
            $this->response->redirect("/backend/index/index")->sendHeaders();
        }
    }

    public function indexAction()
    {

    }

    public function forgotAction()
    {
    }
    
    public function registerAction()
    {
    }
    private function _registerSession($admin,$roles_info){
        list($roles_name,$roles_id) = $roles_info;
        $this->session->set('auth',array('role'=>$roles_name,'avatar'=>$admin->avatar,'nick'=>$admin->nick,'name'=>$admin->name,'roles_id'=>$roles_id));
    }

    public function startAction(){
        if($this->request->isPost()){
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');

            $admin = Admins::findFirst(array(
                "email = :email:",
                'bind' => array(
                    'email'    => $email,
                )
            ));
            if(!$admin){
                $this->flash->error('admin not exist');
                return $this->dispatcher->forward('auth/index');
            }
            if($this->security->checkHash($password, $admin->password)){
                $roles_info = (new RoleAdmin())->getRole($admin->id);
                $roles_info = array(pluck($roles_info,['name']),implode(',',pluck($roles_info,['id'])));
                $this->_registerSession($admin, $roles_info);
                $this->response->redirect("/backend/index/index")->sendHeaders();
            }else{
                $this->flash->error('password not match');
            }
        }
        return $this->dispatcher->forward(['controller'=>'auth','action'=>'index']);
    }

    public function logoutAction(){
        $this->session->destroy('auth');
        $this->response->redirect("/backend/auth/index")->sendHeaders();
    }


}

