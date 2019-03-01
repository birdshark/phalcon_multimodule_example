<?php

namespace Application\Modules\Api\Controllers;

use Application\Common\Models\Gallery;

class GalleryController extends ControllerBase
{

    public function listAction()
    {
        if (!$this->request->isOptions()) {
            $galleries = Gallery::find(['limit'=>4]);
            return $this->response->setJsonContent(['data' => $galleries]);
        }
    }

}

