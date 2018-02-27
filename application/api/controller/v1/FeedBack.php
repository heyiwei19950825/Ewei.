<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/19
 * Time: 15:14
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\service\Token;
use app\api\validate\FeedBack as FeedBackValidate;
use think\Db;

class FeedBack extends BaseController
{
    public $uid = '';

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid();
    }

    /**
     * 添加用户反馈信息
     * @return array
     */
    public function add(){
        $row = ['msg'=>'','errorCode'=>0,'data'=>[]];

        $params = $this->request->param();
        $params['mobile'] += 0;
        $userInfo = Db::name('user')->where(['id'=>$this->uid])->find();//用户信息

        (new FeedBackValidate())->goCheck();

        //查询用户提交信息数量
        $countNum = Db::name('feed_back')->where(['user_id'=>$this->uid,'msg_status'=>0])->count('id');
        if( $countNum >= 5 ){
            $row['error_code'] = 60003 ;
            $row['msg'] = '请勿多次提交';
            return $row;
        }
        $data = [
            'user_mobile'   => $params['mobile'],
            'msg_type'      => $params['type'],
            'msg_content'   => $params['content'],
            'user_id'       => $this->uid,
            'user_name'     => $userInfo['nickname'],
            'msg_time'      => time()
        ];
        $fbRow = Db::name('feed_back')->insert($data);
        if( $fbRow == 1 ){
            $row['error_code'] = 0 ;
            $row['msg'] = '提交成功';
        }else{
            $row['error_code'] = 400004 ;
            $row['msg'] = '网络错误请重试';
        }

        return $row;
    }
}