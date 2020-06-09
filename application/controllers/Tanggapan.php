<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class tanggapan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_tanggapan','tanggapan');
		$this->load->model('M_tanggapan');

	}

	public function index()
	{	
		$data = array(
			'isi'	 			=> 	'v_tanggapan',
			'title1' 			=> 	'Tanggapan',
			'title2' 			=>	'List Data',
			'breadcrumb1'  		=> 	'Tanggapan',
			'breadcrumb2'  		=>	'List',
			'icon' 				=>	'comments	',
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->tanggapan->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $tanggapan) {
			$no++;
			$row = array();
			$row[] = $tanggapan->nama;
			$row[] = $tanggapan->keterangan;
			$row[] = $tanggapan->komentar;
			$row[] = $tanggapan->created;
			if($tanggapan->photo)
				$row[] = '<a href="'.base_url('upload/tanggapan/'.$tanggapan->photo).'" target="_blank"><img src="'.base_url('upload/tanggapan/'.$tanggapan->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_tanggapan('."'".$tanggapan->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_tanggapan('."'".$tanggapan->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->tanggapan->count_all(),
						"recordsFiltered" => $this->tanggapan->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->tanggapan->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'nama' 				=> $this->input->post('nama'),
				'keterangan'  		=> $this->input->post('keterangan'),
				'komentar'  		=> $this->input->post('komentar'), 
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->tanggapan->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data  tanggapan Telah ditambah';
		$isi	= $data['nama'];
		$url	= 'tanggapan';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['nama'];
		$pred 	= $data['keterangan'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "tanggapan", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'nama' 				=> $this->input->post('nama'),
				'keterangan'  		=> $this->input->post('keterangan'),
				'komentar'  		=> $this->input->post('komentar'),
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/tanggapan/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/tanggapan/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$tanggapan = $this->tanggapan->get_by_id($this->input->post('id'));
			if(file_exists('upload/'.$tanggapan->photo) && $tanggapan->photo)
				unlink('upload/'.$tanggapan->photo);

			$data['photo'] = $upload;
		}

		$this->tanggapan->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data tanggapan Telah Diupdate';
		$isi	= $data['nama'];
		$url	= 'tanggapan';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");


		$var = $data['nama'];
		$pred = $data['keterangan'];
		$id = $this->input->post('id');

		helper_log("edit", "", "tanggapan", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$tanggapan = $this->tanggapan->get_by_id($id);
		if(file_exists('upload/tanggapan/'.$tanggapan->photo) && $tanggapan->photo)
			unlink('upload/tanggapan/'.$tanggapan->photo);
		
		$this->tanggapan->delete_by_id($id);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data tanggapan Telah Dihapus';
		$isi	= "";
		$url	= 'tanggapan';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $tanggapan->nama;
		$pred 	= $tanggapan->keterangan;

		helper_log("delete", "tanggapan", "tanggapan", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/tanggapan/';
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


        if($this->input->post('nama') == '')
		{
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'nama harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('keterangan') == '')
		{
			$data['inputerror'][] = 'keterangan';
			$data['error_string'][] = 'keterangan harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('komentar') == '')
		{
			$data['inputerror'][] = 'komentar';
			$data['error_string'][] = 'komentar harus diisi';
			$data['status'] = FALSE;
        }
		

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file tanggapan.php */
/* Location: ./application/controllers/admin/tanggapan.php */ ?>