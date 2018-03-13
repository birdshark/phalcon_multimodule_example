<?php
namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Admins;
use Application\Common\Models\Permissions;
use Application\Common\Models\Roles;

class RoleController extends ControllerBase
{
    public function permissionAction(){
        if($this->request->isAjax()){
            $permissions = Permissions::find();
            $rid = $this->request->get('rid',null,0);
            $role = Roles::findFirst($rid);
            $perms = $role->PermissionRole->toArray();
            $perms = pluck($perms,array('permission_id'));
            $this->view->setVars(['permissions'=>$permissions,'perms_ids'=>$perms]);
        }
    }

    /**
     * @param 
     * @return mixed
     */
    public function listAction(){
        if($this->request->isAjax()){
            $where = array();
            $offset = $this->request->get('offset',null,0);
            $limit = $this->request->get('limit',null,5);
            $filed = array('*');
            $total = Roles::roleCount($where);
            $rows = Roles::roleList($filed,$where,$offset,$limit);
            $data = array('total'=> $total,'rows'=> $rows);
            return $this->response->setJsonContent($data);
        }
    }

    public function addAction(){
        if($this->request->isPost()){
            $input = $this->request->getPost();
            $role = new Roles();
            $result = $role->create($input);
            if(!$result){
                $this->view->setVars(['flag'=>'time','message'=>'添加失败!']);
                return $this->view->pick('public/jump');
            }else{
                $this->view->setVars(['flag'=>'time','message'=>'添加成功!']);
                return $this->view->pick('public/jump');
            }
        }else{
            $info = new Roles();
            $this->view->setVar('info',$info);
        }
    }

    public function editAction($id){
        if($this->request->isPost()){
            $input = $this->request->getPost();
            $roles = new Roles();
            $result = $roles->save($input);
            if (!$result){
                $this->view->setVars(['flag'=>'time','message'=>'修改失败!']);
                return $this->view->pick('public/fails');
            }else{
                $this->view->setVars(['flag'=>'check','message'=>'修改成功!']);
                return $this->view->pick('public/close');

            }
        }else{
            $info = Roles::findFirst($id);
            $this->view->setVar('info',$info);
            return $this->view->pick('role/add');
        }
    }

    public function assignmentAction(){
        if($this->request->isAjax()) {


        }elseif($this->request->isPost()){
            $role_ids = $this->request->get('role_ids',null,array());
            $old_role_ids = $this->request->get('old_role_ids',null,array());
            $aid = $this->request->get('admin_id',null,0);
            $admin =  Admins::findFirst($aid);
            $old_roles = Roles::roleList('*',array('id','in',$old_role_ids));
            $old_roles = pluck($old_roles,array('id'));
            $roles = Roles::roleList('*',array('id','in',$role_ids));
            $roles = pluck($roles,array('id'));
            if($old_roles){
                $admin->detachRoles(array(array('role_id','in',$old_roles)));
                $admin->attachRoles($roles);
            }else{
                $admin->attachRoles($roles);
            }
            $this->view->setVars(['flag'=>'smile-o','message'=>'修改成功!']);
            return $this->view->pick('public/jump');

        }else{
            $roles = Roles::find();
            $this->view->setVar('roles' , $roles);
        }
    }

    public function deleteAction(){
        if($this->request->isAjax()){
            $id = $this->request->getPost('id');
            try{
                $result = Roles::findFirst($id)->delete();
                if(!$result){
                    return $this->response->setJsonContent(['status='>0,'msg'=>'删除失败']);
                }else{
                    return $this->response->setJsonContent(['status'=>1,'msg'=>'删除成功']);
                }
            }catch (\Exception $e){
                return $this->response->setJsonContent(['status='>0,'msg'=>$e->getMessage()]);
            }
        }
    }
}

