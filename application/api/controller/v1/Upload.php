<?php
namespace app\api\controller\v1;

use think\Controller;
use think\Session;
use think\Image;
use think\File;
use think\Config;

 // 存放商品图片、主图、sku
define("UPLOAD_GOODS", Config::get('view_replace_str.UPLOAD_GOODS'));
// 存放商品图片、主图、sku
define("UPLOAD_GOODS_SKU", Config::get('view_replace_str.UPLOAD_GOODS_SKU'));

// 存放商品品牌图
define("UPLOAD_GOODS_BRAND", Config::get('view_replace_str.UPLOAD_GOODS_BRAND'));

// 存放商品分组图片
define("UPLOAD_GOODS_GROUP", Config::get('view_replace_str.UPLOAD_GOODS_GROUP'));
// 存放商品分类图片
define("UPLOAD_GOODS_CATEGORY", Config::get('view_replace_str.UPLOAD_GOODS_CATEGORY'));

// 存放公共图片、网站logo、独立图片、没有任何关联的图片
define("UPLOAD_COMMON", Config::get('view_replace_str.UPLOAD_COMMON'));

// 存放用户头像
define("UPLOAD_AVATOR", Config::get('view_replace_str.UPLOAD_AVATOR'));

// 存放支付生成的二维码图片
define("UPLOAD_PAY", Config::get('view_replace_str.UPLOAD_PAY'));

// 存放广告位图片
define("UPLOAD_ADV", Config::get('view_replace_str.UPLOAD_ADV'));

// 存放物流图片
define("UPLOAD_EXPRESS", Config::get('view_replace_str.UPLOAD_EXPRESS'));

// 存放文章图片
define("UPLOAD_CMS", Config::get('view_replace_str.UPLOAD_CMS'));

// 存放视频文件
define("UPLOAD_VIDEO", Config::get('view_replace_str.UPLOAD_VIDEO'));


/**
 * 通用上传接口
 * Class Upload
 * @package app\api\controller
 */
class Upload extends Controller
{

   

    private $return = array();
    
    // 文件路径
    private $file_path = "";
    
    // 重新设置的文件路径
    private $reset_file_path = "";

     // 文件名称
    private $file_name = "";
    
    // 文件大小
    private $file_size = 0;
    
    // 文件类型
    private $file_type = "";

    private $upload_type = 1;

    private $instance_id = "";
    //缩略类型
    private $thumb_type = 1;


    protected function _initialize()
    {
        parent::_initialize();
        $this->instance_id = 0;
        if (!Session::has('admin_id')) {
            $result = [
                'error'   => 1,
                'message' => '未登录'
            ];

            return json($result);
        }
    }

    // /**
    //  * 通用图片上传接口
    //  * @return \think\response\Json
    //  */
    // public function upload()
    // {
    //     $config = [
    //         'size' => 2097152,
    //         'ext'  => 'jpg,gif,png,bmp'
    //     ];

    //     $file        = $this->request->file('file');
    //     $data        = $this->request->param();
 
    //     $upload_path = str_replace('\\', '/', ROOT_PATH . 'public/uploads/');
    //     $save_path   = '/uploads/';
    //     $info        = $file->validate($config)->move($upload_path);
    //     $time        = date('Ymd',time());

    //     if ($info) {
    //         //创建缩略图
    //         $image    = Image::open( UPLOAD_PATH . $info->getSaveName() );
    //         if ( !is_dir('./uploads/thumb/'.$time )) {//检测文件夹是否存在
    //             mkdir('./uploads/thumb/'.$time);//创建缩略图日期文件
    //         }
    //         // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.png
    //         $imageRow = $image->thumb($data['width'], $data['height'])->save('./uploads/thumb/'. $info->getSaveName());

    //         $result   = [
    //             'error'   => 0,
    //             'url'     => str_replace('\\', '/', '/uploads/thumb/' . $info->getSaveName()),
    //             'img_row' => $imageRow->size()
    //         ];
    //     } else {
    //         $result = [
    //             'error'   => 1,
    //             'message' => $file->getError()
    //         ];
    //     }

    //     return json($result);
    // }

    public function resetFilePath()
    {
        $file_path = "";
        switch ($this->file_path) {
            case UPLOAD_GOODS:
                $file_path = $this->file_path . date("Ymd") . "/";
                break;
            case UPLOAD_GOODS_SKU:
                $file_path = $this->file_path . request()->post("goods_path", "") . "/";
                break;
            case UPLOAD_GOODS_BRAND:
                $file_path = $this->file_path;
                // 商品品牌
                break;
            case UPLOAD_GOODS_GROUP:
                // 商品分组
                $file_path = $this->file_path;
                break;
            case UPLOAD_GOODS_CATEGORY:
                // 商品分类
                $file_path = $this->file_path;
                break;
            case UPLOAD_COMMON:
                $file_path = $this->file_path;
                // 公共
                break;
            case UPLOAD_AVATOR:
                $file_path = $this->file_path;
                // 用户头像
                break;
            case UPLOAD_PAY:
                $file_path = $this->file_path;
                // 支付
                break;
            case UPLOAD_ADV:
                $file_path = $this->file_path;
                // 广告位
                break;
            case UPLOAD_EXPRESS:
                // 物流
                $file_path = $this->file_path;
                break;
            case UPLOAD_CMS:
                // 文章
                $file_path = $this->file_path;
                break;
            case UPLOAD_VIDEO:
                // 视频
                $file_path = $this->file_path;
                break;
        }
        $this->reset_file_path = $file_path;
    }

     /**
     * 功能说明：文件(图片)上传(存入相册)
     */
    public function upload()
    {
        $this->file_path = request()->post("file_path", "");

        if ($this->file_path == "") {
            $this->return['message'] = "文件路径不能为空";
            return $this->ajaxFileReturn();
        }

        // 重新设置文件路径
        $this->resetFilePath();

        // 检测文件夹是否存在，不存在则创建文件夹
        if (! file_exists($this->reset_file_path)) {
            $mode = intval('0777', 8);
            mkdir($this->reset_file_path, $mode, true);
        }
        $this->file_name = $_FILES["file"]["name"]; // 文件原名
        $this->file_size = $_FILES["file"]["size"]; // 文件大小
        $this->file_type = $_FILES["file"]["type"]; // 文件类型
        
        if ($this->file_size == 0) {
            $this->return['message'] = "文件大小为0MB";
            return $this->ajaxFileReturn();
        }
        
        // 验证文件
        if (! $this->validationFile()) {
            return $this->ajaxFileReturn();
        }
        $guid = time();
        $file_name_explode = explode(".", $this->file_name); // 图片名称
        $suffix = count($file_name_explode) - 1;
        $ext = "." . $file_name_explode[$suffix]; // 获取后缀名
        $newfile = $guid . $ext; // 重新命名文件
                                 // 特殊 判断如果是商品图

        $ok = $this->moveUploadFile($_FILES["file"]["tmp_name"], $this->reset_file_path . $newfile,$_POST['width'],$_POST['height']);

        if ($ok["code"]) {
            // 文件上传成功执行下边的操作
            if (! strstr(UPLOAD_VIDEO, $this->reset_file_path)) {
                @unlink($_FILES['file']);
                $image_size = @getimagesize($ok["path"]); // 获取图片尺寸
                if ($image_size) {
                    
                    $width = $_POST['width'];
                    $height = $_POST['height'];
                    $name = $file_name_explode[0];
                    
                    switch ($this->file_path) {
                        case UPLOAD_GOODS:
                            // 商品图
                            $type = request()->post("type", "");
                            $pic_name = request()->post("pic_name", $name);
                            $album_id = request()->post("album_id", 0);
                            $pic_tag = request()->post("pic_tag", $name);
                            $pic_id = request()->post("pic_id", "");
                            $upload_flag = request()->post("upload_flag", "");
                            // 上传到相册管理，生成四张大小不一的图
                            $retval = $this->photoCreate($this->reset_file_path, $this->reset_file_path . $newfile, "." . $file_name_explode[$suffix], $type, $pic_name, $album_id, $width, $height, $pic_tag, $pic_id, $ok["domain"], $ok["bucket"], $ok["path"]);
                            if ($retval > 0) {
                                $this->return['code'] = 1;
                                $this->return['message'] = "上传成功";
                            } else {
                                $this->return['message'] = "上传失败";
                                $this->return['code'] = 0;
                            }
                            $this->return['data'] = $ok["path"];
                            break;
                        case UPLOAD_GOODS_SKU:
                            // 商品SKU图片
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_GOODS_BRAND:
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            // 商品品牌
                            break;
                        case UPLOAD_GOODS_GROUP:
                            // 商品分组
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_GOODS_CATEGORY:
                            // 商品分类
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_COMMON:

                            // 公共
                            $this->return['code'] = 1;                           
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_AVATOR:
                            // 用户头像
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_PAY:
                            // 支付
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_ADV:
                            // 广告位
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_EXPRESS:
                            // 物流
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case UPLOAD_CMS:
                            // 文章
                            $this->return['code'] = 1;
                            $this->return['data'] = $ok["path"];
                            $this->return['message'] = "上传成功";
                            break;
                        case  UPLOAD_COMMENT:
                            // 评论
                            $new_key = $this->reset_file_path . md5(time() . $name) . "_375_375" . $ext;
                            $retval = $this->uploadThumbFile($this->reset_file_path . $newfile, $new_key, 375, 375, 2);
                            if ($retval > 0) {
                                $this->return['message'] = "上传成功";
                                $this->return['code'] = 1;
                            } else {
                                $this->return['message'] = "上传失败";
                                $this->return['code'] = 0;
                            }
                            $this->return['data'] = $new_key;
                            break;
                    }
                } else {
                    
                    // 强制将文件后缀改掉，文件流不同会导致上传文件失败
                    $this->return['message'] = "请检查您的上传参数配置或上传的文件是否有误";
                }
            } else {
                
                switch ($this->file_path) {
                    case UPLOAD_VIDEO:
                        // 视频文件
                        $this->return['code'] = 1;
                        $this->return['data'] = $ok["path"];
                        $this->return['message'] = "上传成功";
                        break;
                }
            }
            //删除本地的图片
            if($this->upload_type == 2){
                @unlink($this->reset_file_path . $newfile);
            }
        } else {
            // 强制将文件后缀改掉，文件流不同会导致上传文件失败
            $this->return['message'] = "请检查您的上传参数配置或上传的文件是否有误";
        }
        return $this->ajaxFileReturn();
    }


     /**
     * 用于相册多图上传
     *
     * @return string|multitype:string NULL Ambigous <unknown, boolean, number, \think\false, string>
     */
    public function photoAlbumUpload()
    {
        $data = array();
        $this->file_path = request()->post("file_path", "");
        if ($this->file_path == "") {
            $data['state'] = '0';
            $data['message'] = "文件路径不能为空";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }

        // 重新设置文件路径
        $this->resetFilePath();
        // 检测文件夹是否存在，不存在则创建文件夹
        if (! file_exists($this->reset_file_path)) {
            $mode = intval('0777', 8);
            mkdir($this->reset_file_path, $mode, true);
        }
        
        $this->file_name = $_FILES["file_upload"]["name"]; // 文件原名
        $this->file_size = $_FILES["file_upload"]["size"]; // 文件大小
        $this->file_type = $_FILES["file_upload"]["type"]; // 文件类型
        
        if ($this->file_size == 0) {
            $data['state'] = '0';
            $data['message'] = "文件大小为0MB";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }
        if ($this->file_size > 5000000) {
            $data['state'] = '0';
            $data['message'] = "文件大小不能超过5MB";
            $data['origin_file_name'] = $this->file_name;
            return $data;
        }
        
        // 验证文件
        if (! $this->validationFile()) {
            return $this->ajaxFileReturn();
        }
        $guid = time();
        $file_name_explode = explode(".", $this->file_name); // 图片名称
        $suffix = count($file_name_explode) - 1;
        $ext = "." . $file_name_explode[$suffix]; // 获取后缀名
                                                  // 获取原文件名
        $tmp_array = $file_name_explode;
        unset($tmp_array[$suffix]);
        $file_new_name = implode(".", $tmp_array);
        $newfile = md5($file_new_name . $guid) . $ext; // 重新命名文件
                                                       // $ok = @move_uploaded_file($_FILES["file_upload"]["tmp_name"], $this->reset_file_path . $newfile);

        $ok = $this->moveUploadFile($_FILES["file_upload"]["tmp_name"], $this->reset_file_path . $newfile);
        if ($ok["code"]) {
            @unlink($_FILES['file_upload']);
            $image_size = @getimagesize($ok["path"]); // 获取图片尺寸
            if ($image_size) {
                $width = $image_size[0];
                $height = $image_size[1];
                $name = $file_name_explode[0];
                $type = request()->post("type", "");
                $pic_name = request()->post("pic_name", $file_new_name);
                $album_id = request()->post("album_id", 0);
                $pic_tag = request()->post("pic_tag", $file_new_name);
                $pic_id = request()->post("pic_id", "");
                $upload_flag = request()->post("upload_flag", "");
                // 上传到相册管理，生成四张大小不一的图
                $retval = $this->photoCreate($this->reset_file_path, $this->reset_file_path . $newfile, "." . $file_name_explode[$suffix], $type, $pic_name, $album_id, $width, $height, $pic_tag, $pic_id, $ok["domain"], $ok["bucket"], $ok["path"]);
                
                if ($retval > 0) {
//                     $album = new Album();
//                     $picture_info = $album->getAlubmPictureDetail([
//                         "pic_id" => $retval
//                     ]);
                    $data['file_id'] = $retval;
//                     $data['file_name'] = $picture_info["pic_cover_mid"];
                    $data['file_name'] = $ok["path"];
                    $data['origin_file_name'] = $this->file_name;
                    $data['file_path'] = $this->reset_file_path . $newfile;
                    $data['state'] = '1';
                } else {
                    $data['state'] = '0';
                    $data['message'] = "图片上传失败";
                    $data['origin_file_name'] = $this->file_name;
                }
            } else {
                $data['state'] = '0';
                $data['message'] = "图片上传失败";
                $data['origin_file_name'] = $this->file_name;
            }
            //删除本地的图片
            if($this->upload_type == 2){
                @unlink($this->reset_file_path . $newfile);
            }
        } else {
            $data['state'] = '0';
            $data['message'] = "图片上传失败";
            $data['origin_file_name'] = $this->file_name;
        }
        return $data;
    }




    /**
     * 上传文件后，ajax返回信息
     *
     * 2017年6月9日 19:54:46 王永杰
     *
     * @param array $return            
     */
    private function ajaxFileReturn()
    {
        if (empty($this->return['code']) || null == $this->return['code'] || "" == $this->return['code']) {
            $this->return['code'] = 0; // 错误码
        }
        
        if (empty($this->return['message']) || null == $this->return['message'] || "" == $this->return['message']) {
            $this->return['message'] = ""; // 消息
        }
        
        if (empty($this->return['data']) || null == $this->return['data'] || "" == $this->return['data']) {
            $this->return['data'] = ""; // 数据
        }
        $this->return['data'] = '/'.$this->return['data'];
        return json($this->return);
    }


    /**
     * 原图上传(上传到外网的同时,也会在本地生成图片(在缩略图生成使用后会被删除))
     *
     * @param unknown $file_path            
     * @param unknown $key            
     */
    public function moveUploadFile($file_path, $key,$width,$height)
    {
        $image = \think\Image::open($file_path);
        // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.png
        $image->thumb($width,$height,\think\Image::THUMB_SCALING)->save($key);
        if( !empty($image) ){
            $ok = true;
        }else{
            $ok = false;
        }
        $result = [
            "code" => $ok,
            "path" => $key,
            "domain" => '',
            "bucket" => ''
        ];
        if($ok){
            if ($this->upload_type == 2) {
                $qiniu = new QiNiu();
                $result = $qiniu->setQiniuUplaod($key, $key);
            }
        }
        return $result;
    }


    /**
     *
     * @param unknown $this->file_path
     *            文件路径
     * @param unknown $this->file_size
     *            文件大小
     * @param unknown $this->file_type
     *            文件类型
     * @return string|unknown|number|\think\false
     */
    private function validationFile()
    {
        $flag = true;
        switch ($this->file_path) {
            case UPLOAD_GOODS:
                // 商品图片
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 3000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过3MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_SKU:
                // 商品SKU图片
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_BRAND:
                // 商品品牌
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_GROUP:
                // 商品分组
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_GOODS_CATEGORY:
                // 商品分类
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_COMMON:
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                // 公共
                break;
            case UPLOAD_AVATOR:
                // 用户头像
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_PAY:
                // 支付
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_ADV:
                // 广告位
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_EXPRESS:
                // 物流
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_CMS:
                // 文章
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                break;
            case UPLOAD_VIDEO:
                if ($this->file_type != "video/mp4" || $this->file_size > 500000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过500MB';
                    $flag = false;
                }
                break;
            case UPLOAD_COMMENT:
                if (($this->file_type != "image/gif" && $this->file_type != "image/png" && $this->file_type != "image/jpeg") || $this->file_size > 1000000) {
                    $this->return['message'] = '文件上传失败,请检查您上传的文件类型,文件大小不能超过1MB';
                    $flag = false;
                }
                // 评论
                break;
        }
        return $flag;
    }
}