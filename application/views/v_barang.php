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
                                <button class="btn btn-success" onclick="add_barang()"><i class="glyphicon glyphicon-plus"></i> Add barang</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </td>
                        </tr>
                    </table>
                    <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Kode barang</th>
                            <th>Nama Barang</th>
                            <th>Kategori</th>
                            <th>Kondisi</th>
                            <th>Jumlah</th>
                            <th>Created</th>
                            <th>Photo</th>
                            <th style="width:70px;">Action</th>
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
                            "url": "<?php echo site_url('barang/ajax_list')?>",
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


                function add_barang()
                {
                    save_method = 'add';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string
                    $('#modal_form').modal('show'); // show bootstrap modal
                    $('.modal-title').text('Add barang'); // Set Title to Bootstrap modal title

                    $('#photo-preview').hide(); // hide photo preview modal

                    $('#label-photo').text('Upload Photo'); // label photo upload
                }
                

                function edit_barang(id)
                {
                    save_method = 'update';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('barang/ajax_edit')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="kode_barang"]').val(data.kode_barang);
                            $('[name="nama"]').val(data.nama);
                            $('[name="kategori"]').val(data.kategori);
                            $('[name="kondisi"]').val(data.kondisi);
                            $('[name="jumlah"]').val(data.jumlah);
                             $('[name="created"]').val(data.created);

                            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Edit barang'); // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/barang/'+data.photo+'" class="img-responsive">'); // show photo
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
                        url = "<?php echo site_url('barang/ajax_add')?>";
                    } else {
                        url = "<?php echo site_url('barang/ajax_update')?>";
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

                function delete_barang(id)
                {
                    if(confirm('Are you sure delete this data?'))
                    {
                        // ajax delete data to database
                        $.ajax({
                            url : "<?php echo site_url('barang/ajax_delete')?>/"+id,
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
                            <center><h3 class="modal-title">Form barang</h3></center>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form" class="form-horizontal">
                                <input type="hidden" value="" name="id"/>
                                <div class="form-body" style="width: 100%">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Kode Barang</label>
                                        <div class="col-md-9">
                                            <input name="kode_barang" placeholder="Kode Barang" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>  
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nama Barang</label>
                                        <div class="col-md-9">
                                            <input name="nama" placeholder="Nama Barang" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>  
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Kategori barang</label>
                                            <div class="col-md-9">
                                                <select name="kategori" class="form-control">
                                                    <option value="">--Select Kategori barang--</option>
                                                    <?php foreach ($kategori as $kategori) { ?>
                                                        <option value="<?php echo $kategori->kategori; ?>"><?php echo $kategori->kategori; ?></option>
                                                    <?php } ?> 
                                                </select>
                                                <span class="help-block"></span>
                                            </div>                                        
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Kondisi Barang</label>
                                            <div class="col-md-9">
                                                <select name="kondisi" class="form-control">
                                                    <option value="">--Select Kategori barang--</option>
                                                    <option value="layak">Layak</option>
                                                    <option value="kurang layak">Kurang Layak</option>
                                                    <option value="tidak layak">Tidak Layak</option>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>                                        
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Jumlah Barang yang serupa</label>
                                        <div class="col-md-9">
                                            <input name="jumlah" placeholder="Jumlah Barang yang serupa" class="form-control" type="number">
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