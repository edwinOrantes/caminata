<?php if($this->session->flashdata("exito")):?>
  <script type="text/javascript">
    $(document).ready(function(){
      toastr.remove();
      toastr.options.positionClass = "toast-top-center";
      toastr.success('<?php echo $this->session->flashdata("exito")?>', 'Aviso!');
    });
  </script>
<?php endif; ?>

<?php if($this->session->flashdata("error")):?>
  <script type="text/javascript">
    $(document).ready(function(){
      toastr.remove();
      toastr.options.positionClass = "toast-top-center";
      toastr.error('<?php echo $this->session->flashdata("error")?>', 'Aviso!');
    });
  </script>
<?php endif; ?>
<!--app-content open-->
<div class="main-content app-content mt-0">
    <div class="side-app">

        <!-- CONTAINER -->
        <div class="main-container container-fluid">

            <!-- page-header -->
                <div class="page-header">
                    <div>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Datos</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Lista clientes</li>
                        </ol>
                    </div>
                    <a href="<?php echo base_url(); ?>Clientes/" class="btn btn-primary"> Lista clientes <i class="fe fe-file"></i></a>
                </div>
            <!-- page-header end -->

            <!-- row open -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Datos del cliente</h3>
                        </div>
                        <div class="card-body">
                            <form class="needs-validation" method="post" action="<?= base_url(); ?>Clientes/guardar_cliente" novalidate>
                                <div class="form-row">

                                    <div class="col-xl-12 mb-3">
                                        <label for="codigoCliente">Código</label>
                                        <input type="text" class="form-control" value="<?php echo $codigo; ?>" id="" name="" readonly>
                                        <input type="hidden" class="form-control" value="<?php echo $codigo; ?>" id="codigoCliente" name="codigoCliente" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-12 mb-3">
                                        <label for="nombreCliente">Nombre completo</label>
                                        <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>
                                    
                                    <div class="col-xl-6 mb-3">
                                        <label for="documentoCliente">Documento</label>
                                        <input type="text" class="form-control" id="documentoCliente" name="documentoCliente" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-6 mb-3">
                                        <label for="telefonoCliente">Teléfono</label>
                                        <input type="text" class="form-control" id="telefonoCliente" name="telefonoCliente" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-12 mb-3">
                                        <label for="direccionCliente">Dirección</label>
                                        <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>
                                    
                                    
                                </div>

                                <div class="text-center mt-5">
                                    <button class="btn btn-primary" type="submit">Guardar datos <i class="fe fe-save"></i></button>
                                </div>
                                    
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- row closed -->
        </div>
        <!-- container closed -->
    </div>
</div>
<!--app-content closed-->


<script>
    $(function() {
        $('.calendario').datepicker({
            'format': 'yyyy-m-d',
				'autoclose': true
        });

        $('input[id="telefonoEmpleado"]').mask('0000-0000');
        $('input[id="duiEmpleado"]').mask('000000000');

    });
</script>