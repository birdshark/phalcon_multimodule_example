<?php

namespace Application\Modules\Backend;

use Application\Modules\Backend\Plugins\NotFoundPlugin;
use Application\Modules\Backend\Plugins\SecurityPlugin;
use Phalcon\Acl\Adapter\Memory as AclList;
use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Logger;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Php as PhpEngine;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Logger\Adapter\File as FileLogger;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Config;
use Phalcon\Security;


class Module implements ModuleDefinitionInterface
{
    /**
     * Registers an autoloader related to the module
     *
     * @param DiInterface $di
     */
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerDirs([
            APP_PATH . '/common/models/',
        ]);
        
        $loader->registerNamespaces([
            'Application\Modules\Backend\Controllers' => __DIR__ . '/controllers/',
            'Application\Modules\Backend\Models'      => __DIR__ . '/models/',
            'Application\Modules\Backend\Plugins'      => __DIR__ . '/plugins/',
        ]);
        $loader->register();
    }

    /**
     * Registers services related to the module
     *
     * @param DiInterface $di
     */
    public function registerServices(DiInterface $di)
    {
        /**
         * Try to load local configuration
         */
        if (file_exists(__DIR__ . '/config/config.php')) {
            
            $config = $di['config'];
            
            $override = new Config(include __DIR__ . '/config/config.php');

            if ($config instanceof Config) {
                $config->merge($override);
            } else {
                $config = $override;
            }
        }

        /**
         * Setting up the view component
         */
        $di['view'] = function () {
            $config = $this->getConfig();

            $view = new View();
            $view->setViewsDir($config->get('application')->viewsDir);
            
            $view->registerEngines([
                '.volt'  => 'voltShared',
                '.phtml' => PhpEngine::class
            ]);
            return $view;
        };

        /**
         * Database connection is created based in the parameters defined in the configuration file
         */
        $di['db'] = function () {
            $config = $this->getConfig();

            $dbConfig = $config->database->toArray();

            $dbAdapter = '\Phalcon\Db\Adapter\Pdo\\' . $dbConfig['adapter'];
            unset($config['adapter']);
            $connection = new $dbAdapter($dbConfig);
            return $connection;
        };

        /**
         * Database connection is created based in the parameters defined in the configuration file
         */
        $di['db'] = function () {
            $config = $this->getConfig();

            $dbConfig = $config->database->toArray();

            $dbAdapter = '\Phalcon\Db\Adapter\Pdo\\' . $dbConfig['adapter'];
            unset($config['adapter']);
            $connection = new $dbAdapter($dbConfig);
            return $connection;
        };

        /**
         * 日志控制
         */
        if($config->sql_debug){
            $profilingSQLEvent = $this->registerProfilingSQLEvent($di);
            $loggingSQLEvent = $this->registerLoggingSQLEvent();
            $di['db']->setEventsManager($profilingSQLEvent);
            $di['db']->setEventsManager($loggingSQLEvent);
        }

        /**
         * 后端分发控制
         */
        $backendDispatcherEvent = $this->registerBackendDispatcherEvent($di);
        $di['dispatcher']->setEventsManager($backendDispatcherEvent);
    }


    /**
     *
     * @param DiInterface $di
     * @return EventsManager
     */
    private function registerProfilingSQLEvent(DiInterface $di){
        $eventsManager = new EventsManager();
        $profiler      = $di->getProfiler();
        $eventsManager->attach('db', function ($event, $connection) use ($profiler) {
            if ($event->getType() == 'beforeQuery') {
                $profiler->startProfile($connection->getSQLStatement());
            }

            if ($event->getType() == 'afterQuery') {
                $profiler->stopProfile();
            }
        });
        return $eventsManager;
    }


    /**
     * 注册数据库日志记录事件
     * @return EventsManager
     */
    private function registerLoggingSQLEvent(){
        $eventsManager = new EventsManager();
        $logger = new FileLogger(__DIR__.'/logs/debug.log');
        $eventsManager->attach('db', function ($event,$connection) use ($logger) {
            if ($event->getType() == 'beforeQuery') {
                $logger->log($connection->getRealSQLStatement(),Logger::INFO);
            }
        });
        return $eventsManager;
    }

    /**
     * 后台分发事件注册
     * @return EventsManager
     */
    private function registerBackendDispatcherEvent(DiInterface $di){
        $config = $di['config'];
        // Create an events manager
        $eventsManager = new EventsManager();
        // Listen for events produced in the dispatcher using the Security plugin
        $eventsManager->attach('dispatch:beforeExecuteRoute', new SecurityPlugin);

        // Handle exceptions and not-found exceptions using NotFoundPlugin
        $eventsManager->attach('dispatch:beforeException', new NotFoundPlugin($config));

        return $eventsManager;
    }


}
