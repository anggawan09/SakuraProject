<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Konfigurasi extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_konfigurasi','konfigurasi');
		$this->load->model('M_konfigurasi');

	}

	public function index()
	{	
		if ($this->session->userdata('akses_level') == "admin"){
		
			$data = array(
				'isi'	 		=> 	'v_konfigurasi',
				'title1' 		=> 	'konfigurasi',
				'title2' 		=>	'List Data',
				'breadcrumb1'  	=> 	'konfigurasi',
				'breadcrumb2'  	=>	'List',
				'icon' 			=>	'cogs' 
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

		$list = $this->konfigurasi->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $konfigurasi) {
			$no++;
			$row = array();
			$row[] = $konfigurasi->nama;
			$row[] = $konfigurasi->alamat;
            $row[] = $konfigurasi->telepon;
			$row[] = $konfigurasi->twitter;
			$row[] = $konfigurasi->website;
			//add html for action
			$row[] = '
					
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_konfigurasi('."'".$konfigurasi->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->konfigurasi->count_all(),
						"recordsFiltered" => $this->konfigurasi->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->konfigurasi->get_by_id($id);
		echo json_encode($data);
	}



	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'nama' 			 => $this->input->post('nama'),
				'alamat' 		 => $this->input->post('alamat'), 
				'telepon' 		 => $this->input->post('telepon'), 
				'email' 	 	 => $this->input->post('email'),
				'instagram' 	 => $this->input->post('instagram'),
				'facebook' 	 	 => $this->input->post('facebook'),
				'twitter' 	 	 => $this->input->post('twitter'),
				'website' 		 => $this->input->post('website'),
				'periode' 		 => $this->input->post('periode'),
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/other/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$konfigurasi = $this->konfigurasi->get_by_id($this->input->post('id'));
			if(file_exists('upload/other/'.$konfigurasi->photo) && $konfigurasi->photo)
				unlink('upload/other/'.$konfigurasi->photo);

			$data['photo'] = $upload;
		}

		$this->konfigurasi->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$var = $data['nama'];
		$pred = $data['email'];
		$id = $this->input->post('id');

		helper_log("edit", "", "Konfigurasi", "$id","$var","$pred");


	}


	private function _do_upload()
	{
		$config['upload_path']          = 'upload/other/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 2000; //set max size allowed in Kilobyte
        $config['max_width']            = 3000; // set max width image allowed
        $config['max_height']           = 3000; // set max height allowed
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

		if($this->input->post('nama') == '')
		{
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'nama harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('alamat') == '')
		{
			$data['inputerror'][] = 'alamat';
			$data['error_string'][] = 'alamat harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('telepon') == '')
		{
			$data['inputerror'][] = 'telepon';
			$data['error_string'][] = 'telepon harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('email') == '')
		{
			$data['inputerror'][] = 'email';
			$data['error_string'][] = 'email harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('instagram') == '')
		{
			$data['inputerror'][] = 'instagram';
			$data['error_string'][] = 'instagram harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('website') == '')
		{
			$data['inputerror'][] = 'website';
			$data['error_string'][] = 'website harus diisi';
			$data['status'] = FALSE;
        }		
      
		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}




}




/* End of file konfigurasi.php */
/* Location: ./application/controllers/admin/konfigurasi.php */ ?>