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

    /**
     * egg $where = array('field','value');
     * egg $where = array('field','operate','value');
     * egg $where = array(array('field','value'),array('field','value'));
     * egg $where = array(array('field','operate','value'),array('field','operate','value'));
     * @param $where
     * @return string
     */
    protected static function whereFormat($where){
        $whereArray = array();

        $operate = ' AND ';

        foreach ($where as $key => $set){
            if(is_string($set)){
                if(count($where) == 2){
                    list($filed,$value) = $where;
                    $whereArray[] = $filed . ' = ' . $value;
                }
                if(count($where) == 3){
                    list($filed,$exp,$value) = $where;
                    if(in_array($exp, array('=','<=','<>','>=')) && $value){
                        $whereArray[] = $filed . " $exp " . $value;
                    }
                    if(in_array($exp, array('in','not in')) && $value){
                        $value = implode(',', $value);
                        $whereArray[] = $filed . " $exp " . " ($value)";
                    }
                }
                break;
            }elseif(is_array($set)){
                if(count($set) == 2){
                    list($filed,$value) = $set;
                    $whereArray[] = $filed . ' = ' . $value;
                }
                if(count($set) == 3){
                    list($filed,$exp,$value) = $set;
                    if(in_array($exp, array('=','<=','<>','>=')) && $value){
                        $whereArray[] = $filed . " $exp " . $value;
                    }
                    if(in_array($exp, array('in','not in')) && $value){
                        $value = implode(',', $value);
                        $whereArray[] = $filed . " $exp " . " ($value)";
                    }
                }
            }

        }
        return implode($operate, $whereArray);
    }

    public function pluck(){

    }

}