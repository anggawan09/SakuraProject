<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_login');
	}

	public function index()
	{
		$this->load->view('v_login');
	}

    public function aksi_login()
    {
        //validasi
        $valid  =	$this->form_validation;
        $valid->set_rules('username','Username','required',
                           array('required' => 'Username Harus diisi'));
        $valid->set_rules('password','Password','required',
                           array('required'  => 'Password Harus diisi'));
        
        if ($valid->run()===FALSE) {
            $this->load->view('login');
        }else{ 

            $username       =   $this->input->post('username');
            $password       =   md5($this->input->post('password'));
			$check_login	= $this->m_login->login($username, $password);

            //kalau ada record maka read session dan redirect
            if (count($check_login) == 1 ){

                $this->session->set_userdata('id',$check_login->id);
                $this->session->set_userdata('username',$username);
                $this->session->set_userdata('password',$password);
				$this->session->set_userdata('nama', $check_login->nama);
                $this->session->set_userdata('motto', $check_login->motto);
                $this->session->set_userdata('pekerjaan', $check_login->pekerjaan);
                $this->session->set_userdata('photo', $check_login->photo);
                $this->session->set_userdata('akses_level', $check_login->akses_level);
                $this->session->set_userdata('created', $check_login->created);
                

                $nama        = $this->session->userdata('nama');
                $id          = $this->session->userdata('id');
                $username    = $this->session->userdata('username');
                $pekerjaan   = $this->session->userdata('pekerjaan');
                $akses_level = $this->session->userdata('akses_level');


                $var        = $nama;
                $pred       = $username;
                $data2      = $akses_level;
         
                helper_log("Login", "login", "User", "$data2","$var","$pred");

                redirect(base_url('beranda'),'refresh');

            }else{
                $this->session->set_flashdata('sukses','Username atau Password tidak cocok');
                redirect(base_url('login'),'refresh');
            }
        }
    }

    public function logout(){
        $nama        = $this->session->userdata('nama');
        $username     = $this->session->userdata('username');
        $pekerjaan   = $this->session->userdata('pekerjaan');
        $akses_level = $this->session->userdata('akses_level');


        $var        = $nama;
        $pred       = $username;
        $data2      = $akses_level;
 
        helper_log("Logout", "Logout", "User", "$data2","$var","$pred");

        $this->session->unset_userdata('username');
        $this->session->unset_userdata('password');
        $this->session->set_userdata('status', FALSE);
        redirect(base_url('login'),'refresh');        
    }

}

/* End of file Login.php */
/* Location: ./application/controllers/Login.php */