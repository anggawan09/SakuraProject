   <div class="site-section" id="hub-section">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center mb-5">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <span>Postingan Kegiatan Terbaru</span>
              <h2>Kegiatan Kami</h2>
            </div>
            <div class="sidebar-box">
            <?php echo form_open(base_url('public/kegiatan/search'));?>
              <form class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" name="keyword" class="form-control" placeholder="Cari Kegiatan disini">
                </div>
              </form>
            <?php echo form_close(); ?>
            </div>
          </div>
        </div>
       <div class="row">
            <?php foreach ($kegiatan as $kegiatan) { ?>     
            <?php 
                  $CI =& get_instance();
                  $CI->load->model('public/M_beranda');
                  $user  = $CI->M_beranda->user($kegiatan->username);
             ?>
            <div class="col-md-6 col-lg-6" data-aos="fade-up" data-aos-delay="100">
              <div>
                <a href="<?php echo site_url('public/kegiatan/read/'.$kegiatan->slug_berita) ?>" class="mb-4 d-block"><img src="<?php echo site_url('upload/berita/'.$kegiatan->photo) ?> " alt="Image" class="img-fluid rounded"></a>
                <h2><a href="<?php echo site_url('public/kegiatan/read/'.$kegiatan->slug_berita) ?>"><?php echo $kegiatan->judul_berita ?></a></h2>
                <p class="text-muted mb-3 text-uppercase small"><span class="mr-2"><?php echo longdate_indo(substr($kegiatan->created, 0 , 10))?></span> By <a href="<?php echo site_url('public/kegiatan/read/'.$kegiatan->slug_berita) ?>" class="by">
                  <?php foreach ($user as $user) {
                    echo $user->nama;
                  } ?>

                </a></p>
               
                <p></p>
                <p><a href="<?php echo site_url('public/kegiatan/read/'.$kegiatan->slug_berita) ?>">Baca Selengkapnya..</a></p>
              </div>
            </div>
            <?php } ?>         
        </div>
         <div class="row">
          <div class="col-12 text-center mb-10">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <h5 data-aos="fade-right" data-aos-delay="200"> <?php echo $this->pagination->create_links(); ?>   </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
    
   