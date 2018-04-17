<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/23
 * Time: 22:49
 */

namespace app\common\model;


class OrderGoodsExpress extends BaseModel
{
    protected $table = 'order_goods_express';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}