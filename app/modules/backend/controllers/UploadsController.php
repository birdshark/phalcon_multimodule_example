<?php

namespace Application\Modules\Backend\Controllers;

use Imagine\Gd\Imagine;
use Imagine\Image\Box;
use Imagine\Image\Point;

class UploadsController extends ControllerBase
{
    public function avatarAction()
    {
        if ($this->request->hasFiles()) {
            $date = date('Ymd');
            $store_path = '/backend/avatar/'.$date.'/';
            $config = $this->request->getPost();
            foreach ($this->request->getUploadedFiles() as $file) {
                $imagine = new Imagine();
                $image = $imagine->open($file->getTempName());
                $thumbnail = $image->thumbnail(new Box(intval($config['sw']),intval($config['sh']) ));
                $thumbnail->crop(new Point($config['x'], $config['y']),new Box($config['w'],$config['h']));
                $dir = BASE_PATH.'/public'.$store_path;
                $file_name =  cloud_uuid();
                if(make_directory($dir)){
                    $thumbnail->save($dir.$file_name.'.png');
                    return $this->response->setJsonContent(array('data'=>array('file_name'=>$store_path.$file_name.'.png'),'state'=>1,'msg'=>'上传成功'));
                }else{
                    return $this->response->setJsonContent(array('data'=>[],'state'=>1,'msg'=>'上传成功'));
                }
            }
        }
    }
}

