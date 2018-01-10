<?php
namespace app\admin\controller;

use app\common\model\Article as ArticleModel;
use app\common\model\ArticleCategory as ArticleCategoryModel;
use app\common\server\Goods as GoodsServer;
use app\common\controller\AdminBase;
use think\Db;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class Article extends AdminBase
{
    protected $article_model;
    protected $category_model;
    protected $goods_server;
    protected function _initialize()
    {
        parent::_initialize();
        $this->article_model  = new ArticleModel();
        $this->category_model = new ArticleCategoryModel();
        $this->goods_server   = new GoodsServer;

        $category_level_list = $this->category_model->getLevelList();
        $this->assign('category_level_list', $category_level_list);
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($cid = 0, $keyword = '', $page = 1)
    {
        $map   = [];
        $field = 'id,title,cid,author,reading,status,publish_time,sort';

        if ($cid > 0) {
            $category_children_ids = $this->category_model->where(['path' => ['like', "%,{$cid},%"]])->column('id');
            $category_children_ids = (!empty($category_children_ids) && is_array($category_children_ids)) ? implode(',', $category_children_ids) . ',' . $cid : $cid;
            $map['cid']            = ['IN', $category_children_ids];
        }

        if (!empty($keyword)) {
            $map['title'] = ['like', "%{$keyword}%"];
        }

        $article_list  = $this->article_model->field($field)->where($map)->order(['publish_time' => 'DESC'])->paginate(15, false, ['page' => $page]);
        $category_list = $this->category_model->column('name', 'id');

        return $this->fetch('index', ['article_list' => $article_list, 'category_list' => $category_list, 'cid' => $cid, 'keyword' => $keyword]);
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $req             = [];
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Article');

            if( $data['goods_ids'] != ''){//关联商品
                $ids = explode(',',trim($data['goods_ids'],',') );
                $data['range_type'] = 0;
            }else{
                $data['range_type'] = 1;
            }

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->article_model->allowField(true)->save($data)) {
                    foreach ($ids as $key => $value) {//关联商品
                        $req[$key] = array(
                            'article_id' => $this->article_model->id,
                            'goods_id' => $value
                        ); 
                    }

                    Db::name('article_goods')->insertAll($req);
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑文章
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $article = $this->article_model->find($id);

        $ids = Db::name('article_goods')->where(['article_id'=>$id])->select()->toArray();
        $idsStr = '';
        foreach ($ids as $key => &$value) {
           $idsStr .= $value['goods_id'].',';
        }

        $list = $this->goods_server->getGoodsListByIds($idsStr);
        $goods_ids = '';
        foreach ($list as $key => $value) {
            $goods_ids .= $value['id'].',';
        }

        return $this->fetch('edit', ['article' => $article,'goods_list'=>$list]);
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $req             = [];
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Article');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->article_model->allowField(true)->save($data, $id) !== false) {
                    if( $data['goods_ids'] != ''){//关联商品
                        $ids = explode(',',trim($data['goods_ids'],',') );
                        $data['range_type'] = 0;
                    }else{
                        $data['range_type'] = 1;
                    }

                    foreach ($ids as $key => $value) {//关联商品
                        $req[$key] = array(
                            'article_id' => $id,
                            'goods_id' => $value
                        ); 
                    }
                    
                    Db::name('article_goods')->where(['article_id'=>$id])->delete();
                    Db::name('article_goods')->insertAll($req);
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除文章
     * @param int   $id
     * @param array $ids
     */
    public function delete($id = 0, $ids = [])
    {
        $id = $ids ? $ids : $id;
        if ($id) {
            if ($this->article_model->destroy($id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的文章');
        }
    }

    /**
     * 文章审核状态切换
     * @param array  $ids
     * @param string $type 操作类型
     */
    public function toggle($ids = [], $type = '')
    {
        $data   = [];
        $status = $type == 'audit' ? 1 : 0;

        if (!empty($ids)) {
            foreach ($ids as $value) {
                $data[] = ['id' => $value, 'status' => $status];
            }
            if ($this->article_model->saveAll($data)) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $this->error('请选择需要操作的文章');
        }
    }
}