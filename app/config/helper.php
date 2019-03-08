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
     * @param string $index
     * @return array
     */
    function pluck($array = array(),$fields = array(),$index = ''){
        $result = array();
        if(count($fields) == 1){
            foreach ($array as $key => $value){
                if ($index) {
                    $map_index = $value[$index];
                    $result[$map_index] = $value[$fields[0]];
                }else{
                    $result[] = $value[$fields[0]];
                }
            }
        }else{
            foreach ($array as $key => $value)
                if ($index) {
                    $map_index = $value[$index];
                    $result[$map_index] = array_intersect_key($value, $fields);
                } else {

                    $result[] = array_intersect_key($value, $fields);
                }
        }
        return $result;
    }
}

if(!function_exists('make_directory')){
    /**
     * @param $dir
     * @return bool
     */
    function make_directory($dir){
        if(is_dir($dir)){
            return true;
        }
        if(mkdir($dir, 0777, true)){
            return true;
        } else {
            return false;
        }
    }
}


if(!function_exists('cloud_uuid')){
    /**
     * 生成UUID
     * @return string
     */
    function cloud_uuid(){
        return strtolower(str_replace(array('+','=','/'), array('','',''), base64_encode(openssl_random_pseudo_bytes(24))));
    }
}

if(!function_exists('auth_code')){
    /**
     * 可逆加密
     * @param $string
     * @param string $operation
     * @param string $key
     * @param int $expiry
     * @param int $random_key_length
     * @return bool|string
     */
    function auth_code($string, $operation = 'DECODE', $key = 'BIRDS', $expiry = 0 , $random_key_length = 4) {
//        $random_key_length = 4; // 随机密钥长度 取值 0-32;
        // 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
        // 取值越大，密文变动规律越大，密文变化 = 16 的 $random_key_length 次方
        // 当此值为 0 时，则不产生随机密钥
        $key = md5($key);
        $key_a = md5(substr($key, 0, 16));
        $key_b = md5(substr($key, 16, 16));
        $key_c = $random_key_length ? ($operation == 'DECODE' ? substr($string, 0, $random_key_length) : substr(md5(microtime()), -$random_key_length)) : '';
        $crypt_key = $key_a . md5($key_a . $key_c);
        $key_length = strlen($crypt_key);
        $string = $operation == 'DECODE' ? base64_decode(substr($string, $random_key_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $key_b), 0, 16) . $string;
        $string_length = strlen($string);
        $result = '';
        $box = range(0, 255);
        $rnd_key = array();
        for ($i = 0; $i <= 255; $i++) {
            $rnd_key[$i] = ord($crypt_key[$i % $key_length]);
        }
        for ($j = $i = 0; $i < 256; $i++) {
            $j = ($j + $box[$i] + $rnd_key[$i]) % 256;
            $tmp = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }
        for ($a = $j = $i = 0; $i < $string_length; $i++) {
            $a = ($a + 1) % 256;
            $j = ($j + $box[$a]) % 256;
            $tmp = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }
        if ($operation == 'DECODE') {
            if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26) . $key_b), 0, 16)) {
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            return $key_c . str_replace('=', '', base64_encode($result));
        }
    }
}