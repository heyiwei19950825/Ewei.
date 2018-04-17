<?php
/**
 * 图片魔方
 * User: heyiw
 * Date: 2018/4/16
 * Time: 22:43
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class PicModels extends AdminBase
{
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function index(){
        $list = Db::name('pic_model')->where(['s_id' => $this->instance_id, 'is_delete' => 0])->select()->toArray();

        return $this->fetch('',['list'=>$list]);
    }

    public function edit( $id =0 ){
        $list = Db::name('pages')->select()->toArray();

        $info = Db::name('pic_model')->where([
            'id' => $id,
            's_id' => $this->instance_id,
            'is_delete' => 0,
        ])->find();

        if( $this->request->isPost()){

        }

        return $this->fetch('',['info'=>$info,'list'=>$list]);
    }


    public function del(){

    }
}