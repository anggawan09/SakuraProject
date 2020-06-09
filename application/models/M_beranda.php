<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_beranda extends CI_Model {


	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	 public function anggota()
    {
        $this->db->select('*');
        $this->db->from('anggota');
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();

    }

    public function anggota_limit()
    {
        $this->db->select('*');
        $this->db->from('anggota');
        $this->db->limit(10);
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();

    }


    public function user()
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();

    }

     public function userlimit()
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->limit(8);
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();

    }

    
     public function listing()
    {
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();

    }

    public function berita()
    {
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where('status_berita', 'publish');
        $query  =  $this->db->get();
        return $query->result();
    }
    public function barang()
    {
        $this->db->select('*');
        $this->db->from('barang');
        $query  =  $this->db->get();
        return $query->result();

    }

     public function surat_masuk()
    {
        $this->db->select('*');
        $this->db->from('surat_masuk');
        $query  =  $this->db->get();
        return $query->result();

    }

     public function surat_keluar()
    {
        $this->db->select('*');
        $this->db->from('surat_keluar');
        $query  =  $this->db->get();
        return $query->result();

    }

    public function permohonan()
    {
        $this->db->select('*');
        $this->db->from('permohonan');
        $this->db->where('aksi', '');
        $query  =  $this->db->get();
        return $query->result();
    }

     public function permohonan_valid()
    {
        $this->db->select('*');
        $this->db->from('permohonan');
        $this->db->where('aksi', 'valid');
        $query  =  $this->db->get();
        return $query->result();
    }
     public function permohonan_tolak()
    {
        $this->db->select('*');
        $this->db->from('permohonan');
        $this->db->where('aksi', 'tolak');
        $query  =  $this->db->get();
        return $query->result();
    }

    public function database()
    {
        $this->db->select('*');
        $this->db->from('backup_db');
        $query  =  $this->db->get();
        return $query->result();
    }

    public function database2()
    {
        $this->db->select('*');
        $this->db->from('backup_db');
    	$this->db->order_by('id','DESC');
        $this->db->limit(1);
        $query  =  $this->db->get();
        return $query->result();
    }

    public function riwayat()
    {
        $this->db->select('*');
        $this->db->from('tabel_log');
    	$this->db->order_by('id','DESC');
        $this->db->limit(6);
        $query  =  $this->db->get();
        return $query->result();
    }

    public function komentar()
    {
        $this->db->select('*');
        $this->db->from('komentar');
        $query  =  $this->db->get();
        return $query->result();
    }


      




	

}

/* End of file M_beranda.php */
/* Location: ./application/models/M_beranda.php */