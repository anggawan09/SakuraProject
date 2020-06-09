<style>
  .fileDiv {
  position: relative;
  overflow: hidden;
}
.upload_attachmentfile {
  position: absolute;
  opacity: 0;
  right: 0;
  top: 0;
}
.btnFileOpen {margin-top: -50px; }

.direct-chat-warning .right>.direct-chat-text {
    background: #d2d6de;
    border-color: #d2d6de;
    color: #444;
  text-align: right;
}
.direct-chat-primary .right>.direct-chat-text {
    background: #3c8dbc;
    border-color: #3c8dbc;
    color: #fff;
  text-align: right;
}
.spiner{}
.spiner .fa-spin { font-size:24px;}
.attachmentImgCls{ width:450px; margin-left: -25px; cursor:pointer; }
</style>      



      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?php echo $anggota ?></h3>

              <p>Database Anggota</p>
            </div>
            <div class="icon">
              <i class="fa fa-group"></i>
            </div>
            <a href="<?php echo site_url('anggota') ?>" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?php echo $user ?></h3>

              <p>User</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="<?php echo site_url('user') ?> " class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?php echo $berita ?></h3>

              <p>Berita Release</p>
            </div>
            <div class="icon">
              <i class="fa fa-newspaper-o"></i>
            </div>
            <a href="<?php echo  site_url('berita') ?> " class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?php echo $barang; ?> </h3>

              <p>Inventaris Barang</p>
            </div>
            <div class="icon">
              <i class="fa fa-search"></i>
            </div>
            <a href="<?php echo site_url('barang') ?>" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div> 
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-comments-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Komentar</span>
              <span class="info-box-number"><?php echo $komentar ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-address-book-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Surat Masuk</span>
              <span class="info-box-number"><?php echo $surat_masuk ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-database"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Backup Database</span>
              <span class="info-box-number"><?php echo $backup ?></span>
              <span class="info-box-text">Last Backup
                <?php foreach ($backup2 as $backup2) { ?>
                  <strong><small><?php echo substr($backup2->tanggal,0,10)?></small></strong>
                  
                <?php } ?> 
              </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-tasks"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Permohonan Tenaga</span>
              <span class="info-box-number"><?php echo $permohonan ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-thumbs-o-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Permohonan Tenaga</span>
              <span class="info-box-text">Valid</span>
              <span class="info-box-number"><?php echo $permohonan_valid ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-thumbs-down"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Permohonan Tenaga</span>
              <span class="info-box-text">Tolak</span>
              <span class="info-box-number"><?php echo $permohonan_tolak ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
           <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-address-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Surat Keluar</span>
              <span class="info-box-number"><?php echo $surat_keluar ?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
      </div>



      <div class="row">
        <div class="col-md-8" id="chatSection">
              <!-- DIRECT CHAT -->
              <div class="box box-warning direct-chat direct-chat-primary">
                <div class="box-header with-border">
                  <h3 class="box-title" id="ReciverName_txt"><?=$chatTitle;?></h3>

                  <div class="box-tools pull-right">
                    <span data-toggle="tooltip" title="Clear Chat" class="ClearChat"><i class="fa fa-comments"></i></span>
                    <!--<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>-->
                   <!-- <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Clear Chat"
                            data-widget="chat-pane-toggle">
                      <i class="fa fa-comments"></i></button>-->
                   <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>-->
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <!-- Conversations are loaded here -->
                  <div class="direct-chat-messages" id="content">
                     <!-- /.direct-chat-msg -->
                     <div id="dumppy"></div>

                  </div>
                  <!--/.direct-chat-messages-->
 
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  <!--<form action="#" method="post">-->
                    <div class="input-group">
                     <?php
                        $obj=&get_instance();
                        $obj->load->model('M_user');
                        $profile_url = $obj->M_user->PictureUrl();
                        $user=$obj->M_user->GetUserData();
                      ?>
                      
                        <input type="hidden" id="Sender_Name" value="<?=$user['nama'];?>">
                        <input type="hidden" id="Sender_ProfilePic" value="<?=$profile_url;?>">
                      
                      <input type="hidden" id="ReciverId_txt">
                        <input type="text" name="message" placeholder="Type Message ..." class="form-control message">
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-success btn-flat btnSend" id="nav_down">Send</button>
                              <div class="fileDiv btn btn-info btn-flat"> <i class="fa fa-upload"></i> 
                                <input type="file" name="file" class="upload_attachmentfile"/>
                              </div>
                          </span>
                    </div>
                  <!--</form>-->
                </div>
                <!-- /.box-footer-->
              </div>
              <!--/.direct-chat -->
            </div>


            <div class="col-md-4">
              <!-- USERS LIST -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title"><?=$strTitle;?></h3>

                  <div class="box-tools pull-right">
                    <span class="label label-danger"><?=count($userlist);?> <?=$strsubTitle;?></span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                  <ul class="users-list clearfix">
                  
                    <?php if(!empty($userlist)){
                      foreach($userlist as $v):
                      ?>
                        <li class="selectUser" id="<?=$v['id'];?>" title="<?=$v['nama'];?>">
                          <img src="<?=$v['photo'];?>" alt="<?=$v['nama'];?>" title="<?=$v['nama'];?>">
                          <a class="users-list-name" href="#"><?=$v['nama'];?></a>
                          <!--<span class="users-list-date">Yesterday</span>-->
                        </li>
                    <?php endforeach;?>
                    
                   <?php }else{?>
                    <li>
                       <a class="users-list-name" href="#">Tidak ada User</a>
                     </li>
                    <?php } ?>
                    
                    
                  </ul>
                </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
              <a href="<?php echo site_url('user') ?>" class="uppercase">Lihat Semua User</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!--/.box -->
        </div>
            <div class="modal fade" id="myModalImg">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title" id="modelTitle">Modal Heading</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                      <img id="modalImgs" src="upload/file/" class="img-thumbnail" alt="Cinque Terre">
                    </div>
                  
                  </div>
                </div>
            </div>
      </div>
      



      <div class="row">
        <div class="col-md-8">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Riwayat Aktivitas</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Tanggal</th>
                    <th>User</th>
                    <th>Aksi</th>
                    <th>Keterangan</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach ($riwayat as $riwayat) { ?>
                    <tr>
                      <td><?php echo substr($riwayat->log_time,0,10) ?></td>
                      <td><?php echo $riwayat->log_user ?> </td>
                      <td><?php if ($riwayat->log_tipe == 'Update'): ?>
                              <span class="label label-success"><?php echo $riwayat->log_tipe ?> </span>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Insert'): ?>
                              <span class="label label-warning"><?php echo $riwayat->log_tipe ?> </span>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Delete'): ?>
                              <span class="label label-danger"><?php echo $riwayat->log_tipe ?> </span>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Login'): ?>
                              <span class="label label-info"><?php echo $riwayat->log_tipe ?> </span>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Logout'): ?>
                              <span class="label label-primary"><?php echo $riwayat->log_tipe ?> </span>
                          <?php endif ?>
                      </td>
                      <td>

                          <?php if ($riwayat->log_tipe == 'Update'): ?>
                           <strong><?php echo $riwayat->log_tipe?></strong> data <?php echo $riwayat->log_desc;?>pada tabel <strong><?php echo $riwayat->log_tabel ; ?></strong><br>
                            <strong>[ID <?php echo $riwayat->log_tabel ; ?> : <?php echo $riwayat->data;?>}</strong>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Insert'): ?>
                              <strong><?php echo $riwayat->log_tipe?></strong> data <?php echo $riwayat->log_desc ?> pada tabel <strong><?php echo $riwayat->log_tabel?></strong><br>
                              <strong>[<?php echo $riwayat->var ?>],[<?php echo $riwayat->pred ?> ]</strong>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Delete'): ?>
                              <strong><?php echo $riwayat->log_tipe ?></strong> data <?php echo $riwayat->log_desc ?> pada tabel <strong><?php echo $riwayat->log_tabel ?></strong><br>
                              <strong>[ID <?php echo $riwayat->log_tabel ?> : <?php echo $riwayat->data ?>] [<?php echo $riwayat->log_desc ?> : <?php echo $riwayat->var ?>]</strong>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Login'): ?>
                              <strong><?php echo $riwayat->log_tipe ?></strong> Record pada tabel <strong><?php echo $riwayat->log_tabel ?></strong><br>
                              <strong>[Nama <?php echo $riwayat->log_tabel ?>  : <?php echo $riwayat->var ?>] [Akses Level : <?php echo $riwayat->data ?>]  [Username : <?php echo $riwayat->pred ?>]</strong>
                          <?php endif ?>

                          <?php if ($riwayat->log_tipe == 'Logout'): ?>
                              <strong><?php echo $riwayat->log_tipe ?></strong> Record pada tabel <strong><?php echo $riwayat->log_tabel ?></strong><br>
                              <strong>[Nama <?php echo $riwayat->log_tabel ?>  : <?php echo $riwayat->var ?>] [Akses Level : <?php echo $riwayat->data ?>]  [Username : <?php echo $riwayat->pred?>]</strong>
                          <?php endif ?>
                      </td>
                    </tr>
                  <?php } ?>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            
            <!-- /.box-footer -->
          </div>
        </div>
        <div class="col-md-4">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Anggota Terbaru</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
                <?php foreach ($anggota_limit as $anggota) { ?>
                  <?php if ($anggota->photo == "") { ?>
                      <li class="item">
                        <div class="product-img">
                          <img src="<?php echo base_url('upload/other/images.png') ?>" alt="Product Image">
                        </div>
                        <div class="product-info">
                          <a class="product-title"><?php echo $anggota->nama ?>
                            <!-- <span class="label label-warning pull-right">$1800</span></a> -->
                              <span class="users-list-date">
                               <?php echo $anggota->alamat?>
                              </span>
                        </div>
                      </li>
                  <?php }else{ ?>
                      <li class="item">
                        <div class="product-img">
                          <img src="<?php echo base_url('upload/anggota/'.$anggota->photo) ?>" alt="Product Image">
                        </div>
                        <div class="product-info">
                          <a class="product-title"><?php echo $anggota->nama ?>
                            <!-- <span class="label label-warning pull-right">$1800</span></a> -->
                              <span class="users-list-date">
                               <?php echo $anggota->alamat?>
                              </span>
                        </div>
                      </li>
                  <?php } ?>
                <?php } ?> 
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
              <a href="<?php echo site_url('anggota') ?>" class="uppercase">Lihat Semua Anggota</a>
            </div>
            <!-- /.box-footer -->
          </div>
        </div>
      </div>
      <div class="row">
         <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Saran dan Masukan</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Nama Depan</th>
                    <th>Nama Belakang</th>
                    <th>Email</th>
                    <th width="300px">Pesan</th>
                    <th>Tanggal</th>
                    <th>Aksi</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach ($hub as $hub) { ?>
                    <tr>
                      <td><?php echo $hub->nama_awal ?></td>
                      <td><?php echo $hub->nama_akhir ?></td>
                      <td><?php echo $hub->email ?></td>
                      <td><?php echo $hub->pesan ?></td>
                      <td><?php echo $hub->created ?></td>
                      <td> <a href="<?php echo site_url('beranda/delete_hub/'.$hub->id) ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Hapus</a></td>
                    </tr>
                  <?php } ?>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            
            <!-- /.box-footer -->
          </div>
        </div>
      </div>
     