<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Beranda extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('public/M_beranda');
		$this->load->model('public/M_berita');
		$this->load->helper('tgl_indo');
	}

	public function index()
	{	
		
		$this->load->library('pagination');


		//konfigurasi=
		$config['base_url'] 	= 	site_url('public/beranda/index');
		$config['total_rows']	=	$this->M_berita->countAllberita();
		$config['per_page'] 	=	2;

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

		$get_berita 	= $this->M_berita->get_berita($config['per_page'],$data['start']);
		$slider 		= $this->M_beranda->slider();
		$visi			= $this->M_beranda->visi();
		$misi			= $this->M_beranda->misi();
		$struktur		= $this->M_beranda->struktur();
		$anggota		= $this->M_beranda->anggota();
		$sejarah		= $this->M_beranda->sejarah();
		$tanggapan		= $this->M_beranda->tanggapan();
		$kegiatan 		= $this->M_beranda->kegiatan();
		$galeri			= $this->M_beranda->galeri();	

		$data = array(	'isi' 			=> 'public/v_beranda',
						'visi' 			=> $visi,
						'misi' 			=> $misi, 
					 	'slider' 		=> $slider,
					 	'anggota' 		=> $anggota,
					 	'sejarah' 		=> $sejarah,
					 	'tanggapan' 	=> $tanggapan,
					 	'struktur' 		=> $struktur,
					 	'no_tanggapan' 	=> count($tanggapan),
					 	'berita' 		=> $get_berita,
					 	'kegiatan' 		=> $kegiatan,
					 	'galeri' 		=> $galeri 
				
			);

		$this->load->view('public/wrapper', $data, FALSE);	

	}

	public function hub(){
		$valid = $this->form_validation;

        $valid->set_rules('nama_awal','Nama_awal','required',
                    array('required' => ' Harus Diisi'));
        $valid->set_rules('nama_akhir','Nama_akhir','required',
                    array('required' => ' Harus Diisi'));
        $valid->set_rules('email','Email','required',
                    array('required' => ' Email Harus Diisi'));    
        $valid->set_rules('pesan','pesan','required',
                    array('required' => ' Pesan Harus Diisi'));      
        //end validasi
        if($valid->run()===FALSE){

            $data = array( 	'isi'	=>	'public/v_beranda');
            $this->load->view('public/wrapper', $data, FALSE);

        //jika tdk error, maka masuk ke db
        }else{
   
            $i = $this->input;
            $data = array(	'nama_awal'       	=> 	$i->post('nama_awal'),
            				'nama_akhir'       	=> 	$i->post('nama_akhir'),
                            'email'       	 	=> 	$i->post('email'),
                        	'pesan'			 	=>	$i->post('pesan'));
                           
            $this->M_beranda->hub($data);

	        $this->session->set_flashdata('sukses',' Data telah ditambahkan');
            redirect(base_url('public/Beranda#contact-section'),'refresh');  
        }
	}

	public function permohonan(){
		$valid = $this->form_validation;

        $valid->set_rules('instansi','Instansi','required',
                    array('required' => ' Harus Diisi'));
        $valid->set_rules('perihal','Perihal','required',
                    array('required' => ' Harus Diisi'));
        $valid->set_rules('jumlah','Jumlah','required',
                    array('required' => ' Jumlah Harus Diisi'));    
        $valid->set_rules('contact','Contact','required',
                    array('required' => ' Contact Harus Diisi'));      
        //end validasi
        if($valid->run()===FALSE){

            $data = array( 	'isi'	=>	'public/v_beranda');
            $this->load->view('public/wrapper', $data, FALSE);

        //jika tdk error, maka masuk ke db
        }else{
   
            $i = $this->input;
            $data = array(	'instansi'       	=> 	$i->post('instansi'),
            				'perihal'       	=> 	$i->post('perihal'),
                            'jumlah'       	 	=> 	$i->post('jumlah'),
                            'keterangan'       	=> 	$i->post('keterangan'),
                        	'contact'			=>	$i->post('contact'));
                           
            $this->M_beranda->permohonan($data);
            $this->session->set_flashdata('sukses',' Data telah ditambahkan');
            redirect(base_url('public/Beranda#permohonan-section'),'refresh');  
        }
	}
}

/* End of file Beranda.php */
/* Location: ./application/controllers/Public/Beranda.php */ ?>