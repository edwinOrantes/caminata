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
        
		$data["emisores"] = $this->Clientes_Model->obtenerEmisores();
        $data["receptores"] = $this->Clientes_Model->obtenerReceptores();
        $data["destinos"] = $this->Ordenes_Model->obtenerDestino();

		$this->load->view('Base/header');
		$this->load->view('Ordenes/agregar_orden', $data);
		$this->load->view('Base/footer');
		// echo json_encode($data);
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
		$data["orden"] = $this->Ordenes_Model->obtenerOrden($id);
		$data["articulos"] = $this->Ordenes_Model->obtenerDetalleOrden($id);
        $data["idOrden"] = $id;
		$this->load->view('Base/header');
		$this->load->view('Ordenes/detalle_orden', $data);
		$this->load->view('Base/footer');
		// echo json_encode($data);
    }
	
/* 	public function guardar_articulo(){
		$datos = $this->input->post();
		$orden = $datos["idOrden"];
		$resp = $this->Ordenes_Model->guardarDetalleOrden($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos ingresados con exito");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}else{
			$this->session->set_flashdata("error","Error al registrar los datos");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}
		// echo json_encode($datos);
	} */
	
	public function guardar_articulo(){
		if($this->input->is_ajax_request()){
			$datos = $this->input->post();		
			$resp = $this->Ordenes_Model->guardarDetalleOrden($datos);
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
	
	public function editar_articulo(){
		$datos = $this->input->post();
		$orden = $datos["idOrden"];
		unset($datos["idOrden"]);
		$resp = $this->Ordenes_Model->actualizarDetalleOrden($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos actualizados con exito");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}else{
			$this->session->set_flashdata("error","Error al actualizar los datos");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}
		// echo json_encode($datos);
	}
	
	public function eliminar_articulo(){
		$datos = $this->input->post();
		$orden = $datos["idOrden"];
		unset($datos["idOrden"]);
		$resp = $this->Ordenes_Model->eliminarDetalleOrden($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos eliminados con exito");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}else{
			$this->session->set_flashdata("error","Error al eliminados los datos");
			redirect(base_url()."Ordenes/detalle_orden/".$orden."/");
		}
		// echo json_encode($datos);
	}
}

?>