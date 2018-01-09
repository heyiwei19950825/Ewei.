<?php 

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Shop as ShopModel;
use app\common\model\ShopGroup as ShopGroupModel;
use app\common\model\AdminUser as AdminUserModel;
use app\common\model\AuthGroupAccess as AuthGroupAccessModel;
use app\common\model\City as CityModel;//城市
use app\common\model\District as DistrictModel;//区
use app\common\model\Province as ProvinceModel;//省份


use think\Session;
use think\Config;

class ShopInfo extends AdminBase
{
    protected $shop_model;
    protected $shop_group_model;
    protected $city_model;
    protected $district_model;
    protected $province_model;


    protected function _initialize()
    {
        parent::_initialize();
        $this->shop_model              = new ShopModel();
        $this->shop_group_model        = new ShopGroupModel();
         $this->city_model = new CityModel();
        $this->district_model = new DistrictModel();
        $this->province_model = new ProvinceModel();
    }

    /**
     * 商城配置
     */
    public function index(){
        if( $this->request->isPost()){
            if ($this->request->isPost()) {
                $data            = $this->request->param();
                $validate_result = $this->validate($data, 'Shop');
                $userId = Session::get('admin_id');
                $userId = 23;
                $shopInfo = $this->shop_model->field('id')->where(['uid'=>$userId])->find();
                $where['id'] =$shopInfo->id;

                if ($validate_result !== true) {
                    $this->error($validate_result);
                } else {
                    if ($this->shop_model->allowField(true)->save($data, $where) !== false) {
                        $this->success('更新成功');
                    } else {
                        $this->error('更新失败');
                    }
                }
            }
        }else{
            $id = Session::get('admin_id');
            $id = 23;
            $cityList = $this->city_model->select();
            $districtList = $this->district_model->select();
            $provinceList = $this->province_model->select();
            $info = $this->shop_model->where(['uid'=>$id])->find();
            $shop_group_list = $this->shop_group_model->field('id,group_name')->select();

            return $this->fetch('index', ['info' => $info,'shop_group_list'=>$shop_group_list,'cityList'=>$cityList,'districtList'=>$districtList,'provinceList'=>$provinceList]);

        }
    }
}

 ?>