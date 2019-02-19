<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Admins;

class AdminController extends ControllerBase
{

    public function listAction(){
        if(!$this->request->isOptions()){
            $page = $this->getParams('current',null,0);
            $limit = $this->getParams('limit',null,10);
            $offset = $limit*($page-1) ;
            $where = array();
            $fields = array('id','name','email');
            $total = Admins::adminCount($where);
            $rows = Admins::adminList($where,$offset,$limit,$fields);
            $data = array( 'total'=> $total , 'admins'=> $rows,'current' => $page, 'limit' => $limit);
            return $this->response->setJsonContent($data);
        }
    }

}

