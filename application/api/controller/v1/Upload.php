<?php
namespace app\api\controller\v1;

use think\Controller;
use think\Session;
use think\Image;
use think\File;

/**
 * 通用上传接口
 * Class Upload
 * @package app\api\controller
 */
class Upload extends Controller
{
    protected function _initialize()
    {
        parent::_initialize();
        if (!Session::has('admin_id')) {
            $result = [
                'error'   => 1,
                'message' => '未登录'
            ];

            return json($result);
        }
    }

    /**
     * 通用图片上传接口
     * @return \think\response\Json
     */
    public function upload()
    {
        $config = [
            'size' => 2097152,
            'ext'  => 'jpg,gif,png,bmp'
        ];

        $file        = $this->request->file('file');
        $data        = $this->request->param();
 
        $upload_path = str_replace('\\', '/', ROOT_PATH . 'public/uploads/');
        $save_path   = '/uploads/';
        $info        = $file->validate($config)->move($upload_path);
        $time        = date('Ymd',time());

        if ($info) {
            //创建缩略图
            $image    = Image::open( UPLOAD_PATH . $info->getSaveName() );
            if ( !is_dir('./uploads/thumb/'.$time )) {//检测文件夹是否存在
                mkdir('./uploads/thumb/'.$time);//创建缩略图日期文件
            }
            // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.png
            $imageRow = $image->thumb($data['width'], $data['height'])->save('./uploads/thumb/'. $info->getSaveName());

            $result   = [
                'error'   => 0,
                'url'     => str_replace('\\', '/', '/uploads/thumb/' . $info->getSaveName()),
                'img_row' => $imageRow->size()
            ];
        } else {
            $result = [
                'error'   => 1,
                'message' => $file->getError()
            ];
        }

        return json($result);
    }
}