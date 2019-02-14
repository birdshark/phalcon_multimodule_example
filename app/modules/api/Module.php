<?php

namespace Application\Modules\Api;


use Application\Modules\Api\Plugins\NotFoundPlugin;
use Application\Modules\Api\Plugins\TokenPlugin;
use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Config;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Mvc\View;

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

        $loader->registerNamespaces([
            'Application\Modules\Api\Controllers' => __DIR__ . '/controllers/',
            'Application\Modules\Api\Models'      => __DIR__ . '/models/',
            'Application\Modules\Api\Plugins'      => __DIR__ . '/plugins/',
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

            return new $dbAdapter($dbConfig);
        };

        $backendDispatcherEvent = $this->registerBackendDispatcherEvent($di);
        $di['dispatcher']->setEventsManager($backendDispatcherEvent);
    }


    /**
     * 后台分发事件注册
     * @param DiInterface $di
     * @return EventsManager
     */
    private function registerBackendDispatcherEvent(DiInterface $di){
        $config = $di['config'];
        // Create an events manager
        $eventsManager = new EventsManager();
        // Listen for events produced in the dispatcher using the Security plugin
        $eventsManager->attach('dispatch:beforeExecuteRoute', new TokenPlugin);

        // Handle exceptions and not-found exceptions using NotFoundPlugin
        $eventsManager->attach('dispatch:beforeException', new NotFoundPlugin($config));

        return $eventsManager;
    }
}
