<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Berita extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('public/M_berita');
		$this->load->model('public/M_beranda');
	}

	public function index()
	{
		
		
	}

	public function read($slug_berita){
		$berita  		= $this->M_berita->read($slug_berita);
		$konfigurasi	= $this->M_beranda->konfigurasi();
		$beritalain		= $this->M_berita->beritalain();	

		$data = array('berita' 			=> $berita,
					  'konfigurasi' 	=> $konfigurasi,
					  'isi' 			=> 'public/v_readberita',
					  'beritalain' 		=> $beritalain, 
					);

		$this->load->view('public/wrapper', $data, FALSE);	

	}

}

/* End of file Berita.php */
/* Location: ./application/controllers/Public/Berita.php */ ?>