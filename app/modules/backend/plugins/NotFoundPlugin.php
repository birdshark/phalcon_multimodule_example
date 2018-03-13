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
// | Date: 3/8/2018 3:47 PM
// +----------------------------------------------------------------------
namespace Application\Modules\Backend\Plugins;

use Phalcon\Events\Event;
use Phalcon\Logger;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Logger\Adapter\File as FileLogger;
use Phalcon\Mvc\Dispatcher\Exception as DispatchException;
use Phalcon\Mvc\Model\Exception as ModelException;
use Phalcon\Mvc\User\Plugin;

class NotFoundPlugin extends Plugin{

    private $config ;
    public function __construct($config)
    {
        $this->config = $config;
    }

    public function beforeException(Event $event,Dispatcher $dispatcher,$exception){
        if($this->config->error_log){
            $logger = new FileLogger(__DIR__.'/../logs/error.log');
            $logger->log($exception->getTraceAsString(),Logger::ERROR);
        }
        if ($exception instanceof DispatchException) {
            $dispatcher->forward(['controller'=>'index','action'=>'show404']);
            return false;
        }
        if ($exception instanceof ModelException){
            $dispatcher->forward(['controller'=>'index','action'=>'show404']);
            return false;
        }

        switch ($exception->getCode()) {
            case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
            case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                $dispatcher->forward(['controller'=>'index','action'=>'show404']);
                return false;
        }
    }
}