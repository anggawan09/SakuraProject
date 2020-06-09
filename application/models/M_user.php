<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_user extends CI_Model {

	var $table = 'user';
	var $column_order = array('username','nama','pekerjaan','email',null); //set column field database for datatable orderable
	var $column_search = array('username','nama','pekerjaan','email'); //set column field database for datatable searchable just firstname , lastname , address are searchable
	var $order = array('id' => 'desc'); // default order 

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	private function _get_datatables_query()
	{
		
		$this->db->from($this->table);

		$i = 0;
	
		foreach ($this->column_search as $item) // loop column 
		{
			if($_POST['search']['value']) // if datatable send POST for search
			{
				
				if($i===0) // first loop
				{
					$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
					$this->db->like($item, $_POST['search']['value']);
				}
				else
				{
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if(count($this->column_search) - 1 == $i) //last loop
					$this->db->group_end(); //close bracket
			}
			$i++;
		}
		
		if(isset($_POST['order'])) // here order processing
		{
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} 
		else if(isset($this->order))
		{
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if($_POST['length'] != -1)
		$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}

	public function get_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();

		return $query->row();
	}

	public function save($data)
	{
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	public function update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}

	public function delete_by_id($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}

	public function Userlist() 

	{  
 		$this->db->select('id,nama,photo');
		$this->db->from($this->table);
		$this->db->where('akses_level','user');
   		$query = $this->db->get();
 		$r=$query->result_array();
		return $r;
   	}

   	public function Adminlist() 

	{  
 		$this->db->select('id,nama,photo');
		$this->db->from($this->table);
		$this->db->where('akses_level','admin');
   		$query = $this->db->get();
 		$r=$query->result_array();
		return $r;
   	}

	public function PictureUrlById($id)

	{  
 		$this->db->select('id,photo');
		$this->db->from($this->table);
		$this->db->where("id",$id);
		$this->db->limit(1);
  		$query = $this->db->get();
		$res = $query->row_array();
		if(!empty($res['photo'])){
			return base_url('/upload/user/'.$res['photo']);
		}else{
			return base_url('/upload/user/images.png');
		}
   	}

   	public function PictureUrl()
	{  
 		$this->db->select('id,photo');
		$this->db->from($this->table);
		$this->db->where("id",$this->session->userdata('id'));
		$this->db->limit(1);
  		$query = $this->db->get();
		$res = $query->row_array();
		if(!empty($res['photo'])){
			return base_url('/upload/user/'.$res['photo']);
		}else{
			return base_url('/upload/user/images.png');
		}
	}

	 	
	public function GetUserData()
	{  
 		$this->db->select('id,akses_level,username,nama,pekerjaan,email,facebook,instagram,motto,created');
		$this->db->from($this->table);
		$this->db->where("id",$this->session->userdata('id'));
		$this->db->limit(1);
  		$query = $this->db->get();
 		if ($query) {
			 return $query->row_array();
		 } else {
			 return false;
		 }
   	}

   	public function GetName($id)

	{  
 		$this->db->select('id,nama');
		$this->db->from($this->table);
		$this->db->where("id",$id);
		$this->db->limit(1);
  		$query = $this->db->get();
		$res = $query->row_array();
 		return $res['nama'];
   	}
}

