<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Envios extends CI_Controller {

    public function __construct(){
		parent::__construct();
		date_default_timezone_set('America/El_Salvador');
        $this->load->model("Empleado_Model");
        $this->load->model("Envios_Model");
		/* if (!$this->session->has_userdata('valido')){
			$this->session->set_flashdata("error", "Debes iniciar sesión");
			redirect(base_url());
		} */
	}

    public function index(){
        $data["gestores"] = $this->Empleado_Model->empleadosPorCargo(3);
        $this->load->view('Base/header');
		$this->load->view('Envios/crear_envio', $data);
		$this->load->view('Base/footer');

        // echo json_encode($data);
    }

	public function agregar_a_envio(){
		if($this->input->is_ajax_request()){
			$datos = $this->input->post();
			$url_base = base_url();
			$str = $datos["paquete"];
			$codigo = str_replace($url_base."Ordenes/informacion_orden/", "", $str); // Obteneniendo unicamente el codigo
			$datos["paquete"] = $codigo;

			/* $porciones = explode("-", $codigo);
			echo json_encode($porciones); */
	
			$resp = $this->Envios_Model->agregarAEnvio($datos);
			if($resp){
				$respuesta = array('estado' => 1, 'respuesta' => 'Exito');
				header("content-type:application/json");
				print json_encode($respuesta);
			}else{
				$respuesta = array('estado' => 0, 'respuesta' => 'Error');
				header("content-type:application/json");
				print json_encode($respuesta);
			}
		}
		else{
			$respuesta = array('estado' => 0, 'respuesta' => 'Error');
			header("content-type:application/json");
			print json_encode($respuesta);
		}
	}

    
}
