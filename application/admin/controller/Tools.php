<?php 
/**
 * ============================
 * @Author:   Ewei
 * @Version:  1.0 
 * @DateTime: 2017-8-8
 * ============================
 */
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;
use think\Config;
use think\Backup;



/**
 * 工具箱
 * Class Tools
 * @package app\admin\controller
 */
class Tools extends AdminBase
{
	protected function _initialize(){
		parent::_initialize();
	}


	public function toolsMysql(){
		//获取数据库信息
		$dbtables = DB::query('SHOW TABLE STATUS');
		$total = 0;
		//计算数据库大小
		foreach ($dbtables as $k => $v) {
            $dbtables[$k]['size'] = $this->format_bytes($v['Data_length'] + $v['Index_length']);
            $total += $v['Data_length'] + $v['Index_length'];
        }

        $this->assign('list', $dbtables);
        $this->assign('total', $this->format_bytes($total));
        $this->assign('tableNum', count($dbtables));

		return $this->fetch();
	}

	/**
	 * 备份数据库
	 * @return [type] [description]
	 */
	public function barkMysql(){
		//防止备份数据过程超时
		function_exists('set_time_limit') && set_time_limit(0);
		//初始化
		if( !$this->request->isPost() ){
			//检测是否有选中备份的数据库
			$tables = $this->request->param()['names'];
			if( empty($tables) ){
				$this->error('请选择备份的数据库名称');
			}
			//读取配置信息
			$config = array(
				'path'     => Config::get('database.backup_dir'),
				'part'     => Config::get('database.backup_size'),
				'compress' => Config::get('database.backup_compress'),
				'level'    => Config::get('database.backup_compress_level'),
			);
			//检查是否有正在执行的任务
			$lock = "{$config['path']}backup.lock";
			if(is_file($lock)){
				$this->error('检测到有一个备份任务正在执行，请稍后再试！');
			} else {
				//创建锁文件
				file_put_contents($lock, NOW_TIME);
			}

			session('backup_config', $config);

			//生成备份文件信息
			$file = array(
				'name' => date('Ymd-His', $_SERVER['REQUEST_TIME']),
				'part' => 1,
			);

			session('backup_file', $file);
			//缓存要备份的表
			session('backup_tables', $tables);

			//创建备份文件
			$Database = new Backup($file, $config);

			if(false !== $Database->create()){
				$tab = array('id' => 0, 'start' => 0);
	            $this->success('初始化成功！', '', array('tables' => $tables, 'tab' => $tab));
			}else {
	            $this->error('初始化失败，备份文件创建失败！');
			}
		}
		//备份数据
		if( !$this->request->isGet() ){
			$getParam = $this->request->post(false);
			$tables = session('backup_tables');

		}
	}


	/**
	 * 格式化字节大小
	 * @param  number $size      字节数
	 * @param  string $delimiter 数字和单位分隔符
	 * @return string            格式化后的带单位的大小
	 */
	function format_bytes($size, $delimiter = '') {
		$units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
		for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
		return round($size, 2) . $delimiter . $units[$i];
	}

	//及时输出信息  
    private function _showMsg($msg,$err=false){  
        $err = $err ? "<span class='err'>ERROR:</span>" : '' ;  
        echo "<p class='dbDebug'>".$err . $msg."</p>";  
        flush();  
  
    } 

}

