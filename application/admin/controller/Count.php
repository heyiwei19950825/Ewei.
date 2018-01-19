<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Account;
use think\Db;

/**
 * 统计
 * Class Index
 * @package app\admin\controller
 */
class Count extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 统计近一个月的用户增长数
     * @return [type] [description]
     */
    public function userCount($type = 1){
        switch ($type) {
            case '1':
                $time = '1 MONTH';
                break;
            case '2':
                $time = '3 MONTH';
                break;
            case '3':
                $time = '12 MONTH';
                break;
            default:
                 $time = '7 DAY';
                break;
        }
        $sql = 'SELECT DATE(create_time) AS login_date, COUNT(id) as number FROM ewei_user WHERE DATE_SUB(CURDATE(), INTERVAL '.$time.') <= DATE(create_time) GROUP BY create_time ORDER BY create_time';
        $userRow = Db::name('user')->query($sql);
        //查询当月用户数据统计
        // $userRow  = Db::name('user')->where($map)->field('create_time')->select();
        if( empty( $userRow )){
            return json(['data'=>[],'code'=>1,'message'=>'操作完成']);
        }
        
        foreach ($userRow as $key => $value) {
            $userRow[$key] = [$value['login_date'],$value['number']];
        }

        return json(['data'=>$userRow,'code'=>1,'message'=>'操作完成']);
    }

    /**
     * 首页顶部数据统计
     * @return [type] [description]
     */
    public function dateCount(){
        $todayAmount =  Account::accountSum();
    }

}

