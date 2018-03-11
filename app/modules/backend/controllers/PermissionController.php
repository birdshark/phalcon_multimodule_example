<?php
namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Permissions;
use Application\Common\Models\Roles;

class PermissionController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function addAction(){
        if($this->request->isPost()){
            $input = $this->request->getPost();
            $permission = new Permissions();
            $validate = $permission->validation($input);
            if(!$validate){
                $first_message = array_shift($permission->getMessages());
                $this->view->setVars(['flag'=>'time','message'=>$first_message->getMessage(),'jumpUrl'=>'']);
            }else{
                $result = $permission->create($input);
                if($result){
                    $this->view->setVars(['flag'=>'check','message'=>'添加成功!','jumpUrl'=>'']);
                }else{
                    $this->view->setVars(['flag'=>'time','message'=>'添加失败!','jumpUrl'=>'']);
                }
            }
            return $this->view->pick('public/jump');
        } else {
            $info = new Permissions();
            $this->view->setVar('info',$info);
        }
    }

    public function assignmentAction(){
        if($this->request->isAjax()){
            $roles = Roles::find(['id', 'name', 'display_name']);
            return view('backend.permission.assignment', ['roles' => $roles]);
        }
        elseif($this->request->isPost()) {
            $role_id = $this->request->get('role_id',null,0);
            $permission_ids = $this->request->get('role_id',null,array());
            $old_perms_ids = $this->request->get('role_id',null,array());
            $role = Roles::findFirst($role_id);
            $permissions = Permissions::find('id',$permission_ids);
            $old_permissions = Permissions::whereIn('id',$old_perms_ids);
            return view('backend.public.jump',['flag'=>'smile-o','message'=>'修改成功!']);
        }else{
            $roles = Roles::find();
            $this->view->setVar('roles', $roles);
        }
    }

    public function listAction(){

    }

}

