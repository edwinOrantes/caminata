-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2023 a las 01:48:45
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_caminata`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_accesos`
--

CREATE TABLE `tbl_accesos` (
  `idAcceso` int(11) NOT NULL,
  `nombreAcceso` varchar(50) NOT NULL,
  `descripcionAcceso` text NOT NULL,
  `estadoAcceso` int(11) NOT NULL,
  `fechaAcceso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_accesos`
--

INSERT INTO `tbl_accesos` (`idAcceso`, `nombreAcceso`, `descripcionAcceso`, `estadoAcceso`, `fechaAcceso`) VALUES
(1, 'Administrador', 'Acceso total al sistema.', 1, '2021-04-29 14:43:54'),
(2, 'Auxiliar de Caja', 'Usuario que se encargara de cobros.', 1, '2021-12-04 14:24:44'),
(3, 'Botiquin', 'Empleado del area de botiquin.', 1, '2021-05-03 17:17:17'),
(4, 'Cuentas', 'Persona encargada de efectuar cuentas.', 1, '2021-06-15 15:29:53'),
(5, 'Contabilidad', 'Encargado de llevar la contabilidad.', 1, '2021-06-15 15:30:32'),
(6, 'Gerente', 'Encargado de la administracion del hospital.', 1, '2021-06-15 15:31:20'),
(7, 'Laboratorio', 'Para empleados del laboratorio', 1, '2021-07-01 12:16:04'),
(8, 'Recepcionista', 'Persona encargada de hacer cuentas ambulatorias', 1, '2021-07-09 16:23:36'),
(9, 'Gerente', 'Gerente del hospital', 1, '2021-07-16 15:32:59'),
(10, 'Cajera', 'Usuario que se encargara de cobros.', 1, '2021-12-04 14:28:34'),
(11, 'Auxiliar de cuentas', 'Ayuda a realizar cuentas.', 1, '2022-01-07 20:54:05'),
(12, 'ISBM', 'Consultas de precios', 1, '2022-01-25 15:11:32'),
(13, 'Hemodiálisis ', 'Encargada de hacer cuentas de hemodiálisis.', 1, '2022-02-01 13:57:01'),
(14, 'Rayos X', 'Para empleados de rayos x.', 1, '2022-02-19 15:27:44'),
(15, 'Marketing', 'Encargada de marketing.', 1, '2022-08-01 14:06:32'),
(16, 'Inventarios', 'Para la gestión de inventarios', 1, '2023-02-02 14:16:10'),
(19, 'Testing', 'This is  a test', 1, '2023-04-08 23:24:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cargos`
--

CREATE TABLE `tbl_cargos` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_cargos`
--

INSERT INTO `tbl_cargos` (`idCargo`, `nombreCargo`) VALUES
(1, 'Ingeniero de Sistemas Informáticos'),
(3, 'Lic. en Enfermería'),
(4, 'Auxiliar de Enfermería'),
(5, 'Enfermera'),
(6, 'Contabilidad'),
(7, 'Auxiliar de Limpieza'),
(8, 'Gerente'),
(9, 'Botiquín '),
(10, 'Administrador de cuentas'),
(11, 'Cajera'),
(12, 'Laboratorio'),
(13, 'Rayos X'),
(14, 'ISBM'),
(15, 'Auxiliar de Caja'),
(16, 'Hemodiálisis '),
(17, 'Marketing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_destinos`
--

CREATE TABLE `tbl_destinos` (
  `idDestino` int(11) NOT NULL,
  `nombreDestino` varchar(50) NOT NULL,
  `creadoDestino` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_destinos`
--

INSERT INTO `tbl_destinos` (`idDestino`, `nombreDestino`, `creadoDestino`) VALUES
(1, 'Usulután', '2023-03-20 23:05:55'),
(2, 'Los Angeles', '2023-03-20 23:05:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_orden`
--

CREATE TABLE `tbl_detalle_orden` (
  `idDetalle` int(11) NOT NULL,
  `idOrden` int(11) NOT NULL,
  `nombreArticulo` text NOT NULL,
  `pesoArticulo` decimal(9,2) NOT NULL,
  `precioKilo` decimal(9,2) NOT NULL,
  `totalArticulo` decimal(9,2) NOT NULL,
  `detalleArticulo` text NOT NULL,
  `qrArticulo` text NOT NULL,
  `eliminadoArticulo` int(11) NOT NULL DEFAULT 1,
  `creadoArticulo` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_detalle_orden`
--

INSERT INTO `tbl_detalle_orden` (`idDetalle`, `idOrden`, `nombreArticulo`, `pesoArticulo`, `precioKilo`, `totalArticulo`, `detalleArticulo`, `qrArticulo`, `eliminadoArticulo`, `creadoArticulo`) VALUES
(1, 1, 'Pantalon comando', '30.00', '26.00', '780.00', 'Tonteras', '', 1, '2023-03-25 22:46:33'),
(2, 1, 'Pollo Campero', '10.00', '5.55', '55.50', 'Pollo cocinado', '', 1, '2023-03-25 23:47:46'),
(3, 1, 'Bolsa de churros', '50.00', '2.60', '130.00', 'Full churros', '', 1, '2023-03-26 23:34:29'),
(4, 1, 'Pampers', '10.00', '4.66', '46.60', 'Pampers de los finos', '', 1, '2023-03-26 23:40:55'),
(5, 1, 'Ropa de nño', '8.00', '7.00', '56.00', 'N/A', '', 1, '2023-04-07 19:55:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_emisores`
--

CREATE TABLE `tbl_emisores` (
  `idCliente` int(11) NOT NULL,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text NOT NULL,
  `documentoCliente` varchar(15) NOT NULL,
  `telefonoCliente` varchar(15) NOT NULL,
  `direccionCliente` text NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_emisores`
--

INSERT INTO `tbl_emisores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 23:08:03', 1),
(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 23:08:40', 1),
(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-21 04:04:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombreEmpleado` varchar(50) NOT NULL,
  `edadEmpleado` int(11) NOT NULL,
  `telefonoEmpleado` varchar(10) NOT NULL,
  `cargoEmpleado` int(11) NOT NULL,
  `sexoEmpleado` varchar(10) NOT NULL,
  `estadoEmpleado` int(11) NOT NULL DEFAULT 1,
  `direccionEmpleado` text NOT NULL,
  `ingresoEmpleado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`idEmpleado`, `nombreEmpleado`, `edadEmpleado`, `telefonoEmpleado`, `cargoEmpleado`, `sexoEmpleado`, `estadoEmpleado`, `direccionEmpleado`, `ingresoEmpleado`) VALUES
(1, 'Edwin Alexander Cortez Orantes', 29, '6310-0397 ', 1, 'Masculino', 1, 'Usulután', '2021-01-04 06:00:00'),
(3, 'Carla Isolina', 27, '7537-3424 ', 9, 'Femenino', 1, 'Usulután', '2020-07-01 06:00:00'),
(4, 'Carla Marisa ', 21, '7193-3931', 9, 'Femenino', 1, 'Usulután', '2020-07-01 06:00:00'),
(5, 'Catalina de Jesús', 42, '7492-2204 ', 9, 'Femenino', 1, 'Canton el Palmital, Ozatlan, Usulután', '2016-08-08 06:00:00'),
(6, 'Elena Abigail', 29, '7927-8472', 10, 'Femenino', 1, 'Usulután', '2016-08-22 06:00:00'),
(7, 'Jacquelinne Vanessa', 35, '7870-0107', 11, 'Femenino', 1, 'Usulután', '2020-07-01 06:00:00'),
(8, 'Alba Rosa ', 35, '7043-7030', 11, 'Femenino', 1, 'Colonia Las Colinas, Casa ·6', '2014-06-01 06:00:00'),
(9, 'Wendy del Carmen', 27, '7244-5673', 11, 'Femenino', 1, 'Colonia El Milagro, Lote 8, Poligono 10, La Poza', '2021-06-15 06:00:00'),
(10, 'Claudia Patricia ', 28, '7323-4541', 11, 'Femenino', 1, 'Colonia Saravia', '2020-09-21 06:00:00'),
(11, 'Carlos Miguel', 34, '7747-1360', 6, 'Masculino', 1, 'Colonia Espiritu Santo Calle Principal Casa # 40', '2020-09-03 06:00:00'),
(12, 'Laboratorio', 25, '0000-0000', 12, 'Masculino', 1, 'Usulutan', '2021-01-01 06:00:00'),
(13, 'Usuario', 28, '0000-0000', 8, 'Masculino', 1, 'Barrio El Calvario, Usulutan', '2020-11-23 06:00:00'),
(14, 'Kriscia Iveth', 19, '7793-5538', 10, 'Femenino', 1, 'Canton Joya Ancha Arriba', '2021-09-22 06:00:00'),
(15, 'Luis Fernando', 24, '7922-1812', 14, 'Masculino', 1, '-', '2021-03-26 06:00:00'),
(16, 'Carla Ivette', 21, '7007-5534', 15, 'Femenino', 1, 'Cantón Ojo de Agua, Caserio San Jaime, Usulután, Usulután', '2022-01-11 06:00:00'),
(17, 'Mirna Veronica', 37, '7955-3701', 16, 'Femenino', 1, 'Colonia Las Colinas', '2013-06-01 06:00:00'),
(18, 'Rayos', 50, '0000-0000', 13, 'Femenino', 1, '6a Calle Ote #8, Usulután, El Salvador', '2000-01-01 06:00:00'),
(19, 'Allison Esmeralda', 28, '7858-1702', 15, 'Femenino', 1, 'Residencial Las Veraneras, Poligono W, Casa 4', '2022-06-24 06:00:00'),
(20, 'Silvia Leonor', 28, '7960-8566', 15, 'Femenino', 1, 'Entrada a Residencial San José', '2022-06-29 06:00:00'),
(21, 'Hazel Josseline', 25, '7725-7607', 17, 'Femenino', 1, '6ta calle oriente B La parroquia #21', '2022-01-17 06:00:00'),
(22, 'Jose Angel ', 26, '7031-9189', 1, 'Masculino', 1, 'Lot. Pueblo Nuevo KM112 Salida a San Miguel Usulutan', '2023-02-01 06:00:00'),
(23, 'Axwell Alexander Cortez Rodrigues', 20, '7895-6789', 1, 'Masculino', 1, 'San Miguel', '2023-04-07 21:52:43'),
(24, 'Chester Rodriguez', 25, '7895-6321', 4, 'Masculino', 0, 'San Miguel', '2023-04-07 22:31:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado_orden`
--

CREATE TABLE `tbl_estado_orden` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(50) NOT NULL,
  `creadoEstado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_estado_orden`
--

INSERT INTO `tbl_estado_orden` (`idEstado`, `nombreEstado`, `creadoEstado`) VALUES
(1, 'Recibido', '2023-03-20 23:47:44'),
(2, 'En Tránsito ', '2023-03-20 23:47:44'),
(3, 'Llego a destino', '2023-03-20 23:47:44'),
(4, 'Entregado', '2023-03-20 23:47:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `idMenu` int(11) NOT NULL,
  `nombreMenu` varchar(25) NOT NULL,
  `htmlMenu` text NOT NULL,
  `fechaMenu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`idMenu`, `nombreMenu`, `htmlMenu`, `fechaMenu`) VALUES
(1, 'Pacientes', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#patient\" aria-expanded=\"false\"\r\n                        aria-controls=\"patient\">\r\n                        <span><i class=\"fas fa-user\"></i>Pacientes</span>\r\n                    </a>\r\n                    <ul id=\"patient\" class=\"collapse\" aria-labelledby=\"patient\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Paciente/agregar_pacientes\">Agregar paciente</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Paciente/lista_pacientes\">Lista pacientes</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-29 19:00:15'),
(2, 'Hoja de cobro', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#hojaCobro\" aria-expanded=\"false\"\r\n        aria-controls=\"hojaCobro\">\r\n        <span><i class=\"fa fa-file\"></i>Hoja de cobro</span>\r\n    </a>\r\n    <ul id=\"hojaCobro\" class=\"collapse\" aria-labelledby=\"hojaCobro\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Hoja/\">Agregar Hoja</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Hoja/lista_hojas\">Listado de Hojas</a> </li>\r\n        <!--<li> <a href=\"<?php echo base_url(); ?>Hoja/lista_paquetes\">Paquetes</a> </li>-->\r\n        <li> <a href=\"<?php echo base_url(); ?>Hoja/lista_paquetes\">Paquetes</a> \r\n        <li> <a href=\"<?php echo base_url(); ?>ServiciosExternos/\">Servicios Externos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Proveedor/\">Proveedores</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Hoja/historial_hojas\">Historial de Hojas</a> </li>\r\n    </ul>\r\n</li>', '2021-04-29 19:00:15'),
(3, 'Botiquin', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#botiquin\" aria-expanded=\"false\"\r\n                        aria-controls=\"botiquin\">\r\n                        <span><i class=\"fa fa-thermometer\"></i>Botiquin</span>\r\n                    </a>\r\n                    <ul id=\"botiquin\" class=\"collapse\" aria-labelledby=\"botiquin\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Botiquin/\">Medicamentos</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Botiquin/agregar_medicamento\">Agregar compra</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Botiquin/historial_compras\">Historial compras</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Botiquin/kardex\">Movimientos</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-29 19:00:43'),
(4, 'Cotización', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#cotizacion\" aria-expanded=\"false\"\r\n                        aria-controls=\"cotizacion\">\r\n                        <span><i class=\"fa fa-file\"></i>Cotización</span>\r\n                    </a>\r\n                    <ul id=\"cotizacion\" class=\"collapse\" aria-labelledby=\"cotizacion\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Hoja/presupuesto\">Crear cotización</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Hoja/lista_presupuestos\">Listado de cotizaciones</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-29 21:20:37'),
(5, 'Gastos', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#gastos\" aria-expanded=\"false\"\r\n                        aria-controls=\"gastos\">\r\n                        <span><i class=\"fa fa-tasks\"></i>Gastos</span>\r\n                    </a>\r\n                    <ul id=\"gastos\" class=\"collapse\" aria-labelledby=\"gastos\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Gastos/\">Cuentas</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Gastos/control_gastos\">Control de gastos</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-30 17:20:44'),
(6, 'Médicos', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#doctor\" aria-expanded=\"false\"\r\n                        aria-controls=\"doctor\">\r\n                        <span><i class=\"fas fa-stethoscope\"></i>Médico</span>\r\n                    </a>\r\n                    <ul id=\"doctor\" class=\"collapse\" aria-labelledby=\"doctor\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Medico/\">Lista médicos</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-30 17:20:44'),
(7, 'Empleados', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#empleados\" aria-expanded=\"false\"\r\n                        aria-controls=\"empleados\">\r\n                        <span><i class=\"fas fa-users\"></i>Empleados</span>\r\n                    </a>\r\n                    <ul id=\"empleados\" class=\"collapse\" aria-labelledby=\"empleados\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Empleado/\">Agregar empleado</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Empleado/lista_empleados\">Lista empleados</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Empleado/vacaciones_empleados\">Cumpleañeros</a> </li>\r\n                        <li> <a href=\"<?php echo base_url(); ?>Empleado/cargos_empleados\">Cargos</a> </li>\r\n                    </ul>\r\n                </li>', '2021-04-30 17:20:44'),
(8, 'Habitaciones', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#habitacion\" aria-expanded=\"false\"\r\n        aria-controls=\"habitacion\">\r\n        <span><i class=\"fas fa-hospital\"></i>Habitaciones</span>\r\n    </a>\r\n    <ul id=\"habitacion\" class=\"collapse\" aria-labelledby=\"habitacion\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Paciente/esquema_habitaciones\">Esquema de habitaciones</a></li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Paciente/senso_diario\">Censo diario</a></li>\r\n    </ul>\r\n</li>', '2021-04-30 17:20:44'),
(9, 'Reportes', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#reportes\" aria-expanded=\"false\"\r\n        aria-controls=\"reportes\">\r\n        <span><i class=\"fas fa-file-invoice-dollar\"></i>Reportes</span>\r\n    </a>\r\n    <ul id=\"reportes\" class=\"collapse\" aria-labelledby=\"reportes\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/liquidacion_caja\">Liquidación de caja</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/cobros_pacientes\">Cobros a pacientes</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/externos_hoja\">Externos por hoja</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/usg_rx\">USG y RX</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/rx_laboratorio\">RX y Laboratorio</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/ingresos_costos_gastos\">Ingresos, Costos, Gastos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/detalle_gastos\">Detalle gastos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/detalle_facturas\">Facturas</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/salidas_botiquin\">Salidas de botiquín</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/detalle_medicamento\">Detalle medicamento</a> </li>\r\n    </ul>\r\n</li>', '2021-04-30 17:20:44'),
(10, 'Configuraciòn', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#configuracion\"\r\n                        aria-expanded=\"false\" aria-controls=\"configuracion\">\r\n                        <span><i class=\"fa fa-cog\"></i>Configuración</span>\r\n                    </a>\r\n                    <ul id=\"configuracion\" class=\"collapse\" aria-labelledby=\"configuracion\"\r\n                        data-parent=\"#side-nav-accordion\">\r\n                        <li><a href=\"<?php echo base_url(); ?>Accesos/\">Accesos</a></li>\r\n                        <li><a href=\"<?php echo base_url(); ?>Usuarios/gestion_usuarios\">Usuarios</a></li>\r\n                        <li><a href=\"<?php echo base_url(); ?>Permisos/\">Permisos</a></li>\r\n	     <li><a href=\"<?php echo base_url(); ?>Herramientas/movimientos_hojas\">Movimientos hoja</a></li>\r\n                    </ul>\r\n                </li>', '2021-04-30 17:20:44'),
(11, 'Cuentas por pagar', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#pagar\" aria-expanded=\"false\" aria-controls=\"pagar\">\r\n        <span><i class=\"fas fa-clipboard-list\"></i>Cuentas por pagar</span>\r\n    </a>\r\n    <ul id=\"pagar\" class=\"collapse\" aria-labelledby=\"pagar\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>CuentasPendientes/cuentas_por_pagar\">Gestión cuentas</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>CuentasPendientes/cuentas_por_proveedor\">Cuentas por proveedor</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>CuentasPendientes/cuentas_por_fecha\">Cuentas por fecha</a> </li>\r\n    </ul>\r\n</li>', '2021-05-18 16:29:04'),
(12, 'Stock Medicamentos', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#stock\" aria-expanded=\"false\"\r\n        aria-controls=\"stock\">\r\n        <span><i class=\"fas fa-clipboard-list\"></i>Stock Medicamentos</span>\r\n    </a>\r\n    <ul id=\"stock\" class=\"collapse\" aria-labelledby=\"stock\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Botiquin/stock_medicamentos\">Actualizar Stock</a> </li>\r\n    </ul>\r\n</li>', '2021-06-30 13:54:18'),
(13, 'Laboratorio', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#laboratorio\" aria-expanded=\"false\"aria-controls=\"laboratorio\">\r\n        <span><i class=\"fas fa-flask\"></i>Laboratorio</span>\r\n    </a>\r\n    <ul id=\"laboratorio\" class=\"collapse\" aria-labelledby=\"laboratorio\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Laboratorio/agregar_examen\">Agregar examen</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Laboratorio/examenes_realizados\">Examenes realizados</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Laboratorio/historial_examenes\">Historial examenes</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Laboratorio/resumen_examenes\">Resumen examenes</a> </li>\r\n    </ul>\r\n</li>', '2021-09-25 14:27:48'),
(14, 'Honorarios', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#honorarios\" aria-expanded=\"false\"aria-controls=\"honorarios\">\r\n        <span><i class=\"fa fa-money-bill\"></i>Honorarios</span>\r\n    </a>\r\n    <ul id=\"honorarios\" class=\"collapse\" aria-labelledby=\"laboratorio\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Honorarios/gestion_honorarios\">Gestion de honorarios</a> </li>\r\n    </ul>\r\n</li>', '2021-11-23 22:07:16'),
(15, 'Reporte', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#reporte\" aria-expanded=\"false\"\r\n        aria-controls=\"reporte\">\r\n        <span><i class=\"fas fa-file-invoice-dollar\"></i>Reporte</span>\r\n    </a>\r\n    <ul id=\"reporte\" class=\"collapse\" aria-labelledby=\"reporte\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Reportes/externos_hoja\">Externos por hoja</a> </li>\r\n    </ul>\r\n</li>', '2021-12-04 14:19:05'),
(16, 'Facturación', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#anuncio\" aria-expanded=\"false\"aria-controls=\"anuncio\">\r\n        <span><i class=\"fas fa-newspaper\"></i>Facturación</span>\r\n    </a>\r\n    <ul id=\"anuncio\" class=\"collapse\" aria-labelledby=\"laboratorio\" data-parent=\"#side-nav-accordion\">\r\n        <!-- <li> <a href=\"<?php echo base_url(); ?>Herramientas/agregar_anuncio\">Gestion de anuncios</a> </li> -->\r\n        <!-- <li> <a href=\"<?php echo base_url(); ?>Herramientas/factura_isbm\">Factura ISBM</a> </li> -->\r\n        <li> <a href=\"<?php echo base_url(); ?>Herramientas/facturacion\">Facturación</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Herramientas/resumen_diario\">Resumen diario</a> </li>\r\n    </ul>\r\n</li>', '2021-12-17 14:25:07'),
(17, 'Consultas ISBM', '<li class=\"menu-item\">\r\n                    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#botiquin\" aria-expanded=\"false\"\r\n                        aria-controls=\"botiquin\">\r\n                        <span><i class=\"fa fa-thermometer\"></i>Botiquin</span>\r\n                    </a>\r\n                    <ul id=\"botiquin\" class=\"collapse\" aria-labelledby=\"botiquin\" data-parent=\"#side-nav-accordion\">\r\n                        <li> <a href=\"<?php echo base_url(); ?>Botiquin/\">Medicamentos</a> </li>\r\n                    </ul>\r\n                </li>', '2022-01-10 14:51:51'),
(18, 'Precio medicamentos', '<li class=\"menu-item\">\r\n    <a href=\"<?php echo base_url(); ?>Botiquin/precios_medicamentos/\">\r\n    <span><i class=\"fas fa-list\"></i>Precio medicamentos</span>\r\n    </a>\r\n</li>', '2022-02-14 14:02:15'),
(19, 'Hemodialisis', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#hemodialisis\" aria-expanded=\"false\" aria-controls=\"hemodialisis\">\r\n        <span><i class=\"fa fa-tasks\"></i>Hemodiálisis </span>\r\n    </a>\r\n    <ul id=\"hemodialisis\" class=\"collapse\" aria-labelledby=\"hemodialisis\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Hemodialisis/agregar_paciente/\">Agregar paciente</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Hemodialisis/agregar_cita/\">Agregar cita</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Hemodialisis/lista_citas/\">Lista citas</a> </li>\r\n    </ul>\r\n</li>', '2022-02-21 13:36:48'),
(20, 'ISBM, Hemo, Empleados', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#isbm\" aria-expanded=\"false\" aria-controls=\"isbm\">\r\n        <span><i class=\"fa fa-tablets\"></i>ISBM, Hemo, Empleados</span>\r\n    </a>\r\n    <ul id=\"isbm\" class=\"collapse\" aria-labelledby=\"isbm\" data-parent=\"#side-nav-accordion\">\r\n        <!--<li> <a href=\"<?php echo base_url(); ?>Isbm/cuentas_isbm/\">Crear Requisición</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Isbm/cuentas_isbm/\">Lista requisiciones</a> </li>-->\r\n        <li> <a href=\"<?php echo base_url(); ?>Isbm/cuenta_descargo/\">Crear cuenta para descargos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Isbm/lista_cuenta_descargos/\">Lista cuenta descargos</a> </li>\r\n    </ul>\r\n</li>', '2022-04-26 20:39:22'),
(21, 'Insumos laboratorio', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#insumosLab\" aria-expanded=\"false\" aria-controls=\"insumosLab\">\r\n        <span><i class=\"fa fa-vials\"></i>Insumos laboratorio</span>\r\n    </a>\r\n    <ul id=\"insumosLab\" class=\"collapse\" aria-labelledby=\"insumosLab\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosLab/agregar_compra/\">Agregar compra</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosLab/lista_compras/\">Lista compras</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosLab/lista_insumos/\">Lista insumos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosLab/gestion_insumos/\">Salidas</a> </li>\r\n       <li> <a href=\"<?php echo base_url(); ?>InsumosLab/donantes/\">Donantes</a> </li>\r\n       <li> <a href=\"<?php echo base_url(); ?>InsumosLab/lista_donantes/\">Lista donantes</a> </li>\r\n    </ul>\r\n</li>', '2022-07-13 12:49:45'),
(22, 'Insumos limpieza', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#insumosLimpieza\" aria-expanded=\"false\" aria-controls=\"insumosLimpieza\">\r\n        <span><i class=\"fa fa-list\"></i>Insumos limpieza</span>\r\n    </a>\r\n    <ul id=\"insumosLimpieza\" class=\"collapse\" aria-labelledby=\"insumosLimpieza\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Limpieza/agregar_compra/\">Agregar compra</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Limpieza/lista_compras/\">Lista compras</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Limpieza/descargos_insumos/\">Salidas</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Limpieza/\">Gestión insumos</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Limpieza/seguimiento_insumos/\">Seguimiento insumos</a> </li>\r\n    </ul>\r\n</li>', '2022-08-30 14:56:51'),
(23, 'Insumos Hemodialisis', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#insumosHemodialisis\" aria-expanded=\"false\" aria-controls=\"insumosHemodialisis\">\r\n        <span><i class=\"fa fa-notes-medical\"></i>Insumos Hemodialisis</span>\r\n    </a>\r\n    <ul id=\"insumosHemodialisis\" class=\"collapse\" aria-labelledby=\"insumosHemodialisis\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosHemo/agregar_compra/\">Agregar compra</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosHemo/lista_compras/\">Lista compras</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosHemo/descargos_insumos/\">Salidas</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>InsumosHemo/\">Gestión insumos</a> </li>\r\n    </ul>\r\n</li>', '2022-09-26 13:54:22'),
(24, 'Planilla', '<li class=\"menu-item\">\r\n    <a href=\"#\" class=\"has-chevron\" data-toggle=\"collapse\" data-target=\"#planilla\" aria-expanded=\"false\" aria-controls=\"planilla\">\r\n        <span><i class=\"fa fa-users\"></i>Planilla</span>\r\n    </a>\r\n    <ul id=\"planilla\" class=\"collapse\" aria-labelledby=\"planilla\" data-parent=\"#side-nav-accordion\">\r\n        <li> <a href=\"<?php echo base_url(); ?>Planilla/\">Crear planilla</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Planilla/historial_planillas/\">Historial planilla</a> </li>\r\n        <li> <a href=\"<?php echo base_url(); ?>Planilla/personal_planilla/\">Personal planilla</a> </li>\r\n</li>', '2023-02-27 14:35:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ordenes`
--

CREATE TABLE `tbl_ordenes` (
  `idOrden` int(11) NOT NULL,
  `codigoOrden` int(11) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `emisorOrden` int(11) NOT NULL,
  `receptorOrden` int(11) NOT NULL,
  `destinoOrden` int(11) NOT NULL,
  `tipoPago` varchar(15) NOT NULL,
  `estadoPago` varchar(15) NOT NULL,
  `tipoServicio` varchar(15) NOT NULL,
  `otraDireccionOrden` text NOT NULL,
  `gestorOrden` int(11) NOT NULL,
  `direccionOrden` text NOT NULL,
  `observacionesOrden` text NOT NULL,
  `estadoOrden` int(11) NOT NULL DEFAULT 1,
  `creadaOrden` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_ordenes`
--

INSERT INTO `tbl_ordenes` (`idOrden`, `codigoOrden`, `fechaIngreso`, `emisorOrden`, `receptorOrden`, `destinoOrden`, `tipoPago`, `estadoPago`, `tipoServicio`, `otraDireccionOrden`, `gestorOrden`, `direccionOrden`, `observacionesOrden`, `estadoOrden`, `creadaOrden`) VALUES
(1, 1000, '2023-03-20', 1, 1, 2, 'Efectivo', 'Pagado', 'Entrega', '', 1, '', 'Tratar con cuidado', 1, '2023-03-20 23:12:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permisos`
--

CREATE TABLE `tbl_permisos` (
  `idPermiso` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idAcceso` int(11) NOT NULL,
  `estadoPermiso` int(11) NOT NULL,
  `fechaPermiso` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_permisos`
--

INSERT INTO `tbl_permisos` (`idPermiso`, `idMenu`, `idAcceso`, `estadoPermiso`, `fechaPermiso`) VALUES
(1, 1, 1, 1, '2021-04-29 19:41:05'),
(2, 3, 1, 1, '2021-04-29 19:41:05'),
(3, 2, 1, 1, '2021-04-29 21:13:09'),
(4, 4, 1, 1, '2021-04-30 18:48:46'),
(5, 5, 1, 1, '2021-04-30 18:48:46'),
(6, 6, 1, 1, '2021-04-30 18:48:46'),
(7, 7, 1, 1, '2021-04-30 18:48:46'),
(8, 8, 1, 1, '2021-04-30 18:48:47'),
(9, 9, 1, 1, '2021-04-30 18:48:47'),
(10, 10, 1, 1, '2021-04-30 18:48:47'),
(11, 3, 3, 1, '2021-05-03 17:17:51'),
(12, 2, 3, 1, '2021-05-03 18:31:34'),
(13, 1, 3, 1, '2021-05-03 18:41:32'),
(14, 11, 1, 1, '2021-05-18 16:29:19'),
(15, 1, 4, 1, '2021-06-15 15:40:40'),
(16, 2, 4, 1, '2021-06-15 15:40:40'),
(17, 3, 4, 1, '2021-06-15 15:40:40'),
(18, 4, 4, 1, '2021-06-15 15:40:40'),
(19, 5, 4, 1, '2021-06-15 15:40:40'),
(20, 8, 4, 1, '2021-06-15 15:40:40'),
(21, 4, 3, 1, '2021-06-15 15:43:17'),
(22, 2, 2, 1, '2021-06-24 16:25:36'),
(23, 4, 2, 1, '2021-06-24 16:25:36'),
(24, 6, 2, 1, '2021-06-24 16:25:56'),
(25, 6, 4, 1, '2021-06-24 16:39:55'),
(26, 6, 3, 1, '2021-06-24 16:41:25'),
(27, 2, 5, 1, '2021-06-29 13:00:56'),
(28, 5, 5, 1, '2021-06-29 13:00:56'),
(29, 9, 5, 1, '2021-06-29 13:00:56'),
(30, 11, 5, 1, '2021-06-29 13:00:56'),
(31, 1, 2, 1, '2021-06-29 13:15:02'),
(32, 12, 1, 1, '2021-06-30 13:55:15'),
(33, 1, 7, 1, '2021-07-01 12:17:54'),
(34, 2, 7, 1, '2021-07-01 12:17:54'),
(35, 9, 4, 1, '2021-07-01 14:01:07'),
(36, 1, 5, 1, '2021-07-02 19:40:22'),
(37, 6, 5, 1, '2021-07-02 19:40:22'),
(38, 12, 3, 1, '2021-07-05 13:13:27'),
(39, 1, 9, 1, '2021-07-16 15:37:23'),
(40, 2, 9, 1, '2021-07-16 15:37:23'),
(41, 3, 9, 1, '2021-07-16 15:37:24'),
(42, 4, 9, 1, '2021-07-16 15:37:24'),
(43, 5, 9, 1, '2021-07-16 15:37:24'),
(44, 6, 9, 1, '2021-07-16 15:37:24'),
(45, 7, 9, 1, '2021-07-16 15:37:24'),
(46, 8, 9, 1, '2021-07-16 15:37:24'),
(47, 9, 9, 1, '2021-07-16 15:37:24'),
(48, 13, 1, 1, '2021-09-25 15:32:19'),
(49, 13, 7, 1, '2021-09-27 13:38:40'),
(50, 1, 8, 1, '2021-10-23 16:50:40'),
(51, 2, 8, 1, '2021-10-23 16:50:40'),
(52, 4, 8, 1, '2021-10-23 16:50:40'),
(53, 6, 8, 1, '2021-10-23 16:50:40'),
(54, 14, 1, 1, '2021-11-23 22:08:18'),
(55, 14, 5, 1, '2021-11-24 13:14:23'),
(56, 14, 4, 1, '2021-11-26 15:45:12'),
(57, 1, 10, 1, '2021-12-04 14:30:21'),
(58, 2, 10, 1, '2021-12-04 14:30:22'),
(59, 4, 10, 1, '2021-12-04 14:30:22'),
(60, 15, 10, 1, '2021-12-04 14:30:22'),
(61, 6, 10, 1, '2021-12-04 14:31:34'),
(62, 15, 2, 0, '2021-12-13 17:19:15'),
(63, 16, 1, 1, '2021-12-17 14:25:16'),
(64, 16, 10, 1, '2021-12-17 16:17:48'),
(65, 16, 2, 1, '2021-12-17 21:34:02'),
(66, 16, 9, 1, '2021-12-20 14:17:01'),
(67, 14, 10, 1, '2021-12-30 15:52:38'),
(68, 1, 11, 1, '2022-01-07 20:56:19'),
(69, 2, 11, 1, '2022-01-07 20:56:19'),
(70, 3, 11, 1, '2022-01-07 20:56:19'),
(71, 4, 11, 1, '2022-01-07 20:56:19'),
(72, 6, 11, 1, '2022-01-07 20:56:19'),
(73, 17, 12, 1, '2022-01-10 14:52:07'),
(74, 16, 5, 1, '2022-01-24 15:42:19'),
(75, 1, 13, 1, '2022-02-01 13:58:12'),
(76, 2, 13, 1, '2022-02-01 13:58:12'),
(77, 6, 13, 1, '2022-02-01 13:58:13'),
(78, 18, 1, 1, '2022-02-14 14:02:59'),
(79, 18, 11, 0, '2022-02-14 14:04:01'),
(80, 18, 3, 1, '2022-02-14 14:04:35'),
(81, 18, 8, 1, '2022-02-14 14:04:49'),
(82, 18, 4, 1, '2022-02-14 14:05:01'),
(83, 18, 2, 1, '2022-02-14 14:05:14'),
(84, 18, 10, 1, '2022-02-14 14:05:30'),
(85, 12, 11, 0, '2022-02-16 14:53:27'),
(86, 19, 13, 1, '2022-02-21 13:37:59'),
(87, 19, 1, 1, '2022-02-21 13:40:14'),
(88, 8, 11, 1, '2022-02-24 17:47:25'),
(89, 3, 5, 1, '2022-04-26 20:21:38'),
(90, 20, 3, 1, '2022-04-26 20:40:15'),
(91, 20, 1, 1, '2022-04-26 20:40:35'),
(92, 20, 11, 1, '2022-04-27 14:22:43'),
(93, 21, 7, 1, '2022-07-13 12:50:06'),
(94, 21, 1, 1, '2022-07-16 13:10:25'),
(95, 18, 15, 1, '2022-08-01 14:09:44'),
(96, 22, 1, 1, '2022-08-30 15:08:15'),
(97, 23, 5, 1, '2022-09-26 13:54:31'),
(98, 23, 1, 1, '2022-09-26 13:57:32'),
(99, 18, 13, 1, '2022-10-20 14:31:45'),
(100, 21, 16, 1, '2023-02-02 14:17:38'),
(101, 22, 16, 1, '2023-02-02 14:17:38'),
(102, 23, 16, 1, '2023-02-02 14:17:39'),
(103, 24, 1, 1, '2023-02-27 14:35:19'),
(104, 24, 4, 1, '2023-02-27 14:40:04'),
(105, 15, 1, 1, '2023-04-08 23:37:11'),
(106, 17, 1, 1, '2023-04-08 23:38:18'),
(107, 1, 19, 1, '2023-04-08 23:47:11'),
(108, 2, 19, 1, '2023-04-08 23:47:11'),
(109, 3, 19, 1, '2023-04-08 23:47:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_receptores`
--

CREATE TABLE `tbl_receptores` (
  `idCliente` int(11) NOT NULL,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text NOT NULL,
  `documentoCliente` varchar(15) NOT NULL,
  `telefonoCliente` varchar(15) NOT NULL,
  `direccionCliente` text NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_receptores`
--

INSERT INTO `tbl_receptores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 23:08:03', 1),
(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 23:08:40', 1),
(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-21 04:04:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `psUsuario` varchar(25) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idAcceso` int(11) NOT NULL,
  `estadoUsuario` int(11) NOT NULL DEFAULT 1,
  `fechaUsuario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`idUsuario`, `nombreUsuario`, `psUsuario`, `idEmpleado`, `idAcceso`, `estadoUsuario`, `fechaUsuario`) VALUES
(1, 'Informatica', '0d01c3f03a5957680fae71ddb', 1, 1, 1, '2021-04-29 23:05:52'),
(2, 'CARLA ORTEZ', 'ffc0d3e0050c7e80a4b74dc81', 3, 3, 1, '2021-05-03 23:17:36'),
(3, 'CARLA PAREDES', '51bf195bf5654e4909e3166db', 4, 3, 1, '2021-06-15 21:35:21'),
(4, 'CATALINA GOMEZ', '09f5e38cb53313959c5e28864', 5, 3, 1, '2021-06-15 21:37:21'),
(5, 'ELENA CRUZ', '3f7f41fb8e972a91b38d19325', 6, 4, 1, '2021-06-15 21:39:02'),
(6, 'ALBA RAMIREZ', '7f2264fd031a37eff93eee36c', 8, 2, 1, '2021-06-24 22:22:11'),
(7, 'WENDY SERPAS', 'd5dff56e8607bbc8f678a2714', 9, 2, 1, '2021-06-24 22:29:17'),
(8, 'JACQUELINNE TREJO', 'b6683b0b0fb3b20575b6fbfa9', 7, 10, 1, '2021-06-24 22:34:02'),
(9, 'PATRICIA GARCIA', '6bbea091fbcbe4770f208a628', 10, 2, 1, '2021-06-26 01:40:06'),
(10, 'CARLOS MARTINEZ', 'd2f0c294711426f440af6c188', 11, 5, 1, '2021-06-29 18:51:00'),
(11, 'LABORATORIO', '6e3f560530f160dc58dcd01aa', 12, 7, 1, '2021-07-01 18:16:52'),
(12, 'INVITADO', '7f807cfd0c0f23e81ff4c31e0', 13, 1, 1, '2021-07-16 21:33:33'),
(13, 'KRISCIA SEGOVIA', 'e9337ab1ef7e2ef2b557c504b', 14, 11, 1, '2021-09-24 02:41:16'),
(14, 'FERNANDO VARAONA', 'f92ee076bfaf8a653ba172adc', 15, 12, 1, '2022-01-10 20:50:16'),
(15, 'CARLA LOPEZ ', 'bfa3ba9c72c2b00ee01e8376e', 16, 2, 1, '2022-01-11 22:04:09'),
(16, 'MIRNA RAMIREZ', 'b9cc21fd2720e8433543d7083', 17, 13, 1, '2022-02-01 20:38:48'),
(17, 'Rayos X', '94bc09728be5328b5e22ef02f', 18, 14, 1, '2022-02-19 21:28:05'),
(18, 'ALLISON MARTINEZ', '9258d54363145d88d9007f71f', 19, 2, 1, '2022-07-06 18:35:43'),
(19, 'SILVIA CAMPOS', '1fb2a1c37b18aa4611c3949d6', 20, 2, 1, '2022-07-06 19:08:16'),
(20, 'HAZEL GRIMALDI', 'd7e3c58845a8fb04775ec5eab', 21, 15, 1, '2022-08-01 20:07:24'),
(21, 'JOSE CHAVEZ', 'b8224ec7c1b07e5eff278cefb', 22, 16, 1, '2023-02-02 20:16:51'),
(22, 'Testing', '202cb962ac59075b964b07152', 3, 3, 0, '2023-04-08 23:02:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_accesos`
--
ALTER TABLE `tbl_accesos`
  ADD PRIMARY KEY (`idAcceso`);

--
-- Indices de la tabla `tbl_cargos`
--
ALTER TABLE `tbl_cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `tbl_destinos`
--
ALTER TABLE `tbl_destinos`
  ADD PRIMARY KEY (`idDestino`);

--
-- Indices de la tabla `tbl_detalle_orden`
--
ALTER TABLE `tbl_detalle_orden`
  ADD PRIMARY KEY (`idDetalle`);

--
-- Indices de la tabla `tbl_emisores`
--
ALTER TABLE `tbl_emisores`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `tbl_estado_orden`
--
ALTER TABLE `tbl_estado_orden`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  ADD PRIMARY KEY (`idOrden`);

--
-- Indices de la tabla `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  ADD PRIMARY KEY (`idPermiso`);

--
-- Indices de la tabla `tbl_receptores`
--
ALTER TABLE `tbl_receptores`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_accesos`
--
ALTER TABLE `tbl_accesos`
  MODIFY `idAcceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_cargos`
--
ALTER TABLE `tbl_cargos`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_destinos`
--
ALTER TABLE `tbl_destinos`
  MODIFY `idDestino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_orden`
--
ALTER TABLE `tbl_detalle_orden`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_emisores`
--
ALTER TABLE `tbl_emisores`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_estado_orden`
--
ALTER TABLE `tbl_estado_orden`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_permisos`
--
ALTER TABLE `tbl_permisos`
  MODIFY `idPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `tbl_receptores`
--
ALTER TABLE `tbl_receptores`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
