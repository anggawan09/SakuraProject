<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_beranda extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function slider()
    {
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where('status_berita','publish');
        $this->db->where('jenis','slider');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();   
    }


    public function konfigurasi(){
    	$this->db->select('*');
        $this->db->from('konfigurasi');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();   
    }

    public function anggota(){
    	$this->db->select('*');
        $this->db->from('anggota');
        $this->db->where('status','pengurus inti');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();   
    }
    public function tanggapan(){
    	$this->db->select('*');
        $this->db->from('tanggapan');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }
    public function berita(){
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where('status_berita','publish');
        $this->db->where('jenis','berita');
        $this->db->limit(4);
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }

    public function kegiatan(){
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where('status_berita','publish');
        $this->db->where('jenis','kegiatan');
        $this->db->limit(4);
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }
    public function visi(){
        $this->db->select('*');
        $this->db->from('profil');
        $this->db->where('status_profile','publish');
        $this->db->where('jenis','Visi');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }
     public function misi(){
        $this->db->select('*');
        $this->db->from('profil');
        $this->db->where('status_profile','publish');
        $this->db->where('jenis','Misi');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }
    public function sejarah(){
        $this->db->select('*');
        $this->db->from('profil');
        $this->db->where('status_profile','publish');
        $this->db->where('jenis','Sejarah');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }

    public function struktur(){
        $this->db->select('*');
        $this->db->from('profil');
        $this->db->where('status_profile','publish');
        $this->db->where('jenis','Struktur organisasi');
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }

    public function user($username){
        $this->db->select('*');
        $this->db->from('user');
        $this->db->where('username',$username);
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->result();
    }

    public function hub($data)
    {
        $this->db->insert('hub', $data);
    }

     public function permohonan($data)
    {
        $this->db->insert('permohonan', $data);
    }

    public function galeri()
    {
        $this->db->select('*');
        $this->db->from('kategori_galeri');
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();
    }


}

/* End of file M_beranda.php */
/* Location: ./application/models/Public/M_beranda.php */