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

namespace Application\Modules\Backend\Plugins;

use Application\Common\Models\PermissionRole;
use Application\Common\Models\Roles;
use Phalcon\Acl;
use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Acl\Adapter\Memory as AclList;

class SecurityPlugin extends Plugin{

    public function beforeExecuteRoute(Event $event,Dispatcher $dispatcher){
        $auth = $this->session->get('auth');
        if (!$auth) {
            $roles = array('guest');
        } else {
            $roles = $auth['role'];
        }
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();
        $acl = $this->getInitAcl();
        $allowed_set = array();

        foreach ($roles as $index => $role){
            $var_key = 'allowed'.$index;
            $$var_key = $acl->isAllowed($role, $controller, $action);
            $allowed_set[] = $$var_key;
        }

        if (array_sum($allowed_set) == Acl::DENY && $role == 'guest') {
            $this->flash->error("You don't have access to this module");
            $dispatcher->forward(['controller' => 'auth', 'action' => 'index']);
            return false;
        }
    }

    private function getInitAcl(){
        if(!is_file(APP_PATH."/modules/backend/security/acl.data")) {
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
            foreach ($roles as $role) {
                $acl->addRole($role->name);
                $permissions = (new PermissionRole())->getPermissions($role->id);
                foreach ($permissions as $permission) {
                    list($resource, $access) = explode('-', $permission->name);
                    $acl->addResource($resource, $access);
                    $acl->allow($role->name, $resource, $access);
                }
                $acl->addResource('auth', ['index', 'start']);
                $acl->addResource('index', ['show404']);
                $acl->allow($role->name, 'auth', 'index');
                $acl->allow($role->name, 'auth', 'start');
                $acl->allow('guest', 'index', 'show404');
            }
            file_put_contents(APP_PATH."/modules/backend/security/acl.data", serialize($acl));
        }else{
            $acl = unserialize(file_get_contents(APP_PATH."/modules/backend/security/acl.data"));
        }
        return $acl;
    }
}