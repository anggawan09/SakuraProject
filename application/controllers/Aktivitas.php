<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Aktivitas extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_aktivitas','aktivitas');
		$this->load->model('M_aktivitas');

	}

	public function index()
	{	
		if ($this->session->userdata('akses_level') == "admin"){
			$data = array(	
				'isi'	 		=> 	'v_aktivitas',
				'title1' 		=> 	'Aktivitas',
				'title2' 		=>	'List Data',
				'breadcrumb1'  	=> 	'Aktivitas',
				'breadcrumb2'  	=>	'List',
				'icon' 			=>	'clock-o' 
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

		$list = $this->aktivitas->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $aktivitas) {

			$no++;
			$row = array();
			$row[] = $aktivitas->log_time;
			$row[] = $aktivitas->log_user;
			$row[] = $aktivitas->log_tipe;
			
			if ($aktivitas->log_tipe == "Insert") {
				$row[] = "<strong>$aktivitas->log_tipe</strong> data $aktivitas->log_desc pada tabel <strong>$aktivitas->log_tabel</strong><br>
						  <strong>[$aktivitas->var],[$aktivitas->pred]</strong>";

			}elseif ($aktivitas->log_tipe == "Update") {
				$row[] = "<strong>$aktivitas->log_tipe</strong> data $aktivitas->log_desc pada tabel <strong>$aktivitas->log_tabel</strong><br>
						  <strong>[ID $aktivitas->log_tabel : $aktivitas->data]</strong>";

			}elseif ($aktivitas->log_tipe == "Delete") {
				$row[] = "<strong>$aktivitas->log_tipe</strong> data $aktivitas->log_desc pada tabel <strong>$aktivitas->log_tabel</strong><br>
						  <strong>[ID $aktivitas->log_tabel : $aktivitas->data] [$aktivitas->log_desc : $aktivitas->var]</strong>";
			}elseif ($aktivitas->log_tipe == "Login") {
				$row[] = "<strong>$aktivitas->log_tipe</strong> Record pada tabel <strong>$aktivitas->log_tabel</strong><br>
						  <strong>[Nama $aktivitas->log_tabel  : $aktivitas->var] [Akses Level : $aktivitas->data]  [Username : $aktivitas->pred]</strong>";
			}elseif ($aktivitas->log_tipe == "Logout") {
				$row[] = "<strong>$aktivitas->log_tipe</strong> Record pada tabel <strong>$aktivitas->log_tabel</strong><br>
						  <strong>[Nama $aktivitas->log_tabel  : $aktivitas->var] [Akses Level : $aktivitas->data]  [Username : $aktivitas->pred]</strong>";
			}
			
			$data[] = $row;
			 
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->aktivitas->count_all(),
						"recordsFiltered" => $this->aktivitas->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}
	

}




/* End of file aktivitas.php */
/* Location: ./application/controllers/admin/aktivitas.php */ ?>