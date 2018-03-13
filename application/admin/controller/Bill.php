<?php
/**
 * 账单
 * User: heyiw
 * Date: 2018/3/13
 * Time: 19:01
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;

class Bill extends AdminBase
{
    /**
     * 账单首页
     */
    public function index(){
        $list = [];
        $order_no = $start_time = $end_time = $user_name = $order_from = $order_type = $order_status =  $shop_id = null;
        return $this->fetch('index', [
            'list' => $list,
//            'order_list'=>$order_list['data'],
            'order_no'=>$order_no,
            'start_time'=>$start_time,
            'end_time'=>$end_time,
            'user_name'=>$user_name,
            'order_from'=>$order_from,
            'order_type'=>$order_type,
            'order_status'=>$order_status,
//            'sid'=>$this->sid,
            'shop_id'=>$shop_id
        ]);
    }


}