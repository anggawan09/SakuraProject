<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notifikasi extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_notif');
	}

	public function index()
	{
				
	}

	public function delete(){

	$id 	= $_POST['id']; // Ambil data NIS yang dikirim oleh view.php melalui form submit
    $this->M_notif->delete($id); // Panggil fungsi delete dari model
    redirect('beranda','refresh');
	}
}

/* End of file Notifikasi.php */
/* Location: ./application/controllers/Notifikasi.php */