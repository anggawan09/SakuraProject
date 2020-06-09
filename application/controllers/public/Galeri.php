<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Galeri extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('public/M_galeri');
		$this->load->model('public/M_beranda');
	}

	public function index()
	{
		
	}

	public function read($slug_galeri){

		$galeri  		= $this->M_galeri->read($slug_galeri);
		$nav			= $this->M_galeri->nav($slug_galeri);
		$data = array(	'galeri' 		=> $galeri,
						'nav' 			=> $nav, 
					  	'isi' 			=> 'public/v_readgaleri',
					);

		$this->load->view('public/wrapper', $data, FALSE);
	}

}

/* End of file Galeri.php */
/* Location: ./application/controllers/Public/Galeri.php */ ?>