<?php
/**
 * @author : ewei
 * @date : 2018.1.1
 * @version : v1.0.0.0
 */
namespace app\admin\controller;

// use data\service\Address;
// use data\service\Config;
// use data\service\promotion\PromoteRewardRule;
// use data\service\Promotion as PromotionService;
use app\common\model\CouponType as CouponTypeModel;
use app\common\model\Coupon as CouponModel;
use app\common\model\CouponGoods as CouponGoodsModel;
use app\common\server\Goods as GoodsServer;
use app\common\controller\AdminBase;
use think\Db;

/**
 * 营销控制器
 *
 * @author Administrator
 *        
 */
class Promotion extends AdminBase
{
    protected $coupon_type_model;
    protected $coupon_model;
    protected $goods_server;
    protected $coupon_goods_model;
    public function _initialize()
    {
        $this->coupon_type_model  =  new CouponTypeModel;
        $this->coupon_model       =  new CouponModel;
        $this->coupon_goods_model =  new CouponGoodsModel;
        $this->goods_server       =  new GoodsServer;
        parent::_initialize();
    }

    /**
     * 优惠券类型列表
     *
     * @return multitype:number unknown |Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function coupon( $keyword = '', $page = 1 )
    {
        $map   = [];
        $field = 'coupon_type_id,coupon_name,money,count,max_fetch,at_least,need_user_level,is_show,start_time,end_time';
        if (!empty($keyword)) {
            $map['coupon_name'] = ['like', "%{$keyword}%"];
        }

        $coupon_list = $this->coupon_type_model->where($map)->field($field)->order(['end_time'=>'AESC'])->paginate(20, false, ['page' => $page]);
   
        return $this->fetch('coupon',['coupon_list'=>$coupon_list,'keyword' => $keyword]);
    }

    /**
     * 删除优惠券类型
     */
    public function delcoupon( $id = 0, $ids = [] )
    {
        $id = $ids ? $ids : $id;
        if ( $id ) {
            if ($this->coupon_type_model->destroy( $id )) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的优惠券');
        }
    }

    /**
     * 优惠券领取记录
     */
    public function couponGetList( $id ){
        $field = 'u.nickname,u.portrait,c.coupon_code,c.fetch_time,c.state';
        $stateNote = ['未使用', '已使用','已过期'];
        $couponList = $this->coupon_model->alias('c')->field($field)->join('user u','c.uid = u.id','LEFT')->where(['coupon_type_id'=>$id])->order('fetch_time desc')->select()->toArray();
        if( !empty($couponList)){
            foreach ( $couponList as &$v){
                $v['state'] = $stateNote[$v['state']];
            }
        }
        return $this->fetch('coupon_get_list',['coupon_list'=>$couponList]);

    }
    /**
     * 添加优惠券类型
     */
    public function addCoupon()
    {
        if( request()->isPost() ){
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'coupon');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {

                if( $data['goods_ids'] != ''){//关联商品
                    $ids = explode(',',trim($data['goods_ids'],',') );
                    $data['range_type'] = 0;
                }else{
                    $data['range_type'] = 1;
                }
                try {
                    //开始事物
                    Db::startTrans();
                    $coupon_type_id = $this->coupon_type_model->allowField(true)->save($data);
                    if ( $coupon_type_id ) {
                        $id = $this->coupon_type_model->coupon_type_id;
                        if ($data['count'] > 0) {
                            for ($i = 0; $i < $data['count']; $i ++) {
                                $data_coupon = array(
                                    'coupon_type_id' => $id,
                                    'coupon_code' => time() . rand(111, 999),
                                    'uid' => 0,
                                    'create_order_id' => 0,
                                    'money' => $data['money'],
                                    'state' => 0,
                                    "start_time" => strtotime($data['start_time']),
                                    "end_time" => strtotime($data['end_time'])
                                );
                                $retval = $this->coupon_model->save($data_coupon);
                            }
                        }
                        if( $data['range_type'] == 0 ){
                            foreach ($ids as $key => $value) {//关联商品
                                $req = array(
                                'coupon_type_id' => $id,
                                'goods_id' => $value
                                ); 
                                $this->coupon_goods_model->insert($req);
                            }

                        }
                        
                    
                        Db::commit();
                        $this->success('保存成功');
                    } else {
                        Db::rollback();
                        $this->error('保存失败');
                    }

                } catch (Exception $e) {
                    Db::rollback();
                    $this->error('保存失败');
                }
            }
        }else{
            return $this->fetch('add_coupon');
        }
    }

    /**
     * 修改优惠券信息
     * @return mixed
     */
    public function updateCoupon( )
    {
        if(request()->isPost()){
            $data            = $this->request->param();
            try {
                Db::startTrans();
                if( $data['goods_ids'] != ''){//修改关联商品
                    $goods_ids = trim($data['goods_ids'],',');
                    $coupon_goods_list = $this->coupon_goods_model->where('coupon_type_id','=',$data['coupon_type_id'])->select()->toArray();

                    $coupon_goods_ids = $req = [];
                    $goods_ids = explode(',',$goods_ids);
                    if( !empty($coupon_goods_list) ){//删除不存在的
                        foreach ($coupon_goods_list as $key => $value) {
                            if(!in_array($value['goods_id'],$goods_ids)){
                                $this->coupon_goods_model->where(['id'=>$value['id']])->delete();
                            }
                            $coupon_goods_ids[] = $value['goods_id'];
                        }
                    }

                    if( !empty($goods_ids)  ){//添加库中没有的
                        foreach ($goods_ids as $key => $value) {
                            if( !in_array( $value,$coupon_goods_ids) ){
                                 $req = array(
                                    'coupon_type_id' => $data['coupon_type_id'],
                                    'goods_id' => $value
                                ); 
                               $this->coupon_goods_model->insert($req);
                            }
                           
                        }
                    }
                    $data['range_type'] = 0;
                }else{
                    //删除所有关联商品
                    $this->coupon_goods_model->where(['coupon_type_id'=>$data['coupon_type_id']])->delete();
                    $data['range_type'] = 1;
                }

                $id = $data['coupon_type_id'];
                unset($data['goods_ids']);
                unset($data['coupon_type_id']);
                $data['start_time'] = strtotime($data['start_time']);
                $data['end_time']   = strtotime($data['end_time']);

                $row = $this->coupon_type_model->allowField(true)->where(['coupon_type_id'=>$id])->update($data);

                if( $row == 0 || $row == 1 ){
                    Db::commit();
                    $this->success('更新成功');
                }else{
                    Db::rollback();
                    $this->error('更新失败');

                }
            } catch (Exception $e) {
                Db::rollback();
                $this->error('更新失败');
            }
        }else{
            $data   = $this->request->param();
            $ids = $this->coupon_goods_model->where(['coupon_type_id'=>$data['id']])->select()->toArray();
            $idsStr = '';
            foreach ($ids as $key => &$value) {
               $idsStr .= $value['goods_id'].',';
            }

            $list = $this->goods_server->getGoodsListByIds($idsStr);
            $goods_ids = '';
            foreach ($list as $key => $value) {
                $goods_ids .= $value['id'].',';
            }
            $coupon = $this->coupon_type_model->find($data['id']);

            return $this->fetch('update_coupon', ['coupon' => $coupon,'goods_list'=>$list,'goods_ids'=>$goods_ids]);
        }
    }

    /**
     * 获取优惠券详情
     */
    public function getCouponTypeInfo()
    {
        $coupon = new PromotionService();
        $coupon_type_id = request()->post('coupon_type_id', '');
        $coupon_type_data = $coupon->getCouponTypeDetail($coupon_type_id);
        return $coupon_type_data;
    }

    /**
     * 功能：积分管理
     */
    public function pointConfig()
    {
        $pointConfig = new PromotionService();
        if (request()->isAjax()) {
            $convert_rate = request()->post('convert_rate', '');
            $is_open = request()->post('is_open', 0);
            $desc = request()->post('desc', 0);
            $retval = $pointConfig->setPointConfig($convert_rate, $is_open, $desc);
            return AjaxReturn($retval);
        }
        $child_menu_list = array(
            array(
                'url' => "promotion/pointconfig",
                'menu_name' => "积分管理",
                "active" => 1
            ),
            array(
                'url' => "promotion/integral",
                'menu_name' => "积分奖励",
                "active" => 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        $pointconfiginfo = $pointConfig->getPointConfig();
        $this->assign("pointconfiginfo", $pointconfiginfo);
        return view($this->style . "Promotion/pointConfig");
    }

    /**
     * 赠品列表
     * wzy
     */
    public function giftList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post("page_size", PAGESIZE);
            $search_text = request()->post('search_text');
            $gift = new PromotionService();
            $condition = array(
                'shop_id' => $this->instance_id,
                'gift_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $list = $gift->getPromotionGiftList($page_index, $page_size, $condition);
            return $list;
        }
        return view($this->style . "Promotion/giftList");
    }

    /**
     * 添加赠品
     *
     * @return \think\response\View
     */
    public function addGift()
    {
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $gift_name = request()->post('gift_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $days = request()->post('days', '');
            $max_num = request()->post('max_num', '');
            $goods_id_array = request()->post('goods_id_array', '');
            $gift = new PromotionService();
            $res = $gift->addPromotionGift($shop_id, $gift_name, $start_time, $end_time, $days, $max_num, $goods_id_array);
            return AjaxReturn($res);
        }
        return view($this->style . "Promotion/addGift");
    }

    /**
     * 修改赠品
     *
     * @return \think\response\View
     */
    public function updateGift()
    {
        $gift = new PromotionService();
        if (request()->isAjax()) {
            $gift_id = request()->post('gift_id', '');
            $shop_id = $this->instance_id;
            $gift_name = request()->post('gift_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $days = request()->post('days', '');
            $max_num = request()->post('max_num', '');
            $goods_id_array = request()->post('goods_id_array', '');
            $res = $gift->updatePromotionGift($gift_id, $shop_id, $gift_name, $start_time, $end_time, $days, $max_num, $goods_id_array);
            return AjaxReturn($res);
        } else {
            $gift_id = request()->get('gift_id', 0);
            if (! is_numeric($gift_id)) {
                $this->error('未获取到信息');
            }
            $info = $gift->getPromotionGiftDetail($gift_id);
            $this->assign('info', $info);
            return view($this->style . "Promotion/updateGift");
        }
    }

    /**
     * 获取赠品 详情
     *
     * @param unknown $gift_id            
     */
    public function getGiftInfo($gift_id)
    {
        $gift = new PromotionService();
        $info = $gift->getPromotionGiftDetail($gift_id);
        return $info;
    }

    /**
     * 满减送 列表
     */
    public function mansongList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text', '');
            $status = request()->post('status', '');
            $condition = array(
                'shop_id' => $this->instance_id,
                'mansong_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $mansong = new PromotionService();
            if ($status !== '-1') {
                $condition['status'] = $status;
                $list = $mansong->getPromotionMansongList($page_index, $page_size, $condition);
            } else {
                $list = $mansong->getPromotionMansongList($page_index, $page_size, $condition);
            }
            return $list;
        }
        
        $status = request()->get('status', - 1);
        $this->assign("status", $status);
        $child_menu_list = array(
            array(
                'url' => "promotion/mansonglist",
                'menu_name' => "全部",
                "active" => $status == '-1' ? 1 : 0
            ),
            array(
                'url' => "promotion/mansonglist?status=0",
                'menu_name' => "未发布",
                "active" => $status == 0 ? 1 : 0
            ),
            array(
                'url' => "promotion/mansonglist?status=1",
                'menu_name' => "进行中",
                "active" => $status == 1 ? 1 : 0
            ),
            array(
                'url' => "promotion/mansonglist?status=3",
                'menu_name' => "已关闭",
                "active" => $status == 3 ? 1 : 0
            ),
            array(
                'url' => "promotion/mansonglist?status=4",
                'menu_name' => "已结束",
                "active" => $status == 4 ? 1 : 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        return view($this->style . "Promotion/mansongList");
    }

    /**
     * 添加满减送活动
     *
     * @return \think\response\View
     */
    public function addMansong()
    {
        $mansong = new PromotionService();
        if (request()->isAjax()) {
            $mansong_name = request()->post('mansong_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $shop_id = $this->instance_id;
            $type = request()->post('type', '');
            $range_type = request()->post('range_type', '');
            $rule = request()->post('rule', '');
            $goods_id_array = request()->post('goods_id_array', '');
            $res = $mansong->addPromotionMansong($mansong_name, $start_time, $end_time, $shop_id, '', $type, $range_type, $rule, $goods_id_array);
            return AjaxReturn($res);
        } else {
            $child_menu_list = array(
                array(
                    'url' => "javascript:;",
                    'menu_name' => $this->module_info['module_name'],
                    'active' => 1,
                    "superior_menu" => array(
                        'url' => "promotion/mansonglist",
                        'menu_name' => "满减送",
                        'active' => 1,
                    )
                )
            );
            $this->assign("child_menu_list", $child_menu_list);
            return view($this->style . "Promotion/addMansong");
        }
    }

    /**
     * 修改 满减送活动
     */
    public function updateMansong()
    {
        $mansong = new PromotionService();
        if (request()->isAjax()) {
            $mansong_id = request()->post('mansong_id', '');
            $mansong_name = request()->post('mansong_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $shop_id = $this->instance_id;
            $type = request()->post('type', '');
            $range_type = request()->post('range_type', '');
            $rule = request()->post('rule', '');
            $goods_id_array = request()->post('goods_id_array', '');
            $res = $mansong->updatePromotionMansong($mansong_id, $mansong_name, $start_time, $end_time, $shop_id, '', $type, $range_type, $rule, $goods_id_array);
            return AjaxReturn($res);
        } else {
            $mansong_id = request()->get('mansong_id', '');
            if (! is_numeric($mansong_id)) {
                $this->error('未获取到信息');
            }
            $info = $mansong->getPromotionMansongDetail($mansong_id);
            $condition = array(
                'shop_id' => $this->instance_id
            );
            $coupon_type_list = $mansong->getCouponTypeList(1, 0, $condition);
            $gift_list = $mansong->getPromotionGiftList(1, 0, $condition);
            $this->assign('coupon_type_list', $coupon_type_list);
            $this->assign('gift_list', $gift_list);
            $this->assign('mansong_info', $info);
            $child_menu_list = array(
                array(
                    'url' => "javascript:;",
                    'menu_name' => $this->module_info['module_name'],
                    'active' => 1,
                    "superior_menu" => array(
                        'url' => "promotion/mansonglist",
                        'menu_name' => "满减送",
                        'active' => 1,
                    )
                )
            );
            $this->assign("child_menu_list", $child_menu_list);
            return view($this->style . "Promotion/updateMansong");
        }
    }

    /**
     * 获取限时折扣；列表
     */
    public function getDiscountList()
    {
        if (request()->isAjax()) {
            $page_index = request()->post("page_index", 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text', '');
            $status = request()->post('status', '');
            $discount = new PromotionService();
            
            $condition = array(
                'shop_id' => $this->instance_id,
                'discount_name' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            if ($status !== '-1') {
                $condition['status'] = $status;
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            } else {
                $list = $discount->getPromotionDiscountList($page_index, $page_size, $condition);
            }
            
            return $list;
        }
        
        $status = request()->get('status', - 1);
        $this->assign("status", $status);
        $child_menu_list = array(
            array(
                'url' => "promotion/getdiscountList",
                'menu_name' => "全部",
                "active" => $status == '-1' ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=0",
                'menu_name' => "未发布",
                "active" => $status == 0 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=1",
                'menu_name' => "进行中",
                "active" => $status == 1 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=3",
                'menu_name' => "已关闭",
                "active" => $status == 3 ? 1 : 0
            ),
            array(
                'url' => "promotion/getdiscountList?status=4",
                'menu_name' => "已结束",
                "active" => $status == 4 ? 1 : 0
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        
        return view($this->style . "Promotion/getDiscountList");
    }

    /**
     * 添加限时折扣
     */
    public function addDiscount()
    {
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_name = request()->post('discount_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $remark = '';
            $goods_id_array = request()->post('goods_id_array', '');
            $retval = $discount->addPromotiondiscount($discount_name, $start_time, $end_time, $remark, $goods_id_array);
            return AjaxReturn($retval);
        }
        $child_menu_list = array(
            array(
                'url' => "javascript:;",
                'menu_name' => $this->module_info['module_name'],
                'active' => 1,
                "superior_menu" => array(
                    'url' => "promotion/getdiscountlist",
                    'menu_name' => "限时折扣",
                    'active' => 1,
                )
            )
        );
        $this->assign("child_menu_list", $child_menu_list);
        return view($this->style . "Promotion/addDiscount");
    }

    /**
     * 修改限时折扣
     */
    public function updateDiscount()
    {
        if (request()->isAjax()) {
            $discount = new PromotionService();
            $discount_id = request()->post('discount_id', '');
            $discount_name = request()->post('discount_name', '');
            $start_time = request()->post('start_time', '');
            $end_time = request()->post('end_time', '');
            $remark = '';
            $goods_id_array = request()->post('goods_id_array', '');
            $retval = $discount->updatePromotionDiscount($discount_id, $discount_name, $start_time, $end_time, $remark, $goods_id_array);
            return AjaxReturn($retval);
        }
        $info = $this->getDiscountDetail();
        if (! empty($info['goods_list'])) {
            foreach ($info['goods_list'] as $k => $v) {
                $goods_id_array[] = $v['goods_id'];
            }
        }
        $info['goods_id_array'] = $goods_id_array;
        $this->assign("info", $info);
        $child_menu_list = array(
            array(
                'url' => "javascript:;",
                'menu_name' => $this->module_info['module_name'],
                'active' => 1,
                "superior_menu" => array(
                    'url' => "promotion/getdiscountlist",
                    'menu_name' => "限时折扣",
                    'active' => 1,
                )
            )
        );
        $this->assign("child_menu_list", $child_menu_list);
        return view($this->style . "Promotion/updateDiscount");
    }

    /**
     * 获取限时折扣详情
     */
    public function getDiscountDetail()
    {
        $discount_id = request()->get('discount_id', '');
        if (! is_numeric($discount_id)) {
            $this->error("没有获取到折扣信息");
        }
        $discount = new PromotionService();
        $detail = $discount->getPromotionDiscountDetail($discount_id);
        return $detail;
    }

    /**
     * 获取满减送详情
     */
    public function getMansongDetail()
    {
        $mansong_id = request()->get('mansong_id', '');
        if (! is_numeric($mansong_id)) {
            $this->error("没有获取到满减送信息");
        }
        $mansong = new PromotionService();
        $detail = $mansong->getPromotionMansongDetail($mansong_id);
        return $detail;
    }

    /**
     * 删除限时折扣
     */
    public function delDiscount()
    {
        $discount_id = request()->post('discount_id', '');
        if (empty($discount_id)) {
            $this->error("没有获取到折扣信息");
        }
        $discount = new PromotionService();
        $res = $discount->delPromotionDiscount($discount_id);
        return AjaxReturn($res);
    }

    /**
     * 关闭正在进行的限时折扣
     */
    public function closeDiscount()
    {
        $discount_id = request()->post('discount_id', '');
        if (! is_numeric($discount_id)) {
            $this->error("没有获取到折扣信息");
        }
        $discount = new PromotionService();
        $res = $discount->closePromotionDiscount($discount_id);
        return AjaxReturn($res);
    }

    /**
     * 删除满减送活动
     *
     * @return unknown[]
     */
    public function delMansong()
    {
        $mansong_id = request()->post('mansong_id', '');
        if (empty($mansong_id)) {
            $this->error("没有获取到满减送信息");
        }
        $mansong = new PromotionService();
        $res = $mansong->delPromotionMansong($mansong_id);
        return AjaxReturn($res);
    }

    /**
     * 关闭满减送活动
     *
     * @return unknown[]
     */
    public function closeMansong()
    {
        $mansong_id = request()->post('mansong_id', '');
        if (! is_numeric($mansong_id)) {
            $this->error("没有获取到满减送信息");
        }
        $mansong = new PromotionService();
        $res = $mansong->closePromotionMansong($mansong_id);
        return AjaxReturn($res);
    }

    /**
     * 满额包邮
     */
    public function fullShipping()
    {
        $full = new PromotionService();
        if (request()->isAjax()) {
            $is_open = request()->post('is_open', '');
            $full_mail_money = request()->post('full_mail_money', '');
            $no_mail_province_id_array = request()->post('no_mail_province_id_array', '');
            $no_mail_city_id_array = request()->post("no_mail_city_id_array", '');
            $res = $full->updatePromotionFullMail(0, $is_open, $full_mail_money, $no_mail_province_id_array, $no_mail_city_id_array);
            return AjaxReturn($res);
        } else {
            $info = $full->getPromotionFullMail($this->instance_id);
            $this->assign("info", $info);
            $existing_address_list['province_id_array'] = explode(',', $info['no_mail_province_id_array']);
            $existing_address_list['city_id_array'] = explode(',', $info['no_mail_city_id_array']);
            $address = new Address();
            // 目前只支持省市，不支持区县，在页面上不会体现 2017年9月14日 19:18:08 王永杰
            $address_list = $address->getAreaTree($existing_address_list);
            $this->assign("address_list", $address_list);
            $no_mail_province_id_array = '';
            if (! empty($existing_address_list['province_id_array'])) {
                foreach ($existing_address_list['province_id_array'] as $v) {
                    $no_mail_province_id_array[] = $address->getProvinceName($v);
                }
            }
            $no_mail_province = implode(',', $no_mail_province_id_array);
            $this->assign("no_mail_province", $no_mail_province);
            return view($this->style . "Promotion/fullShipping");
        }
    }

    /**
     * 单店基础版积分奖励
     */
    public function integral()
    {
        $child_menu_list = array(
            array(
                'url' => "promotion/pointconfig",
                'menu_name' => "积分管理",
                "active" => 0
            ),
            array(
                'url' => "promotion/integral",
                'menu_name' => "积分奖励",
                "active" => 1
            )
        );
        $this->assign('child_menu_list', $child_menu_list);
        $rewardRule = new PromoteRewardRule();
        if (request()->isAjax()) {
            $shop_id = $this->instance_id;
            $sign_point = request()->post('sign_point', 0);
            $share_point = request()->post('share_point', 0);
            $reg_member_self_point = request()->post('reg_member_self_point', 0);
            $reg_member_one_point = 0;
            $reg_member_two_point = 0;
            $reg_member_three_point = 0;
            $reg_promoter_self_point = 0;
            $reg_promoter_one_point = 0;
            $reg_promoter_two_point = 0;
            $reg_promoter_three_point = 0;
            $reg_partner_self_point = 0;
            $reg_partner_one_point = 0;
            $reg_partner_two_point = 0;
            $reg_partner_three_point = 0;
            $click_point = request()->post("click_point", 0);
            $comment_point = request()->post("comment_point", 0);
            $res = $rewardRule->setPointRewardRule($shop_id, $sign_point, $share_point, $reg_member_self_point, $reg_member_one_point, $reg_member_two_point, $reg_member_three_point, $reg_promoter_self_point, $reg_promoter_one_point, $reg_promoter_two_point, $reg_promoter_three_point, $reg_partner_self_point, $reg_partner_one_point, $reg_partner_two_point, $reg_partner_three_point, $click_point, $comment_point);
            return AjaxReturn($res);
        }
        $res = $rewardRule->getRewardRuleDetail($this->instance_id);
        $Config = new Config();
        $integralConfig = $Config->getIntegralConfig($this->instance_id);
        $this->assign("res", $res);
        $this->assign("integralConfig", $integralConfig);
        return view($this->style . "Promotion/integral");
    }

    /**
     *
     * @return Ambigous <multitype:unknown, multitype:unknown unknown string >
     */
    public function setIntegralAjax()
    {
        $register = request()->post('register', 0);
        $sign = request()->post('sign', 0);
        $share = request()->post('share', 0);
        $Config = new Config();
        $retval = $Config->SetIntegralConfig($this->instance_id, $register, $sign, $share);
        return AjaxReturn($retval);
    }
}