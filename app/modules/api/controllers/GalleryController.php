<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Gallery;

class GalleryController extends ControllerBase
{

    public function listAction()
    {
        if (!$this->request->isOptions()) {
//            $page = $this->getParams('current',null,0);
//            $limit = $this->getParams('limit',null,10);
            $galleries = Gallery::find();
            return $this->response->setJsonContent(['data' => $galleries]);
        }
    }

}

