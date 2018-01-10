<?php

namespace app\common\model;

use app\common\model\BaseModel;
/**
 * 商品sku表
 * @author Administrator
 *
 */
class GoodsSku extends BaseModel {

    protected $table = 'ewei_goods_sku';
    protected $rule = [
        'sku_id'  =>  '',
    ];
    protected $msg = [
        'sku_id'  =>  '',
    ];

}