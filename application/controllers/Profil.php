<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profil extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_profil','profil');
		$this->load->model('M_profil');

	}

	public function index()
	{	
		$profil = $this->M_profil->listing();
		$data = array(
			'profil' 		=>	$profil,
			'isi'	 		=> 	'v_profil',
			'title1' 		=> 	'profil',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'profil',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'user' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->profil->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $profil) {
			$no++;
			$row = array();
            $row[] = $profil->jenis;
			$row[] = $profil->isi;
			$row[] = $profil->status_profile;
			$row[] = $profil->created;
			if($profil->photo)
				$row[] = '<a href="'.base_url('upload/profil/'.$profil->photo).'" target="_blank"><img src="'.base_url('upload/profil/'.$profil->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			
			$row[] =  '
					<a class="btn btn-md btn-primary" href="profil/isi_profil/'.$profil->id.'" title="Isi"><i class="glyphicon glyphicon-text-size"></i></a>
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_profil('."'".$profil->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>';

			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->profil->count_all(),
						"recordsFiltered" => $this->profil->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);


	}

	public function ajax_edit($id)
	{
		$data = $this->profil->get_by_id($id);
		echo json_encode($data);
	}


	public function ajax_update()
	{	

		$this->_validate();
		$data = array(
				'jenis' 		 => $this->input->post('jenis'),
				'status_profile' => $this->input->post('status_profile') 
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/profil/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/profil/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$profil = $this->profil->get_by_id($this->input->post('id'));
			if(file_exists('upload/profil/'.$profil->photo) && $profil->photo)
				unlink('upload/profil/'.$profil->photo);

			$data['photo'] = $upload;
		}

		$this->profil->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data profil Telah Diupdate';
		$isi	= $data['jenis'];
		$url	= 'profil';
		$icon	= 'fa fa-newspaper-o';
		helper_notif("$judul","$isi","$url","$icon");
		
		$var = $data['jenis'];
		$pred = $data['status_profile'];
		$id = $this->input->post('id');

		helper_log("edit", "", "profil", "$id","$var","$pred");
	}


	private function _do_upload()
	{
		$config['upload_path']          = 'upload/profil/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 4000; //set max size allowed in Kilobyte
        $config['max_width']            = 400000; // set max width image allowed
        $config['max_height']           = 400000; // set max height allowed
        $config['file_name']            = round(microtime(true) * 1000); //just milisecond timestamp fot unique name

        $this->upload->initialize($config);

        if(!$this->upload->do_upload('photo')) //upload and validate
        {
            $data['inputerror'][] = 'photo';
			$data['error_string'][] = 'Upload error: '.$this->upload->display_errors('',''); //show ajax error
			$data['status'] = FALSE;
			echo json_encode($data);
			exit();
		}
		return $this->upload->data('file_name');
	}

	private function _validate()
	{
		$data = array();
		$data['error_string'] = array();
		$data['inputerror'] = array();
		$data['status'] = TRUE;

        if($this->input->post('jenis') == '')
		{
			$data['inputerror'][] = 'jenis';
			$data['error_string'][] = 'jenis profil harus diisi';
			$data['status'] = FALSE;
        }		
		if($this->input->post('status_profile') == '')
		{
			$data['inputerror'][] = 'status_profile';
			$data['error_string'][] = 'status profile harus diisi';
			$data['status'] = FALSE;
        }
	}

	public function isi_profil($id)
	{
		$profil = $this->M_profil->detail($id);

		//validation error
		$valid = $this->form_validation;
        
        $valid->set_rules('isi','Isi profil','required',
                    array('required' => ' Isi profil Harus Diisi'));
        
        
		//end validasi
		if($valid->run()===FALSE){
			$data = array(  'title1' 		=> 	'Edit Isi profil',
							'site' 			=>	'profil/isi_profil/', 
							'editor' 		=> 	$profil,
							'title2' 		=>	'Editor',
							'breadcrumb1'  	=> 	'profil',
							'breadcrumb2'  	=>	'Isi profil',
							'icon' 			=>	'text-size', 
							'isi' 			=> 	'v_tambahisi');
			$this->load->view('wrapper', $data, FALSE);

		//jika tdk error, maka masuk ke db
		}else{
            $i = $this->input;
			$data = array(	'id'    		 => $id,
							'jenis' 		 => $profil->jenis,
							'photo' 		 => $profil->photo,
							'status_profile' => $profil->status_profile,
							'created' 		 => $profil->created, 
                            'isi'         	 => $i->post('isi'));
			$this->M_profil->edit($data);
			$this->session->set_flashdata('sukses',' Data telah diupdate');
			redirect(base_url('profil'),'refresh');
		}
	}
 
}




/* End of file profil.php */
/* Location: ./application/controllers/admin/profil.php */ ?>