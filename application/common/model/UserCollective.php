<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/14
 * Time: 2:14
 */

namespace app\common\model;


class UserCollective extends BaseModel
{
    protected $table = 'user_collective';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}