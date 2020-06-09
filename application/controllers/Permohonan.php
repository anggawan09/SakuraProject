<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class permohonan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_permohonan','permohonan');
		$this->load->model('M_permohonan');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_permohonan',
			'title1' 		=> 	'Permohonan',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Permohonan',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'handshake-o' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->permohonan->get_datatables();
		$data = array();
		$no = $_POST['start'];


		foreach ($list as $permohonan) {
			if ($permohonan->aksi == "") {
				$no++;
				$row = array();
				
				$row[] = $permohonan->id;
				$row[] = $permohonan->instansi;
				$row[] = $permohonan->perihal;
				$row[] = $permohonan->jumlah;
				$row[] = $permohonan->contact;
				$row[] = $permohonan->keterangan;
				$row[] = $permohonan->created;
				//add html for action
				$row[] = '
						<a class="btn btn-md btn-primary" href="permohonan/valid/'.$permohonan->id.'" title="Valid"><i class="fa fa-thumbs-o-up"></i></a>
						<a class="btn btn-md btn-danger" href="permohonan/tolak/'.$permohonan->id.'" title="Tolak" ><i class="fa fa-thumbs-down"></i></a>';
			
				$data[] = $row;
				}
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->permohonan->count_all(),
						"recordsFiltered" => $this->permohonan->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function valid($id)
	{
		
		$permohonan = $this->M_permohonan->detail($id);

        $i = $this->input;
		$data = array(	'id'    		 => $id,
						'instansi' 		 => $permohonan->instansi,
						'perihal' 		 => $permohonan->perihal,
						'jumlah' 	 	 => $permohonan->jumlah,
						'contact' 		 => $permohonan->contact,
						'keterangan' 	 => $permohonan->keterangan,
						'aksi'  		 => "valid",
						'created' 		 => $permohonan->created, 
                       );
		$this->M_permohonan->edit($data);

		$judul 	= 'Data Permohonan Telah Valid';
		$isi	= $data['instansi'];
		$url	= 'Permohonan_valid';
		$icon	= 'fa fa-thumbs-o-up';
		helper_notif("$judul","$isi","$url","$icon");


		redirect(base_url('permohonan'),'refresh');
	}

	public function tolak($id)
	{
		
		$permohonan = $this->M_permohonan->detail($id);

        $i = $this->input;
		$data = array(	'id'    		 => $id,
						'instansi' 		 => $permohonan->instansi,
						'perihal' 		 => $permohonan->perihal,
						'jumlah' 	 	 => $permohonan->jumlah,
						'contact' 		 => $permohonan->contact,
						'keterangan' 	 => $permohonan->keterangan,
						'aksi'  		 => "tolak",
						'created' 		 => $permohonan->created, 
                       );
		$this->M_permohonan->edit($data);

		$judul 	= 'Data Permohonan Telah ditolak';
		$isi	= $data['instansi'];
		$url	= 'Permohonan_tolak';
		$icon	= 'fa fa-thumbs-down';
		helper_notif("$judul","$isi","$url","$icon");



		redirect(base_url('permohonan'),'refresh');
	}

}




/* End of file permohonan.php */
/* Location: ./application/controllers/admin/permohonan.php */ ?>