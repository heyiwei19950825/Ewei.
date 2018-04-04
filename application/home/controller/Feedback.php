<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/4/2
 * Time: 23:32
 */

namespace app\home\controller;


use app\common\controller\HomeBase;

class Feedback extends HomeBase
{
    /**
     * 文化执法大队首页
     */
    public function index(){

        return $this->fetch();
    }
}