<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_kegiatan extends CI_Model {
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function read($slug_berita){
    	$this->db->select('*');
        $this->db->from('berita');
        $this->db->where('slug_berita',$slug_berita);
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();   
    }

    public function tambah_komentar($data)
    {
        $this->db->insert('komentar', $data);
    }

    public function komentar($slug_berita)
    {
    	$this->db->select('*');
        $this->db->from('komentar');
        $this->db->where('slug_berita',$slug_berita);
        $this->db->order_by('id','ASC');
        $query =   $this->db->get();
        return $query->result();   
    }

    public function kategori()
    {
    	$this->db->select('*');
        $this->db->from('kategori_berita');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();   
    }


    public function tot_kategori($kategori){
    	$this->db->select('*');
        $this->db->from('berita');
        $this->db->where('jenis','kegiatan');
        $this->db->where('kategori', $kategori);
        $this->db->where('status_berita','publish');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->num_rows();   
    }

    public function countAllkegiatan(){
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where(array('status_berita' => 'publish',
                              'jenis'          => 'kegiatan'));
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function get_kegiatan($limit, $start){
        $this->db->select('*');
        $this->db->where(array('status_berita' => 'publish',
                              'jenis'          => 'kegiatan'));
        $this->db->order_by('id', 'desc');
        $query = $this->db->get('berita', $limit, $start);
        return $query->result();
    }

    public function search($keyword,$limit,$start){
        $this->db->select('*');
        $this->db->where(array('status_berita' => 'publish',
                               'jenis'         => 'kegiatan'));
        $this->db->like('judul_berita', $keyword);
        $this->db->or_like('kategori', $keyword);
        $query = $this->db->get('berita',$limit, $start ); // Tampilkan data siswa berdasarkan keyword
        return $query->result();
    }

     public function countsearch($keyword){
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where(array('status_berita' => 'publish',
                               'jenis'         => 'kegiatan'));
        $this->db->like('judul_berita', $keyword);
        $this->db->or_like('kategori', $keyword);
        $query = $this->db->get();
        return $query->num_rows();
    }
    



}

/* End of file M_kegiatan.php */
/* Location: ./application/models/Public/M_kegiatan.php */ ?>