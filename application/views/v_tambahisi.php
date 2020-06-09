            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                    <i class="fa fa-minus"></i></button>
                </div>
            </div>
        <?php echo form_open_multipart(site_url($site.$editor->id)); ?>
            <div class="box-body">
                <div class="row">
                    <div class="col-lg-13">
                        <center><label for="exampleInputEmail1">Isi </label></center>
                        <div class="box-body pad">
                            <form>
                                  <textarea  id="editor1" name="isi" rows="10" cols="80" class="form-control" placeholder="Isi">
                                    <?php echo $editor->isi; ?>
                                  </textarea>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" class="btn btn-success btn-xs" value="Simpan Data">
                            <a href="<?php echo base_url($breadcrumb1) ?>" class="btn btn-warning btn-xs"><i class="fa fa-arrow-left"></i> Kembali</a>
                </div>
            </div>
        <?php echo form_close(); ?>
