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

    /**
     * 分发前置
     * @param Event $event
     * @param Dispatcher $dispatcher
     */
    public function beforeExecuteRoute(Event $event,Dispatcher $dispatcher){
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();

    }
}