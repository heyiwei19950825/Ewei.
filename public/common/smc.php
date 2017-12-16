<?php


//使用示例
require('./ServerAPI.php');
//网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
$AppKey = 'ab6a95c2c96e56b7dac5346323b7e21c';
//网易云信分配的账号，请替换你在管理后台应用下申请的appSecret
$AppSecret = '670d55b97133';
$p = new ServerAPI($AppKey,$AppSecret,'curl');     //fsockopen伪造请求

//发送短信验证码
$row = ( $p->sendSmsCode('3129310','17610226808','','4') );

//判断验证码是否正确
if( $row['code'] == 200 ){
	return $row['obj'];
}else{
	return $false;
}

?>