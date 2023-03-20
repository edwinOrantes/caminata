<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ordenes extends CI_Controller {

	public function __construct(){
		parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		$this->load->model("Ordenes_Model");
		$this->load->model("Clientes_Model");
	}

	public function index(){
		$data["ordenes"] = $this->Ordenes_Model->obtenerOrdenes();
		$this->load->view('Base/header');
		$this->load->view('Ordenes/lista_ordenes', $data);
		$this->load->view('Base/footer');
		// echo json_encode($data["empleados"]);
	}

	public function agregar_orden(){
        /* Creando codigo */
            $cod = "";
            $codigo = $this->Ordenes_Model->obtenerCodigo();
            if(is_null($codigo)){
                $cod = 1000;
            }else{
                $cod = $codigo->codigo + 1;
            }
            $data["codigo"] = $cod;
        /* Creando codigo */
        $data["clientes"] = $this->Clientes_Model->obtenerClientes();
        $data["destinos"] = $this->Ordenes_Model->obtenerDestino();
		$this->load->view('Base/header');
		$this->load->view('Ordenes/agregar_orden', $data);
		$this->load->view('Base/footer');
		// echo json_encode($cod);
	}

	public function guardar_orden(){
		$datos = $this->input->post();
		$resp = $this->Ordenes_Model->guardarOrden($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos ingresados con exito");
			redirect(base_url()."Ordenes/detalle_orden/".$resp."/");
		}else{
			$this->session->set_flashdata("error","Error al registrar los datos");
			redirect(base_url()."Ordenes/agregar_orden/");
		}
		// echo json_encode($datos);
	
	}

    public function detalle_orden($id = null){
        echo $id;
    }
}

?>