<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_berita extends CI_Model {
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

    public function beritalain(){
    	$this->db->select('*');
    	$this->db->from('berita');
    	$this->db->where('status_berita','publish');
    	$this->db->where('jenis','berita');
    	$this->db->limit(10);
    	$this->db->order_by('id', 'desc');
    	$query = $this->db->get();
    	return $query->result();
    }
   public function countAllberita(){
        $this->db->select('*');
        $this->db->from('berita');
        $this->db->where(array('status_berita' => 'publish',
                              'jenis'          => 'berita'));
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function get_berita($limit, $start){
        $this->db->select('*');
       	$this->db->where(array('status_berita' => 'publish',
                              'jenis'          => 'berita'));
        $this->db->order_by('id', 'desc');
        $query = $this->db->get('berita', $limit, $start);
        return $query->result();
    }
	

}

/* End of file M_berita.php */
/* Location: ./application/models/Public/M_berita.php */