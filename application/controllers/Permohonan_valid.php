<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class permohonan_valid extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_permohonanvalid','permohonan_valid');
		$this->load->model('M_permohonanvalid');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_permohonanvalid',
			'title1' 		=> 	'permohonan valid',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'permohonan valid',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'thumbs-o-up' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->permohonan_valid->get_datatables();
		$data = array();
		$no = $_POST['start'];


		foreach ($list as $permohonan_valid) {
			if ($permohonan_valid->aksi == "valid") {
				$no++;
				$row = array();
				
				$row[] = $permohonan_valid->id;
				$row[] = $permohonan_valid->instansi;
				$row[] = $permohonan_valid->perihal;
				$row[] = $permohonan_valid->jumlah;
				$row[] = $permohonan_valid->contact;
				$row[] = $permohonan_valid->keterangan;
				$row[] = $permohonan_valid->created;
				//add html for action
			
				$data[] = $row;
				}
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->permohonan_valid->count_all(),
						"recordsFiltered" => $this->permohonan_valid->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}
}




/* End of file permohonan.php */
/* Location: ./application/controllers/admin/permohonan.php */ ?>