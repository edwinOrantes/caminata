-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2023 a las 00:55:06
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
(2, 1, 'Pollo Campero', '10.00', '5.55', '55.50', 'Pollo cocinado', '', 1, '2023-03-25 23:47:46');

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

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `tbl_estado_orden`
--
ALTER TABLE `tbl_estado_orden`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  ADD PRIMARY KEY (`idOrden`);

--
-- Indices de la tabla `tbl_receptores`
--
ALTER TABLE `tbl_receptores`
  ADD PRIMARY KEY (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_destinos`
--
ALTER TABLE `tbl_destinos`
  MODIFY `idDestino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_orden`
--
ALTER TABLE `tbl_detalle_orden`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_emisores`
--
ALTER TABLE `tbl_emisores`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_estado_orden`
--
ALTER TABLE `tbl_estado_orden`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_ordenes`
--
ALTER TABLE `tbl_ordenes`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_receptores`
--
ALTER TABLE `tbl_receptores`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
