<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/19
 * Time: 15:17
 */

namespace app\api\validate;


class FeedBack  extends BaseValidate
{
    protected $rule = [
        'type' => 'require',
        'content' => 'require',
        'mobile' => 'require|isMobile'
    ];

    protected $message = [
        'type' => '必须选择反馈类型',
        'content' => '反馈内容不能为空',
        'mobile' => '必须填写手机号'
    ];
}