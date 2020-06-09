<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori_galeri extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_kategorigaleri','kategori_galeri');
		$this->load->model('M_kategorigaleri');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_kategorigaleri',
			'title1' 		=> 	'Kategori Galeri',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Kategori Galeri',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'plus' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->kategori_galeri->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $kategori_galeri) {
			$no++;
			$row = array();
			$row[] = $kategori_galeri->kategori;
			$row[] = $kategori_galeri->sekilas;
			$row[] = $kategori_galeri->created;
			if($kategori_galeri->photo)
				$row[] = '<a href="'.base_url('upload/kategorigaleri/'.$kategori_galeri->photo).'" target="_blank"><img src="'.base_url('upload/kategorigaleri/'.$kategori_galeri->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_kategori_galeri('."'".$kategori_galeri->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_kategori_galeri('."'".$kategori_galeri->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->kategori_galeri->count_all(),
						"recordsFiltered" => $this->kategori_galeri->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->kategori_galeri->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		$slug_galeri = url_title($this->input->post('kategori'),'dash', TRUE);
		$data = array(
			'kategori' 			 => $this->input->post('kategori'),
			'slug_galeri' 	     => $slug_galeri,
			'sekilas' 		 	 => $this->input->post('sekilas'), 
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->kategori_galeri->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori Berita Telah ditambah';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_galeri';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['kategori'];
		$pred 	= $data['sekilas'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "kategori_galeri", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$slug_galeri = url_title($this->input->post('kategori'),'dash', TRUE);
		$data = array(
			'kategori' 			 => $this->input->post('kategori'),
			'slug_galeri' 	 	 => $slug_galeri,
			'sekilas' 		 	 => $this->input->post('sekilas'), 
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/kategorigaleri/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/kategorigaleri/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$kategori_galeri = $this->kategori_galeri->get_by_id($this->input->post('id'));
			if(file_exists('upload/kategorigaleri/'.$kategori_galeri->photo) && $kategori_galeri->photo)
				unlink('upload/kategorigaleri/'.$kategori_galeri->photo);

			$data['photo'] = $upload;
		}

		$this->kategori_galeri->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori galeri Telah Diupdate';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_galeri';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var = $data['kategori'];
		$pred = $data['sekilas'];
		$id = $this->input->post('id');

		helper_log("edit", "", "Kategori_galeri", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$kategori_galeri = $this->kategori_galeri->get_by_id($id);
		if(file_exists('upload/kategorigaleri/'.$kategori_galeri->photo) && $kategori_galeri->photo)
			unlink('upload/kategorigaleri/'.$kategori_galeri->photo);
		
		$this->kategori_galeri->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori galeri Dihapus';
		$isi	= "";
		$url	= 'Kategori_galeri';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");


		$var 	= $kategori_galeri->kategori;
		$pred 	= $kategori_galeri->sekilas;

		helper_log("delete", "Kategori", "kategori_galeri", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/kategorigaleri/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 4000; //set max size allowed in Kilobyte
        $config['max_width']            = 4000; // set max width image allowed
        $config['max_height']           = 4000; // set max height allowed
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
        if($this->input->post('sekilas') == '')
		{
			$data['inputerror'][] = 'sekilas';
			$data['error_string'][] = 'sekilas harus diisi';
			$data['status'] = FALSE;
        }		

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file kategori_galeri.php */
/* Location: ./application/controllers/admin/kategori_galeri.php */ ?>