-- phpMyAdmin SQL Dump
-- version 5.2.1
--
-- Fundación Universitaria del Área Andina - Gestión de Bases de Datos 202410-1A - 11  :: 2024
-- Lucy Andrea Gallo Rico
-- Cristyan Vergara Pineda
-- Yessica Salguero Huertas


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `registro_desempleo_2024`
--
CREATE DATABASE IF NOT EXISTS `registro_desempleo_2024` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `registro_desempleo_2024`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_oferta`
--

DROP TABLE IF EXISTS `aplicacion_oferta`;
CREATE TABLE IF NOT EXISTS `aplicacion_oferta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `id_oferta_trabajo` int(11) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `estado` enum('Aplicación','Revisión de Doc','Selección','Entrevista','Aceptado','No Seleccionado') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  KEY `id_oferta_trabajo` (`id_oferta_trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacion_persona_sector_laboral`
--

DROP TABLE IF EXISTS `asociacion_persona_sector_laboral`;
CREATE TABLE IF NOT EXISTS `asociacion_persona_sector_laboral` (
  `id_persona` int(11) NOT NULL,
  `id_sector_laboral` int(11) NOT NULL,
  KEY `id_persona` (`id_persona`),
  KEY `id_sector_laboral` (`id_sector_laboral`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(50) NOT NULL,
  `id_sector_laboral` int(11) NOT NULL,
  `meses_duracion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sector_laboral` (`id_sector_laboral`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(50) NOT NULL,
  `id_sectot_laboral` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `tamaño_empresa` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sectot_laboral` (`id_sectot_laboral`),
  KEY `id_ubicacion` (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_trabajo`
--

DROP TABLE IF EXISTS `oferta_trabajo`;
CREATE TABLE IF NOT EXISTS `oferta_trabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `id_sector_laboral` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `salario` varchar(50) NOT NULL,
  `jornada` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_sector_laboral` (`id_sector_laboral`),
  KEY `id_ubicacion` (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_persona` int(11) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `nivel_educativo` varchar(20) NOT NULL,
  `fecha_desempleo` date DEFAULT NULL,
  `meses_experiencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula_persona` (`cedula_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector_laboral`
--

DROP TABLE IF EXISTS `sector_laboral`;
CREATE TABLE IF NOT EXISTS `sector_laboral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sector_laboral` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sector_laboral`
--

INSERT INTO `sector_laboral` (`id`, `nombre_sector_laboral`) VALUES
(1, 'Mantenimiento Fachadas'),
(2, 'Mecánica Automotriz'),
(3, 'Call Center - Ventas'),
(4, 'Call Center - Atención al Usuario'),
(5, 'Servicios Generales - Aseo'),
(6, 'Cocina - Chef'),
(7, 'Cocina - Auxiliar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ubicacion` varchar(50) NOT NULL,
  `nombre_ciudad` varchar(50) NOT NULL,
  `nombre_pais` varchar(50) NOT NULL,
  `cod_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `nombre_ubicacion`, `nombre_ciudad`, `nombre_pais`, `cod_postal`) VALUES
(1, 'Usaquén', 'Bogotá', 'Colombia', '110111'),
(2, 'Barrios Unidos', 'Bogotá', 'Colombia', '111211'),
(3, 'Bosa', 'Bogotá', 'Colombia', '110711'),
(4, 'Chapinero', 'Bogotá', 'Colombia', '110211'),
(5, 'Engativá', 'Bogotá', 'Colombia', '111011'),
(6, 'Fontibón', 'Bogotá', 'Colombia', '110911'),
(7, 'Kennedy', 'Bogotá', 'Colombia', '110811'),
(8, 'Apia', 'Riosaralda', 'Colombia', '663030'),
(9, 'Belen de Umbria', 'Risaralda', 'Colombia', '664040'),
(10, 'Dosquebradas', 'Risaralda', 'Colombia', '661001'),
(11, 'Guatica', 'Risaralda', 'Colombia', '664010'),
(12, 'Santuario', 'Risaralda', 'Colombia', '663001'),
(13, 'Rosa de Cabal', 'Risaralda', 'Colombia', '661020'),
(14, 'Pereira', 'Risaralda', 'Colombia', '660001');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacion_oferta`
--
ALTER TABLE `aplicacion_oferta`
  ADD CONSTRAINT `aplicacion_oferta_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_oferta_ibfk_2` FOREIGN KEY (`id_oferta_trabajo`) REFERENCES `oferta_trabajo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `asociacion_persona_sector_laboral`
--
ALTER TABLE `asociacion_persona_sector_laboral`
  ADD CONSTRAINT `asociacion_persona_sector_laboral_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asociacion_persona_sector_laboral_ibfk_2` FOREIGN KEY (`id_sector_laboral`) REFERENCES `sector_laboral` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_sector_laboral`) REFERENCES `sector_laboral` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_sectot_laboral`) REFERENCES `sector_laboral` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `oferta_trabajo`
--
ALTER TABLE `oferta_trabajo`
  ADD CONSTRAINT `oferta_trabajo_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `oferta_trabajo_ibfk_2` FOREIGN KEY (`id_sector_laboral`) REFERENCES `sector_laboral` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `oferta_trabajo_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id`) ON UPDATE CASCADE;
COMMIT;
