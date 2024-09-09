-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2024 a las 01:02:59
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
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `f_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_usuario` int(11) DEFAULT NULL,
  `json_usuario` longtext DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `origen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `token`, `f_creacion`, `tipo_usuario`, `json_usuario`, `last_update`, `origen`) VALUES
(1, 'Sefiredecosu', 'Se2024fi', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI0OWJmODRmZi1hYjU4LTRiMGQtYjJkMS0xMGY1MDZkNzkxMDAiLCJ1c2VybmFtZSI6IlNlZmlyZWRlY29zdSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjY5LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRURFQ08iLCJpYXQiOjE3MjU1NjkwNDUsImV4cCI6MTcyODE2MTA0NX0._ylN_ziSU6-jj7_E9pNkVLRWt1pym53vl3tXzuvC-Pk', '2024-09-05 20:02:14', 1, '{\"message\":\"El usuario ha sido creado exitosamente!\",\"data\":{\"userid\":\"49bf84ff-ab58-4b0d-b2d1-10f506d79100\",\"username\":\"Sefiredecosu\",\"password\":\"$2a$10$c1tG2z.X2MyYVdqRa4GcwehKEwbMFuUwx76W9MX0DvCyZ8EVTtj.2\",\"institucionid\":\"49A8C2DF-5942-4E14-9D36-ED3070D4\",\"is_active\":true,\"profileid\":\"2\",\"date\":\"2024-09-03T06:00:00.000Z\",\"system\":\"a7f7f93d-704e-4afe-a7aa-0b56490b479e\",\"token_access\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI0OWJmODRmZi1hYjU4LTRiMGQtYjJkMS0xMGY1MDZkNzkxMDAiLCJ1c2VybmFtZSI6IlNlZmlyZWRlY29zdSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjY5LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRURFQ08iLCJpYXQiOjE3MjU0MDY3NzEsImV4cCI6MTcyNzk5ODc3MX0.evaQp4nIWwDJHr5mPIIsigKyioifup1TEBvFQNucsP0\"}}', '2024-09-05 20:44:06', 'superuser'),
(3, 'SefiReune', 'Se2024fi', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIyYmJiZjc4OC1kZmI3LTRmZGEtOTU3ZC1kNGQyYmMxNWM3MDEiLCJ1c2VybmFtZSI6IlNlZmlSZXVuZSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjY5LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRVVORSIsImlhdCI6MTcyNTkyMjg0MywiZXhwIjoxNzI4NTE0ODQzfQ.iHNDLIDXa1UtLJfG4NZJI6meWMZLt_DG494y7pldvsM', '2024-09-09 23:00:44', 2, '{\"message\":\"El usuario ha sido creado exitosamente!\",\"data\":{\"userid\":\"2bbbf788-dfb7-4fda-957d-d4d2bc15c701\",\"username\":\"SefiReune\",\"password\":\"$2a$10$e13A6pKlTkAuH9s6CuPj6OpHVsJWa1cW9idJ7Ixb16r1TfvAm0PrC\",\"institucionid\":\"49A8C2DF-5942-4E14-9D36-ED3070D4\",\"is_active\":true,\"profileid\":\"2\",\"date\":\"2024-09-09T06:00:00.000Z\",\"system\":\"8b2d9355-84de-470f-99b4-69dd3b39a03e\",\"token_access\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIyYmJiZjc4OC1kZmI3LTRmZGEtOTU3ZC1kNGQyYmMxNWM3MDEiLCJ1c2VybmFtZSI6IlNlZmlSZXVuZSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjY5LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRVVORSIsImlhdCI6MTcyNTkyMjg0MywiZXhwIjoxNzI4NTE0ODQzfQ.iHNDLIDXa1UtLJfG4NZJI6meWMZLt_DG494y7pldvsM\"}}', '2024-09-09 23:02:28', 'superuser');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
