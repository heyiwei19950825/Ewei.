<?php
namespace app\common\model;


class AuthGroupAccess extends BaseModel
{

    protected $table = 'auth_group_access';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }
}