-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2024 a las 22:25:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `php_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_redeco`
--

CREATE TABLE `config_redeco` (
  `id` int(50) NOT NULL,
  `QuejasDenominacion` varchar(100) NOT NULL,
  `QuejasSector` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `config_redeco`
--

INSERT INTO `config_redeco` (`id`, `QuejasDenominacion`, `QuejasSector`) VALUES
(1, 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.', 'Sociedades Financieras de Objeto Múltiple E.N.R.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `resultado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`resultado`)),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productId` varchar(20) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `institucion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productId`, `product`, `institucion`) VALUES
('026911801257', 'Crédito Simple (Auto)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911811258', 'Crédito Simple (CGH)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911821259', 'Crédito Simple (CGP)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911821260', 'Crédito Cuenta Corriente (CGP)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911831261', 'Crédito Simple (CN)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911831262', 'Crédito Cuenta Corriente (CN)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911841263', 'Crédito Simple (CE)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911841264', 'Crédito Cuenta Corriente (CE)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911851265', 'Crédito Simple (CH)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911861266', 'Crédito Simple (CAM)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911861267', 'Crédito Cuenta Corriente (CAM)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911871268', 'Crédito Simple (CP)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911871269', 'Crédito Cuenta Corriente (CP)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911881270', 'Crédito Simple (CPYME)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911881271', 'Crédito Cuenta Corriente (CPYME)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911891272', 'Crédito Simple (CSG)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911891273', 'Crédito Cuenta Corriente (CSG)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911901274', 'Crédito Simple (CPHA)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911911275', 'Crédito Simple (CPR)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911941280', 'Crédito Simple (MC)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911941281', 'Crédito Cuenta Corriente (MC)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.'),
('026911951282', 'Crédito Cuenta Corriente (TC)', 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejas_data`
--

CREATE TABLE `quejas_data` (
  `id_quejas` int(50) NOT NULL,
  `data_queja` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data_queja`)),
  `fcreacion_queja` timestamp NOT NULL DEFAULT current_timestamp(),
  `enviada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `quejas_data`
--

INSERT INTO `quejas_data` (`id_quejas`, `data_queja`, `fcreacion_queja`, `enviada`) VALUES
(1, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/5ebcafe2\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 1008,\n    \"QuejasLocId\": 26,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:30:36', 1),
(2, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/94d2cfbe\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:33:22', 1),
(3, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/4d87f249\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76134,\n    \"QuejasColId\": 111,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:34:50', 1),
(4, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/73c5eabb\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:36:32', 1),
(5, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/76b1835f\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:36:55', 1),
(6, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector1\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/30f261d0\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:37:46', 0),
(7, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/63561f39\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:39:54', 1),
(8, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/f350927c\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:41:16', 1),
(9, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/04e35d4f\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 24,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 22:06:45', 1),
(10, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/d019f34a\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911831261\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 2,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 24,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": \"15/07/2024\",\n    \"QuejasFecNotificacion\": \"17/07/2024\",\n    \"QuejasRespuesta\": 1,\n    \"QuejasNumPenal\": 1,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 23:05:36', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `token`) VALUES
(1, 'admin', 'Sefi2015', 'Este usuario es solo para administración'),
(2, 'AdminSefi', 'Se2024fi', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MjhlYzIzMS1mYmI4LTQxOGYtODZjYS1mMzk4Nzk1NThiZjkiLCJ1c2VybmFtZSI6IkFkbWluU2VmaSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjI0LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRURFQ08iLCJpYXQiOjE3MTk0MzQwMzUsImV4cCI6MTcyMjAyNjAzNX0.NfgQJYSsc5ptxN5I0si_j191srsJeNEjTJCQOLL1HPI');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `config_redeco`
--
ALTER TABLE `config_redeco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quejas_data`
--
ALTER TABLE `quejas_data`
  ADD PRIMARY KEY (`id_quejas`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `config_redeco`
--
ALTER TABLE `config_redeco`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quejas_data`
--
ALTER TABLE `quejas_data`
  MODIFY `id_quejas` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
