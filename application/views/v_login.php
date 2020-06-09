<!DOCTYPE html>
<html>
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Sakura | Log in</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <!-- Bootstrap 3.3.7 -->
      <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/bower_components/font-awesome/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/bower_components/Ionicons/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/dist/css/AdminLTE.min.css">
      <!-- iCheck -->
      <link rel="stylesheet" href="<?php echo base_url()?>assets/admin//plugins/iCheck/square/blue.css">

      <link rel="icon" type="image/png" href="<?php echo site_url('upload/ig.png') ?>" />

      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  </head>
  <body class="hold-transition login-page">
      <div class="login-box">
        <div class="login-logo">
          <a href="../../index2.html"><b>SISTEM INFORMASI</b></a><br>
          <a href="">KSR UNIT 106 SAKURA MAKASSAR</a>
        </div>
            <!-- /.login-logo -->
              <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                  <?php 

  //Notifikasi Kalau ada input error
                    echo validation_errors('<div class="alert alert-danger"><i class="fa fa-warning"></i> ',' </div>');

                    //Notifikasi
                    if($this->session->flashdata('sukses')){
                    

                      echo '<div class="alert alert-danger alert-dismissable">';
                      echo '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
                      echo '<h4><i class="icon fa fa-ban"></i> Perhatian!</h4>';
                      echo $this->session->flashdata('sukses');
                      echo '</div>';
                    }

                ?>
                <form role="form" method="post" action="<?php echo site_url('Login/aksi_login') ?>">
                      <div class="form-group has-feedback">
                        <input type="text" name="username" class="form-control" placeholder="Username">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                      </div>
                      <div class="form-group has-feedback">
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                      </div>
                      <div class="row">
                        <div class="col-xs-8">
                          <div class="checkbox icheck">
                            <label>
                              <input type="checkbox"> Remember Me
                            </label>
                          </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div>
                        <!-- /.col -->
                      </div>
                </form>
              </div>
      </div>
    <script src="<?php echo base_url()?>assets/admin//bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?php echo base_url()?>assets/admin//bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="<?php echo base_url()?>assets/admin/plugins/iCheck/icheck.min.js"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' /* optional */
        });
      });
    </script>
  </body>
</html>
