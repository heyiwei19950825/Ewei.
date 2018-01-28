<?php
/**
 * Created by 七月.
 * Author: 七月
 * 微信公号：小楼昨夜又秋风
 * 知乎ID: 七月在夏天
 * Date: 2017/3/5
 * Time: 17:59
 */

namespace app\api\controller;


use app\api\service\Token;
use think\Controller;

class BaseController extends Controller
{
    public function _initialize(){
        parent::_initialize();
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
}