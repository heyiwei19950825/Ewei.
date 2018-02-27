<?php 
namespace app\common\model;


class OrderGoods extends BaseModel {

    protected $table = 'ewei_order_product';
    protected $rule = [
        'order_goods_id'  =>  '',
    ];
    protected $msg = [
        'order_goods_id'  =>  '',
    ];

}
