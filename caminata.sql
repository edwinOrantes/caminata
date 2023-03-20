-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla db_caminata.tbl_destinos
CREATE TABLE IF NOT EXISTS `tbl_destinos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestino` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `creadoDestino` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_destinos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_destinos` DISABLE KEYS */;
INSERT INTO `tbl_destinos` (`idDestino`, `nombreDestino`, `creadoDestino`) VALUES
	(1, 'Usulután', '2023-03-20 17:05:55'),
	(2, 'Los Angeles', '2023-03-20 17:05:55');
/*!40000 ALTER TABLE `tbl_destinos` ENABLE KEYS */;

-- Volcando estructura para tabla db_caminata.tbl_emisores
CREATE TABLE IF NOT EXISTS `tbl_emisores` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text COLLATE utf8_spanish_ci NOT NULL,
  `documentoCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `telefonoCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccionCliente` text COLLATE utf8_spanish_ci NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_emisores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_emisores` DISABLE KEYS */;
INSERT INTO `tbl_emisores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
	(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 17:08:03', 1),
	(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 17:08:40', 1),
	(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-20 22:04:33', 1);
/*!40000 ALTER TABLE `tbl_emisores` ENABLE KEYS */;

-- Volcando estructura para tabla db_caminata.tbl_estado_orden
CREATE TABLE IF NOT EXISTS `tbl_estado_orden` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `creadoEstado` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_estado_orden: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_estado_orden` DISABLE KEYS */;
INSERT INTO `tbl_estado_orden` (`idEstado`, `nombreEstado`, `creadoEstado`) VALUES
	(1, 'Recibido', '2023-03-20 17:47:44'),
	(2, 'En Tránsito ', '2023-03-20 17:47:44'),
	(3, 'Llego a destino', '2023-03-20 17:47:44'),
	(4, 'Entregado', '2023-03-20 17:47:44');
/*!40000 ALTER TABLE `tbl_estado_orden` ENABLE KEYS */;

-- Volcando estructura para tabla db_caminata.tbl_ordenes
CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `idOrden` int(11) NOT NULL AUTO_INCREMENT,
  `codigoOrden` int(11) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `emisorOrden` int(11) NOT NULL,
  `receptorOrden` int(11) NOT NULL,
  `destinoOrden` int(11) NOT NULL,
  `tipoPago` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `estadoPago` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tipoServicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `otraDireccionOrden` text COLLATE utf8_spanish_ci NOT NULL,
  `gestorOrden` int(11) NOT NULL,
  `direccionOrden` text COLLATE utf8_spanish_ci NOT NULL,
  `observacionesOrden` text COLLATE utf8_spanish_ci NOT NULL,
  `estadoOrden` int(11) NOT NULL DEFAULT 1,
  `creadaOrden` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idOrden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_ordenes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_ordenes` (`idOrden`, `codigoOrden`, `fechaIngreso`, `emisorOrden`, `receptorOrden`, `destinoOrden`, `tipoPago`, `estadoPago`, `tipoServicio`, `otraDireccionOrden`, `gestorOrden`, `direccionOrden`, `observacionesOrden`, `estadoOrden`, `creadaOrden`) VALUES
	(1, 1000, '2023-03-20', 1, 1, 2, 'Efectivo', 'Pagado', 'Entrega', '', 1, '', 'Tratar con cuidado', 1, '2023-03-20 17:12:18');
/*!40000 ALTER TABLE `tbl_ordenes` ENABLE KEYS */;

-- Volcando estructura para tabla db_caminata.tbl_receptores
CREATE TABLE IF NOT EXISTS `tbl_receptores` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` int(11) NOT NULL,
  `nombreCliente` text COLLATE utf8_spanish_ci NOT NULL,
  `documentoCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `telefonoCliente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccionCliente` text COLLATE utf8_spanish_ci NOT NULL,
  `creadoCliente` timestamp NOT NULL DEFAULT current_timestamp(),
  `estadoCliente` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_caminata.tbl_receptores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_receptores` DISABLE KEYS */;
INSERT INTO `tbl_receptores` (`idCliente`, `codigoCliente`, `nombreCliente`, `documentoCliente`, `telefonoCliente`, `direccionCliente`, `creadoCliente`, `estadoCliente`) VALUES
	(1, 1000, 'Juan Antonio Campos Sanchez', '47856946', '70152634', 'Barrio el Calvario, Usulutan', '2023-03-20 17:08:03', 1),
	(2, 1001, 'Flor de Maria Fuentes Saravia', '56987456', '78956321', 'Santa Maria, Usulutan', '2023-03-20 17:08:40', 1),
	(3, 1002, 'Carmen del Cid Medrano', '05123698', '74569812', 'El centro, Usulutan', '2023-03-20 22:04:33', 1);
/*!40000 ALTER TABLE `tbl_receptores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
