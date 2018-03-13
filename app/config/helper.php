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
// | Date: 3/9/2018 10:27 PM
// +----------------------------------------------------------------------



if(!function_exists('pluck')){
    /**
     * 获取数组中某列
     * @param array $array
     * @param array $fields
     * @return array
     */
    function pluck($array = array(),$fields = array()){
        $result = array();
        if(count($fields) == 1){
            foreach ($array as $key => $value){
                $result[] = $value[$fields[0]];
            }
        }else{
            foreach ($array as $key => $value){
                $result[] = array_intersect_key($value,$fields);
            }
        }
        return $result;
    }
}