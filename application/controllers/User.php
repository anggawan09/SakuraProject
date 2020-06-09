<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_user','user');
		$this->load->model('M_user');

	}

	public function index()
	{	
		if ($this->session->userdata('akses_level') == "admin"){
			$data = array(
				'isi'	 		=> 	'v_user',
				'title1' 		=> 	'User',
				'title2' 		=>	'List Data',
				'breadcrumb1'  	=> 	'User',
				'breadcrumb2'  	=>	'List',
				'icon' 			=> 	'user-plus'
			);
			$this->load->view('wrapper', $data, FALSE);
		}else{
			$data = array(
					'isi'	 		=> 	'v_eror',
					'title1' 		=> 	'Eror',
					'title2' 		=>	'404 Error',
					'breadcrumb1'  	=> 	'404 Error',
					'breadcrumb2'  	=>	'404 Error',
					'icon' 			=>	'fa fa-warning text-yellow' 
				);
			$this->load->view('wrapper', $data, FALSE);	
		}	
	}

	public function ajax_list()
	{

		$list = $this->user->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $user) {
			$no++;
			$row = array();
			$row[] = $user->username;
			$row[] = $user->password;
			$row[] = $user->akses_level;
            $row[] = $user->nama;
			$row[] = $user->pekerjaan;
			$row[] = $user->email;
			
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-success" href="javascript:void(0)" title="Edit" onclick="detail_user('."'".$user->id."'".')"><i class="glyphicon glyphicon-list"></i></a>
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_user('."'".$user->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_user('."'".$user->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->user->count_all(),
						"recordsFiltered" => $this->user->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->user->get_by_id($id);
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'akses_level' 	 => $this->input->post('akses_level'),
				'username' 		 => $this->input->post('username'), 
				'password' 		 => MD5($this->input->post('password')), 
				'nama' 	         => $this->input->post('nama'),
				'pekerjaan' 	 => $this->input->post('pekerjaan'),
				'email' 		 => $this->input->post('email'),
				'facebook' 	     => $this->input->post('facebook'),
				'instagram' 	 => $this->input->post('instagram'),
				'motto'  		 => $this->input->post('motto'), 
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->user->save($data);

		echo json_encode(array("status" => TRUE));

		$var 	= $data['username'];
		$pred 	= $data['akses_level'];
		$id 	= $this->input->post('id');

		helper_log("add", "", "User", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'akses_level' 	 => $this->input->post('akses_level'),
				'username' 		 => $this->input->post('username'), 
				'password' 		 => $this->input->post('password'), 
				'nama' 	         => $this->input->post('nama'),
				'pekerjaan' 	 => $this->input->post('pekerjaan'),
				'email' 		 => $this->input->post('email'),
				'facebook' 	     => $this->input->post('facebook'),
				'instagram' 	 => $this->input->post('instagram'),
				'motto'  		 => $this->input->post('motto'),  
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/user/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/user/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$user = $this->user->get_by_id($this->input->post('id'));
			if(file_exists('upload/user/'.$user->photo) && $user->photo)
				unlink('upload/user/'.$user->photo);

			$data['photo'] = $upload;
		}

		$this->user->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$var = $data['akses_level'];
		$pred = $data['username'];
		$id = $this->input->post('id');

		helper_log("edit", "", "User", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$user = $this->user->get_by_id($id);
		if(file_exists('upload/user/'.$user->photo) && $user->photo)
			unlink('upload/user/'.$user->photo);
		
		$this->user->delete_by_id($id);
		echo json_encode(array("status" => TRUE));
		$var 	= $user->username;
		$pred 	= $user->akses_level;

		helper_log("delete", "User", "User", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/user/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 3000; //set max size allowed in Kilobyte
        $config['max_width']            = 3000; // set max width image allowed
        $config['max_height']           = 3000; // set max height allowed
        $config['file_name']            = round(microtime(true) * 1000); //just milisecond timestamp fot unique name

        $this->upload->initialize($config);

        if(!$this->upload->do_upload('photo')) //upload and validate
        {
            $data['inputerror'][] = 'photo';
			$data['error_string'][] = 'Upload error: '.$this->upload->display_errors('',''); //show ajax error
			$data['status'] = FALSE;
			echo json_encode($data);
			exit();
		}
		return $this->upload->data('file_name');
	}

	private function _validate()
	{
		$data = array();
		$data['error_string'] = array();
		$data['inputerror'] = array();
		$data['status'] = TRUE;

		if($this->input->post('akses_level') == '')
		{
			$data['inputerror'][] = 'akses_level';
			$data['error_string'][] = 'akses_level harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('username') == '')
		{
			$data['inputerror'][] = 'username';
			$data['error_string'][] = 'username harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('password') == '')
		{
			$data['inputerror'][] = 'password';
			$data['error_string'][] = 'password harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('nama') == '')
		{
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'nama harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('pekerjaan') == '')
		{
			$data['inputerror'][] = 'pekerjaan';
			$data['error_string'][] = 'Pekerjaan harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('email') == '')
		{
			$data['inputerror'][] = 'email';
			$data['error_string'][] = 'email harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('facebook') == '')
		{
			$data['inputerror'][] = 'facebook';
			$data['error_string'][] = 'facebook harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('instagram') == '')
		{
			$data['inputerror'][] = 'instagram';
			$data['error_string'][] = 'instagram harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('motto') == '')
		{
			$data['inputerror'][] = 'motto';
			$data['error_string'][] = 'motto harus diisi';
			$data['status'] = FALSE;
        }
        if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

	public function detail_user($id){
		$data = $this->user->get_by_id($id);
		echo json_encode($data);
	}
}




/* End of file user.php */
/* Location: ./application/controllers/admin/user.php */ ?>