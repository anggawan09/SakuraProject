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
                    <table style="margin-bottom: 10px">
                        <tr>
                            <td>
                                <button class="btn btn-success" onclick="add_surat_keluar()"><i class="glyphicon glyphicon-plus"></i> Add Surat keluar</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </td>
                        </tr>
                    </table>
                    <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Nomor Surat</th>
                            <th>Perihal</th>
                            <th>Instansi dituju</th>
                            <th>Anggota yang diutus</th>
                            <th>Tanggal Mulai</th>
                            <th>Tanggal Selesai</th>
                            <th>Created</th>
                            <th>Photo</th>
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
                            "url": "<?php echo site_url('surat_keluar/ajax_list')?>",
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

                
                function add_surat_keluar()
                {
                    save_method = 'add';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string
                    $('#modal_form').modal('show'); // show bootstrap modal
                    $('.modal-title').text('Add surat_keluar'); // Set Title to Bootstrap modal title

                    $('#photo-preview').hide(); // hide photo preview modal

                    $('#label-photo').text('Upload Photo'); // label photo upload
                }
                

                function edit_surat_keluar(id)
                {
                    save_method = 'update';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('surat_keluar/ajax_edit')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="kode"]').val(data.kode);
                            $('[name="nomor"]').val(data.nomor);
                            $('[name="perihal"]').val(data.perihal);
                            $('[name="instansi"]').val(data.instansi);
                            $('[name="penugasan"]').val(data.penugasan);
                            $('[name="tanggal_mulai"]').datepicker('update',data.tanggal_mulai);
                            $('[name="tanggal_akhir"]').datepicker('update',data.tanggal_akhir);
                             $('[name="created"]').val(data.created);

                            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Edit surat_keluar'); // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/suratkeluar/'+data.photo+'" class="img-responsive">'); // show photo
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
                        url = "<?php echo site_url('surat_keluar/ajax_add')?>";
                    } else {
                        url = "<?php echo site_url('surat_keluar/ajax_update')?>";
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

                function delete_surat_keluar(id)
                {
                    if(confirm('Are you sure delete this data?'))
                    {
                        // ajax delete data to database
                        $.ajax({
                            url : "<?php echo site_url('surat_keluar/ajax_delete')?>/"+id,
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
                            <center><h3 class="modal-title">Form surat_keluar</h3></center>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form" class="form-horizontal">
                                <input type="hidden" value="" name="id"/>
                                <div class="form-body" style="width: 100%">

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nomor Surat</label>
                                        <div class="col-md-9">
                                            <input name="nomor" placeholder="Nomor Surat" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label class="control-label col-md-3">Perihal</label>
                                        <div class="col-md-9">
                                            <input name="perihal" placeholder="Perihal Surat" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>    

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Instansi Penerima</label>
                                        <div class="col-md-9">
                                            <input name="instansi" placeholder="Instansi Penerima" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Anggota yang Diutus</label>
                                        <div class="col-md-9">
                                            <textarea name="penugasan" id="" cols="30" rows="10"></textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>                                
                        
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Tanggal Mulai Penugasan</label>
                                        <div class="col-md-9">
                                            <input name="tanggal_mulai" placeholder="yyyy-mm-dd" class="form-control datepicker" type="text">
                                                <span class="help-block"></span>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="control-label col-md-3">Tanggal Berakhir Penugasan</label>
                                        <div class="col-md-9">
                                            <input name="tanggal_akhir" placeholder="yyyy-mm-dd" class="form-control datepicker" type="text">
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
    </div>