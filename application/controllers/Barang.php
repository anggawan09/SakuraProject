<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class barang extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_barang','barang');
		$this->load->model('M_barang');

	}

	public function index()
	{	
		$kategori = $this->M_barang->listing();
		$data = array(
			'isi'	 			=> 	'v_barang',
			'title1' 			=> 	'Kategori barang',
			'title2' 			=>	'List Data',
			'breadcrumb1'  		=> 	'Kategori barang',
			'breadcrumb2'  		=>	'List',
			'kategori' 			=>	$kategori,
			'icon' 				=>	'search	',
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->barang->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $barang) {
			$no++;
			$row = array();
			$row[] = $barang->kode_barang;
			$row[] = $barang->nama;
			$row[] = $barang->kategori;
			$row[] = $barang->kondisi;
			$row[] = $barang->jumlah;
			$row[] = $barang->created;
			if($barang->photo)
				$row[] = '<a href="'.base_url('upload/barang/'.$barang->photo).'" target="_blank"><img src="'.base_url('upload/barang/'.$barang->photo).'" class="img-responsive" /></a>';
			else
				$row[] = '(No photo)';
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_barang('."'".$barang->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_barang('."'".$barang->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->barang->count_all(),
						"recordsFiltered" => $this->barang->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->barang->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'kode_barang' 	=> $this->input->post('kode_barang'),
				'nama' 			=> $this->input->post('nama'),
				'kategori'  	=> $this->input->post('kategori'),
				'kondisi'  		=> $this->input->post('kondisi'), 
				'jumlah'  		=> $this->input->post('jumlah'),  
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->barang->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data  Barang Telah ditambah';
		$isi	= $data['nama'];
		$url	= 'Barang';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['nama'];
		$pred 	= $data['kategori'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "barang", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'kode_barang' 	=> $this->input->post('kode_barang'),
				'nama' 			=> $this->input->post('nama'),
				'kategori'  	=> $this->input->post('kategori'),
				'kondisi'  		=> $this->input->post('kondisi'), 
				'jumlah'  		=> $this->input->post('jumlah'),   
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/barang/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/barang/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$barang = $this->barang->get_by_id($this->input->post('id'));
			if(file_exists('upload/'.$barang->photo) && $barang->photo)
				unlink('upload/'.$barang->photo);

			$data['photo'] = $upload;
		}

		$this->barang->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Barang Telah Diupdate';
		$isi	= $data['nama'];
		$url	= 'Barang';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");


		$var = $data['nama'];
		$pred = $data['kategori'];
		$id = $this->input->post('id');

		helper_log("edit", "", "barang", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$barang = $this->barang->get_by_id($id);
		if(file_exists('upload/barang/'.$barang->photo) && $barang->photo)
			unlink('upload/barang/'.$barang->photo);
		
		$this->barang->delete_by_id($id);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data Barang Telah Dihapus';
		$isi	= "";
		$url	= 'Barang';
		$icon	= 'fa fa-search';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $barang->nama;
		$pred 	= $barang->kategori;

		helper_log("delete", "barang", "barang", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/barang/';
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

		if($this->input->post('kode_barang') == '')
		{
			$data['inputerror'][] = 'kode_barang';
			$data['error_string'][] = 'kode barang harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('nama') == '')
		{
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'nama harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('kategori') == '')
		{
			$data['inputerror'][] = 'kategori';
			$data['error_string'][] = 'kategori harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('kondisi') == '')
		{
			$data['inputerror'][] = 'kondisi';
			$data['error_string'][] = 'kondisi harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('jumlah') == '')
		{
			$data['inputerror'][] = 'jumlah';
			$data['error_string'][] = 'jumlah harus diisi';
			$data['status'] = FALSE;
        }					

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

}




/* End of file barang.php */
/* Location: ./application/controllers/admin/barang.php */ ?>