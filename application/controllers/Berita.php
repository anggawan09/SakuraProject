<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Berita extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_berita','berita');
		$this->load->model('M_berita');

	}

	public function index()
	{	
		$kategori = $this->M_berita->listing();
		$berita = $this->M_berita->listing_berita();
		$data = array(
			'berita' 		=>	$berita,
			'isi'	 		=> 	'v_berita',
			'title1' 		=> 	'berita',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'berita',
			'breadcrumb2'  	=>	'List',
			'kategori' 		=>  $kategori,
			'icon' 			=>	'newspaper-o' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->berita->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $berita) {
			$no++;
			$row = array();
            $row[] = $berita->judul_berita;
			$row[] = $berita->kategori;
			$row[] = $berita->isi;
			$row[] = $berita->username;
			$row[] = $berita->status_berita;
			$row[] = $berita->jenis;
			$row[] = $berita->created;
			//add html for action
			
			$row[] =  '
					<a class="btn btn-md btn-primary" href="berita/isi_berita/'.$berita->id.'" title="Isi"><i class="glyphicon glyphicon-text-size"></i></a>
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_berita('."'".$berita->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_berita('."'".$berita->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';

			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->berita->count_all(),
						"recordsFiltered" => $this->berita->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);


	}

	public function ajax_edit($id)
	{
		$data = $this->berita->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();

		$slug_berita = url_title($this->input->post('judul_berita'),'dash', TRUE);
		
		$data = array(
				'username' 		 => $this->session->userdata('username'),
				'kategori' 		 => $this->input->post('kategori'), 
				'slug_berita' 	 =>	$slug_berita, 
				'judul_berita' 	 => $this->input->post('judul_berita'),
				'status_berita'  => $this->input->post('status_berita'),
				'jenis' 		 => $this->input->post('jenis')
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->berita->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Berita Telah ditambah';
		$isi	= $data['judul_berita'];
		$url	= 'Berita';
		$icon	= 'fa fa-newspaper-o';
		helper_notif("$judul","$isi","$url","$icon");
		
		$var 	= $data['username'];
		$pred 	= $data['judul_berita'];
		$id 	= $this->input->post('id');

		helper_log("add", "", "berita", "$id","$var","$pred");
	}

	public function ajax_update()
	{	

		$this->_validate();
		$slug_berita = url_title($this->input->post('judul_berita'),'dash', TRUE);
		$data = array(
				'username' 		 => $this->session->userdata('username'),
				'kategori' 		 => $this->input->post('kategori'), 
				'slug_berita' 	 => $slug_berita,
				'judul_berita' 	 => $this->input->post('judul_berita'),
				'status_berita'  => $this->input->post('status_berita'),
				'jenis' 		 => $this->input->post('jenis')  
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/berita/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/berita/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$berita = $this->berita->get_by_id($this->input->post('id'));
			if(file_exists('upload/berita/'.$berita->photo) && $berita->photo)
				unlink('upload/berita/'.$berita->photo);

			$data['photo'] = $upload;
		}

		$this->berita->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data Berita Telah Diupdate';
		$isi	= $data['judul_berita'];
		$url	= 'Berita';
		$icon	= 'fa fa-newspaper-o';
		helper_notif("$judul","$isi","$url","$icon");
		
		$var = $data['username'];
		$pred = $data['judul_berita'];
		$id = $this->input->post('id');

		helper_log("edit", "", "berita", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$berita = $this->berita->get_by_id($id);
		if(file_exists('upload/berita/'.$berita->photo) && $berita->photo)
			unlink('upload/berita/'.$berita->photo);
		
		$this->berita->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Berita Dihapus';
		$isi	= "";
		$url	= 'Berita';
		$icon	= 'fa fa-newspaper-o';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $berita->username;
		$pred 	= $berita->judul_berita;

		helper_log("delete", "berita", "berita", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/berita/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 1000; //set max size allowed in Kilobyte
        $config['max_width']            = 2000; // set max width image allowed
        $config['max_height']           = 2000; // set max height allowed
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

        if($this->input->post('judul_berita') == '')
		{
			$data['inputerror'][] = 'judul_berita';
			$data['error_string'][] = 'judul berita harus diisi';
			$data['status'] = FALSE;
        }		
		if($this->input->post('kategori') == '')
		{
			$data['inputerror'][] = 'kategori';
			$data['error_string'][] = 'kategori harus diisi';
			$data['status'] = FALSE;
        }

        if($this->input->post('status_berita') == '')
		{
			$data['inputerror'][] = 'status_berita';
			$data['error_string'][] = 'status berita harus diisi';
			$data['status'] = FALSE;
        }

        if($this->input->post('jenis') == '')
		{
			$data['inputerror'][] = 'jenis';
			$data['error_string'][] = 'Jenis harus diisi';
			$data['status'] = FALSE;
        }

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

	public function isi_berita($id)
	{
		$berita = $this->M_berita->detail($id);

		//validation error
		$valid = $this->form_validation;
        
        $valid->set_rules('isi','Isi berita','required',
                    array('required' => ' Isi berita Harus Diisi'));
        
        
		//end validasi
		if($valid->run()===FALSE){
			$data = array(  'title1' 		=> 	'Edit Isi berita',
							'site' 			=>	'berita/isi_berita/', 
							'editor'		=> 	$berita,
							'title2' 		=>	'Editor',
							'breadcrumb1'  	=> 	'berita',
							'breadcrumb2'  	=>	'Isi berita',
							'icon' 			=>	'text-size', 
							'isi' 			=> 	'v_tambahisi');
			$this->load->view('wrapper', $data, FALSE);

		//jika tdk error, maka masuk ke db
		}else{
            $i = $this->input;
			$data = array(	'id'    		 => $id,
							'username' 		 => $berita->username,
							'kategori' 		 => $berita->kategori,
							'slug_berita' 	 => $berita->slug_berita,
							'photo' 		 => $berita->photo,
							'status_berita'  => $berita->status_berita,
							'created' 		 => $berita->created, 
                            'isi'         	 => $i->post('isi'));
			$this->M_berita->edit($data);
			$this->session->set_flashdata('sukses',' Data telah diupdate');
			redirect(base_url('berita'),'refresh');
		}
	}
 
}




/* End of file berita.php */
/* Location: ./application/controllers/admin/berita.php */ ?>