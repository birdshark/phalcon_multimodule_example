<?php

namespace Application\Modules\Frontend\Controllers;

use Application\Models\News;
use Enqueue\AmqpExt\AmqpConnectionFactory;

class NewsController extends ControllerBase
{

    public function indexAction()
    {


    }

    public function detailAction($id){
        $this->view->setVar('news',News::findFirst($id));
    }

    public function listAction($page){
        $paginator = new \Phalcon\Paginator\Adapter\Model(array('data'=>News::find(),'limit'=>10,'page'=>$page));
        $list = $paginator->getPaginate();
        $this->view->setVar('list', $list);
    }

    public function testAction(){
        try{
            $connectionFactory = new AmqpConnectionFactory("amqp://full_access:bird@192.168.30.130:5672/%2f");
            $context = $connectionFactory->createContext();

            $destination = $context->createQueue('foo');
            $context->deleteQueue($destination);
            exit;
            $context->declareQueue($destination);
//        //$destination = $context->createTopic('foo');
//
            $message = $context->createMessage('Hello world!');
//
            $context->createProducer()->send($destination, $message);

        }catch (\Exception $e){
            echo 'xxx';
        }

    }
}

