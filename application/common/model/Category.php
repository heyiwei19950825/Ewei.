<?php
namespace app\common\model;

use think\Db;
use think\Model;

class Category extends BaseModel
{
    protected $table = 'category';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }

}