<?php 

class Ordenes_Model extends CI_Model
{

    public function obtenerDestino(){
        $sql = "SELECT * FROM tbl_destinos";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerOrdenes(){
        $sql = "SELECT * FROM tbl_ordenes";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerCodigo(){
        $sql = "SELECT codigoOrden as codigo FROM tbl_ordenes WHERE idOrden = (SELECT MAX(idOrden) FROM tbl_ordenes)";
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

/*
    
    public function guardarCliente($data = null){
        if($data != null){
            $sql = "INSERT INTO tbl_clientes(codigoCliente, nombreCliente, documentoCliente, telefonoCliente, direccionCliente)
            VALUES(?, ?, ?, ?, ?)";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

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