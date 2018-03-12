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
            $input = $this->request->all();
            $validator = Role::validate($input);
            if($validator->fails()){
                $messages = $validator->messages();
                return view('backend.public.jump',['flag'=>'time','message'=>'添加失败!']);
            }else{
                unset($input['_token']);
                unset($input['id']);
                $result = Role::create($input);
                if($result){
                    return view('backend.public.jump',['flag'=>'check','message'=>'添加成功!']);
                }else{
                    return view('backend.public.jump',['flag'=>'time','message'=>'添加失败!']);
                }
            }
        }else{
            $info = new Roles();
            $this->view->setVar('info',$info);
        }
    }

    public function editAction(){
        if($this->request->method() == 'POST'){
            $input = $this->request->all();
            $validator = Role::validate($input);
            if ($validator->fails()){
                $messages = $validator->messages();
                return view('backend.public.fails',['flag'=>'time','message'=>'修改失败!']);
            }else{
                unset($input['_token']);
                $where =array('id'=>$id);
                $result = Role::roleUpdate($where,$input);
                if($result){
                    return view('backend.public.close',['flag'=>'check','message'=>'修改成功!']);
                }else{
                    return view('backend.public.jump',['flag'=>'time','message'=>'修改失败!']);
                }
            }
        }else{
            $info = Role::findOrFail($id);
            return view('backend.role.add',$info);
        }
    }

    public function assignmentAction(){
        if($this->request->isAjax()) {


        }elseif($this->request->isPost()){
            $role_ids = $this->request->get('role_ids',null,array());
            $old_role_ids = $this->request->get('old_role_ids',null,array());
            $aid = $this->request->get('admin_id',null,0);
            $admin =  Admins::findFirst($aid);
            //detach old role
            $old_roles = Roles::whereIn('id',$old_role_ids)->get(['id']);

            $roles = Role::whereIn('id',$role_ids)->get(['id']);
            if($old_role_ids){
                $admin->detachRoles($old_roles);
                $admin->attachRoles($roles);
            }else{
                $admin->attachRoles($roles);
            }
            return view('backend.public.jump',['flag'=>'smile-o','message'=>'修改成功!']);

        }else{
            $roles = Roles::find();
            $this->view->setVar('roles' , $roles);
        }
    }
}

