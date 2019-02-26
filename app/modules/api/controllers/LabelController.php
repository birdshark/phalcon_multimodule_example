<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Labels;

class LabelController extends ControllerBase
{

    public function allAction()
    {
        $labels = Labels::find();
        return $this->response->setJsonContent(['data' => $labels]);
    }

}

