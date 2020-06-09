<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Backup extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_backup','backup');
		$this->load->model('M_backup');

	}

	public function index()
	{	
		if ($this->session->userdata('akses_level') == "admin"){
			$data = array(
				'isi'	 		=> 	'v_backup',
				'title1' 		=> 	'Backup Database',
				'title2' 		=>	'List Data',
				'breadcrumb1'  	=> 	'Backup Database',
				'breadcrumb2'  	=>	'List',
				'icon' 			=> 	'database',
			);
			$this->load->view('wrapper', $data, FALSE);
		}else{
			$data = array(
						'isi'	 		=> 	'v_eror',
						'title1' 		=> 	'Eror',
						'title2' 		=>	'404 Error',
						'breadcrumb1'  	=> 	'404 Error',
						'breadcrumb2'  	=>	'404 Error',
						'icon' 			=>	'fa fa-warning text-yellow' 
					);
			$this->load->view('wrapper', $data, FALSE);	
		}		
	}

	public function ajax_list()
	{

		$list = $this->backup->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $backup) {
			$no++;
			$row = array();
			
			$row[] = $backup->nama;
			$row[] = $backup->tanggal;
			$row[] = $backup->size;
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-success" href="assets/db/'.$backup->nama.'" title="Hapus"><i class="glyphicon glyphicon-save"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_backup('."'".$backup->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';

			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->backup->count_all(),
						"recordsFiltered" => $this->backup->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_delete($id)
	{
		//delete file
		$backup = $this->backup->get_by_id($id);
		if(file_exists('assets/db/'.$backup->nama) && $backup->nama)
			unlink('assets/db/'.$backup->nama);
		$this->backup->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$var 	= $backup->nama;
		$pred 	= $backup->size;

		helper_log("delete", "Backup", "Backup_db", "$id","$var","$pred");
	}

	public function backup()
	{

		$this->load->dbutil();

		$prefs = array(
				'format' 	=>'sql', 
				'filename' 	=>'sakura_'.date("Ymd-His").'.sql',
				
			);
		$backup =& $this->dbutil->backup($prefs);

		$db_name 	= "sakura_".date("Ymd-His").'.sql';
		

		$save = FCPATH.'assets/db/'.$db_name;
		$this->load->helper('file');
		write_file($save, $backup);
		
		$path = "assets/db/".$db_name;
		$size = filesize($path);

        $data = array(  'nama'       	 => $db_name,
                        'size'  		 => $size.' bytes',
                    );
		$var 	= $data['nama'];
		$pred 	= $data['size'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "Backup", "backup_db", "$id","$var","$pred");
        
        $this->M_backup->save($data);
		$this->load->helper('download');
		force_download($db_name, $backup);
	}

}




/* End of file backup.php */
/* Location: ./application/controllers/admin/backup.php */ ?>