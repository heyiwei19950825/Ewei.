<?php
/**
 * Created by PhpStorm.
 * User: heyiw
 * Date: 2018/2/1
 * Time: 2:19
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\GoodsCollective as GoodsCollectiveModel;

class Collective extends BaseController
{
    /**
     * 获取所有在线的开团商品
     */
    public function getList(){
        $page = $this->request->param('page');
        $size = $this->request->param('size');
        $collectiveList = GoodsCollectiveModel::getList($page,$size);
        $collectiveList['data'] = self::prefixDomainToArray('thumb',$collectiveList['data']);

        //配置参数
        $data = [
            'count' => $collectiveList['total'],//总数
            'last_page' => $collectiveList['last_page'],//下一页页码
            'currentPage' => $collectiveList['current_page'],//当前页码
            'goodsList'=>$collectiveList['data'],//商品列表
            'pagesize'  => $size,//每页长度
            'totalPages' => 1, //总页数
            'data' => $collectiveList['data'],
        ];

        $row = [
            'errno' => 0,
            'errmsg' => '',
            'data' => $data
        ];

        return $row;
    }
}