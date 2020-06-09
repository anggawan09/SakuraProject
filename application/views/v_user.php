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
                    <table  style="margin-bottom: 10px">
                        <tr>
                            <td>
                                <button class="btn btn-success" onclick="add_user()"><i class="glyphicon glyphicon-plus"></i> Add user</button>
                                <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                            </td>
                        </tr>
                    </table>
                    <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Akses Level</th>
                            <th>Nama</th>
                            <th>Pekerjaan</th>
                            <th>Email</th>
                            <th style="width:120px;">Action</th>
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
                            "url": "<?php echo site_url('user/ajax_list')?>",
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

                

                function add_user()
                {
                    save_method = 'add';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string
                    $('#modal_form').modal('show'); // show bootstrap modal
                    $('.modal-title').text('Add user'); // Set Title to Bootstrap modal title

                    $('#photo-preview').hide(); // hide photo preview modal

                    $('#label-photo').text('Upload Photo'); // label photo upload
                }
                
                function detail_user(id)
                {   
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('user/detail_user')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="akses_level"]').val(data.akses_level);
                            $('[name="username"]').val(data.username);
                            $('[name="password"]').val(data.password);
                            $('[name="nama"]').val(data.nama);
                            $('[name="pekerjaan"]').val(data.pekerjaan);
                            $('[name="email"]').val(data.email);
                            $('[name="facebook"]').val(data.facebook);
                            $('[name="instagram"]').val(data.instagram);
                            $('[name="motto"]').val(data.motto);
                            $('[name="created"]').val(data.created);

                            $('#modal_detail').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Detail Data user') // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/user/'+data.photo+'" class="img-responsive">'); // show phot
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

                function edit_user(id)
                {
                    save_method = 'update';
                    $('#form')[0].reset(); // reset form on modals
                    $('.form-group').removeClass('has-error'); // clear error class
                    $('.help-block').empty(); // clear error string


                    //Ajax Load data from ajax
                    $.ajax({
                        url : "<?php echo site_url('user/ajax_edit')?>/" + id,
                        type: "GET",
                        dataType: "JSON",
                        success: function(data)
                        {

                            $('[name="id"]').val(data.id);
                            $('[name="akses_level"]').val(data.akses_level);
                            $('[name="username"]').val(data.username);
                            $('[name="password"]').val(data.password);
                            $('[name="nama"]').val(data.nama);
                            $('[name="pekerjaan"]').val(data.pekerjaan);
                            $('[name="email"]').val(data.email);
                            $('[name="facebook"]').val(data.facebook);
                            $('[name="instagram"]').val(data.instagram);
                            $('[name="motto"]').val(data.motto);

                            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
                            $('.modal-title').text('Edit user'); // Set title to Bootstrap modal title

                            $('#photo-preview').show(); // show photo preview modal

                            if(data.photo)
                            {
                                $('#label-photo').text('Change Photo'); // label photo upload
                                $('#photo-preview div').html('<img src="'+base_url+'upload/user/'+data.photo+'" class="img-responsive">'); // show photo
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
                        url = "<?php echo site_url('user/ajax_add')?>";
                    } else {
                        url = "<?php echo site_url('user/ajax_update')?>";
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

                function delete_user(id)
                {
                    if(confirm('Are you sure delete this data?'))
                    {
                        // ajax delete data to database
                        $.ajax({
                            url : "<?php echo site_url('user/ajax_delete')?>/"+id,
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
                            <center><h3 class="modal-title">Form user</h3></center>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form" class="form-horizontal">
                                <input type="hidden" value="" name="id"/>
                                <div class="form-body" style="width: 100%">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Username</label>
                                        <div class="col-md-9">
                                            <input name="username" placeholder="Username" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Password</label>
                                        <div class="col-md-9">
                                            <input name="password" placeholder="Password" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Akses Level</label>
                                            <div class="col-md-9">
                                                <select name="akses_level" class="form-control">
                                                    <option value="">--Select Akses Level--</option>
                                                    <option value="user">User</option>
                                                    <option value="admin">Admin</option>                                   
                                                </select>
                                                <span class="help-block"></span>
                                            </div>                                        
                                    </div>                               
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nama</label>
                                        <div class="col-md-9">
                                            <textarea name="nama" placeholder="Nama" class="form-control"></textarea>
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
                                        <label class="control-label col-md-3">Email</label>
                                        <div class="col-md-9">
                                            <input name="email" placeholder="Email" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Facebook</label>
                                        <div class="col-md-9">
                                            <input name="facebook" placeholder="Facebook" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Instagram</label>
                                        <div class="col-md-9">
                                            <input name="instagram" placeholder="Instagram" class="form-control" type="email">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Motto</label>
                                        <div class="col-md-9">
                                            <textarea name="motto" cols="50" rows="10"></textarea>
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
                                        <td rowspan="10" width="30%">
                                            <center>
                                                <div class="form-group" id="photo-preview">
                                                    <div class="col-md-10">
                                                        <span class="help-block"></span>
                                                    </div>
                                                </div>
                                            </center>
                                        </td>
                                        <td width="70%">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Akses Level</label>
                                                <div class="col-md-9">
                                                    <select name="akses_level" class="form-control" disabled>
                                                        <option value="">--Select Akses Level--</option>
                                                        <option value="admin">Admin</option>
                                                        <option value="user">User</option>
                                                    </select>
                                                </div>
                                            </div>                               
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Username</label>
                                                <div class="col-md-9">
                                                    <input name="username" placeholder="Username" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Password</label>
                                                <div class="col-md-9">
                                                    <input name="password" placeholder="Password" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Nama</label>
                                                <div class="col-md-9">
                                                    <input name="nama" placeholder="Nama" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Pekerjaan</label>
                                                <div class="col-md-9">
                                                    <input name="pekerjaan" placeholder="Pekerjaan" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Email</label>
                                                <div class="col-md-9">
                                                    <input name="email" placeholder="Email" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Facebook</label>
                                                <div class="col-md-9">
                                                    <input name="facebook" placeholder="Facebook" class="form-control" type="email" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Instagram</label>
                                                <div class="col-md-9">
                                                    <input name="instagram" placeholder="Instagram" class="form-control" type="text" readonly>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Motto</label>
                                                <div class="col-md-9">
                                                    <input name="motto" placeholder="motto" class="form-control" type="text" readonly>
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
            </div>
    </div>