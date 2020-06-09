<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Surat_masuk extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_suratmasuk','surat_masuk');
		$this->load->model('M_suratmasuk');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_suratmasuk',
			'title1' 		=> 	'Surat Masuk',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'surat_masuk',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'address-book-o' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->surat_masuk->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $surat_masuk) {
			$no++;
			$row = array();
			$row[] = $surat_masuk->pengirim;
			$row[] = $surat_masuk->nomor;
            $row[] = $surat_masuk->tanggal;
			$row[] = $surat_masuk->perihal;
            $row[] = $surat_masuk->created;
            if($surat_masuk->photo)
				$row[] = '<a href="'.base_url('upload/suratmasuk/'.$surat_masuk->photo).'" target="_blank"><img src="'.base_url('upload/suratmasuk/'.$surat_masuk->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_surat_masuk('."'".$surat_masuk->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_surat_masuk('."'".$surat_masuk->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->surat_masuk->count_all(),
						"recordsFiltered" => $this->surat_masuk->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->surat_masuk->get_by_id($id);
		$data->tanggal = ($data->tanggal == '0000-00-00') ? '' : $data->tanggal; // if 0000-00-00 set tu empty for datepicker compatibility
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'pengirim' 		 => $this->input->post('pengirim'),
				'nomor' 		 => $this->input->post('nomor'), 
				'perihal' 		 => $this->input->post('perihal'), 
				'tanggal' 	 	 => $this->input->post('tanggal'),
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->surat_masuk->save($data);

		echo json_encode(array("status" => TRUE));
		
		$var 	= $data['pengirim'];
		$pred 	= $data['perihal'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "surat_masuk", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'pengirim' 		 => $this->input->post('pengirim'),
				'nomor' 		 => $this->input->post('nomor'), 
				'perihal' 		 => $this->input->post('perihal'), 
				'tanggal' 	 	 => $this->input->post('tanggal'),
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/suratmasuk/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/suratmasuk/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$surat_masuk = $this->surat_masuk->get_by_id($this->input->post('id'));
			if(file_exists('upload/suratmasuk/'.$surat_masuk->photo) && $surat_masuk->photo)
				unlink('upload/suratmasuk/'.$surat_masuk->photo);

			$data['photo'] = $upload;
		}

		$this->surat_masuk->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));
		$var = $data['pengirim'];
		$pred = $data['perihal'];
		$id = $this->input->post('id');

		helper_log("edit", "", "surat_masuk", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$surat_masuk = $this->surat_masuk->get_by_id($id);
		if(file_exists('upload/suratmasuk/'.$surat_masuk->photo) && $surat_masuk->photo)
			unlink('upload/suratmasuk/'.$surat_masuk->photo);
		
		$this->surat_masuk->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$var 	= $surat_masuk->pengirim;
		$pred 	= $surat_masuk->perihal;

		helper_log("delete", "surat_masuk", "surat_masuk", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/suratmasuk/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 1000; //set max size allowed in Kilobyte
        $config['max_width']            = 1000; // set max width image allowed
        $config['max_height']           = 1000; // set max height allowed
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

		if($this->input->post('pengirim') == '')
		{
			$data['inputerror'][] = 'pengirim';
			$data['error_string'][] = 'pengirim harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('nomor') == '')
		{
			$data['inputerror'][] = 'nomor';
			$data['error_string'][] = 'nomor harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('perihal') == '')
		{
			$data['inputerror'][] = 'perihal';
			$data['error_string'][] = 'perihal harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('tanggal') == '')
		{
			$data['inputerror'][] = 'tanggal';
			$data['error_string'][] = 'tanggal harus diisi';
			$data['status'] = FALSE;
        }		
		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file surat_masuk.php */
/* Location: ./application/controllers/admin/surat_masuk.php */ ?>