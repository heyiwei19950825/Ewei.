<?php
/**
 * 地址
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\City as CityModel;//城市
use app\common\model\District as DistrictModel;//区
use app\common\model\Province as ProvinceModel;//省份

use think\Config;
use think\Db;
use app\common\lib\Helper as HelperClass;
class Address extends AdminBase{

	protected $city_model;
	protected $district_model;
	protected $province_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->city_model = new CityModel();
        $this->district_model = new DistrictModel();
        $this->province_model = new ProvinceModel();
    }
    /**
    * 获取城市地址
    */
    public function getCitry(){
    	$cityList = $this->city_model->where()->select();
    	return json(['data'=>$cityList,'code'=>1,'message'=>'操作完成']);
    }
    /**
    * 获取区地址
    */
    public function getDistrict(){
    	$districtList = $this->district_model->where()->select();
    	return json(['data'=>$districtList,'code'=>1,'message'=>'操作完成']);
    }
     /**
    * 获取省地址
    */
    public function getProvince(){
    	$provinceList = $this->province_model->select();
    	return json(['data'=>$provinceList,'code'=>1,'message'=>'操作完成']);
    }

}