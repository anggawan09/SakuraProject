<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori_berita extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_kategoriberita','kategori_berita');
		$this->load->model('M_kategoriberita');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_kategoriberita',
			'title1' 		=> 	'Kategori Berita',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Kategori Berita',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'plus' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->kategori_berita->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $kategori_berita) {
			$no++;
			$row = array();
			
			$row[] = $kategori_berita->kategori;
			$row[] = $kategori_berita->sekilas;
			$row[] = $kategori_berita->created;
			if($kategori_berita->photo)
				$row[] = '<a href="'.base_url('upload/kategoriberita/'.$kategori_berita->photo).'" target="_blank"><img src="'.base_url('upload/kategoriberita/'.$kategori_berita->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_kategori_berita('."'".$kategori_berita->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_kategori_berita('."'".$kategori_berita->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->kategori_berita->count_all(),
						"recordsFiltered" => $this->kategori_berita->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->kategori_berita->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'kategori' 		=> $this->input->post('kategori'),
				'sekilas' 		=> $this->input->post('sekilas'), 
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->kategori_berita->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori Berita Telah ditambah';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_berita';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['kategori'];
		$pred 	= $data['sekilas'];
		$id 	= $this->input->post('id');

		helper_log("add", "", "Kategori_berita", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'kategori' 		 => $this->input->post('kategori'),
				'sekilas' 		 => $this->input->post('sekilas'), 
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/kategoriberita/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/kategoriberita/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$kategori_berita = $this->kategori_berita->get_by_id($this->input->post('id'));
			if(file_exists('upload/kategoriberita/'.$kategori_berita->photo) && $kategori_berita->photo)
				unlink('upload/kategoriberita/'.$kategori_berita->photo);

			$data['photo'] = $upload;
		}

	

		$this->kategori_berita->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori berita Telah Diupdate';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_berita';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");


		$var = $data['kategori'];
		$pred = $data['sekilas'];
		$id = $this->input->post('id');

		helper_log("edit", "", "Kategori_berita", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$kategori_berita = $this->kategori_berita->get_by_id($id);
		if(file_exists('upload/kategoriberita/'.$kategori_berita->photo) && $kategori_berita->photo)
			unlink('upload/kategoriberita/'.$kategori_berita->photo);
		
		$this->kategori_berita->delete_by_id($id);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data Kategori berita Dihapus';
		$isi	= "";
		$url	= 'Kategori_berita';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $kategori_berita->kategori;
		$pred 	= $kategori_berita->sekilas;

		helper_log("delete", "Kategori", "Kategori_berita", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/kategoriberita/';
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




/* End of file kategori_berita.php */
/* Location: ./application/controllers/admin/kategori_berita.php */ ?>