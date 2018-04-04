<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/28
 * Time: 14:52
 */

namespace app\home\controller;


use app\common\controller\HomeBase;

class User extends HomeBase
{
    public function attestation(){
        if( $this->request->isPost()){

        }else{
            return $this->fetch();
        }
    }
}