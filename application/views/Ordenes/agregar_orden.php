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
                            <li class="breadcrumb-item active" aria-current="page">Crear orden</li>
                        </ol>
                    </div>
                    <a href="<?php echo base_url(); ?>Ordenes/" class="btn btn-primary"> Lista ordenes <i class="fe fe-file"></i></a>
                </div>
            <!-- page-header end -->

            <!-- row open -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Datos de la orden</h3>
                        </div>
                        <div class="card-body">
                            <form class="needs-validation" method="post" action="<?= base_url(); ?>Ordenes/guardar_orden" novalidate>
                                <div class="form-row">

                                    <div class="col-xl-6 mb-3">
                                        <label for="codigoOrden">Código</label>
                                        <input type="text" class="form-control" value="<?php echo $codigo; ?>" id="" name="" readonly>
                                        <input type="hidden" class="form-control" value="<?php echo $codigo; ?>" id="codigoOrden" name="codigoOrden" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-6 mb-3">
                                        <label for="fechaOrden">Fechas</label>
                                        <input type="date   " class="form-control" value="<?php echo date("Y-m-d") ?>" id="fechaOrden" name="fechaOrden" required>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-5 mb-3" id="emisor">
                                        <label for="emisorOrden">Emisor</label>
                                        <select class="form-control select2-show-search" id="emisorOrden" name="emisorOrden" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <?php
                                                foreach ($emisores as $row) {
                                            ?>
                                            <option value="<?php echo $row->idCliente;?>"><?php echo $row->nombreCliente;?></option>
                                            <?php
                                                }
                                            ?>

                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-5 mb-3">
                                        <label for="receptorOrden">Receptor</label>
                                        <select class="form-control select2-show-search" id="receptorOrden" name="receptorOrden" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <?php
                                                foreach ($receptores as $row) {
                                            ?>
                                            <option value="<?php echo $row->idCliente;?>"><?php echo $row->nombreCliente;?></option>
                                            <?php
                                                }
                                            ?>

                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-2 mb-3">
                                        <label for="destinoOrden">Bodega destino</label>
                                        <select class="form-control" id="destinoOrden" name="destinoOrden" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <?php
                                                foreach ($destinos as $row) {
                                            ?>
                                            <option value="<?php echo $row->idDestino;?>"><?php echo $row->nombreDestino;?></option>
                                            <?php
                                                }
                                            ?>

                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-4 mb-3">
                                        <label for="tipoPago">Tipo pago</label>
                                        <select class="form-control" id="tipoPago" name="tipoPago" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <option value="Efectivo">Efectivo</option>
                                            <option value="Tarjeta de crédito">Tarjeta de crédito</option>
                                            <option value="Transferencia bancaria">Transferencia bancaria</option>
                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-4 mb-3">
                                        <label for="estadoPago">Estado pago</label>
                                        <select class="form-control" id="estadoPago" name="estadoPago" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <option value="Pagado">Pagado</option>
                                            <option value="Por pagar">Por pagar</option>
                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-4 mb-3">
                                        <label for="tipoServicio">Tipo servicio</label>
                                        <select class="form-control" id="tipoServicio" name="tipoServicio" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <option value="Entrega">Entrega</option>
                                            <option value="Recogida">Recogida</option>
                                            <option value="Entrega y Recogida">Entrega y Recogida</option>
                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-8 mb-3">
                                        <label for="otraDireccion">Cambiar dirección de entrega </label>
                                        <input type="text" class="form-control" placeholder="Si la entrega se hara en una direccion distinta" id="otraDireccion" name="otraDireccion">
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-4 mb-3">
                                        <label for="gestorOrden">Gestor asignado</label>
                                        <select class="form-control" id="gestorOrden" name="gestorOrden" required>
                                            <option value="">.:: Seleccionar ::.</option>
                                            <?php
                                                foreach ($gestores as $row) {
                                                    echo '<option value="'.$row->idEmpleado.'">'.$row->nombreEmpleado.'</option>';
                                                }
                                                
                                            ?>
                                        </select>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>

                                    <div class="col-xl-12 mb-3">
                                        <label for="otraDireccion">Observaciones</label>
                                        <textarea name="observacionesOrden" id="observacionesOrden" class="form-control" rows="5"></textarea>
                                        <div class="valid-feedback">Muy bien!</div>
                                    </div>
                                    
                                </div>

                                <div class="text-center mt-5">
                                    <button class="btn btn-primary" type="submit">Crear orden <i class="fe fe-save"></i></button>
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
