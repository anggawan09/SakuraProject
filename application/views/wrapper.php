<!DOCTYPE html>
<html>
<head>
    <?php
        if($this->session->userdata('username') == ""){
          $this->session->set_flashdata('sukses', ' Silakan Login Terlebih Dahulu');
          redirect(site_url('Login'),'refresh');
        }

        $id           = $this->session->userdata('id'); 
        $nama         = $this->session->userdata('nama');
        $motto        = $this->session->userdata('motto');
        $pekerjaan    = $this->session->userdata('pekerjaan');
        $photo        = $this->session->userdata('photo');
        $akses_level  = $this->session->userdata('akses_level');
        $created        = $this->session->userdata('created');


        $CI =& get_instance();
        $CI->load->model('M_notif');
        $CI->load->model("M_user");
        $CI->load->model("M_konfigurasi");

        
        $notif = $CI->M_notif->listing();
        $pesan = $CI->M_notif->listing_pesan();
        $count = $CI->M_notif->count();
        $konf  = $CI->M_konfigurasi->listing();
                              

        // echo json_encode($notif);

    ?>
    
    <link rel="icon" type="image/png" href="<?php echo site_url('upload/other/ig.png')?>" alt="Image" class="img-fluid rounded" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>KSR SAKURA | <?php echo $breadcrumb1; ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
        folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/jvectormap/jquery-jvectormap.css">


    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/select2/dist/css/select2.css">

        <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

    <link rel="stylesheet" href="<?php echo base_url() ?>assets/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    
    <link href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css')?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/datatables/css/dataTables.bootstrap.css')?>" rel="stylesheet">


    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>

    <script src="<?php echo base_url('assets/bootstrap-datepicker/js/bootstrap-datepicker.min.js')?>"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">

            <!-- Logo -->
            <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>SKR</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>KSR</b>SAKURA</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                  <!-- Messages: style can be found in dropdown.less-->
                  <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-envelope-o"></i>
                      <span class="label label-success"> <?php echo count($count) ?></span>
                    </a>
                    <ul class="dropdown-menu" style="width: 300px;">
                      <li class="header">
                        <?php if (count($count) == "0" ) {?>
                          Anda Tidak Memiliki Pesan
                        <?php }else{ ?>
                          Anda Memiliki <?php echo count($count) ?> Pesan  
                        <?php } ?>
                        
                      </li>
                      
                      <li>
                           <!-- $receiver_id = $pesan->receiver_id;
                              $user = $CI->M_notif->PictureUrlById($receiver_id); 
 -->                        <!-- inner menu: contains the actual data -->
                        <ul class="menu">
                          <?php foreach ($pesan as $pesan) {?>
                            <?php  $sender_id = $pesan->sender_id; ?>
                            <?php  $user = $CI->M_notif->PictureUrlById($sender_id);  ?>
                            <?php foreach ($user as $user) { ?>
                              <li>
                                <a href="<?php echo site_url('beranda') ?>">
                                  <div class="pull-left">
                                    <img src="<?php echo base_url('upload/user/'.$user->photo)?>" class="img-circle" alt="User Image">
                                  </div>
                                  <h4>
                                    <?php echo $user->nama; ?>
                                    <small><i class="fa fa-clock-o"></i> <?php echo substr($user->created, 0,10)?></small>
                                  </h4>
                                  <p><?php if ( $pesan->message == "NULL") {?>
                                     <?php echo $user->nama ?> Mengirimi anda File (<?php echo $pesan->mime_type  ?>)
                                    <?php  } else{ ?>
                                    <?php echo $pesan->message ?>
                                  <?php } ?>
                                  </p>
                                </a>
                              </li>   
                            <?php } ?>
                          <?php } ?>
                        </ul>
                      </li>
                      <li class="footer"><a href="#">See All Messages</a></li>
                    </ul>
                  </li>
                  <!-- Notifications: style can be found in dropdown.less -->
                  <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bell-o"></i>
                      <span class="label label-warning"><?php echo count($notif); ?> </span>
                    </a>
                    
                    <ul style="width: 450px;" class="dropdown-menu">
                        <?php if (count($notif) == 0) {?>
                        <li class="header"><center>"Tidak ada Notifikasi"</center>
                        <?php }else{ ?>
                        <li class="header">
                          <center> <i class="fa fa-bell-o"></i><span> Anda Memiliki <?php echo count($notif)?> Notifikasi</span></center><br>
                          <input type="checkbox" id="check-all" class="form-check-input">Pilih Semua
                        </li>
                          <li>
                            <form  method="post" action="<?php echo site_url('Notifikasi/delete') ?>" id="form-delete">
                              <ul class="menu">
                                <?php foreach ($notif as $notif) {  ?>
                                <li>
                                  <a href="<?php echo site_url($notif->url)?>">
                                    <input type='checkbox' class='form-check-input' name='id[]' value='<?php echo $notif->id ?>'>
                                     <i class="<?php echo $notif->icon?> text-aqua"></i><?php echo $notif->judul ?> Oleh <?php echo $notif->user?>
                                    <div class="pull-right"><small><i class="fa fa-clock-o"></i> <?php echo  substr( $notif->created,0,10) ?> </small></div> 
                                  </a>
                                </li>
                                <?php } ?>
                              </ul>
                            </form>
                          </li>
                        <li class="footer"><center><button type="button" class="btn btn-primary btn-xs" id="btn-delete" >Hapus Notifikasi</button></center></li>
                        <?php } ?>
                      </li>
                    </ul>
                  </li>

                  <!-- User Account: style can be found in dropdown.less -->
                  <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="hidden-xs"><?php echo $nama?></span>
                    </a>
                    <ul class="dropdown-menu">
                      <!-- User image -->
                      <li class="user-header">
                        <img src="<?php echo base_url('upload/user/'.$photo)?>" class="img-circle" alt="User Image">
                        <p>
                          <?php echo $nama ?> - <?php echo $akses_level?>
                          <small><?php echo $pekerjaan?></small>
                        </p>
                      </li>
                      <!-- Menu Body -->
                      <!-- Menu Footer-->
                      <li class="user-footer">
                        <div class="pull-right">
                          <a href="<?php echo base_url('login/logout')?>" class="btn btn-default btn-flat">Sign out</a>
                        </div>
                      </li>
                    </ul>
                  </li>
                  <!-- Control Sidebar Toggle Button -->
                </ul>
              </div>
            </nav>
        </header>

        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
            <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image" >
                        <img src=" <?php echo base_url('upload/user/'.$photo)?>" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><?php echo $nama?></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
            <!-- search form -->
            
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MENU UTAMA</li>
                    <li class="<?php if($this->uri->segment(1)=="beranda"){echo "active";}?>" ><a href="<?php echo site_url('beranda') ?>"><i class="fa fa-dashboard"></i><span>Beranda</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="anggota"){echo "active";}?>"><a href="<?php echo site_url('anggota')?>"><i class="fa fa-group"></i><span>Database Anggota</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="barang"){echo "active";}?>"><a href="<?php echo site_url('barang') ?> "><i class="fa fa-search"></i><span>Inventaris Barang</span></a></li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-handshake-o"></i>
                            <span>Permohonan Tenaga</span>
                            <span class="pull-right-container">
                            <span class="label label-primary pull-right">3</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<?php if($this->uri->segment(1)=="permohonan"){echo "active";}?>"><a href="<?php echo site_url('permohonan') ?>"><i class="fa fa-tasks"></i><span>Permohonan Tenaga</span></a></li>
                            <li class="<?php if($this->uri->segment(1)=="permohonan_valid"){echo "active";}?>"><a href="<?php echo site_url('permohonan_valid') ?>"><i class="fa fa-thumbs-o-up"></i><span>Permohonan Valid</span></a></li>
                            <li class="<?php if($this->uri->segment(1)=="permohonan_tolak"){echo "active";}?>"><a href="<?php echo site_url('permohonan_tolak') ?>"><i class="fa fa-thumbs-down"></i><span>Permohonan Tolak</span></a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-book"></i>
                            <span>Manajemen Surat</span>
                            <span class="pull-right-container">
                            <span class="label label-primary pull-right">2</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<?php if($this->uri->segment(1)=="surat_masuk"){echo "active";}?>"><a href="<?php echo site_url('surat_masuk') ?>"><i class="fa fa-address-book-o"></i><span>Surat Masuk</span></a></li>
                            <li class="<?php if($this->uri->segment(1)=="surat_keluar"){echo "active";}?>"><a href="<?php echo site_url('surat_keluar') ?> "><i class="fa fa-address-book"></i><span>Surat Keluar</span></a></li>
                        </ul>
                    </li>
                    <li class="header">PUBLIKASI & DOKUMENTASI</li>
                    <li class="<?php if($this->uri->segment(1)=="berita"){echo "active";}?>"><a href="<?php echo site_url('berita') ?>"><i class="fa fa-newspaper-o"></i><span>Berita</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="tanggapan"){echo "active";}?>"><a href="<?php echo site_url('tanggapan') ?>"><i class="fa fa-comments"></i><span>Tanggapan</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="galeri"){echo "active";}?>" ><a href="<?php echo site_url('galeri')?>"><i class="fa fa-file-photo-o"></i><span>Galeri</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="profil"){echo "active";}?>" ><a href="<?php echo site_url('profil')?>"><i class="fa fa-user"></i><span>Profil</span></a></li>

                    <li class="header">REFRENSI</li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-newspaper-o"></i>
                            <span>Kategori</span>
                            <span class="pull-right-container">
                            <span class="label label-primary pull-right">3</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<?php if($this->uri->segment(1)=="kategori_berita"){echo "active";}?>"><a href="<?php echo site_url('kategori_berita')?>"><i class="fa fa-plus"></i>Kategori Berita</a></li>
                            <li class="<?php if($this->uri->segment(1)=="kategori_galeri"){echo "active";}?>"><a href="<?php echo site_url('kategori_galeri')?>"><i class="fa fa-plus"></i>Kategori Galeri</a></li>
                            <li class="<?php if($this->uri->segment(1)=="kategori_barang"){echo "active";}?>"><a href="<?php echo site_url('kategori_barang')?>"><i class="fa fa-plus"></i>Kategori Barang</a></li>
                        </ul>
                    </li>
                    <?php if ($akses_level == "admin") {?>
                    <li class="header">UTILITY</li>
                    <li class="<?php if($this->uri->segment(1)=="konfigurasi"){echo "active";}?>"><a href="<?php echo site_url('konfigurasi')?>"><i class="fa fa-cogs"></i><span>Konfigurasi Aplikasi</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="user"){echo "active";}?>"><a href="<?php echo site_url('user')?>"><i class="fa fa-user-plus"></i><span>Manajemen User</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="backup"){echo "active";}?>"><a href="<?php echo site_url('backup')?> "><i class="fa fa-database"></i><span>Backup Database</span></a></li>
                    <li class="<?php if($this->uri->segment(1)=="aktivitas"){echo "active";}?>"><a href="<?php echo site_url('aktivitas')?> "><i class="fa fa-clock-o"></i><span>Riwayat Aktivitas</span></a></li>
                    <?php } ?>
             
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <section class="content-header">
                <h1><i class="fa fa-<?php echo $icon ?>"></i> <?php echo $title1;?>
                    <small><?php echo $title2;?></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>
                    <?php 
                        echo $breadcrumb1;
                    ?>
                    </a></li>
                    <li class="active">
                    <?php 
                        echo $breadcrumb2;
                    ?>
                    </li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <?php 
                            if ($isi) {
                                $this->load->view($isi);
                            }
                        ?>
                    </div>
                </div>
            </section>
        </div>

        <!-- /.content-wrapper -->
        
        <footer class="main-footer">
            <strong>Copyright &copy; 2019-2020 <a href="https://adminlte.io">Sistem Informasi | KSR PMI UNIT 106 SAKURA MAKASSAR </a>.</strong> All rights
            reserved.
        </footer>
    </div>
    <!-- ./wrapper -->

    <script src="<?php echo base_url()?>/assets/admin/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/raphael/raphael.min.js"></script>
    <script src="<?php echo base_url()?>/assets/admin/bower_components/morris.js/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="<?php echo base_url()?>/assets/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="<?php echo base_url()?>/assets/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/moment/min/moment.min.js"></script>
    <script src="<?php echo base_url()?>/assets/admin/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<?php echo base_url()?>/assets/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url()?>/assets/admin/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url()?>/assets/admin/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<?php echo base_url()?>/assets/admin/dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?php echo base_url()?>/assets/admin/dist/js/demo.js"></script>

    <script src="<?php echo base_url()?>/assets/admin/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url()?>/assets/admin/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    
    <script src="<?php echo base_url()?>/assets/admin/bower_components/ckeditor/ckeditor.js"></script>
    <script src="<?php echo base_url()?>/assets/admin/chat/chat.js"></script>

     <script>
              CKEDITOR.replace( 'editor1' );
    </script>


   <script>
        $(document).ready(function(){ // Ketika halaman sudah siap (sudah selesai di load)
          $("#check-all").click(function(){ // Ketika user men-cek checkbox all
            if($(this).is(":checked")) // Jika checkbox all diceklis
              $(".form-check-input").prop("checked", true); // ceklis semua checkbox siswa dengan class "check-item"
            else // Jika checkbox all tidak diceklis
              $(".form-check-input").prop("checked", false); // un-ceklis semua checkbox siswa dengan class "check-item"
          });
          
          $("#btn-delete").click(function(){ // Ketika user mengklik tombol delete
            var confirm = window.confirm("Apakah Anda yakin ingin menghapus data-data ini?"); // Buat sebuah alert konfirmasi
            
            if(confirm) // Jika user mengklik tombol "Ok"
              $("#form-delete").submit(); // Submit form
          });
        });
  </script>

</body>
</html>
