<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ordenes extends CI_Controller {

	public function __construct(){
		parent::__construct();
		date_default_timezone_set('America/El_Salvador');
		$this->load->model("Ordenes_Model");
		$this->load->model("Clientes_Model");
		$this->load->model("Empresa_Model");
		$this->load->model("Empleado_Model");
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
        $data["gestores"] = $this->Empleado_Model->empleadosPorCargo(3);

		$this->load->view('Base/header');
		$this->load->view('Ordenes/agregar_orden', $data);
		$this->load->view('Base/footer');
		
		//echo json_encode($data);
	}

	public function guardar_orden(){
		echo '<script>
				if (window.history.replaceState) { // verificamos disponibilidad
					window.history.replaceState(null, null, window.location.href);
				}
			</script>';
		$datos = $this->input->post();
		$c = $datos["codigoOrden"];
		$codigo = $this->Ordenes_Model->validarCodigoOrden($c);
		if(!is_null($codigo)){
			$ultimoCodigo = $this->Ordenes_Model->obtenerCodigo();
			$uc = $ultimoCodigo->codigo + 1;
			$datos["codigoOrden"] = "$uc";
		}
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
	
	
	/*public function guardar_articulo(){
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
	
	public function etiquetas_articulo(){
		$this->load->library('ciqrcode');
		$datos = $this->input->post();
		$nombre = "";
		$pivote = false;
		/* Ejecutando procesos */
			if($datos["cantidadEtiquetas"] > 1){
				for ($i=1; $i <= $datos["cantidadEtiquetas"]; $i++) { 
					$nombre = $datos["codigoOrden"]."-".$i;
					$params['data'] = base_url().'Ordenes/informacion_orden/'.$nombre;
					$params['level'] = 'H';
					$params['size'] = 10;
					$params['savename'] = FCPATH.'public/images/qrs/'.$nombre.".png";
					$this->ciqrcode->generate($params);

					//Guardando en DB
						$this->Ordenes_Model->guardarQR($datos["idOrden"], $nombre);
					//Guardando en DB

					// Confirmando que se crearon los Qrs
						$pivote = $this->Ordenes_Model->actualizarEstadoQR($datos["idOrden"]);
					// Confirmando que se crearon los Qrs

				}
			}else{
				$params['data'] = base_url().'Ordenes/informacion_orde/'.$datos["codigoOrden"]."/";
				$params['level'] = 'H';
				$params['size'] = 10;
				$params['savename'] = FCPATH.'public/images/qrs/'.$datos["codigoOrden"].".png";
				$this->ciqrcode->generate($params);

				//Guardando en DB
					$this->Ordenes_Model->guardarQR($datos["idOrden"], $datos["codigoOrden"]);
				//Guardando en DB

				// Confirmando que se creo el QR
					$pivote = $this->Ordenes_Model->actualizarEstadoQR($datos["idOrden"]);
				// Confirmando que se creo el QR
			}
		/* Ejecutando procesos */
		// echo json_encode($datos);
		if ($pivote){
			$this->session->set_flashdata("exito","Etiquetas creadas con exito!");
			redirect(base_url()."Ordenes/etiqueta_pdf/".$datos["idOrden"]."/");
		}else{
			$this->session->set_flashdata("error","Error al crear las etiquetas");
			redirect(base_url()."Ordenes/etiqueta_pdf/".$datos["idOrden"]."/");
		}

		/* $config['cacheable']	= true; //boolean, the default is true
		$config['cachedir']		= ''; //string, the default is application/cache/
		$config['errorlog']		= ''; //string, the default is application/logs/
		$config['quality']		= true; //boolean, the default is true
		$config['size']			= ''; //interger, the default is 1024
		$config['black']		= array(224,255,255); // array, default is array(255,255,255)
		$config['white']		= array(70,130,180); // array, default is array(0,0,0)
		$this->ciqrcode->initialize($config); */

		/* $params['data'] = 'https://www.youtube.com/watch?v=dLCY8jPN6AY';
		$params['level'] = 'H';
		$params['size'] = 10;
		$params['savename'] = FCPATH.'public/images/qrs/etiqueta.png';
		$this->ciqrcode->generate($params);

		echo '<img src="'.base_url().'public/images/qrs/etiqueta.png" />'; */

		// echo json_encode($datos);
	}

	public function etiqueta_pdf($id = null){
		$data["orden"] = $this->Ordenes_Model->obtenerOrden($id);
		$data["qr"] = $this->Ordenes_Model->obtenerQr($id);
		$data["empresa"] = $this->Empresa_Model->obtenerInformacion();

		// Creando PDF 
			$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8', 'format' => 'A4']);
			$mpdf = new \Mpdf\Mpdf([
				'margin_left' => 10,
				'margin_right' => 10,
				'margin_top' => 10,
				'margin_bottom' => 10,
				'margin_header' => 10,
				'margin_footer' => 10
				]);
			//$mpdf->setFooter('');
			//$mpdf->SetProtection(array('print'));
			$mpdf->SetTitle("Hospital Orellana, Usulutan");
			$mpdf->SetAuthor("Edwin Orantes");
			$mpdf->showWatermarkText = false;
			$mpdf->watermark_font = 'DejaVuSansCondensed';
			$mpdf->watermarkTextAlpha = 0.1;
			$mpdf->SetDisplayMode('fullpage');
			$mpdf->AddPage('L'); //Voltear Hoja
			$html = $this->load->view('Ordenes/etiqueta_pdf', $data ,true); // Cargando hoja de estilos
			$mpdf->SetHTMLHeader();
			
					
			// FOOTER MALO EN TEORIA
			/* $mpdf->SetHTMLFooter('<div>
				<p style="margin-top: 50px; height: 65px"><strong>AUTORIZACIÓN:</strong></p>
				<div style="width: 100%;">
					<table class="tabla_detalle_paciente" style="margin-top: 25px; border-collapse: separate; border-spacing: 30px 0px;">
						<tr>
							<td style="border-bottom: 1px solid #000"> </td>
							<td style="border-bottom: 1px solid #000"> </td>
							<td style="border-bottom: 1px solid #000"> </td>
						</tr>
						<tr>
							<td style="border:none; width: 150px; text-align: center; font-size: 12px"><strong>Empleado</strong></td>
							<td style="border:none; width: 150px; text-align: center; font-size: 12px"><strong>Jefe inmediato</strong></td>
							<td style="border:none; width: 150px; text-align: center; font-size: 12px"><strong>Gerente general</strong></td>
						</tr>
					</table>
				</div>
			</div>'); */
			$mpdf->WriteHTML($html);
			$mpdf->Output('etiqueta.pdf', 'I');
		// Fin del PDF 
		//echo json_encode($data);


	}

	public function informacion_orden($orden = null){

	}




}

?> 