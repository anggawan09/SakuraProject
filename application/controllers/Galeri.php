<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Galeri extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_galeri','galeri');
		$this->load->model('M_galeri');
		$this->load->model('M_kategorigaleri');

	}

	public function index()
	{	
		$kategori = $this->M_galeri->listing();
		$data = array(
			'isi'	 			=> 	'v_galeri',
			'title1' 			=> 	'Galeri',
			'title2' 			=>	'List Data',
			'breadcrumb1'  		=> 	'Galeri',
			'breadcrumb2'  		=>	'List',
			'kategori' 			=>	$kategori,
			'icon' 				=>	'file-photo-o' 	
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->galeri->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $galeri) {
			$no++;
			$row = array();
			$row[] = $galeri->kategori;
			$row[] = $galeri->keterangan;
			$row[] = $galeri->created;
			if($galeri->photo)
				$row[] = '<a href="'.base_url('upload/galeri/'.$galeri->photo).'" target="_blank"><img src="'.base_url('upload/galeri/'.$galeri->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_galeri('."'".$galeri->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_galeri('."'".$galeri->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->galeri->count_all(),
						"recordsFiltered" => $this->galeri->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->galeri->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();

		$slug_galeri = url_title($this->input->post('kategori'),'dash', TRUE);
		$data = array(
				'kategori' 		=> $this->input->post('kategori'),
				'slug_galeri' 	=> $slug_galeri,
				'keterangan' 	=> $this->input->post('keterangan'), 
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->galeri->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Galeri Telah ditambah';
		$isi	= $data['keterangan'];
		$url	= 'Galeri';
		$icon	= 'fa fa-file-photo-o';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['kategori'];
		$pred 	= $data['keterangan'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "galeri", "$id","$var","$pred");
			
		
	}

	public function ajax_update()
	{
		$this->_validate();
		
		$slug_galeri = url_title($this->input->post('kategori'),'dash', TRUE);
		$data = array(
				'kategori' 		=> $this->input->post('kategori'),
				'slug_galeri' 	=> $slug_galeri,
				'keterangan' 	=> $this->input->post('keterangan'), 
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/galeri/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/galeri/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$galeri = $this->galeri->get_by_id($this->input->post('id'));
			if(file_exists('upload/galeri/'.$galeri->photo) && $galeri->photo)
				unlink('upload/galeri/'.$galeri->photo);

			$data['photo'] = $upload;
		}

		$this->galeri->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Galeri Telah Diupdate';
		$isi	= $data['keterangan'];
		$url	= 'Galeri';
		$icon	= 'fa fa-file-photo-o';
		helper_notif("$judul","$isi","$url","$icon");

		$var = $data['kategori'];
		$pred = $data['keterangan'];
		$id = $this->input->post('id');

		helper_log("edit", "", "galeri", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$galeri = $this->galeri->get_by_id($id);
		if(file_exists('upload/galeri/'.$galeri->photo) && $galeri->photo)
			unlink('upload/galeri/'.$galeri->photo);
		
		$this->galeri->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Galeri Dihapus';
		$isi	= "";
		$url	= 'Galeri';
		$icon	= 'fa fa-file-photo-o';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $galeri->kategori;
		$pred 	= $galeri->keterangan;

		helper_log("delete", "Galeri", "galeri", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/galeri/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 5000; //set max size allowed in Kilobyte
        $config['max_width']            = 5000; // set max width image allowed
        $config['max_height']           = 5000; // set max height allowed
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

		if($this->input->post('kategori') == '')
		{
			$data['inputerror'][] = 'kategori';
			$data['error_string'][] = 'kategori harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('keterangan') == '')
		{
			$data['inputerror'][] = 'keterangan';
			$data['error_string'][] = 'keterangan harus diisi';
			$data['status'] = FALSE;
        }		

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file galeri.php */
/* Location: ./application/controllers/admin/galeri.php */ ?>