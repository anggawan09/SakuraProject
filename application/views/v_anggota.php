            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                    <i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table style="margin-bottom: 10px" class="table" >
                        <tr>
                            <td>
                                <button class="btn btn-success" onclick="add_anggota()"><i class="glyphicon glyphicon-plus"></i> Add anggota</button>
                                <a href="<?php echo base_url("Anggota/export");?>"><button class="btn btn-primary"><i class="glyphicon glyphicon-floppy-open"></i> Export Excel</button></a>
                                <button class="btn btn-warning" onclick="import_data()"><i class="glyphicon glyphicon-floppy-save"></i> Import Data</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </td>
                        </tr>
                    </table>
                    <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Gender</th>
                            <th>Angkatan</th>
                            <th>Alamat</th>
                            <th>Telepon</th>
                            <th style="width: 50px">Golongan Darah</th>
                            <th style="width:130px;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    </table>
                </div>      
            </div>
                <script src="<?php echo base_url('assets/jquery/jquery-2.1.4.min.js')?>"></script>
                <script src="<?php echo base_url('assets/datatables/js/jquery.dataTables.min.js')?>"></script>
                <script src="<?php echo base_url('assets/datatables/js/dataTables.bootstrap.js')?>"></script>
                <script src="<?php echo base_url('assets/bootstrap-datepicker/js/bootstrap-datepicker.min.js')?>"></script>

            <script type="text/javascript">

                var save_method; //for save method string
                var table;
                var base_url = '<?php echo base_url();?>';

                $(document).ready(function() {

                    //datatables
                    table = $('#table').DataTable({ 

                        "processing": true, //Feature control the processing indicator.
                        "serverSide": true, //Feature control DataTables' server-side processing mode.
                        "order": [], //Initial no order.

                        // Load data for the table's content from an Ajax source
                        "ajax": {
                            "url": "<?php echo site_url('anggota/ajax_list')?>",
                            "type": "POST"
                        },

                        //Set column definition initialisation properties.
                        "columnDefs": [
                            { 
                                "targets": [ -1 ], //last column
                                "orderable": false, //set not orderable
                            },
                            { 
                                "targets": [ -2 ], //2 last column (photo)
                                "orderable": false, //set not orderable
                            },
                        ],

                    });

                    //datepicker
                    $('.datepicker').datepicker({
                        autoclose: true,
                        format: "yyyy-mm-dd",
                        todayHighlight: true,
                        orientation: "top auto",
                        todayBtn: true,
                        todayHighlight: true,  
                    });

                    //set input/textarea/select event when change value, remove class error and remove text help block 
                    $("input").change(function(){
                        $(this).parent().parent().removeClass('has-error');
                        $(this).next().empty();
                    });
                    $("textarea").change(function(){
                        $(this).parent().parent().removeClass('has-error');
                        $(this).next().empty();
                    });
                    $("select").change(function(){
                        $(this).parent().parent().removeClass('has-error');
                        $(this).next().empty();
                    });

                });

                

                function import_data()
                {
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error error_string
                    $('#modal_import').modal('show'); // show bootstrap modal
                    $('.modal-title').text('Import Database'); // Set Title to Bootstrap modal title
                }

                function add_anggota()
                {
                    save_method = 'add';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string
                    $('#modal_form').modal('show'); // show bootstrap modal
                    $('.modal-title').text('Add anggota'); // Set Title to Bootstrap modal title

                    $('#photo-preview').hide(); // hide photo preview modal

                    $('#label-photo').text('Upload Photo'); // label photo upload
                }
                
                function detail_anggota(id)
                {   
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('anggota/detail_anggota')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="nama"]').val(data.nama);
                            $('[name="gender"]').val(data.gender);
                            $('[name="angkatan"]').val(data.angkatan);
                            $('[name="kotalahir"]').val(data.kotalahir);
                            $('[name="tanggallahir"]').datepicker('update',data.tanggallahir);
                            $('[name="alamat"]').val(data.alamat);
                            $('[name="pekerjaan"]').val(data.pekerjaan);
                            $('[name="telepon"]').val(data.telepon);
                            $('[name="status"]').val(data.status);
                            $('[name="jabatan"]').val(data.jabatan);
                            $('[name="darah"]').val(data.darah);
                            $('[name="email"]').val(data.email);
                            $('[name="facebook"]').val(data.facebook);
                            $('[name="twitter"]').val(data.twitter);
                            $('[name="instagram"]').val(data.instagram);
                            $('[name="created"]').val(data.created);

                            $('#modal_detail').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Detail Data Anggota') // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/anggota/'+data.photo+'" class="img-responsive">'); // show phot
                            }
                            else
                            {
                                $('#label-photo').text('Upload Photo'); // label photo upload
                                $('#photo-preview div').text('(No photo)');
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            alert('Error get data from ajax');
                        }
                    });
 
                }

                function edit_anggota(id)
                {
                    save_method = 'update';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('anggota/ajax_edit')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="nama"]').val(data.nama);
                            $('[name="gender"]').val(data.gender);
                            $('[name="angkatan"]').val(data.angkatan);
                            $('[name="kotalahir"]').val(data.kotalahir);
                            $('[name="tanggallahir"]').datepicker('update',data.tanggallahir);
                            $('[name="alamat"]').val(data.alamat);
                            $('[name="pekerjaan"]').val(data.pekerjaan);
                            $('[name="telepon"]').val(data.telepon);
                            $('[name="status"]').val(data.status);
                            $('[name="jabatan"]').val(data.jabatan);
                            $('[name="darah"]').val(data.darah);
                            $('[name="email"]').val(data.email);
                            $('[name="facebook"]').val(data.facebook);
                            $('[name="twitter"]').val(data.twitter);
                            $('[name="instagram"]').val(data.instagram);

                            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Edit anggota'); // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/anggota/'+data.photo+'" class="img-responsive">'); // show photo
                                $('#photo-preview div').append('<input type="checkbox" name="remove_photo" value="'+data.photo+'"/> Remove photo when saving'); // remove photo

                            }
                            else
                            {
                                $('#label-photo').text('Upload Photo'); // label photo upload
                                $('#photo-preview div').text('(No photo)');
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            alert('Error get data from ajax');
                        }
                    });
                }

                function reload_table()
                {
                    table.ajax.reload(null,false); //reload datatable ajax 
                }

                function save()
                {
                    $('#btnSave').text('saving...'); //change button text
                    $('#btnSave').attr('disabled',true); //set button disable 
                    var url;

                    if(save_method == 'add') {
                        url = "<?php echo site_url('anggota/ajax_add')?>";
                    } else {
                        url = "<?php echo site_url('anggota/ajax_update')?>";
                    }

                    // ajax adding data to database

                    var formData = new FormData($('#form')[0]);
                    $.ajax({
                        url : url,
                        type: "POST",
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: "JSON",
                        success: function(data)
                        {

                            if(data.status) //if success close modal and reload ajax table
                            {
                                $('#modal_form').modal('hide');
                                reload_table();
                            }
                            else
                            {
                                for (var i = 0; i < data.inputerror.length; i++) 
                                {
                                    $('[name="'+data.inputerror[i]+'"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                                    $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
                                }
                            }
                            $('#btnSave').text('save'); //change button text
                            $('#btnSave').attr('disabled',false); //set button enable 


                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            alert('Error adding / update data');
                            $('#btnSave').text('save'); //change button text
                            $('#btnSave').attr('disabled',false); //set button enable 

                        }
                    });
                }

                function delete_anggota(id)
                {
                    if(confirm('Are you sure delete this data?'))
                    {
                        // ajax delete data to database
                        $.ajax({
                            url : "<?php echo site_url('anggota/ajax_delete')?>/"+id,
                            type: "POST",
                            dataType: "JSON",
                            success: function(data)
                            {
                                //if success reload ajax table
                                $('#modal_form').modal('hide');
                                reload_table();
                            },
                            error: function (jqXHR, textStatus, errorThrown)
                            {
                                alert('Error deleting data');
                            }
                        });

                    }
                }

            </script>

            <!-- /.modal add dan edit -->
            <div class="modal fade bd-example-modal-md" id="modal_form" role="dialog" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" >
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <center><h3 class="modal-title">Form Anggota</h3></center>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form" class="form-horizontal">
                                <input type="hidden" value="" name="id"/>
                                <div class="form-body" style="width: 100%">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nama</label>
                                        <div class="col-md-9">
                                            <input name="nama" placeholder="Nama" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>                               
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Angkatan</label>
                                            <div class="col-md-9">
                                                <select name="angkatan" class="form-control">
                                                    <option value="">--Select Angkatan--</option>
                                                    <option value="peralihan">Peralihan</option>
                                                    <option value="kehormatan">Kehormatan</option>
                                                    <option value="rekayasa">Rekayasa</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>                                        
                                    </div> 
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Jenis Kelamin</label>
                                        <div class="col-md-9">
                                            <select name="gender" class="form-control">
                                                    <option value="">--Select Gender--</option>
                                                    <option value="laki-laki">Laki laki</option>
                                                    <option value="perempuan">Perempuan</option>
                                            </select>
                                                <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Status Kepengurusan</label>
                                        <div class="col-md-9">
                                            <select name="status" class="form-control">
                                                    <option value="">--Select Gender--</option>
                                                    <option value="pengurus inti">Pengurus Inti</option>
                                                    <option value="pengurus biasa">Pengurus Biasa</option>
                                                    <option value="demisioner">Demisioner</option>
                                            </select>
                                                <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Jabatan Struktural</label>
                                        <div class="col-md-9">
                                            <select name="jabatan" class="form-control">
                                                    <option value="">--Select Jabatan--</option>
                                                    <option value="Komandan">Komandan</option>
                                                    <option value="Wakil Komandan">Wakil Komandan</option>
                                                    <option value="Sekretaris Umum">Sekertaris Umum</option>
                                                    <option value="Bendahara Umum">Bendahara Umum</option>
                                                    <option value="Kewirausahaan">Kepala Bidang Kewirausahaan</option>
                                                    <option value="Litbang">Kepala Bidang Litbang</option>
                                                    <option value="Pb">Kepala Bidang Penanggulangan Bencana</option>
                                                    <option value="Kesekretarian">Kepala Bidang Kesekretarian</option>
                                                    <option value="Anggota Penuh">Anggota Penuh</option>
                                                    <option value="Anggota Muda">Anggota Muda</option>
                                                    
                                            </select>
                                                <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Kota Kelahiran</label>
                                        <div class="col-md-9">
                                            <input name="kotalahir" placeholder="Kota Kelahiran" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Tanggal Lahir</label>
                                        <div class="col-md-9">
                                                <input name="tanggallahir" placeholder="yyyy-mm-dd" class="form-control datepicker" type="text">
                                                <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Alamat</label>
                                        <div class="col-md-9">
                                            <textarea name="alamat" placeholder="Alamat" class="form-control"></textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Pekerjaan</label>
                                        <div class="col-md-9">
                                            <input name="pekerjaan" placeholder="Pekerjaan" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Telepon</label>
                                        <div class="col-md-9">
                                            <input name="telepon" placeholder="Telepon" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Golongan Darah</label>
                                        <div class="col-md-9">
                                            <select name="darah" class="form-control">
                                                <option value="">--Select Golongan Darah--</option>
                                                <option value="a">A</option>
                                                <option value="b">B</option>
                                                <option value="o">O</option>
                                                <option value="ab">AB</option>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Email</label>
                                        <div class="col-md-9">
                                            <input name="email" placeholder="Email" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">facebook</label>
                                        <div class="col-md-9">
                                            <input name="facebook" placeholder="facebook" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">twitter</label>
                                        <div class="col-md-9">
                                            <input name="twitter" placeholder="twitter" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">instagram</label>
                                        <div class="col-md-9">
                                            <input name="instagram" placeholder="instagram" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group" id="photo-preview">
                                        <label class="control-label col-md-3">Foto</label>
                                        <div class="col-md-9">
                                            (Tidak ada Foto)
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3" id="label-photo">Upload Foto</label>
                                        <div class="col-md-9">
                                            <input name="photo" type="file">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </form>                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            

            <!-- /.modal impor -->
            <div class="modal fade bd-example-modal-md" id="modal_import" role="dialog" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" >
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <center><h3 class="modal-title">Import (.xlx)</h3></center>
                        </div>
                        <div class="modal-body form">
                                <input type="hidden" value="" name="id"/>
                                <div class="form-body">
                                    <div class="form-group">
                                        <form method="post" action="<?=site_url()?>anggota/import" class="form-horizontal" enctype="multipart/form-data" >  
                                            <input type="file" name="file" class="form-control" id="file" required accept=".xls, .xlsx" /></p>    
                                            <input type="submit" class="btn btn-block btn-warning" value="Import" name="import">
                                            <a href="<?php echo base_url("upload/excel/formatfix.xlsx"); ?>">Download Format Impor</a>        
                                        </form>
                                    </div>                               
                                </div>                        
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!-- /.modal detail -->
            <div class="modal fade bd-example-modal-lg" id="modal_detail" role="dialog" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <center><h3 class="modal-title"></h3></center>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form" class="form-horizontal">
                                <input type="hidden" value="" name="id"/>
                                <table>
                                    <tr>
                                        <td rowspan="11" width="30%">
                                            <center>
                                                <div class="form-group" id="photo-preview">
                                                    <div class="col-md-10">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                            </center>
                                        </td>
                                        <td width="70%">
                                            <div class="form-body">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Nama</label>
                                                    <div class="col-md-9">
                                                        <input name="nama" placeholder="Nama" class="form-control" type="text" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>                               
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Angkatan</label>
                                                        <div class="col-md-9">
                                                            <select name="angkatan" class="form-control" disabled>
                                                                <option value="">--Select Angkatan--</option>
                                                                <option value="peralihan">Peralihan</option>
                                                                <option value="kehormatan">Kehormatan</option>
                                                                <option value="rekayasa">Rekayasa</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                            </select>
                                                            <span class="help-block"></span>
                                                    </div>                                        
                                                </div> 
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Jenis Kelamin</label>
                                                    <div class="col-md-9">
                                                        <select name="gender" class="form-control" disabled>
                                                            <option value="">--Select Gender--</option>
                                                            <option value="laki-laki">Laki laki</option>
                                                            <option value="perempuan">Perempuan</option>
                                                        </select>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Status Kepengurusan</label>
                                                    <div class="col-md-9">
                                                        <select name="status" class="form-control" disabled>
                                                                <option value="">--Select Status--</option>
                                                                <option value="pengurus inti">Pengurus Inti</option>
                                                                <option value="pengurus biasa">Pengurus Biasa</option>
                                                                <option value="demisioner">Demisioner</option>
                                                        </select>
                                                            <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Kota Kelahiran</label>
                                                    <div class="col-md-9">
                                                        <input name="kotalahir" placeholder="Kota Kelahiran" class="form-control" type="text" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Tanggal Lahir</label>
                                                        <div class="col-md-9">
                                                            <input name="tanggallahir" placeholder="yyyy-mm-dd" class="form-control" type="text" disabled>
                                                            <span class="help-block"></span>
                                                        </div>
                                                </div>
                                               <div class="form-group">
                                                    <label class="control-label col-md-3">Jabatan Struktural</label>
                                                    <div class="col-md-9">
                                                        <select name="jabatan" class="form-control">
                                                                <option value="">--Select Jabatan--</option>
                                                                <option value="Komandan">Komandan</option>
                                                                <option value="Wakil Komandan">Wakil Komandan</option>
                                                                <option value="Sekretaris Umum">Sekertaris Umum</option>
                                                                <option value="Bendahara Umum">Bendahara Umum</option>
                                                                <option value="Kewirausahaan">Kepala Bidang Kewirausahaan</option>
                                                                <option value="Litbang">Kepala Bidang Litbang</option>
                                                                <option value="Pb">Kepala Bidang Penanggulangan Bencana</option>
                                                                <option value="Kesekretarian">Kepala Bidang Kesekretarian</option>
                                                                <option value="Anggota Penuh">Anggota Penuh</option>
                                                                <option value="Anggota Muda">Anggota Muda</option>
                                                                
                                                        </select>
                                                            <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Alamat</label>
                                                    <div class="col-md-9">
                                                        <textarea name="alamat" placeholder="Alamat" class="form-control" readonly="readonly"></textarea>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Pekerjaan</label>
                                                    <div class="col-md-9">
                                                        <input name="pekerjaan" placeholder="Pekerjaan" class="form-control" type="text" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Telepon</label>
                                                    <div class="col-md-9">
                                                        <input name="telepon" placeholder="Telepon" class="form-control" type="text" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Golongan Darah</label>
                                                    <div class="col-md-9">
                                                        <select name="darah" class="form-control" disabled>
                                                            <option value="">--Select Golongan Darah--</option>
                                                            <option value="a">A</option>
                                                            <option value="b">B</option>
                                                            <option value="o">O</option>
                                                            <option value="ab">AB</option>
                                                        </select>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Email</label>
                                                    <div class="col-md-9">
                                                        <input name="email" placeholder="Email" class="form-control" type="email" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">facebook</label>
                                                    <div class="col-md-9">
                                                        <input name="facebook" placeholder="facebook" class="form-control" type="email" readonly>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">twitter</label>
                                                    <div class="col-md-9">
                                                        <input name="twitter" placeholder="twitter" class="form-control" type="email" readonly>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">instagram</label>
                                                    <div class="col-md-9">
                                                        <input name="instagram" placeholder="instagram" class="form-control" type="email" readonly>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Created</label>
                                                    <div class="col-md-9">
                                                        <input name="created" class="form-control" type="email" readonly="readonly">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
    </div>