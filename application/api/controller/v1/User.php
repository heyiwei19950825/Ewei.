<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/3/4
 * Time: 20:24
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\User as UserModel;
use app\api\service\Token;

class User extends BaseController
{
    public function _initialize()
    {
        parent::_initialize();
        $this->uid = Token::getCurrentUid(1);
    }

    public function applyVip(){
        $row = ['errmsg'=>'','errno'=>0,'data'=>[]];

        $params = $this->request->param();
        $data = [
            'username' => $params['username'],
            'mobile' => $params['iphone'],
            'email' => $params['email'],
            'is_vip' => 1,
        ];

        $vipRow = UserModel::update($data,['id'=>$this->uid]);

        if( $vipRow ){
            $row['errmsg'] = '申请成功等待审核';
        }else{
            $row['errno'] = 1;

            $row['errmsg'] = '网络异常';
        }

        return $row;

    }
}