<?php
/**
 * 物流
 * @authors Ewei (lamp_heyiwei@163.com)
 * @date    2017-12-19 22:51:29
 * @version $Id$
 */
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\ExpressCompany as ExpressaModel;

use think\Config;
use think\Db;
use app\common\lib\Helper as HelperClass;

class Expressage extends AdminBase {
    protected $expressa_model;
    protected $where;

    protected function _initialize()
    {
        parent::_initialize();
        $this->expressa_model = new ExpressaModel();

    }
  
	public function index( $page = 1){
		$list  = $this->expressa_model->pageQuery($page,30,[],'s_id desc,orders desc','',true);

	    return $this->fetch('index',['list'=>$list]);
	}

	/**
	*	添加
	**/
	public function add(){
		if( $this->request->isPost()){
			$data = $this->request->param();
			$validate_result = $this->validate($data, 'ExpressageCompanys');

			if( $validate_result !== true){
			    $this->error($validate_result);
			}else{
                $data['s_id'] = $this->instance_id;
                if( $data['is_default'] == 1 ){
                    $this->expressa_model->where(['id'=>['<>',0]])->update(['is_default'=>0]);
                }
				if ($this->expressa_model->allowField(true)->save($data)) {
	            $this->success('保存成功');
	        } else {
	            $this->error('保存失败');
	        }
			}
		}else{
			return $this->fetch('add');
		}
	}

    /**
     * 删除物流
     * @param int   $id
     * @param array $ids
     */
    public function delete($id = 0, $ids = [])
    {
        $id = $ids ? $ids : $id;
        if ($id) {
            $this->where = ['id'=>$id];
            if ($this->expressa_model->where($this->where)->delete()) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的文章');
        }
    }

    /**
    * 编辑物流
    * @param $id
    * @return mixed
    */
    public function edit( $id = 0 )
    {
    	if( $this->request->isPost()){

    		if ($this->request->isPost()) {
            	$data            = $this->request->param();
            	$validate_result = $this->validate($data, 'ExpressageCompanys');

                if($this->expressa_model->getInfo(['id'=>$data['id']]) == false){
                    $this->error('没有权限访问');
                }
                if ($validate_result !== true) {
                    $this->error($validate_result);
                } else {
                    if( $data['is_default'] == 1 ){
                        $this->expressa_model->allowField(true)->save(['is_default'=>0],['id'=>$data['id']]);
                    }

                    if ($this->expressa_model->allowField(true)->save($data,['id'=>$data['id']]) !== false) {

                        $this->success('更新成功');
                    } else {
                        $this->error('更新失败');
                    }
                }
            }

    	}else{
    		$info = $this->expressa_model->where($this->where)->find($id);

        	return $this->fetch('edit', ['info' => $info]);
    	}
      
    }
}