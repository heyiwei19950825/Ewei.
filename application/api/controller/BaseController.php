<?php
/**
 * Created by Ewei..
 * Author: Ewei.
 * 微信公号：眉山同城

 * Date: 2017/3/5
 * Time: 17:59
 */

namespace app\api\controller;


use app\api\service\Token;
use think\Controller;
use think\Db;
use think\Config;



class BaseController extends Controller
{
    public function _initialize(){
        parent::_initialize();
        self::setSystem();
    }

    protected function setSystem(){
        $site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
        $site_config = unserialize($site_config['value']);
        $system = [
            'domain' => $site_config['domain'],
            'pay_back_url' => $site_config['pay_back_url'],

        ];

        Config::set('setting',$system);
        Config::set('wx.app_id',$site_config['app_id']);
        Config::set('wx.app_secret',$site_config['app_secret']);

    }
    protected function checkExclusiveScope()
    {
        Token::needExclusiveScope();
    }

    protected function checkPrimaryScope()
    {
        Token::needPrimaryScope();
    }

    protected function checkSuperScope()
    {
        Token::needSuperScope();
    }

    /**
     * 字段添加域名【字符串】
     * @param $data
     * @return mixed
     */
    protected function  prefixDomain($data){
        $data = config('setting.domain'). $data;
        return $data;
    }

    /**
     * 字段添加域名【数组】
     * @param $value
     * @param $data
     * @return mixed
     */
    protected function  prefixDomainToArray($value, $data){
        if( !empty($data) ){
            foreach ( $data as $key=>&$item) {
                    $item[$value] = config('setting.domain').$item[$value];
            }
        }
        return $data;
    }

    public function isMobile($value)
    {
        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }


}