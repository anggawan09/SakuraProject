	<div class="site-section" id="hub-section">
      	<div class="container">
			<div class="row">
	          <div class="col-12 text-center mb-5">
	            <div class="block-heading-1" data-aos="fade-up" data-aos-delay="">
				<?php foreach ($nav as $nav) { ?>
	              <span>Kategori <?php echo $nav->kategori ?></span>
				<?php } ?>
	              <h2>Galeri Foto</h2>
	            </div>
	          </div>
	        </div>
		    <div class="row">
				<div class="container">
				  <hr class="mt-2 mb-5">
				  <div class="row text-center text-lg-left" data-aos="fade-up" data-aos-delay="">
				  	<?php foreach ($galeri as $galeri) { ?>
					    <div class="col-lg-3 col-md-4 col-6">
					      	<a href="<?php echo site_url('upload/galeri/'.$galeri->photo) ?>" class="d-block mb-4 h-100">
					            <img class="img-fluid img-thumbnail" src="<?php echo site_url('upload/galeri/'.$galeri->photo) ?> " alt="">
					        </a>
					    </div>
				  	<?php } ?>
				  </div>
				</div>
		    </div>
	    </div>
    </div>


