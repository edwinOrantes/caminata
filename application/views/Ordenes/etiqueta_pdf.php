<style>
    .content{
        width: 100%;
        height: 100%;
    }
    .content .articulos{
        float:left;
        width: 48%;
        height: 100%;
        border: 1px solid #000;
        padding: 5px;
    }
    table{
        font-size: 16px
    }
    table tr td{
        height: 25px
    }
    .cabecera, .pie{
        border: none;
    }
    .cabecera .cabecera_izquierda, .pie .pie_izquierda{
        float: left;
        height: 21%;
        width: 50%;
    }
    .cabecera .cabecera_derecha, .pie .pie_derecha{
        float: right;
        height: 21%;
        width: 50%;
    }

    .contenido{
        border: none;
    }
    .contenido .contenido_izquierda{
        float:left;
        height: 35%;
        margin-top: -20px;
        width: 50%;
    }
    .contenido .contenido_derecha{
        float: right;
        height: 35%;
        width: 50%;
    }
</style>


<div class="content">

    <?php
        // for ($i=1; $i <= sizeof($qr) ; $i++) {
            $parte = 0;
            foreach ($qr as $row) {
                $parte++;
    ?>
        <div class="articulos" style="">
            <div class="cabecera">
                <div class="cabecera_izquierda">
                    <img src="<?php echo base_url(); ?>public/images/empresa/<?php echo $empresa->logoEmpresa.".png"; ?>" alt="Logo de la empresa">
                </div>
                <div class="cabecera_derecha" style="text-align: center; line-height: 10px; padding-top: 20px">
                    <h2><?php echo $empresa->nombreEmpresa; ?></h2>
                    <h3><?php echo $empresa->telefonoEmpresa; ?></h3>
                    <h3><?php echo $empresa->direccionEmpresa; ?></h3>
                </div>
            </div>

            <div class="contenido">
                <div class="contenido_izquierda">
                    <img src="<?php echo base_url(); ?>public/images/qrs/<?php echo $row->nombreQr.".png"; ?>" alt="">
                </div>
                <div class="contenido_derecha">
                    <table>
                        <tr>
                            <td><h3><strong>Datos del emisor:</strong></h3></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre:</strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $orden->emisorOrden; ?></td>
                        </tr>
                        <tr>
                            <td><strong>Teléfono:</strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $orden->telefonoEmisor; ?></td>
                        </tr>
                        <tr>
                            <td><strong>Dirección:</strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $orden->origenOrden; ?></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="pie">
                <table style="width: 100%">
                        <tr>
                            <td style="text-align: center;" colspan="2"><h3><strong>Enviar a:</strong></h3></td>
                        </tr>
                        <tr>
                            <td><strong>Nombre:</strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $orden->receptorOrden; ?></td>
                        </tr>
                        <tr>
                            <td><strong>Teléfono:</strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $orden->telefonoReceptor; ?></td>
                        </tr>
                        <tr>
                            <td><strong>Dirección:</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <?php
                                if($orden->otraDireccionOrden != ""){
                                    echo $orden->otraDireccionOrden;
                                }else{
                                    echo $orden->destinoOrden;
                                }
                                ?>
                            </td>
                        </tr>
                    </table>

                    <h3 style="text-align: center; margin-top: 30px">
                        <?php
                            if(sizeof($qr) > 1){
                                echo "Orden: #".$orden->codigoOrden." ----------- Parte: ".$parte;
                            }else{
                                echo "Orden: #".$orden->codigoOrden;
                            }
                        ?>
                    </h3>
            </div>
        </div>
    <?php
        }
    ?>

</div>