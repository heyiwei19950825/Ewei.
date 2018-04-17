<?php 

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Shop as ShopModel;
use app\common\model\ShopReplace as ShopReplaceModel;
use app\common\model\ShopGroup as ShopGroupModel;
use app\common\model\City as CityModel;//城市
use app\common\model\District as DistrictModel;//区
use app\common\model\Province as ProvinceModel;
use think\Exception;//省份


class ShopInfo extends AdminBase
{
    protected $shop_model;
    protected $shop_replace_model;
    protected $shop_group_model;
    protected $city_model;
    protected $district_model;
    protected $province_model;


    protected function _initialize()
    {
        parent::_initialize();
        $this->shop_model               = new ShopModel();
        $this->shop_replace_model       = new ShopReplaceModel();
        $this->shop_group_model         = new ShopGroupModel();
        $this->city_model               = new CityModel();
        $this->district_model           = new DistrictModel();
        $this->province_model           = new ProvinceModel();
    }

    /**
     * 商城配置
     */
    public function index(){
        $type = $this->request->param('type','default');
        $id = $this->request->param('id',0);
        $temple = $type =='audit'?'index_audit':'index';
        $model = $type =='audit'?$this->shop_replace_model:$this->shop_model;
        $temple = $id==0?$temple:'shop/audit_detail';//检测是否是商家列表审核
        $id = $id==0?$this->instance_id:$id;


        if( $this->request->isPost()){
            if ($this->request->isPost()) {
                $data            = $this->request->param();
                $validate_result = $this->validate($data, 'Shop');
                $where['id'] =$id;

                if ($validate_result !== true) {
                    $this->error($validate_result);
                } else {
                    //删除原有审核数据
                    $this->shop_replace_model->pageDel(['id'=>$id]);
                    $data['id'] = $id;
                    $this->shop_replace_model->pageSave( $data );
                    $this->shop_model->pageSave(['audit_status'=>2], $where);

                    $this->success('已提交审核');
                }
            }
        }else{
            $cityList     = $this->city_model->pageQuery()['data'];
            $districtList = $this->district_model->pageQuery()['data'];
            $provinceList = $this->province_model->pageQuery()['data'];


            $info = $model->getInfo(['id'=>$id]);

            if( empty($info) &&  $type =='audit'){
               return $this->error('暂无审核数据');
            }

            //查询审核状态和审核信息备注
            if($type =='audit'){
                $shopInfo = $this->shop_model->getInfo(['id'=>$id],'audit_status,audit_note');
                $statusNote = array('无提交','审核通过','提交审核','审核不通过');
                $info['shop_status'] = $statusNote[$shopInfo['audit_status']];
                $info['audit_note']  = $shopInfo['audit_note'];
            }else{
                $statusNote = array('关闭','开启','审核中');
                $info['shop_status'] =$statusNote[$info['shop_status']];
            }

            $shop_group_list = $this->shop_group_model->field('id,group_name')->select()->toArray();

            return $this->fetch($temple, ['info' => $info,'shop_group_list'=>$shop_group_list,'cityList'=>$cityList,'districtList'=>$districtList,'provinceList'=>$provinceList]);
        }
    }


    /**
     * 使用修改配置
     */
    public function useUpdate(){
        if($this->request->isPost()){
            $id = $this->instance_id;
            //查询替换版本数据
            $replaceRow = $this->shop_replace_model->getInfo(['id'=>$id]);

            if($replaceRow){
                $replaceData = [
                    'shop_name'=> $replaceRow['shop_name'],
                    'shop_category'=> $replaceRow['shop_category'],
                    'shop_phone'=> $replaceRow['shop_phone'],
                    'shop_logo'=> $replaceRow['shop_logo'],
                    'shop_banner'=> $replaceRow['shop_banner'],
                    'shop_address'=> $replaceRow['shop_address'],
                    'brief'=> $replaceRow['brief'],
                    'shop_zip'=> $replaceRow['shop_zip'],
                    'latitude_longitude'=> $replaceRow['latitude_longitude'],
                ];

                //替换当前版本
                $row = $this->shop_model->pageSave($replaceData,['id'=>$id]);

                //删除替换版本数据
                $this->shop_replace_model->pageDel(['id'=>$id]);
                if( $row ){
                    $this->success('操作成功');
                }else{
                    $this->error('操作失败');
                }
            }else{
                $this->success('没有修改');
            }

        }else{
            $this->error('请求错误');
        }
    }
}
 ?>