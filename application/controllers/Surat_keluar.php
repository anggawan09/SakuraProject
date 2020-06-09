<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Surat_keluar extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_suratkeluar','surat_keluar');
		$this->load->model('M_suratkeluar');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_suratkeluar',
			'title1' 		=> 	'Surat keluar',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'surat keluar',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'address-book-o' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->surat_keluar->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $surat_keluar) {
			$no++;
			$row = array();
			$row[] = $surat_keluar->nomor;
            $row[] = $surat_keluar->perihal;
			$row[] = $surat_keluar->instansi;
            $row[] = $surat_keluar->penugasan;
            $row[] = $surat_keluar->tanggal_mulai;
            $row[] = $surat_keluar->tanggal_akhir;
            $row[] = $surat_keluar->created;
            if($surat_keluar->photo)
				$row[] = '<a href="'.base_url('upload/suratkeluar/'.$surat_keluar->photo).'" target="_blank"><img src="'.base_url('upload/suratkeluar/'.$surat_keluar->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_surat_keluar('."'".$surat_keluar->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_surat_keluar('."'".$surat_keluar->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->surat_keluar->count_all(),
						"recordsFiltered" => $this->surat_keluar->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->surat_keluar->get_by_id($id);
		$data->tanggal_mulai = ($data->tanggal_mulai == '0000-00-00') ? '' : $data->tanggal_mulai; // if 0000-00-00 set tu empty for datepicker compatibility
		$data->tanggal_akhir = ($data->tanggal_akhir == '0000-00-00') ? '' : $data->tanggal_akhir; // if 0000-00-00 set tu empty for datepicker compatibility
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'nomor' 		 => $this->input->post('nomor'), 
				'perihal' 		 => $this->input->post('perihal'), 
				'instansi' 	 	 => $this->input->post('instansi'),
				'penugasan' 	 => $this->input->post('penugasan'), 
				'tanggal_mulai'  => $this->input->post('tanggal_mulai'), 
				'tanggal_akhir'  => $this->input->post('tanggal_akhir'),
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->surat_keluar->save($data);

		echo json_encode(array("status" => TRUE));
		
		$var 	= $data['instansi'];
		$pred 	= $data['perihal'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "surat_keluar", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'nomor' 		 => $this->input->post('nomor'), 
				'perihal' 		 => $this->input->post('perihal'), 
				'instansi' 	 	 => $this->input->post('instansi'),
				'penugasan' 	 => $this->input->post('penugasan'), 
				'tanggal_mulai'  => $this->input->post('tanggal_mulai'), 
				'tanggal_akhir'  => $this->input->post('tanggal_akhir'),
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/suratkeluar/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/suratkeluar/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$surat_keluar = $this->surat_keluar->get_by_id($this->input->post('id'));
			if(file_exists('upload/suratkeluar/'.$surat_keluar->photo) && $surat_keluar->photo)
				unlink('upload/suratkeluar/'.$surat_keluar->photo);

			$data['photo'] = $upload;
		}

		$this->surat_keluar->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));
		$var = $data['instansi'];
		$pred = $data['perihal'];
		$id = $this->input->post('id');

		helper_log("edit", "", "surat_keluar", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$surat_keluar = $this->surat_keluar->get_by_id($id);
		if(file_exists('upload/suratkeluar/'.$surat_keluar->photo) && $surat_keluar->photo)
			unlink('upload/suratkeluar/'.$surat_keluar->photo);
		
		$this->surat_keluar->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$var 	= $surat_keluar->instansi;
		$pred 	= $surat_keluar->perihal;

		helper_log("delete", "surat_keluar", "surat_keluar", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/suratkeluar/';
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
        if($this->input->post('instansi') == '')
		{
			$data['inputerror'][] = 'instansi';
			$data['error_string'][] = 'instansi harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('penugasan') == '')
		{
			$data['inputerror'][] = 'penugasan';
			$data['error_string'][] = 'penugasan harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('tanggal_mulai') == '')
		{
			$data['inputerror'][] = 'tanggal_mulai';
			$data['error_string'][] = 'tanggal mulai harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('tanggal_akhir') == '')
		{
			$data['inputerror'][] = 'tanggal_akhir';
			$data['error_string'][] = 'tanggal akhir harus diisi';
			$data['status'] = FALSE;
        }					
		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file surat_keluar.php */
/* Location: ./application/controllers/admin/surat_keluar.php */ ?>