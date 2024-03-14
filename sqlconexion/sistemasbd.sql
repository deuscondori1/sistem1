-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-03-2024 a las 19:13:33
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10
use sistemasbd;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemasbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` bigint NOT NULL,
  `des_area` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `f_registro_area` date DEFAULT NULL,
  `h_registro_area` time DEFAULT NULL,
  `fecha_modificacion_area` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` bigint NOT NULL,
  `des_cargo` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `h_registro_cargo` time DEFAULT NULL,
  `fecha_modificacion_cargo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `f_registro_cargo` date DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` bigint NOT NULL,
  `nombre` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `id_area` bigint DEFAULT NULL,
  `id_cargo` bigint DEFAULT NULL,
  `ci` bigint DEFAULT NULL,
  `expedido` varchar(100) COLLATE utf32_unicode_ci DEFAULT NULL,
  `celular` char(10) COLLATE utf32_unicode_ci DEFAULT NULL,
  `f_registro_empleado` date DEFAULT NULL,
  `h_registro_empleado` time DEFAULT NULL,
  `fecha_modificacion_empleados` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `des_rol` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `h_registro_rol` time DEFAULT NULL,
  `fecha_modificacion_rol` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `f_registro_rol` date DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint NOT NULL,
  `usuario` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `contrasena` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `f_registro_empleado` date DEFAULT NULL,
  `h_registro_empleado` time DEFAULT NULL,
  `id_empleado` bigint DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `fecha_modificacion_usuario` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`),
  ADD UNIQUE KEY `des_cargo` (`des_cargo`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD UNIQUE KEY `celular` (`celular`),
  ADD KEY `fk_id_area` (`id_area`),
  ADD KEY `fk_id_cargo` (`id_cargo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `des_rol` (`des_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_id_rol` (`id_rol`),
  ADD KEY `fk_id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_id_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  ADD CONSTRAINT `fk_id_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
