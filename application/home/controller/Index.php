<?php 

namespace app\home\controller;

use app\common\controller\HomeBase;
use think\Controller;

class Index extends HomeBase{

	public function index(){
		return $this->fetch();
	}

    /**
     * 文化执法大队首页
     */
	public function culture(){

	    return $this->fetch();
    }
}


