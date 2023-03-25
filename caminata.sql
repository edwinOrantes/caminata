-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_caminata
CREATE DATABASE IF NOT EXISTS `db_caminata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_caminata`;

-- Volcando estructura para tabla db_caminata.tbl_destinos
CREATE TABLE IF NOT EXISTS `tbl_destinos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestino` varchar(50) NOT NULL,
  `creadoDestino` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_destinos: ~2 rows (aproximadamente)
INSERT INTO `tbl_destinos` (`idDestino`, `nombreDestino`, `creadoDestino`) VALUES
	(1, 'Usulután', '2023-03-20 23:05:55'),
	(2, 'Los Angeles', '2023-03-20 23:05:55');

-- Volcando estructura para tabla db_caminata.tbl_detalle_orden
CREATE TABLE IF NOT EXISTS `tbl_detalle_orden` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idOrden` int(11) NOT NULL,
  `nombreArticulo` text NOT NULL,
  `pesoArticulo` decimal(9,2) NOT NULL,
  `precioKilo` decimal(9,2) NOT NULL,
  `totalArticulo` decimal(9,2) NOT NULL,
  `detalleArticulo` text NOT NULL,
  `qrArticulo` text NOT NULL,
  `eliminadoArticulo` int(11) NOT NULL DEFAULT 1,
  `creadoArticulo` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla db_caminata.tbl_detalle_orden: ~2 rows (aproximadamente)
INSERT INTO `tbl_detalle_orden` (`idDetalle`, `idOrden`, `nombreArticulo`, `pesoArticulo`, `precioKilo`, `totalArticulo`, `detalleArticulo`, `qrArticulo`, `eliminadoArticulo`, `creadoArticulo`) VALUES
	(1, 1, 'Pantalon comando', 30.00, 26.00, 780.00, 'Tonteras', '', 1, '2023-03-25 22:46:33'),
	(2, 1, 'Pollo Campero', 10.00, 5.55, 55.50, 'Pollo cocinado', '', 1, '2023-03-25 23:47:46');

-- Volcando estructura para tabla db_caminata.tbl_emisores
CREATE TABLE IF NOT EXISTS `tbl_emisores` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text NOT NULL,
  `documentoCliente` varchar(15) NOT NULL,
  `telefonoCliente` varchar(15) NOT NULL,
  `direccionCliente` text NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_emisores: ~3 rows (aproximadamente)
INSERT INTO `tbl_emisores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
	(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 23:08:03', 1),
	(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 23:08:40', 1),
	(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-21 04:04:33', 1);

-- Volcando estructura para tabla db_caminata.tbl_estado_orden
CREATE TABLE IF NOT EXISTS `tbl_estado_orden` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(50) NOT NULL,
  `creadoEstado` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_estado_orden: ~4 rows (aproximadamente)
INSERT INTO `tbl_estado_orden` (`idEstado`, `nombreEstado`, `creadoEstado`) VALUES
	(1, 'Recibido', '2023-03-20 23:47:44'),
	(2, 'En Tránsito ', '2023-03-20 23:47:44'),
	(3, 'Llego a destino', '2023-03-20 23:47:44'),
	(4, 'Entregado', '2023-03-20 23:47:44');

-- Volcando estructura para tabla db_caminata.tbl_ordenes
CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `idOrden` int(11) NOT NULL AUTO_INCREMENT,
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
  `creadaOrden` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idOrden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_ordenes: ~1 rows (aproximadamente)
INSERT INTO `tbl_ordenes` (`idOrden`, `codigoOrden`, `fechaIngreso`, `emisorOrden`, `receptorOrden`, `destinoOrden`, `tipoPago`, `estadoPago`, `tipoServicio`, `otraDireccionOrden`, `gestorOrden`, `direccionOrden`, `observacionesOrden`, `estadoOrden`, `creadaOrden`) VALUES
	(1, 1000, '2023-03-20', 1, 1, 2, 'Efectivo', 'Pagado', 'Entrega', '', 1, '', 'Tratar con cuidado', 1, '2023-03-20 23:12:18');

-- Volcando estructura para tabla db_caminata.tbl_receptores
CREATE TABLE IF NOT EXISTS `tbl_receptores` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text NOT NULL,
  `documentoCliente` varchar(15) NOT NULL,
  `telefonoCliente` varchar(15) NOT NULL,
  `direccionCliente` text NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_receptores: ~3 rows (aproximadamente)
INSERT INTO `tbl_receptores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
	(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 23:08:03', 1),
	(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 23:08:40', 1),
	(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-21 04:04:33', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
