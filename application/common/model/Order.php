<?php
namespace app\common\model;

use think\Model;
use think\Db;

class Order extends Model
{
	public function getOrderAll( $param ){
		//初始化数据
		$data = [];
		$map  = [];
		$map2  = [];
		$param['page'] = empty($param['page'])?1:$param['page'];
		$data['param'] = $param;

		//条件参数判断添加
		if( !empty($param['user_name'])){
        }else{
        	$data['param']['user_name'] = '';
        }
        if( !empty($param['user_phone'])){
        }else{
        	$data['param']['user_phone'] = '';
        }
        // echo $this->unicode_encode($param['keyword']);die;
        if( !empty($param['keyword'])){
        	// $map['snap_items'] =['like', "%".$this->unicode_encode($param['keyword'])."%"];
        	$map['snap_name'] =['like', "%{$param['keyword']}%"];
        }else{
        	$data['param']['keyword'] = '';
        }
        //开始时间
        if( !empty($param['start_time'])){
        	$map['create_time'] =['>', strtotime(urldecode($param['start_time']))];
        	$data['param']['start_time'] = $param['start_time'];
        }else{
        	$data['param']['start_time'] = '';
        }
        //结束时间
        if( !empty($param['end_time'])){
        	$map2['create_time'] =['<', strtotime(urldecode($param['end_time']))];
        	$data['param']['end_time'] = $param['end_time'];
        }else{
        	$data['param']['end_time'] = '';
        }

        //状态查询
        if(!empty($param['status'])){
        	$map['status']=$param['status'];
        }
        //用户名称
        if( !empty($param['user_name'])){
        	$userWhere['nickname'] = ['like',"%{$param['user_name']}%"];
        }

       	//用户手机号
        if( !empty($param['user_name'])){
        	$userWhere['mobile']   = ['like',"%{$param['user_phone']}%"];
        }
        if(  !empty($param['user_name']) ||  !empty($param['user_phone'])){
        	$map['user_id'] = Db::name('user')->field('id')
        	->where($userWhere)
        	->find()['id'];
        }
        

		//数据查询
		$order_list = $this->order(['create_time' => 'DESC'])
			->where($map)
			->where($map2)
			->paginate(15, false, ['page' => $param['page']])->toArray();
			// echo $this->getLastSql();die;
		//分页使用
		$data['page'] = $this->order(['create_time' => 'DESC'])
			->field('id')
			->where($map)
			->paginate(15, false, ['page' => $param['page']])->render();


		$data['data'] = [];
		foreach ($order_list['data'] as $key => $value) {
			$data['data'][$key] = $value;
			//处理收货地址信息
			$data['data'][$key]['snap_address'] = json_decode($value['snap_address'],true);
			//订单内商品信息
			$data['data'][$key]['snap_items'] = json_decode($value['snap_items'],true);

			//根据 user_id查询用户名称和手机号
			$data['data'][$key]['user'] = Db::name('user')->field('nickname,mobile')->find($value['user_id']);

			//订单状态名称修改
			switch ($value['status']) {
				case 1:
					$data['data'][$key]['status'] = '未支付';
					break;
				case 2:
					$data['data'][$key]['status'] = '已支付';
					
					break;
				case 3:
					$data['data'][$key]['status'] = '已发货';
					break;
				case 4:
					$data['data'][$key]['status'] = '已支付[库存不足]';
					break;
				case 5:
					$data['data'][$key]['status'] = '已完成';
					break;
				case 6:
					$data['data'][$key]['status'] = '已关闭';
					break;
				case 7:
					$data['data'][$key]['status'] = '订单异常';
					break;
				default:
					$data['data'][$key]['status'] = '订单异常';
					break;
			}
		}

		return $data;
	}

function unicode_encode($name)  
{  
    $name = iconv('UTF-8', 'UCS-2', $name);  
    $len = strlen($name);  
    $str = '';  
    for ($i = 0; $i < $len - 1; $i = $i + 2)  
    {  
        $c = $name[$i];  
        $c2 = $name[$i + 1];  
        if (ord($c) > 0)  
        {    // 两个字节的文字  
            $str .= '\u'.base_convert(ord($c), 10, 16).base_convert(ord($c2), 10, 16);  
        }  
        else  
        {  
            $str .= $c2;  
        }  
    }  
    return $str;  
} 

}