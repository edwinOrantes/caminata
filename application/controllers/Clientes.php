<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clientes extends CI_Controller {

	public function __construct(){
		parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		$this->load->model("Clientes_Model");
	}

	public function index(){
		$data["clientes"] = $this->Clientes_Model->obtenerClientes();
		// echo json_encode($data["empleados"]);
		$this->load->view('Base/header');
		$this->load->view('Clientes/lista_clientes', $data);
		$this->load->view('Base/footer');
	}

	public function agregar_cliente(){
		$cod = "";
		$codigo = $this->Clientes_Model->obtenerCodigo();
		if(is_null($codigo)){
			$cod = 1000;
		}else{
			$cod = $codigo->codigo + 1;
		}
		$data["codigo"] = $cod;
		$this->load->view('Base/header');
		$this->load->view('Clientes/agregar_cliente', $data);
		$this->load->view('Base/footer');
		//echo json_encode($cod);
	}

	public function guardar_cliente(){
		$datos = $this->input->post();
		$resp = $this->Clientes_Model->guardarCliente($datos);
		if ($resp){
			$this->Clientes_Model->guardarReceptor($datos);
			$this->session->set_flashdata("exito","Datos ingresados con exito");
			redirect(base_url()."Clientes/agregar_cliente/");
		}else{
			$this->session->set_flashdata("error","Error al registrar los datos");
			redirect(base_url()."Clientes/agregar_cliente/");
		}
		echo json_encode($datos);
	
	}

	
	public function detalle_cliente($id = null){
		$data["cliente"] = $this->Clientes_Model->obtenerCliente($id);
		$this->load->view('Base/header');
		$this->load->view('Clientes/detalle_cliente', $data);
		$this->load->view('Base/footer');
		// echo json_encode($data);
	}

	public function actualizar_empleado(){
		$datos = $this->input->post();
		$resp = $this->Clientes_Model->actualizarCliente($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos actualizados con exito");
			redirect(base_url()."Clientes/");
		}else{
			$this->session->set_flashdata("error","Error al actualizar los datos");
			redirect(base_url()."Clientes/");
		}
		//echo json_encode($datos);

	}

	public function eliminar_cliente(){
		$datos = $this->input->post();
		$resp = $this->Clientes_Model->eliminarCliente($datos);
		if ($resp){
			$this->session->set_flashdata("exito","Datos eliminados con exito");
			redirect(base_url()."Clientes/");
		}else{
			$this->session->set_flashdata("error","Error al eliminar los datos");
			redirect(base_url()."Clientes/");
		}

	}

/*


	

	public function buscar_empleado(){
		if($this->input->is_ajax_request()){
			$empleado =$this->input->post("empleado");
			$data = $this->Empleados_Model->validadEmpleado(trim($empleado));
			echo json_encode($data);
		}
		else{
			echo "Error...";
		}
	}



	// Para calendario 
		public function vacaciones(){
			$this->load->view('Base/header');
			$this->load->view('Empleados/calendario_eventos');
			$this->load->view('Base/footer');
		}

		public function obtener_eventos(){
			$eventos = $this->Empleados_Model->obtenerEventos();
			foreach($eventos as $row){
				$data[] = array(
					'id' => $row->idEvento,
					'title' => $row->tituloEvento,
					'start' => $row->inicioEvento,
					'end' => $row->finEvento
				);
			}
			echo json_encode($data);
		}
	// Para calendario
	*/
}

?>