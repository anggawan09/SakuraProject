<?php foreach ($kegiatan as $kegiatan) { ?>

<?php 
    $CI =& get_instance();
    $CI->load->model('M_beranda');
    $CI->load->model('M_kegiatan');
    $user  = $CI->M_beranda->user($kegiatan->username);
  ?>

    <div class="site-section-cover  inner-page bg-primary" style="background-image: url()" data-aos="fade">
      
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
          <div class="col-lg-10">

            <div class="box-shadow-content">
              <div class="block-heading-1">
                <span class="d-block mb-3 text-white" data-aos="fade-up"><?php echo longdate_indo(substr($kegiatan->created, 0 , 10))?><span class="mx-2 text-primary">&bullet;</span> by

                  <?php foreach ($user as $user) {
                    echo $user->nama;
                  } ?>

                </span>
                <h1 class="mb-4" data-aos="fade-up" data-aos-delay="100"><?php echo $kegiatan->judul_berita ?></h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    
    
<section class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-md-8 blog-content">
        <p><img src="<?php echo  site_url('upload/berita/'.$kegiatan->photo); ?> " alt="Image" class="img-fluid"></p>
        <p><?php echo $kegiatan->isi ?></p>
        <div class="pt-5">
          <p>Kategori:  <a href="#"><?php echo $kegiatan->kategori ?></a></p>
        </div>

          <div class="pt-5">
            <h3 class="mb-5"><?php echo $tot_komentar?> Komentar</h3>
            <ul class="comment-list">
              <?php foreach ($komentar as $komentar) { ?>
                <li class="comment">
                  <div class="vcard bio">
                    <img src="<?php echo site_url('upload/other/images.png') ?> " alt="Image">
                  </div>
                  <div class="comment-body">
                    <h3><?php echo $komentar->nama ?></h3>
                    <div class="meta"><?php echo longdate_indo(substr($komentar->created, 0 , 10))?> at <?php echo substr($komentar->created,10,15) ?> </div>
                    <p><?php echo $komentar->pesan ?></p>
                  </div>
                </li>
              <?php } ?>
            </ul>
            <!-- END comment-list -->
            <div class="comment-form-wrap pt-5">
            <?php 
              echo form_open(base_url('public/kegiatan/komentar/'.$kegiatan->slug_berita));
              ?>
              <h3 class="mb-5">Tinggalkan Komentar</h3>
                <form>
                  <div class="form-group">
                    <label for="name">Name *</label>
                    <input type="text" class="form-control" name="nama" required>
                  </div>
                  <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" class="form-control" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="message">Message *</label>
                    <textarea name="pesan" cols="30" rows="10" class="form-control" required></textarea>
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-md text-white">Kirim</button>
                  </div>
                </form>
            </div>
            <?php echo form_close(); ?>
          </div>
        </div>
        <div class="col-md-4 sidebar">
          <div class="sidebar-box">
            <div class="categories">
              <h3>Kategori</h3>
              <?php foreach ($kategori as $kategori) { ?>
                  <?php $total = $CI->M_kegiatan->tot_kategori($kategori->kategori); ?>
                  <li><a href="#"><?php echo $kategori->kategori ?> <span>(<?php echo $total ?> )</span></a></li>
              <?php } ?>
            </div>
          </div>
          <div class="sidebar-box">
            <img src="<?php echo site_url('upload/user/'.$user->photo) ?>" alt="Image" class="img-fluid mb-4 w-50 rounded-circle">
            <h3 class="text-black">Tentang Penulis</h3>
            <p><?php echo $user->motto ?></p>
            <p>
              <a href="https://web.facebook.com/<?php echo $user->facebook?> " class="smoothscroll pl-0 pr-3"><span class="icon-facebook"></span></a>
              <a href="https://www.instagram.com/<?php echo $user->instagram ?>" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="mailto:angga99124@gmail.com " class="pl-3 pr-3"><span class="icon-envelope"></span></a>
            </p>
          </div>
      </div>
    </div>
  </div>
</section>
<?php } ?>