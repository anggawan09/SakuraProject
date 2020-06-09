 <?php foreach ($berita as $berita) {?>

  <?php 
    $CI =& get_instance();
    $CI->load->model('M_beranda');
    $user  = $CI->M_beranda->user($berita->username);
  ?>
 
  <div class="site-section-cover  inner-page bg-primary" style="background-image: url()">
      
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-lg-10">

            <div class="box-shadow-content">
              <div class="block-heading-1">
                <span class="d-block mb-3 text-white"  data-aos="fade-up"><?php echo longdate_indo(substr($berita->created, 0 , 10))?><span class="mx-2 text-primary">&bullet;</span> by
                  <?php foreach ($user as $user) {
                    echo $user->nama;
                  } ?>
                </span>
                <h1 class="mb-4" data-aos="fade-up" data-aos-delay="100"><?php echo $berita->judul_berita ?></h1>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>

    
    <section class="site-section">
      <div class="container">
        <div class="row "data-aos="fade-right" data-aos-delay="">
          <div class="col-md-8 mx-auto blog-content" data-aos="fade-right" data-aos-delay="">
            <p><img src="<?php echo  site_url('upload/berita/'.$berita->photo); ?> " alt="Image" class="img-fluid"></p>
            <p><?php echo $berita->isi ?></p>
          </div>
          
        </div>
      </div>
    </section>
<?php } ?>

    <div class="site-section" id="press-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="block-heading-1" data-aos="fade-right" data-aos-delay="">
              <span>Postingan Berita</span>
              <h2>Berita Terbaru</h2>
            </div>
          </div>
          <div class="col-lg-8"  data-aos="fade-right" data-aos-delay="">
            <ul class="list-unstyled">
              <?php foreach ($beritalain as $beritalain) { ?>
                <li class="mb-4">
                  <h2 class="h4"><a href="<?php echo site_url('public/berita/read/'.$beritalain->slug_berita)?>" class="text-black"><?php echo $beritalain->judul_berita ?></a></h2>
                  <span class="d-block text-secondary"><?php echo longdate_indo(substr($beritalain->created, 0 , 10))?></span>
                  <?php 
                    $num_char = 200;
                    $text     = $beritalain->isi;

                    $char     = $text{$num_char - 1};
                    while($char != ' ') {
                      $char = $text{--$num_char};
                    }
                  ?>
                   <p><?php echo substr($text, 0, $num_char) . '...'; ?></p>
                </li>
              <?php } ?>
            </ul>
          </div>
        </div>
      </div>
    </div>
