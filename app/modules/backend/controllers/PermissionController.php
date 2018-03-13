<?php
namespace Application\Modules\Backend\Controllers;

use Application\Common\Models\Permissions;
use Application\Common\Models\Roles;

class PermissionController extends ControllerBase
{

    public function addAction(){
        if($this->request->isPost()){
            $input = $this->request->getPost();
            $permission = new Permissions();
            $result = $permission->create($input);
            if(!$result){
                $first_message = array_shift($permission->getMessages());
                $this->view->setVars(['flag'=>'time','message'=>$first_message->getMessage(),'jumpUrl'=>'']);
            }else{
                $this->view->setVars(['flag'=>'check','message'=>'添加成功!','jumpUrl'=>'']);
            }
            return $this->view->pick('public/jump');
        } else {
            $info = new Permissions();
            $this->view->setVar('info',$info);
        }
    }

    public function assignmentAction(){
        if($this->request->isAjax()){
            $roles = Roles::find();
            $this->view->setVars(['roles' => $roles]);
            $this->view->pick('permission/assignment');
        }
        elseif($this->request->isPost()) {
            $role_id = $this->request->get('role_id',null,0);
            $permission_ids = $this->request->get('permission_ids',null,array());
            $old_perms_ids = $this->request->get('old_perms_ids',null,array());
            $role = Roles::findFirst($role_id);
            $old_permissions = Permissions::permissionList('*',array('id','in',$old_perms_ids));
            $role->detachPermissions(array(array('permission_id','in',pluck($old_permissions,array('id')))));
            if(!empty($permission_ids)){
                $permissions = Permissions::permissionList('*',array('id','in',$permission_ids));
                $role->attachPermissions(pluck($permissions,array('id')));
            }
            $this->view->setVars(['flag'=>'smile-o','message'=>'修改成功!']);
            return $this->view->pick('public/jump');
        }else{
            $roles = Roles::find();
            $this->view->setVar('roles', $roles);
        }
    }

    public function listAction(){
        if($this->request->isAjax()){
            $where = array();
            $offset = $this->request->get('offset',null,0);
            $limit = $this->request->get('limit',null,5);
            $filed = array('*');
            $total = Permissions::permissionCount($where);
            $rows = Permissions::permissionList($filed,$where,$offset,$limit);
            $data = array( 'total'=> $total , 'rows'=> $rows  );
            return $this->response->setJsonContent($data);
        }
    }

    public function editAction($id){
        if($this->request->isPost()){
            $permission = new Permissions();
            $input = $this->request->getPost();
            $validate = $permission->save($input);
            if (!$validate){
                $first_message = array_shift($permission->getMessages());
                if($this->request->isAjax()){
                    return $this->response->setJsonContent(['flag'=>'check','message'=>$first_message->getMessage()]);
                }else{
                    $this->view->setVars(['flag'=>'check','message'=>$first_message->getMessage(),'jumpUrl'=>'']);
                    return $this->view->pick('public/fails');
                }
            }else{
                if($this->request->isAjax()){
                    return $this->response->setJsonContent(['flag'=>'check','message'=>'修改成功!']);
                }else{
                    $this->view->setVars(['flag'=>'check','message'=>'修改成功!','jumpUrl'=>'']);
                    return $this->view->pick('public/close');
                }
            }
        }else{
            $info = Permissions::findFirst($id);
            $this->view->setVar('info',$info);
            return $this->view->pick('permission/add');
        }
    }

    public function deleteAction(){
        if($this->request->isAjax()){
            $id = $this->request->getPost('id');
            try{
                $result = Permissions::findFirst($id)->delete();
                if(!$result){
                    return $this->response->setJsonContent(['status'=>1,'msg'=>'删除成功']);
                }else{
                    return $this->response->setJsonContent(['status='>0,'msg'=>'删除失败']);
                }
            }catch (\Exception $e){
                return $this->response->setJsonContent(['status='>0,'msg'=>$e->getMessage()]);
            }
        }
    }
}

