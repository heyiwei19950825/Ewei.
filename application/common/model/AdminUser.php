<?php
namespace app\common\model;


/**
 * 管理员模型
 * Class AdminUser
 * @package app\common\model
 */
class AdminUser extends BaseModel
{
    protected $table = 'admin_user';

    public function __construct()
    {
        $this->table = config('database.prefix').$this->table;
        parent::__construct();
    }

}