<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/15
 * Time: 14:43
 */

namespace app\common\model;

use think\Db;
class Api extends BaseModel
{
    static $tableName = 'api';

    public static function getList( $map,$order = 'id asc',$page = 1,$limit = 15){
        $name = self::$tableName;
        $data = Db::name($name)->where($map)->order($order)->paginate($limit, false, ['page' => $page])->toArray();

        return $data;
    }
}