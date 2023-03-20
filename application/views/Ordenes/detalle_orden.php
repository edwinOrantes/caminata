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
                            <li class="breadcrumb-item active" aria-current="page">Datos de la orden</li>
                        </ol>
                    </div>
                    <button class="btn btn-info mt-3" data-bs-toggle="modal" data-bs-target="#agregarArticulos" > Agregar articulos <i class="fe fe-plus"></i></button>
                </div>
            <!-- page-header end -->

            <!-- row open -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="col-md-12 alert-info p-6">
                                <h3 class="card-title">Detalle de la orden</h3>
                                <table class="table table-borderless mt-3">
                                    <tr>
                                        <td class="text-black"><strong>Código : </strong></td>
                                        <td><?php echo $orden->codigoOrden; ?></td>
                                        <td class="text-black"><strong>Fecha : </strong></td>
                                        <td><?php echo $orden->fechaIngreso; ?></td>
                                        <td class="text-black"><strong>Costo total: </strong></td>
                                        <td><span class="badge bg-info badge-sm  me-1 mb-1 mt-1">$0</span></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td class="text-black"><strong>Emisor: </strong></td>
                                        <td><?php echo $orden->emisorOrden; ?></td>
                                        <td class="text-black"><strong>Receptor: </strong></td>
                                        <td><?php echo $orden->receptorOrden; ?></td>
                                        <td class="text-black"><strong>Total articulos : </strong></td>
                                        <td><span class="badge bg-info badge-sm  me-1 mb-1 mt-1">0</span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="text-black"><strong>Destino: </strong></td>
                                        <td><?php echo $orden->destinoOrden; ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-body"></div>
                    </div>
                </div>
            </div>
            <!-- row closed -->
        </div>
        <!-- container closed -->
    </div>
</div>
<!--app-content closed-->


<!-- Modales -->
    <div class="modal fade" id="agregarArticulos" tabindex="-1" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle del articulo</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button>
                </div>
                <div class="modal-body">
                    <p>Contenido aqui</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
<!-- Modales -->