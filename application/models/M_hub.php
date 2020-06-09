<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_hub extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function listing(){
		$this->db->select('*');
        $this->db->from('hub');
        $this->db->limit(20);
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();
	}

	public function delete($data){
		$this->db->where('id', $data['id']);
        $this->db->delete('hub',$data);
	}

	public function detail($id)
    {
        $this->db->select('*');
        $this->db->from('hub');
        $this->db->where('id',$id);
        $this->db->order_by('id','DESC');
        $query =   $this->db->get();
        return $query->row();   
    }
		

}

/* End of file M_hub.php */
/* Location: ./application/models/M_hub.php */