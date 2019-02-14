<?php

namespace Application\Modules\Api\Controllers;

use Phalcon\Mvc\Controller;

abstract class ControllerBase extends Controller
{

    public $params;

    public function beforeExecuteRoute(){
        // deal with request type about payload
        $contentType  = $this->request->getBestAccept();
        if ($contentType === 'application/json') {
            $rawBody = $this->request->getJsonRawBody(true);
            $this->params = $rawBody;
        }else{
            if($this->request->isGet()){
                $this->params = $this->request->getQuery();
            }
            if($this->request->isPost()){
                $this->params = $this->request->getPost();
            }
        }
    }

    protected function OnConstruct(){

    }

    public function initialize(){

    }

    public function afterExecuteRoute()
    {
        $this->response->setHeader("Access-Control-Allow-Origin", "*");
        $this->response->setHeader("Access-Control-Allow-Headers", "*");
    }
}

