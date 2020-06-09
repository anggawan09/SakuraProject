  <?php 
    $CI =& get_instance();
    $CI->load->model('M_beranda');
    $konfigurasi  = $CI->M_beranda->konfigurasi();
  ?>

<?php foreach ($konfigurasi as $konfigurasi) { ?>
  <!doctype html>
  <html lang="en">
    <head>
      <title><?php echo $konfigurasi->nama ?></title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700" rel="stylesheet">
    
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/fonts/icomoon/style.css">

      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/bootstrap.min.css">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/jquery.fancybox.min.css">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/owl.carousel.min.css">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/owl.theme.default.min.css">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/fonts/flaticon/font/flaticon.css">
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/aos.css">
      <link rel="icon" type="image/png" href="<?php echo site_url('upload/other/ig.png') ?>"  alt="Image" class="img-fluid"/>



      <!-- MAIN CSS -->
      <link rel="stylesheet" href="<?php echo base_url() ?>assets/public/css/style.css">
      
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
    
    <div class="site-wrap"  id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>
     
       
      <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">
            
              
              <div class="site-logo">
                <a href="<?php echo site_url('public/beranda') ?> " class="text-black"><span class="text-primary">
                  <img width="250px" src=" <?php echo base_url('upload/other/'.$konfigurasi->photo) ?>">
                </a>
              </div>
              
              <div class="col-12">
                <nav class="site-navigation text-right ml-auto " role="navigation">

                  <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                    <?php if ($this->uri->segment(2) == "beranda") { ?>
                      <li><a href="#home-section" class="nav-link">Home</a></li>
                      <li class="has-children">
                        <a href="#profil-section" class="nav-link">Profil</a>
                        <ul class="dropdown arrow-top">
                          <li><a href="#tentang-section" class="nav-link">Tentang</a></li>
                          <li><a href="#sejarah-section" class="nav-link">Sejarah</a></li>
                          <li><a href="#struktur-section" class="nav-link">Struktur Organisasi</a></li>
                        </ul>
                      </li>
                      <li><a href="#press-section" class="nav-link">Berita</a></li>
                      <li><a href="#galeri-section" class="nav-link">Galeri</a></li>
                      <li><a href="#tanggapan-section" class="nav-link">Tanggapan</a></li>
                      <li><a href="#hub-section" class="nav-link">Kegiatan</a></li>
                      <li><a href="#permohonan-section" class="nav-link">Permohonan</a></li>
                      <li><a href="#contact-section" class="nav-link">Hubungi Kami</a></li>
                    <?php }else{ ?>
                      <li><a href="<?php echo site_url('public/beranda#home-section') ?> " class="nav-link">Home</a></li>
                       <li class="has-children">
                          <a href="<?php echo site_url('public/beranda#profil-section') ?>" class="nav-link">Profil</a>
                          <ul class="dropdown arrow-top">
                            <li><a href="<?php echo site_url('public/beranda#tentang-section') ?>" class="nav-link">Tentang</a></li>
                            <li><a href="<?php echo site_url('public/beranda#sejarah-section') ?>" class="nav-link">Sejarah</a></li>
                            <li><a href="<?php echo site_url('public/beranda#struktur-section') ?>" class="nav-link">Struktur Organisasi</a></li>
                          </ul>
                        </li>
                        <li><a href="<?php echo site_url('public/beranda#press-section') ?>" class="nav-link">Berita</a></li>
                        <li><a href="<?php echo site_url('public/beranda#galeri-section') ?>" class="nav-link">Galeri</a></li>
                        <li><a href="<?php echo site_url('public/beranda#tanggapan-section') ?>" class="nav-link">Tanggapan</a></li>
                        <li><a href="<?php echo site_url('public/kegiatan') ?>" class="nav-link">Kegiatan</a></li>
                        <li><a href="<?php echo site_url('public/beranda#permohonan-section') ?>" class="nav-link">Permohonan</a></li>
                        <li><a href="<?php echo site_url('public/beranda#contact-section') ?>" class="nav-link">Hubungi Kami</a></li>
                    <?php } ?>
                  </ul> 
                </nav>
              </div>
            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>
        </div>
      </header>

      <?php if ($isi): ?>
        <?php $this->load->view($isi); ?>
      <?php endif ?>

       <footer class="site-footer">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-8">
                  <h2 class="footer-heading mb-4">Hubungi Kami</h2>
                  <p><img width="100px" src="<?php echo site_url('upload/other/ig.png') ?>" alt=""><br><?php echo $konfigurasi->nama ?><br><?php echo $konfigurasi->alamat?><br><?php echo $konfigurasi->telepon ?> </p>
                </div>
                <div class="col-md-4 ml-auto">
                  <h2 class="footer-heading mb-4">Menu</h2>
                  <ul class="list-unstyled">
                    <li><a href="<?php echo site_url('public/beranda#home-section') ?>">Home</a></li>
                    <li><a href="<?php echo site_url('public/beranda#profil-section') ?>">Profil</a></li>
                    <li><a href="<?php echo site_url('public/beranda#press-section') ?>">Berita</a></li>
                    <li><a href="<?php echo site_url('public/beranda#tanggapan-section') ?>">Tanggapan</a></li>
                    <li><a href="<?php echo site_url('public/beranda#permohonan-section') ?>">Permohonan Tenaga</a></li>
                    <li><a href="<?php echo site_url('public/beranda#contact-section') ?>">Hubungi Kami</a></li>
                  </ul>
                </div>
                
              </div>
            </div>
            <div class="col-md-4 ml-auto">
                <h2 class="footer-heading mb-4">Follow Us</h2>
                  <a href="https://web.facebook.com/<?php echo $konfigurasi->facebook ?>" class="smoothscroll pl-0 pr-3"><span class="icon-facebook"></span></a>
                  <a href="https://twitter.com/<?php echo $konfigurasi->twitter ?>" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                  <a href="https://www.instagram.com/<?php echo $konfigurasi->instagram ?>" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                 <a href="mailto:<?php echo $konfigurasi->email ?>  " class="pl-3 pr-3"><span class="icon-envelope"></span></a>
              </form>
            </div>
          </div>
        </div>
      </footer>

    </div>

    <script src="<?php echo base_url() ?>assets/public/js/jquery-3.3.1.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/popper.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/owl.carousel.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/jquery.sticky.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/jquery.waypoints.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/jquery.animateNumber.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/jquery.fancybox.min.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/jquery.easing.1.3.js"></script>
    <script src="<?php echo base_url() ?>assets/public/js/aos.js"></script>

    
    <script src="<?php echo base_url() ?>assets/public/js/main.js"></script>
      
    </body>
  </html>
<?php } ?>    