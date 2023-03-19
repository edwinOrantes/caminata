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
                        <a href="<?php echo base_url(); ?>Clientes/agregar_cliente" class="btn btn-primary"> Agregar cliente <i class="fe fe-user-plus"></i></a>
                    </div>
                <!-- page-header end -->

                <!-- row open -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title text-dark">Lista de clientes</h3>
                            </div>
                            <div class="card-body">
                                <div class="">
                                    <?php
                                        if(sizeof($clientes) != 0){
                                    ?>
                                    <table class="table table-bordered text-nowrap border-bottom" id="tbl_clientes">
                                        <thead>
                                            <tr class="bg-primary">
                                                <th class="border-bottom-0 text-white"><strong>Cliente</strong></th>
                                                <th class="border-bottom-0 text-white"><strong>Teléfono</strong></th>
                                                <th class="border-bottom-0 text-white"><strong>Documento</strong></th>
                                                <th class="border-bottom-0 text-white"><strong>Dirección</strong></th>
                                                <th class="border-bottom-0 text-white"><strong>Opción</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                foreach ($clientes as $row) {
                                                    if($row->estadoCliente == 1){                                            ?>
                                                    <tr>
                                                        <td><?= $row->nombreCliente;?></td>
                                                        <td><?= $row->telefonoCliente;?></td>
                                                        <td><?= $row->documentoCliente;?></td>
                                                        <td><?= $row->direccionCliente;?></td>
                                                        <td>
                                                            <input type="hidden" id="nombre" value="<?= $row->nombreCliente;?>">
                                                            <input type="hidden" id="telefono" value="<?= $row->telefonoCliente;?>">
                                                            <input type="hidden" id="documento" value="<?= $row->documentoCliente;?>">
                                                            <input type="hidden" id="direccion" value="<?= $row->direccionCliente;?>">
                                                            <input type="hidden" id="idCliente" value="<?= $row->idCliente;?>">

                                                            <a href="<?php echo base_url(); ?>Clientes/detalle_cliente/<?php echo $row->idCliente;?>/" class="text-primary" title="Ver detalle"><i class="fa fa-eye"></i></a>
                                                            <a href="#editarCliente" id="btnEditarDatos" data-bs-toggle="modal" class="text-primary" title="Editar datos"><i class="fa fa-edit"></i></a>
                                                            <a href="#eliminarCliente" id="btnEliminarDatos" data-bs-toggle="modal" class="text-danger" title="Eliminar cliente"><i class="fa fa-trash"></i></a>
                                                        </td>
                                                    </tr>
                
                                            <?php
                                                    }
                                                }
                                            ?>
                                            
                                        </tbody>
                                    </table>
                                    
                                    <?php
                                        }else{
                                            echo '<div class="alert-danger p-3 text-center">No hay datos que mostrar</div>';
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
    <div class="modal fade" id="editarCliente" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Datos del empleado</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                    <form class="needs-validation" method="post" action="<?= base_url(); ?>Clientes/actualizar_empleado" novalidate>
                        <div class="modal-body">   
                            <div class="form-row">

                                <div class="col-xl-12 mb-3">
                                    <label for="nombreCLiente">Nombre completo</label>
                                    <input type="text" class="form-control" id="nombreClienteU" name="nombreCliente" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                <div class="col-xl-6 mb-3">
                                    <label for="documentoCliente">Documento</label>
                                    <input type="text" class="form-control" id="documentoClienteU" name="documentoCliente" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-xl-6 mb-3">
                                    <label for="telefonoCliente">Teléfono</label>
                                    <input type="text" class="form-control" id="telefonoClienteU" name="telefonoCliente" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>

                                <div class="col-xl-12 mb-3">
                                    <label for="direccionCliente">Dirección</label>
                                    <input type="text" class="form-control" id="direccionClienteU" name="direccionCliente" required>
                                    <input type="hidden" class="form-control" id="idClienteU" name="idCliente" required>
                                    <div class="valid-feedback">Muy bien!</div>
                                </div>
                                
                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="text-center mt-5">
                                <button class="btn btn-primary" type="submit">Actualizar datos <i class="fe fe-save"></i></button>
                            </div>
                        </div>   
                    </form>
            </div>
        </div>
    </div>

    <div class="modal  fade" id="eliminarCliente" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <form class="needs-validation" method="post" action="<?= base_url(); ?>Clientes/eliminar_cliente" novalidate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Advertencia</h5>
                        <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                    </div>
                    <div class="modal-body">
                        <p class="text-center">¿Estas seguro de eliminar este registro?</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="estadoClienteE" value="0">
                        <input type="hidden" id="idClienteE" name="idClienteE">
                        <a href="#" class="btn btn-default" data-bs-dismiss="modal">Cancelar</a>
                        <button class="btn btn-danger">Eliminar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<!-- Modales -->



<script>
    $(function() {
        /* $('.calendario').datepicker({
            'format': 'yyyy-m-d',
				'autoclose': true
        }); */

        $('input[id="telefonoEmpleadoU"]').mask('0000-0000');
        $('input[id="duiEmpleadoU"]').mask('000000000');
    });

    $(document).on("click", "#btnEditarDatos", function(event) {
        event.preventDefault();
        
        $("#nombreClienteU").val($(this).closest('tr').find('#nombre').val());
        $("#telefonoClienteU").val($(this).closest('tr').find('#telefono').val());
        $("#documentoClienteU").val($(this).closest('tr').find('#documento').val());
        $("#direccionClienteU").val($(this).closest('tr').find('#direccion').val()); 
        $("#idClienteU").val($(this).closest('tr').find('#idCliente').val());
 
    });

    $(document).on("click", "#btnEliminarDatos", function(event) {
        event.preventDefault();
        $("#idClienteE").val($(this).closest('tr').find('#idCliente').val()); 
    });
</script>