   <?php 
    $CI =& get_instance();
    $CI->load->model('M_beranda');
    $konfigurasi  = $CI->M_beranda->konfigurasi();
  ?>

    <div class="owl-carousel slide-one-item">
      <?php foreach ($slider as $slider) {?>
        <div class="site-section-cover overlay img-bg-section" style="background-image: url(<?php echo base_url('upload/berita/'.$slider->photo); ?>)" >
          <div class="container">
            <div class="row align-items-center justify-content-center text-center">
              <div class="col-md-12 col-lg-7">
                <h1 data-aos="fade-up" data-aos-delay=""><?php echo $slider->judul_berita ?></h1>  
                <p class="mb-5" data-aos="fade-up" data-aos-delay="100"><?php echo $slider->isi ?> .</p>
                <p data-aos="fade-up" data-aos-delay="200"><a href=" <?php echo site_url('public/berita/read/'.$slider->slug_berita) ?> " class="btn btn-outline-white border-w-2 btn-md">Baca Selengkapnya..</a></p>
              </div>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>


    <div class="site-section">
      <div class="block__73694 mb-2" id="services-section">
        <div class="container">
          <div class="row d-flex no-gutters align-items-stretch">

          <?php foreach ($visi as $visi) { ?>                
            <div class="col-12 col-lg-6 block__73422" style="background-image: url(<?php echo base_url('upload/profil/'.$visi->photo); ?>);" data-aos="fade-right" data-aos-delay="">
            </div>
            <div class="col-lg-5 ml-auto p-lg-5 mt-4 mt-lg-0" data-aos="fade-left" data-aos-delay="">
              <h2 class="mb-3 text-black">Visi Organisasi</h2>
              <p><?php echo $visi->isi ?></p>
          <?php  } ?>
            </div>

          </div>
        </div>      
      </div>


      <div class="block__73694">
        <div class="container">
          <div class="row d-flex no-gutters align-items-stretch">
            <?php foreach ($misi as $misi) { ?>
            
              <div class="col-12 col-lg-6 block__73422 order-lg-2" style="background-image: url(<?php echo base_url('upload/profil/'.$misi->photo); ?>);" data-aos="fade-left" data-aos-delay="">
              </div>

              <div class="col-lg-5 mr-auto p-lg-5 mt-4 mt-lg-0 order-lg-1" data-aos="fade-right" data-aos-delay="">
                <h2 class="mb-3 text-black">Misi Organisasi</h2>
                <p><?php echo $misi->isi ?></p>
              </div>
            <?php } ?>

          </div>
        </div>      
      </div>
    </div>

    <div class="site-section" id="tentang-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <h2>Pengurus Harian</h2>
              <?php foreach ($konfigurasi as $konfigurasi) { ?>
                <p>Berikut Pengurus Harian  <?php echo $konfigurasi->nama; ?> Periode <?php echo $konfigurasi->periode; ?></p>
              <?php } ?>
            </div>
          </div>
        </div>
        <div class="row">
          <?php foreach ($anggota as $anggota) { ?>
            <?php if ($anggota->jabatan == "Komandan") { ?>
              <div class="col-lg-12 col-md-10 mb-5" data-aos="fade-up">
                 <div class="block-team-member-3 text-center rounded">
                <figure>
                  <img  src="<?php echo site_url('upload/anggota/'.$anggota->photo) ?> " alt="Image" class="img-fluid rounded-circle">
                </figure>
                <h3 class="font-size-20 text-black"><?php echo $anggota->nama ?></h3>
                <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-12 mb-3"><?php echo $anggota->jabatan ?></span>
                <div class="block-social-1">
                  <a href="https://web.facebook.com/<?php echo $anggota->facebook?> " class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-facebook"></span></a>
                  <a href="https://www.instagram.com/<?php echo $anggota->instagram ?> " class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-twitter"></span></a>
                  <a href="https://twitter.com/<?php echo $anggota->twitter ?> " class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-instagram"></span></a>
                </div>
              </div>
            </div>
            <?php }else{ ?>
            <div class="col-lg-4 col-md-10 mb-10" data-aos="fade-up">
              <div class="block-team-member-1 text-center rounded">
                <figure>
                  <img  src="<?php echo site_url('upload/anggota/'.$anggota->photo) ?> " alt="Image" class="img-fluid rounded-circle">
                </figure>
                <h3 class="font-size-20 text-black"><?php echo $anggota->nama ?></h3>
                <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-12 mb-3"><?php echo $anggota->jabatan ?></span>
                <div class="block-social-1">
                  <a href="https://web.facebook.com/<?php echo $anggota->facebook?> " class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-facebook"></span></a>
                  <a href="#" class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-twitter"></span></a>
                  <a href="#" class="btn border-w-2 rounded primary-primary-outline--hover"><span class="icon-instagram"></span></a>
                </div>
              </div>
            </div>
            <?php } ?>  
          <?php } ?>
        </div>
      </div>
    </div>
    <section class="site-section bg-light" id="sejarah-section">
      <div class="container">
        <div class="row mb-5 justify-content-center text-center">
          <div class="col-md-7">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <?php foreach ($sejarah as $sejarah) { ?>
              <h2>Sejarah Organisasi</h2>
              <p><?php echo $sejarah->isi ?></p>
              <?php } ?>
            </div>
          </div>
        </div>
    </section>
    <section class="site-section bg-light" id="struktur-section">
        <div class="row mb-12 justify-content-center text-center">
          <div class="row mb-5 justify-content-center">
            <div class="col-md-12 text-center">
              <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
                <h2>Struktur Organisasi</h2>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <?php foreach ($struktur as $struktur) { ?>
              <img src="<?php echo site_url('upload/profil/'.$struktur->photo) ?> " alt="Image" class="img-fluid"></a>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
    </section>   


    <div class="site-section" id="press-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 mb-5 mb-lg-0">
            <div class="block-heading-1" data-aos="fade-right" data-aos-delay="">
              <h2>Berita</h2>
            </div>
          </div>
          <div class="col-lg-6">
            <ul class="list-unstyled">
              <?php foreach ($berita as $berita) { ?>
                <li class="mb-5" data-aos="fade-right" data-aos-delay="200">
                  <span class="d-block text-muted mb-3"><?php echo longdate_indo(substr($berita->created, 0 , 10))?></span>
                  <h2 class="h4"><a href="<?php echo site_url('public/berita/read/'.$berita->slug_berita)?>" class="text-black"><?php echo $berita->judul_berita ?></a></h2>
                  <?php 
                    $num_char = 200;
                    $text     = $berita->isi;

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
        <div class="row">
          <div class="col-12 text-center mb-10">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <h5 data-aos="fade-right" data-aos-delay="200"> <?php echo $this->pagination->create_links(); ?>   </h5>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section" id="galeri-section" >
        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <h2>Galeri Foto</h2>
            </div>
          </div>
        </div>
          <div class="owl-carousel slide-one-item">
            <?php foreach ($galeri as $galeri) {?>
              <div class="site-section-cover overlay img-bg-section" style="background-image: url(<?php echo base_url('upload/kategorigaleri/'.$galeri->photo); ?>)" >
                <div class="container">
                  <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-6 col-lg-7">
                      <h1 data-aos="fade-up" data-aos-delay=""><?php echo $galeri->kategori ?></h1>  
                      <p class="mb-5" data-aos="fade-up" data-aos-delay="100"><?php echo $galeri->sekilas ?><br><?php echo longdate_indo(substr($galeri->created,0,10))?></p>
                      <p data-aos="fade-up" data-aos-delay="200"><a href="<?php echo base_url('public/galeri/read/'.$galeri->slug_galeri) ?>" class="btn btn-outline-white border-w-2 btn-md">Lihat Galeri..</a></p>
                    </div>
                  </div>
                </div>
              </div>
            <?php } ?>
          </div>
    </div>


    <div class="site-section bg-light block-13" id="tanggapan-section" data-aos="fade">
      <div class="container">
        
        <div class="text-center mb-5">
          <div class="block-heading-1">
            <h2>Tanggapan</h2>
          </div>
        </div>

        <div class="owl-carousel nonloop-block-13">
          <?php foreach ($tanggapan as $tanggapan) { ?>
              <?php if ($tanggapan->id % 2 == 0) { ?>
                 <div>
                    <div class="block-testimony-1 text-center">
                      <blockquote class="mb-4">
                        <p>&ldquo;<?php echo $tanggapan->komentar ?>&rdquo;</p>
                      </blockquote>

                      <figure>
                        <img src="<?php echo site_url('upload/tanggapan/'.$tanggapan->photo) ?>" alt="Image" class="img-fluid rounded-circle mx-auto">
                      </figure>
                      <h3 class="font-size-20 text-black"><?php echo $tanggapan->nama ?>
                        <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-12 mb-3"><?php echo $tanggapan->keterangan ?></span>
                      </h3>
                    </div>
                  </div>
              <?php }else{ ?>
                  <div>
                    <div class="block-testimony-1 text-center">
                      <figure>
                        <img src="<?php echo site_url('upload/tanggapan/'.$tanggapan->photo) ?>" alt="Image" class="img-fluid rounded-circle mx-auto">
                      </figure>
                      <h3 class="font-size-20 mb-4 text-black"><?php echo $tanggapan->nama ?>
                       <span class="d-block font-gray-5 letter-spacing-1 text-uppercase font-size-12 mb-3"><?php echo $tanggapan->keterangan ?></span>
                      </h3>
                      <blockquote class="mb-4">
                        <p>&ldquo;<?php echo $tanggapan->komentar ?>&rdquo;</p>
                      </blockquote>                    
                    </div>
                  </div>
              <?php } ?>
           
          <?php } ?>
        </div>

      </div>
    </div>

    <div class="site-section" id="hub-section">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center mb-5">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <span>Postingan Kegiatan Terbaru</span>
              <h2>Kegiatan Kami</h2>
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
                <?php 
                    $num_char = 200;
                    $text     = $kegiatan->isi;

                    $char     = $text{$num_char - 1};
                    while($char != ' ') {
                      $char = $text{--$num_char};
                    }
                  ?>
                <p><?php echo substr($text, 0, $num_char) . '...'; ?></p>
                <p><a href="<?php echo site_url('public/kegiatan/read/'.$kegiatan->slug_berita) ?>">Baca Selengkapnya..</a></p>
              </div>
            </div>
          <?php } ?>
        </div>
        <div style="padding-top: 50px" class="row">
          <div class="col-12 text-center mb-10">
            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
              <h5 data-aos="fade-right" data-aos-delay="200"><a href="<?php echo site_url('public/kegiatan') ?>">Lihat Semua Kegiatan</a></h5>
            </div>
          </div>
        </div>
      </div>
    </div>
         

    <div class="site-section" id="permohonan-section">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center mb-5" data-aos="fade-up" data-aos-delay="">
            <div class="block-heading-1">
              <h2>Permohonan Tenaga</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="100">
          <?php echo form_open(base_url('public/beranda/permohonan'));?>
            <form action="#" method="post">

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" name="instansi" class="form-control" placeholder="Instansi/Lembaga Pemohon" required>
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <select name="perihal" class="form-control" required>
                    <option value="">--Pilih Perihal--</option>
                    <option value="Tenaga Lapangan">Tenaga Lapangan</option>
                    <option value="Juri Lomba">Juri Lomba</option>
                    <option value="Tenaga Medis">Tenaga Medis</option>
                  </select>
                </div>
               </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="number" name="jumlah" class="form-control" placeholder="Jumlah Personil dibutuhkan" required>
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" name="contact" class="form-control" placeholder="Nomor Telepon" required>
                </div>
              </div>


              <div class="form-group row">
                <div class="col-md-12">
                  <textarea name="keterangan" class="form-control" placeholder="Keterangan.." cols="30" rows="10" required></textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-md text-white">Send</button>
                </div>
              </div>
            </form>
          <?php echo form_close(); ?>
          </div>
          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="200">
              <img style="padding-bottom: 20px" width="600px" src="<?php echo site_url('upload/other/tenaga.jpg') ?> " alt="Image" class="img-fluid"><br>           
              <img width="600px" src="<?php echo site_url('upload/other/tenaga2.jpg') ?> "alt="Image" class="img-fluid">           
          </div>
        </div>
      </div>
    </div>


    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center mb-5" data-aos="fade-up" data-aos-delay="">
            <div class="block-heading-1">
              <h2>Hubungi Kami</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="100">
          <?php echo form_open(base_url('public/beranda/hub'));?>
            <form action="#" method="post">
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" name="nama_awal" class="form-control" placeholder="First name" required>
                </div>
                <div class="col-md-6">
                  <input type="text" name="nama_akhir" class="form-control" placeholder="Last name" required>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" name="email" class="form-control" placeholder="Email address" required>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea name="pesan" class="form-control" placeholder="Write your message." cols="30" rows="10" required></textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-md text-white">Send</button>
                </div>
              </div>
            </form>
          <?php echo form_close(); ?>
          </div>
          <div class="col-lg-4 ml-auto" data-aos="fade-up" data-aos-delay="200">
              <h2 class="text-black"><?php echo $konfigurasi->nama ?></h2>
              <img width="200px" src="<?php echo site_url('upload/other/ig.png') ?> " alt="">           
              <p><?php echo $konfigurasi->alamat ?><br><?php echo $konfigurasi->telepon ?></p>
          </div>
        </div>
      </div>
    </div>
