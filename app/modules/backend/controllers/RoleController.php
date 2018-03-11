<?php
namespace Application\Modules\Backend\Controllers;
use Application\Common\Models\Permissions;
use Application\Common\Models\Roles;

class RoleController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function permissionAction(){
        if($this->request->isAjax()){
            $permissions = Permissions::find();
            $rid = $this->request->get('rid',null,0);
            $role = Roles::findFirst($rid);
            $perms_ids = $role->PermissionRole->toArray();
            $this->view->setVars(['permissions'=>$permissions,'perms_ids'=>$perms_ids]);
        }
    }

}

