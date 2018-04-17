<?php
namespace app\common\model;

class Shop extends BaseModel
{
    protected $table = 'shop';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}