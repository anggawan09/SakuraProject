<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Beranda extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_beranda');
		$this->load->model('M_hub');
		$this->load->model('M_chat');
		$this->load->model('M_user');
		$this->load->helper('string');
	}

	public function index()
	{	
		$data['strTitle']='';
		$data['strsubTitle']='';
		$list=[];

		if ($this->session->userdata('akses_level') =='admin') {
			$list = $this->M_user->Userlist();
			$strTitle 		='All User';
			$strsubTitle 	='User';
			$chatTitle		='Select User with Chat';
		}else{
			$list = $this->M_user->Adminlist();
			$strTitle 		='All Admin';
			$strsubTitle	='Admin';
			$chatTitle		='Select Admin with Chat';
		}

		$userlist=[];
		foreach($list as $u){
			
			$userlist[]=
			[
				'id' 	=> $u['id'],
				'nama' 	=> $u['nama'],
				'photo' => $this->M_user->PictureUrlById($u['id']),
			];
		}
	
		$anggota 			= $this->M_beranda->anggota();
		$anggota_limit		= $this->M_beranda->anggota_limit();
		$user 				= $this->M_beranda->user();
		$userlimit			= $this->M_beranda->userlimit();
		$barang 			= $this->M_beranda->barang();
		$surat_masuk		= $this->M_beranda->surat_masuk();
		$surat_keluar		= $this->M_beranda->surat_keluar();
		$permohonan 		= $this->M_beranda->permohonan();
		$permohonan_valid	= $this->M_beranda->permohonan_valid();
		$permohonan_tolak	= $this->M_beranda->permohonan_tolak();
		$backup				= $this->M_beranda->database();	
		$backup2			= $this->M_beranda->database2();
		$berita 			= $this->M_beranda->berita();
		$riwayat 			= $this->M_beranda->riwayat();
		$hub				= $this->M_hub->listing();
		$komentar 			= $this->M_beranda->komentar();

		$data = array(
			'isi'	 				=> 	'v_beranda',
			'title1' 				=> 	'Beranda',
			'title2' 				=>	'',
			'breadcrumb1'  			=> 	'Home',
			'breadcrumb2'  			=>	'Beranda',
			'icon' 					=>	'dashboard',
			'strTitle' 				=>	$strTitle,
			'strsubTitle' 	 		=>	$strsubTitle,
			'chatTitle' 			=>	$chatTitle, 	
			'anggota' 				=>	count($anggota),
			'anggota_limit'			=>	$anggota_limit,
			'anggota_count' 		=>	count($anggota_limit), 
			'user' 					=> 	count($user),
			'userlimit' 			=>	$userlimit,
			'userlist' 				=>	$userlist, 
			'berita' 				=>	count($berita),
			'barang' 				=>	count($barang),
			'surat_masuk' 			=> 	count($surat_masuk),
			'surat_keluar' 			=>	count($surat_keluar), 
			'permohonan' 			=>	count($permohonan),
			'permohonan_tolak'  	=> 	count($permohonan_tolak),
			'permohonan_valid' 		=>	count($permohonan_valid),
			'backup' 				=>	count($backup),
			'backup2' 				=>	$backup2,
			'riwayat' 				=>	$riwayat,
			'hub' 					=>	$hub,
			'komentar' 				=>  count($komentar) 	
		);
		$this->parser->parse('wrapper',$data);
	}

	public function send_text_message(){
		date_default_timezone_set("Asia/Kuala_Lumpur");
		$post = $this->input->post();
		$messageTxt='NULL';
		$attachment_name='';
		$file_ext='';
		$mime_type='';
		
		if(isset($_POST['type']) == 'Attachment'){ 
		 
		 	$AttachmentData = $this->ChatAttachmentUpload();
			//print_r($AttachmentData);
			$attachment_name 	= $AttachmentData['file_name'];
			$file_ext 			= $AttachmentData['file_ext'];
			$mime_type 			= $AttachmentData['file_type'];
		}else{
			$messageTxt = reduce_multiples($post['messageTxt'],' ');
		}	
				$data=[
 					'sender_id' 		=> $this->session->userdata('id'),
					'receiver_id' 		=> $this->input->post('receiver_id'),
					'message' 			=> $messageTxt,
					'attachment_name' 	=> $attachment_name,
					'file_ext' 			=> $file_ext,
					'mime_type'			=> $mime_type,
					'message_date_time' => date('Y-m-d H:i:s'), //23 Jan 2:05 pm
					'ip_address' 		=> $this->input->ip_address(),
				];	
		  
 				$query = $this->M_chat->SendTxtMessage($data);
	}

	public function ChatAttachmentUpload(){
		 
		$file_data='';
		if(isset($_FILES['attachmentfile']['name']) && !empty($_FILES['attachmentfile']['name'])){	
				$config['upload_path']          = './upload/file';
				$config['allowed_types']        = 'jpeg|jpg|png|txt|pdf|docx|xlsx|pptx|rtf';
				//$config['max_size']             = 500;
				//$config['max_width']            = 1024;
				//$config['max_height']           = 768;
				$this->upload->initialize($config);
				if ( ! $this->upload->do_upload('attachmentfile'))
				{
					echo json_encode(['status' => 0,
					'message' => '<span style="color:#900;">'.$this->upload->display_errors(). '<span>' ]); die;
				}
				else
				{
					$file_data = $this->upload->data();
					//$filePath = $file_data['file_name'];
					return $file_data;
				}
		    }

	}

	public function get_chat_history_by_vendor(){
		$receiver_id = $this->input->get('receiver_id');
		
		$Logged_sender_id = $this->session->userdata('id');
		 
		$history = $this->M_chat->GetReciverChatHistory($receiver_id);
		//print_r($history);
		foreach($history as $chat):
			
			$message_id = $chat['id'];
			$sender_id = $chat['sender_id'];
			$userName = $this->M_user->GetName($chat['sender_id']);
			$userPic = $this->M_user->PictureUrlById($chat['sender_id']);
			
			$message = $chat['message'];
			$messagedatetime = date('d M H:i A',strtotime($chat['message_date_time']));
			
 		?>
        	<?php
				$messageBody='';
            	if($message=='NULL'){ //fetach media objects like images,pdf,documents etc
					$classBtn = 'right';
					if($Logged_sender_id==$sender_id){$classBtn = 'left';}
					
					$attachment_name = $chat['attachment_name'];
					$file_ext = $chat['file_ext'];
					$mime_type = explode('/',$chat['mime_type']);
					
					$document_url = base_url('/upload/file/'.$attachment_name);
					
				  if($mime_type[0]=='image'){
 					$messageBody.='<img src="'.$document_url.'" onClick="ViewAttachmentImage('."'".$document_url."'".','."'".$attachment_name."'".');" class="attachmentImgCls">';	
				  }else{
					$messageBody='';
					 $messageBody.='<div class="attachment">';
                          $messageBody.='<h4>Attachments:</h4>';
                           $messageBody.='<p class="filename">';
                            $messageBody.= $attachment_name;
                          $messageBody.='</p>';
        
                          $messageBody.='<div class="pull-'.$classBtn.'">';
                            $messageBody.='<a download href="'.$document_url.'"><button type="button" id="'.$message_id.'" class="btn btn-primary btn-sm btn-flat btnFileOpen">Open</button></a>';
                          $messageBody.='</div>';
                        $messageBody.='</div>';
					}
						
											
				}else{
					$messageBody = $message;
				}
			?>
            
   
             <?php if($Logged_sender_id!=$sender_id){?>     
                  <!-- Message. Default to the left -->
                    <div class="direct-chat-msg">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left"><?=$userName;?></span>
                        <span class="direct-chat-timestamp pull-right"><?=$messagedatetime;?></span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img class="direct-chat-img" src="<?=$userPic;?>" alt="<?=$userName;?>">
                      <!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                         <?=$messageBody;?>
                      </div>
                      <!-- /.direct-chat-text -->
                      
                    </div>
                    <!-- /.direct-chat-msg -->
			<?php }else{?>
                    <!-- Message to the right -->
                    <div class="direct-chat-msg right">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-right"><?=$userName;?></span>
                        <span class="direct-chat-timestamp pull-left"><?=$messagedatetime;?></span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img class="direct-chat-img" src="<?=$userPic;?>" alt="<?=$userName;?>">
                      <!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                      	<?=$messageBody;?>
                          	<!--<div class="spiner">
                             	<i class="fa fa-circle-o-notch fa-spin"></i>
                            </div>-->
                       </div>
                       <!-- /.direct-chat-text -->
                    </div>
                    <!-- /.direct-chat-msg -->
             <?php }?>
        
        <?php
		endforeach;
 		
	}

	public function chat_clear_client_cs(){
		$receiver_id = $this->input->get('receiver_id');
		
		$messagelist = $this->M_chat->GetReciverMessageList($receiver_id);
		
		foreach($messagelist as $row){
			
			if($row['message']=='NULL'){
				$attachment_name = unlink('upload/file/'.$row['attachment_name']);
			}
 		}
		
		$this->M_chat->TrashById($receiver_id); 
	}

	public function delete_hub($id){
		$hub = $this->M_hub->detail($id);
		
		$data = [
		    'id' => $id
		];
		$this->M_hub->delete($data);
		redirect(base_url('beranda'),'refresh');
	}
	
}




/* End of file beranda.php */
/* Location: ./application/controllers/admin/beranda.php */ ?>