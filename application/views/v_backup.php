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
                                        <a class="btn btn-primary" href="<?php echo site_url('backup/backup') ?> "><i class="glyphicon glyphicon-save-file"></i> Backup Database</a>
                                        <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i> Reload</button>
                                    </td>
                                </tr>
                            </table>
                            <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Nama File</th>
                                    <th>Tanggal Backup</th>
                                    <th>Ukuran File</th>
                                    <th style="width:100px;">Action</th>
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
                                        "url": "<?php echo site_url('backup/ajax_list')?>",
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

                            

                            function reload_table()
                            {
                                table.ajax.reload(null,false); //reload datatable ajax 
                            }


                            function delete_backup(id)
                            {
                                if(confirm('Are you sure delete this data?'))
                                {
                                    // ajax delete data to database
                                    $.ajax({
                                        url : "<?php echo site_url('backup/ajax_delete')?>/"+id,
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
                