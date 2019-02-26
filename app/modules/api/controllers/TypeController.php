<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Types;

class TypeController extends ControllerBase
{

    public function allAction()
    {
        $types = Types::find()->toArray();
//        return $this->response->setJsonContent(['data' => $types]);
        return $this->response->setJsonContent(['data' => pluck($types,array('type_name'),'type_id')]);
    }

}

