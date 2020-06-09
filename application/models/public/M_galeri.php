<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_galeri extends CI_Model {

		public function __construct()
		{
			parent::__construct();
			$this->load->database();
		}

		public function read($slug_galeri){
			$this->db->select('*');
	        $this->db->from('galeri');
	        $this->db->where('slug_galeri', $slug_galeri);
	        $this->db->order_by('id','DESC');
	        $query  =  $this->db->get();
	        return $query->result();
		}

		public function nav($slug_galeri){
			$this->db->select('*');
	        $this->db->from('kategori_galeri');
	        $this->db->where('slug_galeri', $slug_galeri);
	        $this->db->order_by('id','DESC');
	        $query  =  $this->db->get();
	        return $query->result();
		}
		

}

/* End of file M_galeri.php */
/* Location: ./application/models/Public/M_galeri.php */