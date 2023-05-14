<?php 

class Ordenes_Model extends CI_Model
{

    public function obtenerDestino(){
        $sql = "SELECT * FROM tbl_destinos";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function estadosOrdenes(){
        $sql = "SELECT * FROM tbl_estado_orden";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerOrdenes(){
        $sql = "SELECT
                o.idOrden, o.codigoOrden, o.creoQR, em.nombreCliente AS emisorOrden, em.direccionCliente AS origenOrden, r.nombreCliente as receptorOrden, o.fechaIngreso,
                r.direccionCliente AS destinoOrden, o.tipoPago, o.estadoPago, o.estadoPago, o.otraDireccionOrden, o.estadoOrden, o.gestorOrden, eo.nombreEstado,
                (SELECT SUM(totalArticulo) FROM tbl_detalle_orden WHERE idOrden = o.idOrden) AS totalEnvio
                FROM tbl_ordenes AS o
                INNER JOIN tbl_emisores AS em ON(o.emisorOrden = em.idCliente)
                INNER JOIN tbl_receptores AS r ON(o.receptorOrden = r.idCliente)
                INNER JOIN tbl_estado_orden AS eo ON(o.estadoOrden = eo.idEstado)";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerOrden($id = null){
        $sql = "SELECT o.idOrden, o.codigoOrden, o.creoQR, em.nombreCliente AS emisorOrden, em.direccionCliente AS origenOrden,
                r.nombreCliente as receptorOrden, o.fechaIngreso, r.direccionCliente AS destinoOrden, o.tipoPago, o.estadoPago,
                o.estadoPago, o.otraDireccionOrden, o.estadoOrden, o.gestorOrden, eo.nombreEstado, em.telefonoCliente AS telefonoEmisor,
                r.telefonoCliente AS telefonoReceptor, e.nombreEmpleado FROM tbl_ordenes AS o INNER JOIN tbl_empleados AS e ON(o.gestorOrden = e.idEmpleado)
                INNER JOIN tbl_emisores AS em ON(o.emisorOrden = em.idCliente) INNER JOIN tbl_receptores AS r ON(o.receptorOrden = r.idCliente)
                INNER JOIN tbl_estado_orden AS eo ON(o.estadoOrden = eo.idEstado) WHERE o.idOrden = '$id' ";
        $datos = $this->db->query($sql);
        return $datos->row();
    }

    public function obtenerCodigo(){
        $sql = "SELECT codigoOrden as codigo FROM tbl_ordenes WHERE idOrden = (SELECT MAX(idOrden) FROM tbl_ordenes)";
        $datos = $this->db->query($sql);
        return $datos->row();
    }

    public function validarCodigoOrden($codigo){
        $sql = "SELECT * FROM tbl_ordenes WHERE codigoOrden = '$codigo' ";
        $datos = $this->db->query($sql);
        return $datos->row();
    }

    public function guardarOrden($data = null){
        if($data != null){
            $sql = "INSERT INTO tbl_ordenes(codigoOrden, fechaIngreso, emisorOrden, receptorOrden, destinoOrden, tipoPago, 
                                estadoPago, tipoServicio, otraDireccionOrden, gestorOrden, observacionesOrden)
                    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            if($this->db->query($sql, $data)){
                $orden = $this->db->insert_id(); // Id de la transaccion
                return $orden;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }

    public function obtenerDetalleOrden($id = null){
        if($id != null){
            $sql = "SELECT * FROM tbl_detalle_orden WHERE idOrden = '$id' AND eliminadoArticulo = '1' ";
            $datos = $this->db->query($sql);
            return $datos->result();
        }else{
            return false;
        }
    }

    public function guardarDetalleOrden($data = null){
        if($data != null){
            $sql = "INSERT INTO tbl_detalle_orden(idOrden, nombreArticulo, pesoArticulo, precioKilo, totalArticulo, detalleArticulo)
                    VALUES(?, ?, ?, ?, ?, ?)";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function actualizarDetalleOrden($data = null){
        if($data != null){
            $sql = "UPDATE tbl_detalle_orden SET nombreArticulo = ?, pesoArticulo = ?, precioKilo = ?, totalArticulo = ?, 
                    detalleArticulo = ? WHERE idDetalle = ?";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function eliminarDetalleOrden($data = null){
        if($data != null){
            $sql = "UPDATE tbl_detalle_orden SET eliminadoArticulo = ?  WHERE idDetalle = ?";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    
    public function guardarQR($orden = null, $qr = null){
        if($orden != null && $qr != null){
            $sql = "INSERT INTO tbl_orden_qr(idOrden, nombreQr) VALUES('$orden', '$qr')";
            if($this->db->query($sql)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function actualizarEstadoQR($orden = null){
        if($orden != null){
            $sql = "UPDATE tbl_ordenes SET creoQR = '1' WHERE idOrden  = '$orden' ";
            if($this->db->query($sql)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function obtenerQr($orden = null){
        if($orden != null){
            $sql = "SELECT * FROM tbl_orden_qr WHERE idOrden = '$orden' ";
            $datos = $this->db->query($sql);
            return $datos->result();
        }
    }
    
/*

    public function obtenerCliente($id = null){
        $sql = "SELECT * FROM tbl_clientes WHERE idCliente = '$id' ";
        $datos = $this->db->query($sql);
        return $datos->row();
    }
    
    public function actualizarCliente($data = null){
        if($data != null){
            $sql = "UPDATE tbl_clientes SET nombreCliente = ?, documentoCliente = ?, telefonoCliente = ?, direccionCliente = ?
                    WHERE idCliente = ?";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    */

 
}

?>
