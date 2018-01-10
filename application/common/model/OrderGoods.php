<?php 
namespace app\common\model;

use app\common\model\BaseModel;

class OrderGoods extends BaseModel {

    protected $table = 'ewei_order_goods';
    protected $rule = [
        'order_goods_id'  =>  '',
    ];
    protected $msg = [
        'order_goods_id'  =>  '',
    ];

}
