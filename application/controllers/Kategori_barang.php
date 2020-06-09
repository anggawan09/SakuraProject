<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori_barang extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_kategoribarang','kategori_barang');
		$this->load->model('M_kategoribarang');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_kategoribarang',
			'title1' 		=> 	'Kategori barang',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Kategori barang',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'plus' 
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->kategori_barang->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $kategori_barang) {
			$no++;
			$row = array();
			
			$row[] = $kategori_barang->kategori;
			$row[] = $kategori_barang->sekilas;
			$row[] = $kategori_barang->created;
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_kategori_barang('."'".$kategori_barang->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_kategori_barang('."'".$kategori_barang->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->kategori_barang->count_all(),
						"recordsFiltered" => $this->kategori_barang->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->kategori_barang->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'kategori' 			 => $this->input->post('kategori'),
				'sekilas' 		     => $this->input->post('sekilas'), 
			);


		$insert = $this->kategori_barang->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data Kategori Barang Telah ditambah';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_barang';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $data['kategori'];
		$pred 	= $data['sekilas'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "kategori_barang", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'kategori' 			 => $this->input->post('kategori'),
				'sekilas' 		    => $this->input->post('sekilas'), 
			);

		$this->kategori_barang->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data Kategori Barang Telah Diupdate';
		$isi	= $data['sekilas'];
		$url	= 'Kategori_barang';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");


		$var = $data['kategori'];
		$pred = $data['sekilas'];
		$id = $this->input->post('id');

		helper_log("edit", "", "kategori_barang", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$kategori_barang = $this->kategori_barang->get_by_id($id);
		
		$this->kategori_barang->delete_by_id($id);
		echo json_encode(array("status" => TRUE));


		$judul 	= 'Data Kategori Barang Dihapus';
		$isi	= "";
		$url	= 'Kategori_barang';
		$icon	= 'fa fa-plus';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $kategori_barang->kategori;
		$pred 	= $kategori_barang->sekilas;

		helper_log("delete", "Kategori", "kategori_barang", "$id","$var","$pred");
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




/* End of file kategori_barang.php */
/* Location: ./application/controllers/admin/kategori_barang.php */ ?>