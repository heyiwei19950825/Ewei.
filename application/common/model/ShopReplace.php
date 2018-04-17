<?php
namespace app\common\model;


class ShopReplace extends BaseModel
{
    protected $table = 'shop_replace';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}