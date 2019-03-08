<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Admins;

class AdminController extends ControllerBase
{


    public function initialize(){

    }

    public function listAction(){
        if(!$this->request->isOptions()){
            $page = $this->getParams('current',null,0);
            $limit = $this->getParams('limit',null,10);
            $offset = $limit*($page-1) ;
            $where = array();
            $fields = array('id','name','email');
            $total = Admins::adminCount($where);
            $rows = Admins::adminList($where,$offset,$limit,$fields);
            $data = array( 'total'=> $total , 'admins'=> $rows,'current' => $page, 'limit' => $limit,'sss'=> $this->deny);
            return $this->response->setJsonContent($data);
        }
    }

    public function saveAction(){
        if(!$this->request->isOptions()){
            $input = $this->getParams();
            //edit
            if(isset($input['id'])){
                $admins = Admins::findFirst($input['id']);
                $input['password'] = $this->security->hash($input['password']);
                $result = $admins->update($input,Admins::$WhiteList);
                if (!$result) {
                    $first_message = array_shift($admins->getMessages());
                    $data = ['status' => 'ok', 'message' => $first_message->getMessage()];
                } else {
                    $data = ['status' => 'ok', 'message' => '更新成功'];
                }
            }
            //add
            else{
                $input['password'] = $this->security->hash($input['password']);
                $admins = new Admins();
                $result = $admins->create($input);
                if(!$result){
                    $first_message = array_shift($admins->getMessages());
                    $data = ['status' => 'ok','message'=>$first_message->getMessage()];
                }else{
                    $data = ['status' => 'ok','message'=>'添加成功'];
                }
            }
            return $this->response->setJsonContent($data);
        }
    }

}

