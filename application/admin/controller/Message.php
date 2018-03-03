<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/20
 * Time: 12:30
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use app\common\model\FeedBack ;
use app\common\model\User as UserModel;
use app\common\lib\Helper;


class Message extends AdminBase
{
    private $feedBack = null;
    private $user_model = null;
    protected function _initialize()
    {
        parent::_initialize();
        $this->feedBack = new FeedBack();
        $this->user_model = new UserModel();

    }


    /**
     * 消息列表
     */
    public function index(){
        $row = $this->feedBack->order('msg_time desc')->select()->toArray();
        $note = array('','商品相关', '物流状况', '客户服务', '优惠活动', '功能异常', '产品建议', '其他');
        foreach ( $row as &$v ){
            $v['msg_type'] = $note[$v['msg_type']];
            $v['msg_time'] =  Helper::time_tran($v['msg_time']);
        }
        return $this->fetch('index',['message' => $row]);
    }

    /**
     * 消息处理
     */
    public function dispose( $id ){
        if( $this->request->isPost() ){
            $row = '';
            $msgRow = $this->feedBack->where(['id'=>$id])->update(['msg_status'=>1]);
            if( $msgRow ){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }

    /**
     * 反馈
     */
    public function fanKui(){

    }

    /**
     * 反馈处理
     */
    public function fanKuiDispose(){

    }
}