<?php
namespace Application\Modules\Cli\Tasks;

use Enqueue\AmqpExt\AmqpConnectionFactory;
use Interop\Amqp\AmqpConsumer;
use Interop\Amqp\AmqpMessage;
use Interop\Amqp\AmqpQueue;
use Interop\Amqp\AmqpTopic;
use Interop\Amqp\Impl\AmqpBind;

class MainTask extends \Phalcon\Cli\Task
{
    public function mainAction()
    {
        echo "Congratulations! You are now flying with Phalcon CLI!";
    }


    public function producerAction($message){
        $connectionFactory = new AmqpConnectionFactory("amqp://full_access:bird@192.168.30.130:5672");
        $context = $connectionFactory->createContext();

        $fooTopic = $context->createTopic('foo');
        $fooTopic->setType(AmqpTopic::TYPE_DIRECT);
        $context->declareTopic($fooTopic);

        $fooQueue = $context->createQueue('foo');
        $fooQueue->addFlag(AmqpQueue::FLAG_DURABLE);
        $context->declareQueue($fooQueue);

        $context->bind(new AmqpBind($fooTopic, $fooQueue));

        $message = $context->createMessage('Hello world!');
        $context->createProducer()->send($fooTopic, $message);

//        $message = $context->createMessage('Hello world!');
//        $context->createProducer()->send($fooQueue, $message);
    }


    public function subscriberAction(){
        $connectionFactory = new AmqpConnectionFactory("amqp://full_access:bird@192.168.30.130:5672");
        $context = $connectionFactory->createContext();

        $fooQueue = $context->createQueue('foo');
        $fooQueue->addFlag(AmqpQueue::FLAG_DURABLE);
        $context->declareQueue($fooQueue);

        $barQueue = $context->createQueue('bar');
        $barQueue->addFlag(AmqpQueue::FLAG_DURABLE);
        $context->declareQueue($barQueue);

        $fooConsumer = $context->createConsumer($fooQueue);
        $barConsumer = $context->createConsumer($barQueue);

        $subscriptionConsumer = $context->createSubscriptionConsumer();
        $subscriptionConsumer->subscribe($fooConsumer, function(AmqpMessage $message, AmqpConsumer $consumer) {
            // process message
            echo $message->getBody();
            $consumer->acknowledge($message);
            return true;
        });
        $subscriptionConsumer->subscribe($barConsumer, function(AmqpMessage $message, AmqpConsumer $consumer) {
            // process message
            echo $message->getBody();
            $consumer->acknowledge($message);

            return true;
        });

        $subscriptionConsumer->consume(2000); // 2 sec
    }

    public function testAction(){
        $connectionFactory = new AmqpConnectionFactory("amqp://full_access:bird@192.168.30.130:5672");
        $context = $connectionFactory->createContext();//channel

        $context->createConsumer();
        $context->createMessage();
        $context->createProducer();

        $context->createQueue(); // queue
        $context->createSubscriptionConsumer();
        $context->createTemporaryQueue();
        $context->createTopic(); // exchange
    }


}
