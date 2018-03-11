<?php

use Phalcon\Loader;

$loader = new Loader();

/**
 * Register Namespaces
 */
$loader->registerNamespaces([
    'Application\Common\Models' => APP_PATH . '/common/models/',
    'Application\Common\Library'=> APP_PATH . '/common/library/',
]);

/**
 * Register module classes
 */
$loader->registerClasses([
    'Application\Modules\Frontend\Module' => APP_PATH . '/modules/frontend/Module.php',
    'Application\Modules\Backend\Module' => APP_PATH . '/modules/backend/Module.php',
    'Application\Modules\Cli\Module'      => APP_PATH . '/modules/cli/Module.php'
]);

$loader->register();
