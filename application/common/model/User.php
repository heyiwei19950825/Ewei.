<?php
namespace app\common\model;

use think\Model;
use think\Db;

class User extends Model
{
    protected $insert = ['create_time'];

    /**
     * 创建时间
     * @return bool|string
     */
    protected function setCreateTimeAttr()
    {
        return date('Y-m-d H:i:s');
    }

    /**
     * 通过ID获取用户信息
     * @param int $id
     * @param string $field
     * @return array|false|\PDOStatement|string|Model
     */
    public function getInfo( $id = -1 ,$field = '' ){

        $row = $this->field($field)->where(['id'=>$id,'status'=>1])->find();

        return $row;
    }
}