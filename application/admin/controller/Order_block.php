<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Order as OrderModel;
use think\Db;

/**
 * 订单管理
 * Class SlideCategory
 * @package app\admin\controller
 */
class Order extends AdminBase
{
    protected $orderModel = null;
    protected function _initialize()
    {
        parent::_initialize();
        $this->orderModel = new OrderModel();

    }

    /**
     * 订单管理
     * @return mixed
     */
    public function index()
    {
        $param = $this->request->param();

        $order_list = $this->orderModel->getOrderAll( $param );
        return $this->fetch('index', ['order_list' => $order_list,'keyword'=>1]);
    }

    /**
     * 添加订单
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存分类
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            if (Db::name('banner')->insert($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 编辑订单
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $banner = Db::name('banner')->find($id);

        return $this->fetch('edit', ['banner' => $banner]);
    }

    /**
     * 更新订单
     * @throws \think\Exception
     */
    public function update()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            if (Db::name('banner')->update($data) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }

    /**
     * 删除订单
     * @param $id
     * @throws \think\Exception
     */
    public function delete($id)
    {
        if (Db::name('banner')->delete($id) !== false) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}