<?php
/*平台资金*/

namespace app\common\model;
use think\Db;

class Account extends BaseModel
{
    /*
     * 查询平台收入【根据时间统计】
     * @param $time 
     */
    public static function accountSum($time = '1 DAY')
    {
        $amountSql =  'SELECT COUNT(money) as money FROM ewei_account_order_records WHERE DATE_SUB(CURDATE(), INTERVAL '.$time.') <= DATE(create_time)';

        $todayAmount = Db::name('account_order_records')->quey($amountSql);

        return $todayAmount;
    }
}