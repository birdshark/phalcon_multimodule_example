<?php
// +----------------------------------------------------------------------
// | xiazh [ WHATEVER YOU SHOULD BE DOING RIGHT NOW. GO FUCKING DO IT. ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 .
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Bird Shark <birdmanangle@gmail.com>
// +----------------------------------------------------------------------
// | Date: 3/8/2018 3:43 PM
// +----------------------------------------------------------------------

namespace Application\Modules\Api\Plugins;

use Application\Common\Models\PermissionRole;
use Application\Common\Models\Roles;
use Phalcon\Acl;
use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Acl\Adapter\Memory as AclList;

class TokenPlugin extends Plugin{

    public static function getInitAcl($type){
        if(!is_file(APP_PATH."/modules/api/security/all_permissions.data")) {
            $acl = new AclList();
            $acl->setDefaultAction(Acl::DENY);
            $acl->setNoArgumentsDefaultAction(Acl::DENY);
            $acl->addRole('guest');
            $acl->addResource('auth', ['index', 'start']);
            $acl->addResource('index', ['show404']);
            $acl->allow('guest', 'auth', 'index');
            $acl->allow('guest', 'auth', 'start');
            $acl->allow('guest', 'index', 'show404');
            $roles = Roles::find();
            $all_permissions = [];
            foreach ($roles as $role) {
                $acl->addRole($role->name);
                $permissions = (new PermissionRole())->getPermissions($role->id);
                foreach ($permissions as $permission) {
                    list($resource, $access) = explode('-', $permission->name);
                    $acl->addResource($resource, $access);
                    $acl->allow($role->name, $resource, $access);
                    $all_permissions[$role->name][] = $permission->name;
                }
                $acl->addResource('auth', ['index', 'start']);
                $acl->addResource('index', ['show404']);
                $acl->allow($role->name, 'auth', 'index');
                $acl->allow($role->name, 'auth', 'start');
                $acl->allow('guest', 'index', 'show404');
            }
//            file_put_contents(APP_PATH."/modules/backend/security/acl.data", serialize($acl));
            file_put_contents(APP_PATH."/modules/api/security/all_permissions.data", serialize($all_permissions));
            file_put_contents(APP_PATH."/modules/api/security/acl.data", serialize($acl));
        }else{
            $all_permissions = unserialize(file_get_contents(APP_PATH."/modules/api/security/all_permissions.data"));
            $acl = unserialize(file_get_contents(APP_PATH."/modules/api/security/acl.data"));
        }

        if($type == 'acl'){
            return $acl;
        }else{
            return $all_permissions;
        }
    }
}