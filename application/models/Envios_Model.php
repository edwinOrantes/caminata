<?php 

class Envios_Model extends CI_Model
{

    public function agregarAEnvio($data = null){
       if($data != null){
            $sql = "INSERT INTO tbl_envios(gestorEnvio, maletaEnvio, paqueteEnvio)
            VALUES(?, ?, ?)";
            if($this->db->query($sql, $data)){
                return true;
            }else{
                return false;
            }
       }else{
            return false;
       }
    }

    /* public function agregarAEnvio(){
        $sql = "SELECT * FROM tbl_destinos";
        $datos = $this->db->query($sql);
        return $datos->result();
    } */

 
}

?>
