<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/14
 * Time: 1:05
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class Sell extends AdminBase
{
        public function index(){
            $totalMoney = $totalPlace = $totalGoods = $totalUser = 0;
            //查询
            $field = 'buyer_id';
            $orderList = Db::name('order')->field($field)->select();
            return $this->fetch();
        }

        public function getCount(){

        }
}