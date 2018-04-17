<?php
namespace app\common\model;


class Nav extends BaseModel
{
    protected $table = 'nav';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;

        parent::__construct();
    }
}