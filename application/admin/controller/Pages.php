<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/4/16
 * Time: 20:29
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class Pages extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();

    }

    public function index(){

        $list = Db::name('pages')->select()->toArray();
        foreach( $list as $k=>&$v){
            $v['params'] = json_decode( $v['params'], true );
        }
        return $this->fetch('',['list'=>$list]);
    }
}