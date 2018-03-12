<?php
// +----------------------------------------------------------------------
// | xiazh [ WHATEVER YOU SHOULD BE DOING RIGHT NOW. GO FUCKING DO IT. ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 .
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Bird Shark <birdmanangle@gmail.com>
// +----------------------------------------------------------------------
// | Date: 3/12/2018 10:08 AM
// +----------------------------------------------------------------------

namespace Application\Common\Models;

use Phalcon\Mvc\Model;

abstract class ModelBase extends Model{
    protected static function whereFormat($where){
        $whereArray = array();
        $operate = ' AND ';
        foreach ($where as $key => $value){
            if($value != ''){
                if(is_string($value)){
                    $whereArray[] = $key . ' = ' . $value;
                }
                if(is_array($value)){
                    //TODO parse ....
                }
            }
        }
        return implode($operate, $whereArray);
    }
}