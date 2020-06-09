<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Anggota extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_anggota','anggota');
		$this->load->model('M_anggota');

	}

	public function index()
	{	
		$data = array(
			'isi'	 		=> 	'v_anggota',
			'title1' 		=> 	'Anggota',
			'title2' 		=>	'List Data',
			'breadcrumb1'  	=> 	'Anggota',
			'breadcrumb2'  	=>	'List',
			'icon' 			=>	'group',
		);
		$this->load->view('wrapper', $data, FALSE);	
	}

	public function ajax_list()
	{

		$list = $this->anggota->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $anggota) {
			$no++;
			$row = array();
			$row[] = $anggota->nama;
			$row[] = $anggota->gender;
			$row[] = $anggota->angkatan;
            $row[] = $anggota->alamat;
			$row[] = $anggota->telepon;
			$row[] = $anggota->darah;
			
			//add html for action
			$row[] = '
					<a class="btn btn-md btn-success" href="javascript:void(0)" title="Detail" onclick="detail_anggota('."'".$anggota->id."'".')"><i class="glyphicon glyphicon-list"></i></a>
					<a class="btn btn-md btn-primary" href="javascript:void(0)" title="Edit" onclick="edit_anggota('."'".$anggota->id."'".')"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn btn-md btn-danger" href="javascript:void(0)" title="Hapus" onclick="delete_anggota('."'".$anggota->id."'".')"><i class="glyphicon glyphicon-trash"></i></a>';
		
			$data[] = $row;
		}

		$output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->anggota->count_all(),
						"recordsFiltered" => $this->anggota->count_filtered(),
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function ajax_edit($id)
	{
		$data = $this->anggota->get_by_id($id);
		$data->tanggallahir = ($data->tanggallahir == '0000-00-00') ? '' : $data->tanggallahir; // if 0000-00-00 set tu empty for datepicker compatibility
		echo json_encode($data);
	}

	public function ajax_add()
	{
		$this->_validate();
		
		$data = array(
				'nama' 			 => $this->input->post('nama'),
				'gender' 		 => $this->input->post('gender'), 
				'angkatan' 		 => $this->input->post('angkatan'), 
				'kotalahir' 	 => $this->input->post('kotalahir'),
				'tanggallahir' 	 => $this->input->post('tanggallahir'),
				'alamat' 		 => $this->input->post('alamat'),
				'pekerjaan' 	 => $this->input->post('pekerjaan'),
				'telepon' 		 => $this->input->post('telepon'),
				'status' 		 => $this->input->post('status'),
				'jabatan' 		 => $this->input->post('jabatan'),
				'darah'  		 => $this->input->post('darah'),
				'email'  		 => $this->input->post('email'),
				'facebook' 		 => $this->input->post('facebook'),
				'twitter'  		 => $this->input->post('twitter'),
				'instagram'  	 => $this->input->post('instagram'),
			);

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			$data['photo'] = $upload;
		}

		$insert = $this->anggota->save($data);

		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data anggota Telah ditambah';
		$isi	= $data['nama'];
		$url	= 'anggota';
		$icon	= 'fa fa-group';
		helper_notif("$judul","$isi","$url","$icon");
		
		$var 	= $data['nama'];
		$pred 	= $data['angkatan'];
		$id 	= $id = $this->input->post('id');

		helper_log("add", "", "anggota", "$id","$var","$pred");
	}

	public function ajax_update()
	{
		$this->_validate();
		$data = array(
				'nama' 			 => $this->input->post('nama'),
				'gender' 		 => $this->input->post('gender'), 
				'angkatan' 		 => $this->input->post('angkatan'), 
				'kotalahir' 	 => $this->input->post('kotalahir'),
				'tanggallahir' 	 => $this->input->post('tanggallahir'),
				'alamat' 		 => $this->input->post('alamat'),
				'pekerjaan' 	 => $this->input->post('pekerjaan'),
				'telepon' 		 => $this->input->post('telepon'),
				'status' 		 => $this->input->post('status'),
				'jabatan' 		 => $this->input->post('jabatan'),
				'darah'  		 => $this->input->post('darah'),
				'email'  		 => $this->input->post('email'),
				'facebook' 		 => $this->input->post('facebook'),
				'twitter'  		 => $this->input->post('twitter'),
				'instagram'  	 => $this->input->post('instagram'), 
			);

		if($this->input->post('remove_photo')) // if remove photo checked
		{
			if(file_exists('upload/anggota/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
				unlink('upload/anggota/'.$this->input->post('remove_photo'));
			$data['photo'] = '';
		}

		if(!empty($_FILES['photo']['name']))
		{
			$upload = $this->_do_upload();
			
			//delete file
			$anggota = $this->anggota->get_by_id($this->input->post('id'));
			if(file_exists('upload/anggota/'.$anggota->photo) && $anggota->photo)
				unlink('upload/anggota/'.$anggota->photo);

			$data['photo'] = $upload;
		}

		$this->anggota->update(array('id' => $this->input->post('id')), $data);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data anggota Telah Diupdate';
		$isi	= $data['nama'];
		$url	= 'anggota';
		$icon	= 'fa fa-group';
		helper_notif("$judul","$isi","$url","$icon");


		$var = $data['nama'];
		$pred = $data['angkatan'];
		$id = $this->input->post('id');

		helper_log("edit", "", "anggota", "$id","$var","$pred");
	}

	public function ajax_delete($id)
	{
		//delete file
		$anggota = $this->anggota->get_by_id($id);
		if(file_exists('upload/anggota/'.$anggota->photo) && $anggota->photo)
			unlink('upload/anggota/'.$anggota->photo);
		
		$this->anggota->delete_by_id($id);
		echo json_encode(array("status" => TRUE));

		$judul 	= 'Data anggota Telah Dihapus';
		$isi	= "";
		$url	= 'anggota';
		$icon	= 'fa fa-group';
		helper_notif("$judul","$isi","$url","$icon");

		$var 	= $anggota->nama;
		$pred 	= $anggota->angkatan;

		helper_log("delete", "Anggota", "anggota", "$id","$var","$pred");
	}

	private function _do_upload()
	{
		$config['upload_path']          = 'upload/anggota/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 1000; //set max size allowed in Kilobyte
        $config['max_width']            = 2000; // set max width image allowed
        $config['max_height']           = 2000; // set max height allowed
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

		if($this->input->post('nama') == '')
		{
			$data['inputerror'][] = 'nama';
			$data['error_string'][] = 'nama harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('gender') == '')
		{
			$data['inputerror'][] = 'gender';
			$data['error_string'][] = 'gender harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('angkatan') == '')
		{
			$data['inputerror'][] = 'angkatan';
			$data['error_string'][] = 'angkatan harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('kotalahir') == '')
		{
			$data['inputerror'][] = 'kotalahir';
			$data['error_string'][] = 'kotalahir harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('tanggallahir') == '')
		{
			$data['inputerror'][] = 'tanggallahir';
			$data['error_string'][] = 'tanggal lahir harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('alamat') == '')
		{
			$data['inputerror'][] = 'alamat';
			$data['error_string'][] = 'alamat harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('pekerjaan') == '')
		{
			$data['inputerror'][] = 'pekerjaan';
			$data['error_string'][] = 'pekerjaan harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('telepon') == '')
		{
			$data['inputerror'][] = 'telepon';
			$data['error_string'][] = 'telepon harus diisi';
			$data['status'] = FALSE;
        }		
        if($this->input->post('darah') == '')
		{
			$data['inputerror'][] = 'darah';
			$data['error_string'][] = 'darah harus diisi';
			$data['status'] = FALSE;
        }
        if($this->input->post('email') == '')
		{
			$data['inputerror'][] = 'email';
			$data['error_string'][] = 'email harus diisi';
			$data['status'] = FALSE;
        }        

		if($data['status'] === FALSE)
		{
			echo json_encode($data);
			exit();
		}
	}

	public function export()
	{
    // Load plugin PHPExcel nya
		$this->load->model('M_anggota');
	    include APPPATH.'third_party/PHPExcel/PHPExcel.php';
	    
	    // Panggil class PHPExcel nya
	    $excel = new PHPExcel();
	    // Settingan awal fil excel
	    $excel->getProperties()->setCreator('KSR SAKURA')
	                 ->setLastModifiedBy('KSR SAKURA')
	                 ->setTitle("Data Anggota KSR SAKURA")
	                 ->setSubject("Anggota")
	                 ->setDescription("Database Anggota KSR SAKURA")
	                 ->setKeywords("Data Anggota");
	    // Buat sebuah variabel untuk menampung pengaturan style dari header tabel
	    $style_col = array(
	      'font' => array('bold' => true), // Set font nya jadi bold
	      'alignment' => array(
	        'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
	        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
	      ),
	      'borders' => array(
	        'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
	        'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
	        'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
	        'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
	      )
	    );
	    // Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
	    $style_row = array(
	      'alignment' => array(
	        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
	      ),
	      'borders' => array(
	        'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
	        'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
	        'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
	        'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
	      )
	    );
	    $excel->setActiveSheetIndex(0)->setCellValue('A1', "DATABASE ANGGOTA KSR SAKURA"); // Set kolom A1 dengan tulisan "DATA SISWA"
	    $excel->getActiveSheet()->mergeCells('A1:K1'); // Set Merge Cell pada kolom A1 sampai E1
	    $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE); // Set bold kolom A1
	    $excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20); // Set font size 15 untuk kolom A1
	    $excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER); // Set text center untuk kolom A1
	    // Buat header tabel nya pada baris ke 3
	    $excel->setActiveSheetIndex(0)->setCellValue('A3', "NO"); // Set kolom A3 dengan tulisan "NO"
	    $excel->setActiveSheetIndex(0)->setCellValue('B3', "NAMA"); // Set kolom B3 dengan tulisan "NIS"
	    $excel->setActiveSheetIndex(0)->setCellValue('C3', "JENIS KELAMIN"); // Set kolom C3 dengan tulisan "NAMA"
	    $excel->setActiveSheetIndex(0)->setCellValue('D3', "ANGKATAN"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"
	    $excel->setActiveSheetIndex(0)->setCellValue('E3', "KOTA LAHIR"); // Set kolom E3 dengan tulisan "ALAMAT"
	    $excel->setActiveSheetIndex(0)->setCellValue('F3', "TANGGAL LAHIR"); // Set kolom A3 dengan tulisan "NO"
	    $excel->setActiveSheetIndex(0)->setCellValue('G3', "ALAMAT"); // Set kolom B3 dengan tulisan "NIS"
	    $excel->setActiveSheetIndex(0)->setCellValue('H3', "PEKERJAAN"); // Set kolom C3 dengan tulisan "NAMA"
	    $excel->setActiveSheetIndex(0)->setCellValue('I3', "TELEPON"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"
	    $excel->setActiveSheetIndex(0)->setCellValue('J3', "GOLONGAN DARAH"); // Set kolom E3 dengan tulisan "ALAMAT"
	   	$excel->setActiveSheetIndex(0)->setCellValue('K3', "EMAIL"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"
	    $excel->setActiveSheetIndex(0)->setCellValue('L3', "STATUS");
	    $excel->setActiveSheetIndex(0)->setCellValue('M3', "JABATAN");
	    $excel->setActiveSheetIndex(0)->setCellValue('N3', "FACEBOOK");
	    $excel->setActiveSheetIndex(0)->setCellValue('O3', "INSTAGRAM");
	    $excel->setActiveSheetIndex(0)->setCellValue('P3', "TWITTER");
	    $excel->setActiveSheetIndex(0)->setCellValue('Q3', "CREATED");
	     // Set kolom E3 dengan tulisan "ALAMAT"
	    // Apply style header yang telah kita buat tadi ke masing-masing kolom header
	    $excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('H3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('I3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('J3')->applyFromArray($style_col);	    
	    $excel->getActiveSheet()->getStyle('K3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('L3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('M3')->applyFromArray($style_col);	    
	    $excel->getActiveSheet()->getStyle('N3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('O3')->applyFromArray($style_col);
	    $excel->getActiveSheet()->getStyle('P3')->applyFromArray($style_col);	    
	    $excel->getActiveSheet()->getStyle('Q3')->applyFromArray($style_col);
	    // Panggil function view yang ada di M_anggota untuk menampilkan semua data siswanya
	    
	    $anggota = $this->M_anggota->export_get();
	    $no = 1; // Untuk penomoran tabel, di awal set dengan 1
	    $numrow = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
	    foreach($anggota as $data){ // Lakukan looping pada variabel siswa

	      $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
	      $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->nama);
	      $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data->gender);
	      $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data->angkatan);
	      $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data->kotalahir);
	      $excel->setActiveSheetIndex(0)->setCellValue('F'.$numrow, $data->tanggallahir);
	      $excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, $data->alamat);
	      $excel->setActiveSheetIndex(0)->setCellValue('H'.$numrow, $data->pekerjaan);
	      $excel->setActiveSheetIndex(0)->setCellValue('I'.$numrow, $data->telepon);
	      $excel->setActiveSheetIndex(0)->setCellValue('J'.$numrow, $data->darah);
	      $excel->setActiveSheetIndex(0)->setCellValue('K'.$numrow, $data->email);
	      $excel->setActiveSheetIndex(0)->setCellValue('L'.$numrow, $data->status);
	      $excel->setActiveSheetIndex(0)->setCellValue('M'.$numrow, $data->jabatan);
	      $excel->setActiveSheetIndex(0)->setCellValue('N'.$numrow, $data->facebook);
	      $excel->setActiveSheetIndex(0)->setCellValue('O'.$numrow, $data->instagram);
	      $excel->setActiveSheetIndex(0)->setCellValue('P'.$numrow, $data->twitter);
	      $excel->setActiveSheetIndex(0)->setCellValue('Q'.$numrow, $data->created);


	      // Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
	      $excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('F'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('G'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('H'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('I'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('J'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('K'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('L'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('M'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('N'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('O'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('P'.$numrow)->applyFromArray($style_row);
	      $excel->getActiveSheet()->getStyle('Q'.$numrow)->applyFromArray($style_row);          
	      $no++; // Tambah 1 setiap kali looping
	      $numrow++; // Tambah 1 setiap kali looping
	    }
	    // Set width kolom
	    $excel->getActiveSheet()->getColumnDimension('A')->setWidth(5); // Set width kolom A
	    $excel->getActiveSheet()->getColumnDimension('B')->setWidth(20); // Set width kolom B
	    $excel->getActiveSheet()->getColumnDimension('C')->setWidth(20); // Set width kolom C
	    $excel->getActiveSheet()->getColumnDimension('D')->setWidth(15); // Set width kolom D
	    $excel->getActiveSheet()->getColumnDimension('E')->setWidth(20); // Set width kolom E
	    $excel->getActiveSheet()->getColumnDimension('F')->setWidth(20); // Set width kolom A
	    $excel->getActiveSheet()->getColumnDimension('G')->setWidth(30); // Set width kolom B
	    $excel->getActiveSheet()->getColumnDimension('H')->setWidth(20); // Set width kolom C
	    $excel->getActiveSheet()->getColumnDimension('I')->setWidth(15); // Set width kolom D
	    $excel->getActiveSheet()->getColumnDimension('J')->setWidth(15); // Set width kolom E
	    $excel->getActiveSheet()->getColumnDimension('K')->setWidth(20); // Set width kolom A
	    $excel->getActiveSheet()->getColumnDimension('L')->setWidth(20); // Set width kolom B
	    $excel->getActiveSheet()->getColumnDimension('M')->setWidth(15); // Set width kolom D
	    $excel->getActiveSheet()->getColumnDimension('N')->setWidth(15); // Set width kolom E
	    $excel->getActiveSheet()->getColumnDimension('O')->setWidth(20); // Set width kolom A
	    $excel->getActiveSheet()->getColumnDimension('P')->setWidth(20); // Set width kolom B
	    $excel->getActiveSheet()->getColumnDimension('Q')->setWidth(20); // Set width kolom B            
	    // Set height semua kolom menjadi auto (mengikuti height isi dari kolommnya, jadi otomatis)
	    $excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
	    // Set orientasi kertas jadi LANDSCAPE
	    $excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
	    // Set judul file excel nya
	    $excel->getActiveSheet(0)->setTitle("DATABASE ANGGOTA KSR SAKURA");
	    $excel->setActiveSheetIndex(0);
	    // Proses file excel
	    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	    header('Content-Disposition: attachment; filename="DATABASE ANGGOTA KSR SAKURA.xlsx"'); // Set nama file excel nya
	    header('Cache-Control: max-age=0');
	    $write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
	    $write->save('php://output');

	}
  
   	public function import()
    {	
    include APPPATH.'third_party/PHPExcel/Excel.php';
       if(isset($_FILES["file"]["name"]))
        {
            $path = $_FILES["file"]["tmp_name"];
            $object = PHPExcel_IOFactory::load($path);
            $PHPReader = new PHPExcel_Reader_Excel2007();
     		$PHPReader->setReadDataOnly(true);
            foreach($object->getWorksheetIterator() as $worksheet)
            {
                $highestRow = $worksheet->getHighestRow();
                $highestColumn = $worksheet->getHighestColumn();
                for($row=2; $row<=$highestRow; $row++)
                {   
                    $nama = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
                    $gender= $worksheet->getCellByColumnAndRow(1, $row)->getValue();
                    $angkatan = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
                    $kotalahir= $worksheet->getCellByColumnAndRow(3, $row)->getValue();
                    $tanggallahir = $worksheet->getCellByColumnAndRow(4, $row)->getValue();
                    $alamat= $worksheet->getCellByColumnAndRow(5, $row)->getValue();
                    $pekerjaan = $worksheet->getCellByColumnAndRow(6, $row)->getValue();
                    $telepon= $worksheet->getCellByColumnAndRow(7, $row)->getValue();
                    $darah = $worksheet->getCellByColumnAndRow(8, $row)->getValue();
                    $email= $worksheet->getCellByColumnAndRow(9, $row)->getValue();
                    $status = $worksheet->getCellByColumnAndRow(10, $row)->getValue();
                    $jabatan= $worksheet->getCellByColumnAndRow(11, $row)->getValue();
                    $facebook = $worksheet->getCellByColumnAndRow(12, $row)->getValue();
                    $instagram= $worksheet->getCellByColumnAndRow(13, $row)->getValue();
                    $twitter = $worksheet->getCellByColumnAndRow(14, $row)->getValue();
                    

                    $data[] = array(
                        'nama'        	=>    $nama,
                        'gender'        =>    $gender,
                        'angkatan'      =>    $angkatan,
                        'kotalahir'     =>    $kotalahir,
                        'tanggallahir'  =>    $tanggallahir,
                        'alamat'        =>    $alamat,
                        'pekerjaan'     =>    $pekerjaan,
                        'telepon'       =>    $telepon,
                        'darah'        	=>    $darah,
                        'email'         =>    $email,
                        'status' 		=>	  $status,
                        'jabatan' 		=>	  $jabatan,
                        'facebook' 		=>	  $facebook,
                        'instagram' 	=>	  $instagram,
                        'twitter' 		=>	  $twitter 	 
                    );
           		 $this->M_anggota->import($data);
                }
            }

        }
        redirect('Anggota','refresh');                
    }
	public function detail_anggota($id){
		$data = $this->anggota->get_by_id($id);
		$data->tanggallahir = ($data->tanggallahir == '0000-00-00') ? '' : $data->tanggallahir; // if 0000-00-00 set tu empty for datepicker compatibility
		echo json_encode($data);
	}
}




/* End of file Anggota.php */
/* Location: ./application/controllers/admin/Anggota.php */ ?>