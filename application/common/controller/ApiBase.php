<?php
/**
 * ============================
 * @Author:   Ewei
 * @Version:  1.0 
 * @DateTime: 2017/8/14
 * ============================
 */
namespace app\common\controller;

use org\Auth;
use think\Loader;
use think\Cache;
use think\Controller;
use think\Db;
use think\Session;
use think\Request;


/**
 * 后台公用基础控制器
 * Class AdminBase
 * @package app\common\controller
 */
class ApiBase extends Controller
{
   /**
    * 构造方法
    * @param $param 接口请求参数
    * @return bool
    **/
    protected function _initialize( )
    {
        parent::_initialize();
        $action = Request::instance()->action();
        
        //验证白名单
        $action_arr = $this->filtrationFunction();

        //判断是否在非验证名单中
        if( !in_array($action,$action_arr[Request::instance()->controller()]) ){
            $this->chek();
        }
    }


    /**
    * 验证拦截 
    * @return bool
    **/
    protected function chek(){
        if($this->request->isPost() ){
            if( empty($this->request->post('auth')) ){
                $code = '40004';
                $this->error($this->errorMsg($code),'',array('code'=>$code));die;
            }

            if( $this->request->post('sign') ){
                //获取请求参数
                $param = $this->request->param();
                $sign = $param['sign'];
                unset($param['sign']);

                //系统根据参数转换成签名字符串
                $sysSign = $this->transitionSign( $param );

                //检测签名是否正确
                if( $sign != $sysSign){
                    $code = '40002';
                    echo json_encode(['data'=>'','code'=>$code,'message'=>$this->errorMsg($code)]);die;
                }
            }else{
                $code = '40001';
                echo json_encode(['data'=>'','code'=>$code,'message'=>$this->errorMsg($code)]);die;

            }
        }else{
            //禁止其他方式请求接口
            $code = '50001';
            echo json_encode(['data'=>'','code'=>$code,'message'=>$this->errorMsg($code)]);die;
        }
    }

    /**
    * 参数转换成签名
    * @param $param array 请求参数
    * @return bool
    **/
    protected function transitionSign()
    {
        $param['auth'] = md5('Ewei.一维国度');
        ksort($param);
        $param =  http_build_query($param);

        $sign = strtoupper( md5($param) );

        return $sign;
    }

    /**
    * 参数转换成签名
    * @param $code int  错误码
    * @return bool
    **/
    protected function errorMsg( $code='40000',$field ='' ){
        $msg = array(
            '40000' => '成功',
            '40001' => '签名不存在',
            '40002' => '签名错误',
            '40003' => '参数错误',
            '40004' => '认证码不存在',

            '50001' => '系统错误',
            '50002' => '暂无数据',
        );
        return $msg[$code];
    } 

    /**
     * 将不需要签名认证方法过滤
     * @return [type] [description]
     */
    public function filtrationFunction(){

        return array(
            'User'=>[
                'loginIn','register'
            ]
        );
    }
}