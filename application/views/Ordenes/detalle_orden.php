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

<?php
$totalArticulos = 0;
$costoTotal = 0;
    foreach ($articulos as $row) {
        $costoTotal += $row->totalArticulo;
        $totalArticulos++;
    }
?>

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
                    <button class="btn btn-info mt-3" data-bs-toggle="modal" data-bs-target="#agregarArticulo" > Agregar articulos <i class="fe fe-plus"></i></button>
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
                                        <td><span class="badge bg-info badge-sm  me-1 mb-1 mt-1">$ <?php echo number_format($costoTotal, 2); ?></span></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td class="text-black"><strong>Emisor: </strong></td>
                                        <td><?php echo $orden->emisorOrden; ?></td>
                                        <td class="text-black"><strong>Receptor: </strong></td>
                                        <td><?php echo $orden->receptorOrden; ?></td>
                                        <td class="text-black"><strong>Total articulos : </strong></td>
                                        <td><span class="badge bg-info badge-sm  me-1 mb-1 mt-1"><?php echo number_format($totalArticulos, 2); ?></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="text-black"><strong>Destino: </strong></td>
                                        <td><?php echo $orden->destinoOrden; ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="">
                            <?php
                                    if(sizeof($articulos) > 0){
                                ?>
                                <table class="table table-bordered text-nowrap border-bottom" id="tblArticulos">
                                    <thead>
                                        <tr class="bg-primary">
                                            <th class="border-bottom-0 text-center text-white"><strong>#</strong></th>
                                            <th class="border-bottom-0 text-center text-white"><strong>Nombre</strong></th>
                                            <th class="border-bottom-0 text-center text-white"><strong>Peso en kilos</strong></th>
                                            <th class="border-bottom-0 text-center text-white"><strong>Costo por Kilo</strong></th>
                                            <th class="border-bottom-0 text-center text-white"><strong>Total</strong></th>
                                            <th class="border-bottom-0 text-center text-white"><strong>Opción</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $index = 1;
                                            foreach ($articulos as $row) {
                                        ?>
                                        <tr>
                                            <td class="text-center"><?= $index;?></td>
                                            <td class="text-center"><?= $row->nombreArticulo;?></td>
                                            <td class="text-center"><?= $row->pesoArticulo;?></td>
                                            <td class="text-center">$<?= $row->precioKilo;?></td>
                                            <td class="text-center">$<?= $row->totalArticulo;?></td>
                                            <td class="text-center">
                                                <input type="hidden" id="nombre" value="<?= $row->nombreArticulo;?>">
                                                <input type="hidden" id="peso" value="<?= $row->pesoArticulo;?>">
                                                <input type="hidden" id="precio" value="<?= $row->precioKilo;?>">
                                                <input type="hidden" id="total" value="<?= $row->totalArticulo;?>">
                                                <input type="hidden" id="detalle" value="<?= $row->detalleArticulo;?>">
                                                <input type="hidden" id="idDetalle" value="<?= $row->idDetalle;?>">

                                                <a href="#editarArticulo" id="btnEditarDatos" data-bs-toggle="modal" class="text-primary" title="Editar datos"><i class="fa fa-edit"></i></a>
                                                <a href="#eliminarArticulo" id="btnEliminarDatos" data-bs-toggle="modal" class="text-danger" title="Eliminar empleado"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr>
            
                                        <?php
                                                $index++;
                                            }
                                        ?>
                                        
                                    </tbody>
                                </table>

                                <?php 
                                    }else{
                                        echo '<div class="alert-danger p-3 text-center">No hay articulos agregados aun... </div>';
                                    }
                                ?>
                            </div>
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


<!-- Modales -->
    <!-- Agregar articulo -->
        <div class="modal fade" id="agregarArticulo" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle del articulo</h5>
                        <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button>
                    </div>
                    <form class="needs-validation" method="post" action="<?= base_url(); ?>Ordenes/guardar_articulo" novalidate>
                        <div class="modal-body">
                            <div class="form-row">

                                <div class="col-md-12 mb-3">
                                    <label for="nombreArticulo">Nombre del articulo</label>
                                    <input type="hidden" value="<?php echo $idOrden; ?>" id="idOrden" name="idOrden">
                                    <input type="text" class="form-control" id="nombreArticulo" name="nombreArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="pesoArticulo">Peso en Kilos</label>
                                    <input type="text" value="0" class="form-control" id="pesoArticulo" name="pesoArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                <div class="col-md-12 mb-3">
                                    <label for="precioKilo">Precio por Kilo</label>
                                    <input type="text" value="0" class="form-control" id="precioKilo" name="precioKilo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="totalEnvio">Total del envio</label>
                                    <input type="text" value="0" id="totalLectura" class="form-control" readonly>
                                    <input type="hidden" value="0" id="totalEnvio" name="totalEnvio" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-xl-12 mb-3">
                                    <label for="detallesArticulo">Detalles</label>
                                    <input type="text" class="form-control" id="detallesArticulo" name="detallesArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary">Guardar datos</button>
                            <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <!-- Agregar articulo -->

    <!-- Editar articulo -->
        <div class="modal fade" id="editarArticulo" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle del articulo</h5>
                        <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button>
                    </div>
                    <form class="needs-validation" method="post" action="<?= base_url(); ?>Ordenes/editar_articulo" novalidate>
                        <div class="modal-body">
                            <div class="form-row">

                                <div class="col-md-12 mb-3">
                                    <label for="nombreArticuloU">Nombre del articulo</label>
                                    <input type="text" class="form-control" id="nombreArticuloU" name="nombreArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="pesoArticuloU">Peso en Kilos</label>
                                    <input type="text" class="form-control" id="pesoArticuloU" name="pesoArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                <div class="col-md-12 mb-3">
                                    <label for="precioKiloU">Precio por Kilo</label>
                                    <input type="text" class="form-control" id="precioKiloU" name="precioKilo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-md-12 mb-3">
                                    <label for="totalEnvioU">Total del envio</label>
                                    <input type="text" id="totalLecturaU" class="form-control" readonly>
                                    <input type="hidden" id="totalEnvioU" name="totalEnvio" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-xl-12 mb-3">
                                    <label for="detallesArticuloU">Detalles</label>
                                    <input type="text" class="form-control" id="detallesArticuloU" name="detallesArticulo" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="idDetalleU" name="idDetalleU">
                            <input type="hidden" value="<?php echo $idOrden; ?>" id="idOrdenU" name="idOrden">
                            <button class="btn btn-primary">Actualizar datos</button>
                            <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <!-- Editar articulo -->

    <!-- Eliminar articulo -->
        <div class="modal  fade" id="eliminarArticulo" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
                <form class="needs-validation" method="post" action="<?= base_url(); ?>Ordenes/eliminar_articulo" novalidate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Advertencia</h5>
                            <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                        </div>
                        <div class="modal-body">
                            <p class="text-center">¿Estas seguro de eliminar este articulo?</p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="estadoArticulo" value="0">
                            <input type="hidden" id="idArticuloE" name="idArticuloE">
                            <input type="hidden" value="<?php echo $idOrden; ?>" id="idOrdenD" name="idOrden">
                            <a href="#" class="btn btn-default" data-bs-dismiss="modal">Cancelar</a>
                            <button class="btn btn-danger">Eliminar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <!-- Eliminar articulo -->

<!-- Modales -->

<script>
    $(document).on("change", "#pesoArticulo", function(event) {
        event.preventDefault();
        var peso = parseFloat($(this).val());
        var precio = parseFloat($('#precioKilo').val());
        var total = peso * precio;
        $('#totalEnvio').val(total.toFixed(2));
        $('#totalLectura').val(total.toFixed(2));
    });

    $(document).on("change", "#precioKilo", function(event) {
        event.preventDefault();
        var peso = parseFloat($('#pesoArticulo').val());
        var precio = parseFloat($(this).val());
        var total = peso * precio;
        $('#totalEnvio').val(total.toFixed(2));
        $('#totalLectura').val(total.toFixed(2));
    });

    $(document).on("click", "#btnEditarDatos", function(event) {
        event.preventDefault();
        $("#nombreArticuloU").val($(this).closest('tr').find('#nombre').val());
        $("#pesoArticuloU").val($(this).closest('tr').find('#peso').val());
        $("#precioKiloU").val($(this).closest('tr').find('#precio').val());
        $("#totalLecturaU").val($(this).closest('tr').find('#total').val());
        $("#totalEnvioU").val($(this).closest('tr').find('#total').val());
        $("#detallesArticuloU").val($(this).closest('tr').find('#detalle').val());
        $("#idDetalleU").val($(this).closest('tr').find('#idDetalle').val());
    });

    $(document).on("change", "#pesoArticuloU", function(event) {
        event.preventDefault();
        var peso = parseFloat($(this).val());
        var precio = parseFloat($('#precioKiloU').val());
        var total = peso * precio;
        $('#totalEnvioU').val(total.toFixed(2));
        $('#totalLecturaU').val(total.toFixed(2));
    });

    $(document).on("change", "#precioKiloU", function(event) {
        event.preventDefault();
        var peso = parseFloat($('#pesoArticuloU').val());
        var precio = parseFloat($(this).val());
        var total = peso * precio;
        $('#totalEnvioU').val(total.toFixed(2));
        $('#totalLecturaU').val(total.toFixed(2));
    });

    $(document).on("click", "#btnEliminarDatos", function(event) {
        event.preventDefault();
        $("#idArticuloE").val($(this).closest('tr').find('#idDetalle').val()); 
    });

</script>