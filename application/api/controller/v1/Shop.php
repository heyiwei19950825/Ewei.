<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/4
 * Time: 13:59
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use think\Db;
class Shop extends BaseController
{
    public function _initialize()
    {
        parent::_initialize();
    }


    /**
     * 获取商城帮助信息
     */
    public function helper(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];

        $site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
        $site_config = unserialize($site_config['value']);
        $row['data'] = $site_config['helper'];

        return $row;
    }
}