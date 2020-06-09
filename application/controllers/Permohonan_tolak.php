<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class permohonan_tolak extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_permohonantolak','permohonan_tolak');
		$this->load->model('M_permohonantolak');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_permohonantolak',
			'title1' 		=> 	'permohonan tolak',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Permohonan tolak',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'thumbs-down' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->permohonan_tolak->get_datatables();
		$data = array();
		$no = $_POST['start'];


		foreach ($list as $permohonan_tolak) {
			if ($permohonan_tolak->aksi == "tolak") {
				$no++;
				$row = array();
				
				$row[] = $permohonan_tolak->id;
				$row[] = $permohonan_tolak->instansi;
				$row[] = $permohonan_tolak->perihal;
				$row[] = $permohonan_tolak->jumlah;
				$row[] = $permohonan_tolak->contact;
				$row[] = $permohonan_tolak->keterangan;
				$row[] = $permohonan_tolak->created;
				//add html for action
			
				$data[] = $row;
				}
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->permohonan_tolak->count_all(),
						"recordsFiltered" => $this->permohonan_tolak->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}
}




/* End of file permohonan.php */
/* Location: ./application/controllers/admin/permohonan.php */ ?>