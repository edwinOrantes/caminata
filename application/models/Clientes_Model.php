<?php 

class Clientes_Model extends CI_Model
{

    public function obtenerClientes(){
        $sql = "SELECT * FROM tbl_emisores WHERE estadoCliente = 1";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerCodigo(){
        $sql = "SELECT codigoCliente as codigo FROM tbl_emisores WHERE idCliente = (SELECT MAX(idCliente) FROM tbl_emisores)";
        $datos = $this->db->query($sql);
        return $datos->row();
    }
    
    public function guardarCliente($data = null){
        if($data != null){
            $sql = "INSERT INTO tbl_emisores(codigoCliente, nombreCliente, documentoCliente, telefonoCliente, direccionCliente)
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

    public function guardarReceptor($data = null){
        if($data != null){
            $sql = "INSERT INTO tbl_receptores(codigoCliente, nombreCliente, documentoCliente, telefonoCliente, direccionCliente)
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
        $sql = "SELECT * FROM tbl_emisores WHERE idCliente = '$id' ";
        $datos = $this->db->query($sql);
        return $datos->row();
    }
    
    public function actualizarCliente($data = null){
        if($data != null){
            $sql = "UPDATE tbl_emisores SET nombreCliente = ?, documentoCliente = ?, telefonoCliente = ?, direccionCliente = ?
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

    
    public function eliminarCliente($data = null){
        if($data != null){
            $sql = "UPDATE tbl_emisores SET estadoCliente = ?  WHERE idCliente = ?";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function obtenerEmisores(){
        $sql = "SELECT * FROM tbl_emisores";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

    public function obtenerReceptores(){
        $sql = "SELECT * FROM tbl_receptores";
        $datos = $this->db->query($sql);
        return $datos->result();
    }

/*
    public function obtenerArea($id = null){
        $sql = "SELECT * FROM tbl_areas_hospital WHERE idArea = '$id' ";
        $datos = $this->db->query($sql);
        return $datos->row();
    }

    public function obtenerEmpleados(){
        $sql = "SELECT * FROM tbl_empleados";
        $datos = $this->db->query($sql);
        return $datos->result();
    }


    public function obtenerEmpleadosXArea($area = null){
        $sql = "SELECT * FROM tbl_empleados WHERE areaEmpleado = '$area' ";
        $datos = $this->db->query($sql);
        return $datos->result();
    }




    public function validadEmpleado($id = null){
        $sql = "SELECT * FROM tbl_empleados WHERE idEmpleado = '$id'";
        $datos = $this->db->query($sql);
        return $datos->result();
    }


    // Para calendario
    public function obtenerEventos(){
        $sql = "SELECT * FROM tbl_eventos";
        $datos = $this->db->query($sql);
        return $datos->result();
    }
    // Para calendario
*/

}

?>

