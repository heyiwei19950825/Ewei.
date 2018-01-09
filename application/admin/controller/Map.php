<?php
// 百度地图接口
namespace app\admin\controller;
use think\Controller;

class Map extends Controller{
	public function index(){
		//输出百度地图插件的路径
		$path=APP_PATH."../themes/admin/map/";
		return $this->fetch('index',['path'=>$path]);
	}	
}