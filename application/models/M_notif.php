<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class M_notif extends CI_Model {
 
    public function save_notif($param)
    {
        $sql        = $this->db->insert_string('notifikasi',$param);
        $ex         = $this->db->query($sql);
        return $this->db->affected_rows($sql);
    }

    public function listing()
    {
        $this->db->select('*');
        $this->db->from('notifikasi');
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();
    }

    public function listing_pesan()
    {
        $this->db->select('*');
        $this->db->from('chat');
        $this->db->where('receiver_id', $this->session->userdata('id'));
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();
    }

     public function count()
    {
        $this->db->select('*');
        $this->db->from('chat');
        $this->db->where('receiver_id', $this->session->userdata('id'));
        $this->db->order_by('id','DESC');
        $query  =  $this->db->get();
        return $query->result();
    }


    public function delete($id)
    {
         $this->db->where_in('id', $id);
         $this->db->delete('notifikasi');
    }

    public function PictureUrlById($sender_id)

    {  
        $this->db->select('id,photo,nama,created');
        $this->db->from('user');
        $this->db->where("id",$sender_id);
        $query = $this->db->get();
        return $query->result();
    }
}