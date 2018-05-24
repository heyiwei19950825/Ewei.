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

    public function navList(){
        $navList = [
            'ms'=>[
                'latitude'=> 30.074933,
                'longitude'=> 103.861788,
                'name'=> '眉山市广电局',
                'address'=> '四川省眉山市东坡区眉州大道东二段7号',
                'scale' => 14,
                'infoUrl'=> 'http://weixin.qq.com'
            ],
            'hy'=>[
                'latitude'=> 29.902650,
                'longitude'=> 103.372310,
                'name'=> '洪雅县广电局',
                'address'=> '四川省眉山市洪雅县洪洲大酒店旁',
                'scale' => 14,
                'infoUrl'=> 'http://weixin.qq.com'
            ],
            'dl'=>[
                'latitude'=> 30.011280,
                'longitude'=> 103.507400,
                'name'=> '丹棱县广电局',
                'address'=> '四川省眉山市丹棱县东升路67',
                'scale' => 14,
                'infoUrl'=> 'http://weixin.qq.com'
            ],
            'rs'=>[
                'latitude'=> 29.999370,
                'longitude'=> 104.149300,
                'name'=> '仁寿县广电局',
                'address'=> '四川省眉山市仁寿县陵州路二段158',
                'scale' => 14,
                'infoUrl'=> 'http://weixin.qq.com'
            ],

        ];
        if( $this->request->isPost()){
            $key = $this->request->param('key');
            return json($navList[$key]);
        }else{
            return $this->fetch();
        }
    }
}


