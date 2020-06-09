<?php 

    function helper_log($tipe = "", $str = "",$tabel = "",$data2 = "", $var= "", $pred = ""){
    $CI =& get_instance();
 
    if (strtolower($tipe) == "login"){
        $log_tipe   = "Login";
    }
    elseif(strtolower($tipe) == "logout")
    {
        $log_tipe   = "Logout";
    }
    elseif(strtolower($tipe) == "add"){
        $log_tipe   = "Insert";
    }
    elseif(strtolower($tipe) == "edit"){
        $log_tipe  = "Update";
    }
    elseif (strtolower($tipe) == "delete") {
        $log_tipe  = "Delete";
    }
 
    // paramter
    $param['log_user']      = $CI->session->userdata('akses_level');
    $param['log_tipe']      = $log_tipe;
    $param['log_desc']      = $str;
    $param['log_tabel']     = $tabel;
    $param['data']          = $data2;
    $param['var']           = $var;
    $param['pred']          = $pred;    
 
    //load model log
    $CI->load->model('m_log');
 
    //save to database
    $CI->m_log->save_log($param);
 
}





 ?>