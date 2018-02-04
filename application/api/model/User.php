<?php

namespace app\api\model;

use think\Model;
use think\Db;

class User extends BaseModel
{
    protected $autoWriteTimestamp = true;
//    protected $createTime = ;

    public function orders()
    {
        return $this->hasMany('Order', 'user_id', 'id');
    }

    public function address()
    {
        return $this->hasOne('UserAddress', 'user_id', 'id');
    }

    /**
     * 用户是否存在
     * 存在返回uid，不存在返回0
     */
    public static function getByOpenID($openid)
    {
        $user = User::where('openid', '=', $openid)
            ->find();
        return $user;
    }

    /**
     * 通过ID获取用户信息
     * @param $uid
     * @return array|false|mixed|\PDOStatement|string|Model
     */
    public static function getInfoById( $uid ){
        $user = Db::name('user')->where(['id'=>$uid])->find();
        if( empty( $user) ){
            return [];
        }
        return $user;
    }

    /**
     * 修改用户积分并记录日志
     * @param int $uid
     * @param int $integral
     * @param int $type
     * @return array
     */
    public static function updateUserIntegral($uid = -1,$integral=0,$type = 0){
        $user = Db::name('user')->where(['id'=>$uid])->find();
        if( $type == 0 ){
            $integral = $user['integral'] - $integral;
        }else{
            $integral = $user['integral'] + $integral;
        }
        $row = Db::name('user')->where(['id'=>$uid])->update(['integral'=>$integral]);

        return $row;
    }

}
