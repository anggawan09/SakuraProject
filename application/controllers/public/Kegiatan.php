<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Kegiatan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('public/M_kegiatan');
		$this->load->model('public/M_beranda');
	}
	public function index()
	{
		$this->load->library('pagination');


		//konfigurasi=
		$config['base_url'] 	= 	site_url('public/Kegiatan/index');
		$config['total_rows']	=	$this->M_kegiatan->countAllkegiatan();
		$config['per_page'] 	=	6;

		//styling
		$this->load->library('pagination');
		
		$config['first_link']       = 'First';
        $config['last_link']        = 'Last';
        $config['next_link']        = 'Next';
        $config['prev_link']        = 'Prev';
        $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
        $config['full_tag_close']   = '</ul></nav></div>';
        $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
        $config['num_tag_close']    = '</span></li>';
        $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link">';
        $config['cur_tag_close']    = '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['next_tagl_close']  = '<span aria-hidden="true">&raquo;</span></span></li>';
        $config['prev_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['prev_tagl_close']  = '</span>Next</li>';
        $config['first_tag_open']   = '<li class="page-item"><span class="page-link">';
        $config['first_tagl_close'] = '</span></li>';
        $config['last_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['last_tagl_close']  = '</span></li>';

		//inisilisasi
		$this->pagination->initialize($config);

		$data = [
		    'start' => $this->uri->segment(4)
		];

		$get_kegiatan 	= $this->M_kegiatan->get_kegiatan($config['per_page'],$data['start']);


		$data = [
			'kegiatan' 			=>	$get_kegiatan,
			'isi'  				=> 	'public/v_listkegiatan',
		];

		// print_r($data['berita']);

		$this->load->view('public/wrapper', $data, FALSE);
	}

	public function read($slug_berita){

		$kegiatan  		= $this->M_kegiatan->read($slug_berita);
		$komentar 		= $this->M_kegiatan->komentar($slug_berita);
		$kategori 		= $this->M_kegiatan->kategori();

		$data = array('kegiatan' 		=> $kegiatan,
					  'komentar' 		=> $komentar,
					  'kategori' 		=> $kategori, 
					  'tot_komentar' 	=> count($komentar), 
					  'isi' 			=> 'public/v_readkegiatan',
					);

		$this->load->view('public/wrapper', $data, FALSE);
	}

	public function komentar($slug_berita)
	{		
            $valid = $this->form_validation;

            $valid->set_rules('nama','Nama','required',
                        array('required' => ' Nama Harus Diisi'));
            $valid->set_rules('email','Email','required',
                        array('required' => ' Email Harus Diisi'));    
            $valid->set_rules('pesan','pesan','required',
                        array('required' => ' Pesan Harus Diisi'));      
            //end validasi
            if($valid->run()===FALSE){
    
                $data = array( 	'isi'	=>	'public/v_kegiatan');
                $this->load->view('public/wrapper', $data, FALSE);
    
            //jika tdk error, maka masuk ke db
            }else{
       
                $i = $this->input;
                $data = array(	'slug_berita'  	 => $slug_berita, 
                                'nama'       	 => $i->post('nama'),
                                'email'       	 => $i->post('email'),
                            	'pesan'			 =>	$i->post('pesan'));
                               
                $this->M_kegiatan->tambah_komentar($data);
                redirect(base_url('public/kegiatan/read/'.$slug_berita),'refresh');  
            }
	}

	public function search(){

		$keyword = $this->input->post('keyword');

		$this->load->library('pagination');
		//konfigurasi=
		$config['base_url'] 	= 	site_url('public/Kegiatan/search/index');
		$config['total_rows']	=	$this->M_kegiatan->countsearch($keyword);
		$config['per_page'] 	=	$this->M_kegiatan->countsearch($keyword);

		//styling
		$this->load->library('pagination');
		
		$config['first_link']       = 'First';
        $config['last_link']        = 'Last';
        $config['next_link']        = 'Next';
        $config['prev_link']        = 'Prev';
        $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
        $config['full_tag_close']   = '</ul></nav></div>';
        $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
        $config['num_tag_close']    = '</span></li>';
        $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link">';
        $config['cur_tag_close']    = '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['next_tagl_close']  = '<span aria-hidden="true">&raquo;</span></span></li>';
        $config['prev_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['prev_tagl_close']  = '</span>Next</li>';
        $config['first_tag_open']   = '<li class="page-item"><span class="page-link">';
        $config['first_tagl_close'] = '</span></li>';
        $config['last_tag_open']    = '<li class="page-item"><span class="page-link">';
        $config['last_tagl_close']  = '</span></li>';

		//inisilisasi
		$this->pagination->initialize($config);

		$data = [
		    'start' => $this->uri->segment(5)
		];


		$get_kegiatan 	= $this->M_kegiatan->search($keyword,$config['per_page'],$data['start']);

		$data = [
			'kegiatan' 			=>	$get_kegiatan,
			'isi'  				=> 	'public/v_listkegiatan',
		];

		$this->load->view('public/wrapper', $data, FALSE);
	}	
}

/* End of file Kegiatan.php */
/* Location: ./application/controllers/Public/Kegiatan.php */ ?>