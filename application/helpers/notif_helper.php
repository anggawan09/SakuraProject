<?php 

    function helper_notif ($judul = "", $isi ="", $url = "", $icon=""){
        $CI =& get_instance();
          
        // paramter
        $param['user']      = $CI->session->userdata('akses_level');
        $param['judul']     = $judul;
        $param['isi']       = $isi;
        $param['url']       = $url;
        $param['icon']      = $icon;
     
        //load model log
        $CI->load->model('M_notif');
     
        //save to database
        $CI->M_notif->save_notif($param);
 
    }

    function helper_notif_delete($id){
        $this->M_notif->delete_by_id($id);
    }

 ?>