<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Articles;

class ArticleController extends ControllerBase
{

    public function listAction()
    {
        if(!$this->request->isOptions()){
            $page = $this->getParams('current',null,0);
            $limit = $this->getParams('limit',null,10);
            $offset = $limit*($page-1) ;
            $where = array();
            $fields = array('id','name','email');
            $total = Articles::articleCount($where);
            $rows = Articles::articleList($where,$offset,$limit,$fields);
            $data = array( 'total'=> $total , 'admins'=> $rows,'current' => $page, 'limit' => $limit);
            return $this->response->setJsonContent($data);
        }
    }

    public function saveAction(){
        if(!$this->request->isOptions()){
            $input = $this->getParams();
            //edit
            if(isset($input['id'])){
                $article = Articles::findFirst($input['id']);
                $result = $article->update($input,Articles::$WhiteList);
                if (!$result) {
                    $first_message = array_shift($article->getMessages());
                    $data = ['status' => 'ok', 'message' => $first_message->getMessage()];
                } else {
                    $data = ['status' => 'ok', 'message' => '更新成功'];
                }
            }
            //add
            else{
                $article = new Articles();
                $result = $article->create($input);
                if(!$result){
                    $first_message = array_shift($article->getMessages());
                    $data = ['status' => 'ok','message'=>$first_message->getMessage()];
                }else{
                    $data = ['status' => 'ok','message'=>'添加成功'];
                }
            }
            return $this->response->setJsonContent($data);
        }
    }

}

