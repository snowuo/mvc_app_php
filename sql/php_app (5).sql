-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2024 a las 01:23:47
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
-- Estructura de tabla para la tabla `aclaracion_data`
--

CREATE TABLE `aclaracion_data` (
  `id` int(11) NOT NULL,
  `data_json` longtext DEFAULT NULL,
  `f_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `enviada` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_medios_rec`
--

CREATE TABLE `catalogo_medios_rec` (
  `clave` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo_medios_rec`
--

INSERT INTO `catalogo_medios_rec` (`clave`, `Descripcion`) VALUES
(1, 'Correo electrónico '),
(2, 'Página de internet '),
(3, 'Sucursales '),
(4, 'Teléfono '),
(5, 'UNE '),
(6, 'CONDUSEF-SIGE gestión electrónica '),
(7, 'CONDUSEF-Gestión ordinaria '),
(8, 'Mensajeria '),
(9, 'Fax '),
(17, 'Oficinas de atención '),
(18, 'Centro de atención telefónica '),
(20, 'Aplicación movil '),
(21, 'Interfaces '),
(22, 'Api s'),
(23, 'Bots ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_productos_causas`
--

CREATE TABLE `catalogo_productos_causas` (
  `tipo_operacion` varchar(100) DEFAULT NULL,
  `tipo_producto` varchar(100) DEFAULT NULL,
  `tipo_credito` varchar(100) DEFAULT NULL,
  `causa` varchar(500) DEFAULT NULL,
  `codigo_producto` varchar(100) DEFAULT NULL,
  `codigo_causa` varchar(100) DEFAULT NULL,
  `aplica_consulta` varchar(100) DEFAULT NULL,
  `aplica_reclamacion` varchar(100) DEFAULT NULL,
  `aplica_aclaracion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo_productos_causas`
--

INSERT INTO `catalogo_productos_causas` (`tipo_operacion`, `tipo_producto`, `tipo_credito`, `causa`, `codigo_producto`, `codigo_causa`, `aplica_consulta`, `aplica_reclamacion`, `aplica_aclaracion`) VALUES
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Incumplimiento en la entrega de documentos', '026911791256', '0162', '', 'SI', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Solicitud de estados de cuenta no atendida', '026911791256', '0188', '', 'SI', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Cargos no reconocidos en la cuenta', '026911791256', '0552', '', 'SI', 'SI'),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'No entrega de acuse de recepción de la aclaración', '026911791256', '0770', '', 'SI', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911791256', '0967', '', 'SI', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Incumplimiento con los términos del contrato', '026911791256', '1042', '', 'SI', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911791256', '1079', 'SI', '', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911791256', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Solicitud de estados de cuenta', '026911791256', '1207', 'SI', '', ''),
('Operaciones Activas', 'Arrendamiento Financiero', 'Crédito Simple (AF)', 'Disposición de efectivo en ventanilla y/o sucursal no reconocida por el Usuario, cliente y/o socio', '026911791256', '1236', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Solicitud de estados de cuenta no atendida', '026911801257', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911801257', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911801257', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Crédito aprobado sin la entrega de recursos', '026911801257', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911801257', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad respecto del saldo a favor después del siniestro', '026911801257', '0612', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Negociación de créditos (Orientación)', '026911801257', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Consulta de saldos y movimientos no atendida', '026911801257', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Actualización de historial crediticio no realizada', '026911801257', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911801257', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911801257', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'No entrega de acuse de recepción de la aclaración', '026911801257', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Crédito no reconocido en el historial crediticio', '026911801257', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Cobro de comisión por pago efectuado no aplicado', '026911801257', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911801257', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Convenio/reestructura de pago no respetado por la Institución', '026911801257', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Eliminación de historial crediticio no realizada', '026911801257', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911801257', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911801257', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911801257', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911801257', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad por cambio de Aseguradora', '026911801257', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911801257', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911801257', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911801257', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con la aclaración de los términos del contrato', '026911801257', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911801257', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Incumplimiento con los términos del contrato', '026911801257', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911801257', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911801257', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911801257', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911801257', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911801257', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911801257', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911801257', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911801257', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Información sobre la actualización de historial crediticio', '026911801257', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911801257', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Solicitud de estados de cuenta', '026911801257', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911801257', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Información para la cancelación de producto o servicio', '026911801257', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911801257', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911801257', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Inconformidad con el cobro de gastos de investigación', '026911801257', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911801257', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'No entrega de saldo a favor', '026911801257', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Otorgamiento de crédito a menores de edad', '026911801257', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito al auto', 'Crédito Simple (Auto)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911801257', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Solicitud de estados de cuenta no atendida', '026911811258', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911811258', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911811258', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Crédito aprobado sin la entrega de recursos', '026911811258', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911811258', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad respecto del saldo a favor después del siniestro', '026911811258', '0612', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Negociación de créditos (Orientación)', '026911811258', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Consulta de saldos y movimientos no atendida', '026911811258', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Actualización de historial crediticio no realizada', '026911811258', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911811258', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911811258', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'No se otorgó oferta vinculante o no se respetó', '026911811258', '0760', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'No entrega de acuse de recepción de la aclaración', '026911811258', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Crédito no reconocido en el historial crediticio', '026911811258', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Cobro de comisión por pago efectuado no aplicado', '026911811258', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911811258', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Convenio/reestructura de pago no respetado por la Institución', '026911811258', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Eliminación de historial crediticio no realizada', '026911811258', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911811258', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911811258', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911811258', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911811258', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad por cambio de Aseguradora', '026911811258', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911811258', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911811258', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de comisión por extender oferta vinculante', '026911811258', '0956', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de comisión por subrogación de crédito', '026911811258', '0961', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911811258', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con la aclaración de los términos del contrato', '026911811258', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911811258', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Incumplimiento con los términos del contrato', '026911811258', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911811258', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911811258', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911811258', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911811258', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911811258', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911811258', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911811258', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911811258', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Información sobre la actualización de historial crediticio', '026911811258', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911811258', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Solicitud de estados de cuenta', '026911811258', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911811258', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Información para la cancelación de producto o servicio', '026911811258', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911811258', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911811258', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Inconformidad con el cobro de gastos de investigación', '026911811258', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911811258', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'No entrega de saldo a favor', '026911811258', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Otorgamiento de crédito a menores de edad', '026911811258', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía hipotecaria', 'Crédito Simple (CGH)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911811258', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911821259', '0197', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con la recepción de pagos', '026911821259', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con la aplicación de los programas de apoyo', '026911821259', '0368', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911821259', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911821259', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Crédito aprobado sin la entrega de recursos', '026911821259', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911821259', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Negociación de créditos (Orientación)', '026911821259', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Consulta de saldos y movimientos no atendida', '026911821259', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Actualización de historial crediticio no realizada', '026911821259', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911821259', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911821259', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'No entrega de acuse de recepción de la aclaración', '026911821259', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Cobro de comisión por pago efectuado no aplicado', '026911821259', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911821259', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Convenio/reestructura de pago no respetado por la Institución', '026911821259', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Eliminación de historial crediticio no realizada', '026911821259', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911821259', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911821259', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911821259', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911821259', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911821259', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911821259', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911821259', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911821259', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Incumplimiento con los términos del contrato', '026911821259', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911821259', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911821259', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911821259', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911821259', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911821259', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911821259', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911821259', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911821259', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Información sobre la actualización de historial crediticio', '026911821259', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911821259', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911821259', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Información para la cancelación de producto o servicio', '026911821259', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911821259', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Seguimiento de Aclaración (estatus de su solicitud de aclaración)', '026911821259', '1245', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Consulta de Movimientos de préstamos (aplicación de descuentos, devoluciones)', '026911821259', '1246', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Inconformidad con el cobro de gastos de investigación', '026911821259', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911821259', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'No entrega de saldo a favor', '026911821259', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Otorgamiento de crédito a menores de edad', '026911821259', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Simple (CGP)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911821259', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911821260', '0197', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con la recepción de pagos', '026911821260', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con la aplicación de los programas de apoyo', '026911821260', '0368', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911821260', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911821260', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Crédito aprobado sin la entrega de recursos', '026911821260', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911821260', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Negociación de créditos (Orientación)', '026911821260', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Consulta de saldos y movimientos no atendida', '026911821260', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Actualización de historial crediticio no realizada', '026911821260', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911821260', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911821260', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'No entrega de acuse de recepción de la aclaración', '026911821260', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Cobro de comisión por pago efectuado no aplicado', '026911821260', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911821260', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Convenio/reestructura de pago no respetado por la Institución', '026911821260', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Eliminación de historial crediticio no realizada', '026911821260', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911821260', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911821260', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911821260', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911821260', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911821260', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911821260', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911821260', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911821260', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Incumplimiento con los términos del contrato', '026911821260', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911821260', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911821260', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911821260', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911821260', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911821260', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911821260', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911821260', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911821260', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Información sobre la actualización de historial crediticio', '026911821260', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911821260', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911821260', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Información para la cancelación de producto o servicio', '026911821260', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911821260', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Seguimiento de Aclaración (estatus de su solicitud de aclaración)', '026911821260', '1245', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Consulta de Movimientos de préstamos (aplicación de descuentos, devoluciones)', '026911821260', '1246', 'SI', '', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Inconformidad con el cobro de gastos de investigación', '026911821260', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911821260', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'No entrega de saldo a favor', '026911821260', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Otorgamiento de crédito a menores de edad', '026911821260', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito con garantía prendaria', 'Crédito Cuenta Corriente (CGP)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911821260', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Solicitud de estados de cuenta no atendida', '026911831261', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911831261', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911831261', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Crédito aprobado sin la entrega de recursos', '026911831261', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911831261', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Negociación de créditos (Orientación)', '026911831261', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Consulta de saldos y movimientos no atendida', '026911831261', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Actualización de historial crediticio no realizada', '026911831261', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911831261', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911831261', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'No entrega de acuse de recepción de la aclaración', '026911831261', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Crédito no reconocido en el historial crediticio', '026911831261', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Cobro de comisión por pago efectuado no aplicado', '026911831261', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911831261', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Convenio/reestructura de pago no respetado por la Institución', '026911831261', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Eliminación de historial crediticio no realizada', '026911831261', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911831261', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911831261', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911831261', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911831261', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad por cambio de Aseguradora', '026911831261', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911831261', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911831261', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911831261', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con la aclaración de los términos del contrato', '026911831261', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911831261', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Incumplimiento con los términos del contrato', '026911831261', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911831261', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911831261', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911831261', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911831261', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911831261', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911831261', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911831261', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911831261', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Información sobre la actualización de historial crediticio', '026911831261', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911831261', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Solicitud de estados de cuenta', '026911831261', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911831261', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Información para la cancelación de producto o servicio', '026911831261', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911831261', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911831261', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911831261', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Inconformidad con el cobro de gastos de investigación', '026911831261', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911831261', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'No entrega de saldo a favor', '026911831261', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Otorgamiento de crédito a menores de edad', '026911831261', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Simple (CN)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911831261', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Solicitud de estados de cuenta no atendida', '026911831262', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911831262', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911831262', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Crédito aprobado sin la entrega de recursos', '026911831262', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911831262', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Negociación de créditos (Orientación)', '026911831262', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Consulta de saldos y movimientos no atendida', '026911831262', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Actualización de historial crediticio no realizada', '026911831262', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911831262', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911831262', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'No entrega de acuse de recepción de la aclaración', '026911831262', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Crédito no reconocido en el historial crediticio', '026911831262', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Cobro de comisión por pago efectuado no aplicado', '026911831262', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911831262', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Convenio/reestructura de pago no respetado por la Institución', '026911831262', '0842', '', 'SI', '');
INSERT INTO `catalogo_productos_causas` (`tipo_operacion`, `tipo_producto`, `tipo_credito`, `causa`, `codigo_producto`, `codigo_causa`, `aplica_consulta`, `aplica_reclamacion`, `aplica_aclaracion`) VALUES
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Eliminación de historial crediticio no realizada', '026911831262', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911831262', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911831262', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911831262', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911831262', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad por cambio de Aseguradora', '026911831262', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911831262', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911831262', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911831262', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con la aclaración de los términos del contrato', '026911831262', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911831262', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Incumplimiento con los términos del contrato', '026911831262', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911831262', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911831262', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911831262', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911831262', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911831262', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911831262', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911831262', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911831262', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Información sobre la actualización de historial crediticio', '026911831262', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911831262', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Solicitud de estados de cuenta', '026911831262', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911831262', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Información para la cancelación de producto o servicio', '026911831262', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911831262', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911831262', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911831262', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Inconformidad con el cobro de gastos de investigación', '026911831262', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911831262', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'No entrega de saldo a favor', '026911831262', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Otorgamiento de crédito a menores de edad', '026911831262', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito de nómina', 'Crédito Cuenta Corriente (CN)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911831262', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Solicitud de estados de cuenta no atendida', '026911841263', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con la recepción de pagos', '026911841263', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911841263', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911841263', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Crédito aprobado sin la entrega de recursos', '026911841263', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911841263', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Negociación de créditos (Orientación)', '026911841263', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Consulta de saldos y movimientos no atendida', '026911841263', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Actualización de historial crediticio no realizada', '026911841263', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911841263', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'No entrega de acuse de recepción de la aclaración', '026911841263', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Crédito no reconocido en el historial crediticio', '026911841263', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Cobro de comisión por pago efectuado no aplicado', '026911841263', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911841263', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Convenio/reestructura de pago no respetado por la Institución', '026911841263', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Eliminación de historial crediticio no realizada', '026911841263', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911841263', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911841263', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911841263', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911841263', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad por cambio de Aseguradora', '026911841263', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911841263', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911841263', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911841263', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con la aclaración de los términos del contrato', '026911841263', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911841263', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Incumplimiento con los términos del contrato', '026911841263', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911841263', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911841263', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911841263', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911841263', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911841263', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911841263', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911841263', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911841263', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Información sobre la actualización de historial crediticio', '026911841263', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911841263', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Solicitud de estados de cuenta', '026911841263', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911841263', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Información para la cancelación de producto o servicio', '026911841263', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911841263', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911841263', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911841263', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Inconformidad con el cobro de gastos de investigación', '026911841263', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911841263', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'No entrega de saldo a favor', '026911841263', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Simple (CE)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911841263', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Solicitud de estados de cuenta no atendida', '026911841264', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con la recepción de pagos', '026911841264', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911841264', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911841264', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Crédito aprobado sin la entrega de recursos', '026911841264', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911841264', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Negociación de créditos (Orientación)', '026911841264', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Consulta de saldos y movimientos no atendida', '026911841264', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Actualización de historial crediticio no realizada', '026911841264', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911841264', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'No entrega de acuse de recepción de la aclaración', '026911841264', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Crédito no reconocido en el historial crediticio', '026911841264', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Cobro de comisión por pago efectuado no aplicado', '026911841264', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911841264', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Convenio/reestructura de pago no respetado por la Institución', '026911841264', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Eliminación de historial crediticio no realizada', '026911841264', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911841264', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911841264', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911841264', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911841264', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad por cambio de Aseguradora', '026911841264', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911841264', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911841264', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911841264', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con la aclaración de los términos del contrato', '026911841264', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911841264', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Incumplimiento con los términos del contrato', '026911841264', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911841264', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911841264', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911841264', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911841264', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911841264', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911841264', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911841264', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911841264', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Información sobre la actualización de historial crediticio', '026911841264', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911841264', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Solicitud de estados de cuenta', '026911841264', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911841264', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Información para la cancelación de producto o servicio', '026911841264', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911841264', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911841264', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911841264', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Inconformidad con el cobro de gastos de investigación', '026911841264', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911841264', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'No entrega de saldo a favor', '026911841264', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito empresarial', 'Crédito Cuenta Corriente (CE)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911841264', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Solicitud de estados de cuenta no atendida', '026911851265', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911851265', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911851265', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Crédito aprobado sin la entrega de recursos', '026911851265', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911851265', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad respecto del saldo a favor después del siniestro', '026911851265', '0612', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Negociación de créditos (Orientación)', '026911851265', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Consulta de saldos y movimientos no atendida', '026911851265', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Actualización de historial crediticio no realizada', '026911851265', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911851265', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911851265', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'No se otorgó oferta vinculante o no se respetó', '026911851265', '0760', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'No entrega de acuse de recepción de la aclaración', '026911851265', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Crédito no reconocido en el historial crediticio', '026911851265', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Cobro de comisión por pago efectuado no aplicado', '026911851265', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911851265', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Convenio/reestructura de pago no respetado por la Institución', '026911851265', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Eliminación de historial crediticio no realizada', '026911851265', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911851265', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911851265', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911851265', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911851265', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad por cambio de Aseguradora', '026911851265', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911851265', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911851265', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de comisión por extender oferta vinculante', '026911851265', '0956', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de comisión por subrogación de crédito', '026911851265', '0961', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911851265', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con la aclaración de los términos del contrato', '026911851265', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911851265', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Incumplimiento con los términos del contrato', '026911851265', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911851265', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911851265', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911851265', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911851265', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911851265', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911851265', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911851265', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911851265', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Información sobre la actualización de historial crediticio', '026911851265', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911851265', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Solicitud de estados de cuenta', '026911851265', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911851265', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Información para la cancelación de producto o servicio', '026911851265', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911851265', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911851265', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Inconformidad con el cobro de gastos de investigación', '026911851265', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911851265', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'No entrega de saldo a favor', '026911851265', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Otorgamiento de crédito a menores de edad', '026911851265', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito hipotecario', 'Crédito Simple (CH)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911851265', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Solicitud de estados de cuenta no atendida', '026911861266', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con la recepción de pagos', '026911861266', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911861266', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911861266', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Crédito aprobado sin la entrega de recursos', '026911861266', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911861266', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Negociación de créditos (Orientación)', '026911861266', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Consulta de saldos y movimientos no atendida', '026911861266', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Actualización de historial crediticio no realizada', '026911861266', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911861266', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911861266', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'No entrega de acuse de recepción de la aclaración', '026911861266', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Crédito no reconocido en el historial crediticio', '026911861266', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Cobro de comisión por pago efectuado no aplicado', '026911861266', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911861266', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Convenio/reestructura de pago no respetado por la Institución', '026911861266', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Eliminación de historial crediticio no realizada', '026911861266', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911861266', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911861266', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911861266', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911861266', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad por cambio de Aseguradora', '026911861266', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911861266', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911861266', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911861266', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con la aclaración de los términos del contrato', '026911861266', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911861266', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Incumplimiento con los términos del contrato', '026911861266', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911861266', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911861266', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911861266', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911861266', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911861266', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911861266', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911861266', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911861266', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Información sobre la actualización de historial crediticio', '026911861266', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911861266', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Solicitud de estados de cuenta', '026911861266', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911861266', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Información para la cancelación de producto o servicio', '026911861266', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911861266', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911861266', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911861266', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Inconformidad con el cobro de gastos de investigación', '026911861266', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911861266', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'No entrega de saldo a favor', '026911861266', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Otorgamiento de crédito a menores de edad', '026911861266', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Simple (CAM)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911861266', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Solicitud de estados de cuenta no atendida', '026911861267', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con la recepción de pagos', '026911861267', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911861267', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911861267', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Crédito aprobado sin la entrega de recursos', '026911861267', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911861267', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Negociación de créditos (Orientación)', '026911861267', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Consulta de saldos y movimientos no atendida', '026911861267', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Actualización de historial crediticio no realizada', '026911861267', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911861267', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911861267', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'No entrega de acuse de recepción de la aclaración', '026911861267', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Crédito no reconocido en el historial crediticio', '026911861267', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Cobro de comisión por pago efectuado no aplicado', '026911861267', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911861267', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Convenio/reestructura de pago no respetado por la Institución', '026911861267', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Eliminación de historial crediticio no realizada', '026911861267', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911861267', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911861267', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911861267', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911861267', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad por cambio de Aseguradora', '026911861267', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911861267', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911861267', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911861267', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con la aclaración de los términos del contrato', '026911861267', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911861267', '1011', '', 'SI', '');
INSERT INTO `catalogo_productos_causas` (`tipo_operacion`, `tipo_producto`, `tipo_credito`, `causa`, `codigo_producto`, `codigo_causa`, `aplica_consulta`, `aplica_reclamacion`, `aplica_aclaracion`) VALUES
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Incumplimiento con los términos del contrato', '026911861267', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911861267', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911861267', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911861267', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911861267', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911861267', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911861267', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911861267', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911861267', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Información sobre la actualización de historial crediticio', '026911861267', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911861267', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Solicitud de estados de cuenta', '026911861267', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911861267', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Información para la cancelación de producto o servicio', '026911861267', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911861267', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911861267', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911861267', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Inconformidad con el cobro de gastos de investigación', '026911861267', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911861267', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'No entrega de saldo a favor', '026911861267', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Otorgamiento de crédito a menores de edad', '026911861267', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito para adultos mayores (pensionados o jubilados)', 'Crédito Cuenta Corriente (CAM)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911861267', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Solicitud de estados de cuenta no atendida', '026911871268', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911871268', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911871268', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Crédito aprobado sin la entrega de recursos', '026911871268', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911871268', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Negociación de créditos (Orientación)', '026911871268', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Consulta de saldos y movimientos no atendida', '026911871268', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Actualización de historial crediticio no realizada', '026911871268', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911871268', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911871268', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'No entrega de acuse de recepción de la aclaración', '026911871268', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Crédito no reconocido en el historial crediticio', '026911871268', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Cobro de comisión por pago efectuado no aplicado', '026911871268', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911871268', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Convenio/reestructura de pago no respetado por la Institución', '026911871268', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Eliminación de historial crediticio no realizada', '026911871268', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911871268', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911871268', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911871268', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911871268', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad por cambio de Aseguradora', '026911871268', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911871268', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911871268', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911871268', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con la aclaración de los términos del contrato', '026911871268', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911871268', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Incumplimiento con los términos del contrato', '026911871268', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911871268', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911871268', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911871268', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911871268', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911871268', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911871268', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911871268', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911871268', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Información sobre la actualización de historial crediticio', '026911871268', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911871268', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Solicitud de estados de cuenta', '026911871268', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911871268', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Información para la cancelación de producto o servicio', '026911871268', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911871268', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911871268', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911871268', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Inconformidad con el cobro de gastos de investigación', '026911871268', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911871268', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'No entrega de saldo a favor', '026911871268', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Otorgamiento de crédito a menores de edad', '026911871268', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Simple (CP)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911871268', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Solicitud de estados de cuenta no atendida', '026911871269', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911871269', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911871269', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Crédito aprobado sin la entrega de recursos', '026911871269', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911871269', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Negociación de créditos (Orientación)', '026911871269', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Consulta de saldos y movimientos no atendida', '026911871269', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Actualización de historial crediticio no realizada', '026911871269', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911871269', '0734', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911871269', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'No entrega de acuse de recepción de la aclaración', '026911871269', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Crédito no reconocido en el historial crediticio', '026911871269', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Cobro de comisión por pago efectuado no aplicado', '026911871269', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911871269', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Convenio/reestructura de pago no respetado por la Institución', '026911871269', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Eliminación de historial crediticio no realizada', '026911871269', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911871269', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911871269', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911871269', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911871269', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad por cambio de Aseguradora', '026911871269', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911871269', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911871269', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911871269', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con la aclaración de los términos del contrato', '026911871269', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911871269', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Incumplimiento con los términos del contrato', '026911871269', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911871269', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911871269', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911871269', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911871269', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911871269', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911871269', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911871269', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911871269', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Información sobre la actualización de historial crediticio', '026911871269', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911871269', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Solicitud de estados de cuenta', '026911871269', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911871269', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Información para la cancelación de producto o servicio', '026911871269', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911871269', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911871269', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911871269', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Inconformidad con el cobro de gastos de investigación', '026911871269', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911871269', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'No entrega de saldo a favor', '026911871269', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Otorgamiento de crédito a menores de edad', '026911871269', '1325', '', 'SI', ''),
('Operaciones Activas', 'Crédito personal', 'Crédito Cuenta Corriente (CP)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911871269', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Solicitud de estados de cuenta no atendida', '026911881270', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con la recepción de pagos', '026911881270', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911881270', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911881270', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Crédito aprobado sin la entrega de recursos', '026911881270', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911881270', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Negociación de créditos (Orientación)', '026911881270', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Consulta de saldos y movimientos no atendida', '026911881270', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Actualización de historial crediticio no realizada', '026911881270', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911881270', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'No entrega de acuse de recepción de la aclaración', '026911881270', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Crédito no reconocido en el historial crediticio', '026911881270', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Cobro de comisión por pago efectuado no aplicado', '026911881270', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911881270', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Convenio/reestructura de pago no respetado por la Institución', '026911881270', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Eliminación de historial crediticio no realizada', '026911881270', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911881270', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911881270', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911881270', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911881270', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad por cambio de Aseguradora', '026911881270', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911881270', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911881270', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911881270', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con la aclaración de los términos del contrato', '026911881270', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911881270', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Incumplimiento con los términos del contrato', '026911881270', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911881270', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911881270', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911881270', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911881270', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911881270', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911881270', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911881270', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911881270', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Información sobre la actualización de historial crediticio', '026911881270', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911881270', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Solicitud de estados de cuenta', '026911881270', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911881270', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Información para la cancelación de producto o servicio', '026911881270', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911881270', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911881270', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911881270', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Inconformidad con el cobro de gastos de investigación', '026911881270', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911881270', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'No entrega de saldo a favor', '026911881270', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Simple (CPYME)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911881270', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Solicitud de estados de cuenta no atendida', '026911881271', '0188', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con la recepción de pagos', '026911881271', '0353', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911881271', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911881271', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Crédito aprobado sin la entrega de recursos', '026911881271', '0583', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911881271', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Negociación de créditos (Orientación)', '026911881271', '0666', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Consulta de saldos y movimientos no atendida', '026911881271', '0712', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Actualización de historial crediticio no realizada', '026911881271', '0730', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911881271', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'No entrega de acuse de recepción de la aclaración', '026911881271', '0770', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Crédito no reconocido en el historial crediticio', '026911881271', '0835', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Cobro de comisión por pago efectuado no aplicado', '026911881271', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911881271', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Convenio/reestructura de pago no respetado por la Institución', '026911881271', '0842', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Eliminación de historial crediticio no realizada', '026911881271', '0844', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911881271', '0849', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911881271', '0853', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911881271', '0854', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911881271', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad por cambio de Aseguradora', '026911881271', '0857', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911881271', '0858', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911881271', '0939', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911881271', '0967', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con la aclaración de los términos del contrato', '026911881271', '1005', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911881271', '1011', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Incumplimiento con los términos del contrato', '026911881271', '1042', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911881271', '1058', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911881271', '1060', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911881271', '1064', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911881271', '1074', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911881271', '1075', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911881271', '1079', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911881271', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911881271', '1101', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Información sobre la actualización de historial crediticio', '026911881271', '1200', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911881271', '1204', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Solicitud de estados de cuenta', '026911881271', '1207', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911881271', '1211', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Información para la cancelación de producto o servicio', '026911881271', '1217', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911881271', '1221', 'SI', '', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911881271', '1319', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911881271', '1320', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Inconformidad con el cobro de gastos de investigación', '026911881271', '1321', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911881271', '1323', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'No entrega de saldo a favor', '026911881271', '1324', '', 'SI', ''),
('Operaciones Activas', 'Crédito PYME', 'Crédito Cuenta Corriente (CPYME)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911881271', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Solicitud de estados de cuenta no atendida', '026911891272', '0188', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911891272', '0197', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con la recepción de pagos', '026911891272', '0353', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Cargo indebido de intereses y gastos de cobranza', '026911891272', '0367', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con la aplicación de los programas de apoyo', '026911891272', '0368', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911891272', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911891272', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Crédito aprobado sin la entrega de recursos', '026911891272', '0583', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Negociación de créditos (Orientación)', '026911891272', '0666', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Consulta de saldos y movimientos no atendida', '026911891272', '0712', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Actualización de historial crediticio no realizada', '026911891272', '0730', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'No entrega de acuse de recepción de la aclaración', '026911891272', '0770', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Crédito no reconocido en el historial crediticio', '026911891272', '0835', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Cobro de comisión por pago efectuado no aplicado', '026911891272', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911891272', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Convenio/reestructura de pago no respetado por la Institución', '026911891272', '0842', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Eliminación de historial crediticio no realizada', '026911891272', '0844', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911891272', '0849', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911891272', '0853', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911891272', '0854', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911891272', '0858', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911891272', '0939', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911891272', '0967', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con la aclaración de los términos del contrato', '026911891272', '1005', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911891272', '1011', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Incumplimiento con los términos del contrato', '026911891272', '1042', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911891272', '1058', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911891272', '1060', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911891272', '1064', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911891272', '1079', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911891272', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Información sobre la actualización de historial crediticio', '026911891272', '1200', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Solicitud de estados de cuenta', '026911891272', '1207', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911891272', '1211', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911891272', '1221', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911891272', '1319', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Inconformidad con el cobro de gastos de investigación', '026911891272', '1321', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911891272', '1323', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Simple (CSG)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911891272', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Solicitud de estados de cuenta no atendida', '026911891273', '0188', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911891273', '0197', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con la recepción de pagos', '026911891273', '0353', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Cargo indebido de intereses y gastos de cobranza', '026911891273', '0367', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con la aplicación de los programas de apoyo', '026911891273', '0368', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911891273', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911891273', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Crédito aprobado sin la entrega de recursos', '026911891273', '0583', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Negociación de créditos (Orientación)', '026911891273', '0666', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Consulta de saldos y movimientos no atendida', '026911891273', '0712', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Actualización de historial crediticio no realizada', '026911891273', '0730', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'No entrega de acuse de recepción de la aclaración', '026911891273', '0770', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Crédito no reconocido en el historial crediticio', '026911891273', '0835', '', 'SI', '');
INSERT INTO `catalogo_productos_causas` (`tipo_operacion`, `tipo_producto`, `tipo_credito`, `causa`, `codigo_producto`, `codigo_causa`, `aplica_consulta`, `aplica_reclamacion`, `aplica_aclaracion`) VALUES
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Cobro de comisión por pago efectuado no aplicado', '026911891273', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911891273', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Convenio/reestructura de pago no respetado por la Institución', '026911891273', '0842', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Eliminación de historial crediticio no realizada', '026911891273', '0844', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911891273', '0849', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911891273', '0853', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911891273', '0854', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911891273', '0858', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911891273', '0939', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911891273', '0967', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con la aclaración de los términos del contrato', '026911891273', '1005', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911891273', '1011', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Incumplimiento con los términos del contrato', '026911891273', '1042', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911891273', '1058', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911891273', '1060', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911891273', '1064', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911891273', '1079', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911891273', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Información sobre la actualización de historial crediticio', '026911891273', '1200', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Solicitud de estados de cuenta', '026911891273', '1207', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911891273', '1211', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911891273', '1221', 'SI', '', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911891273', '1319', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Inconformidad con el cobro de gastos de investigación', '026911891273', '1321', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911891273', '1323', '', 'SI', ''),
('Operaciones Activas', 'Créditos solidarios y/o grupal', 'Crédito Cuenta Corriente (CSG)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911891273', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Solicitud de estados de cuenta no atendida', '026911901274', '0188', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911901274', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911901274', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Crédito aprobado sin la entrega de recursos', '026911901274', '0583', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911901274', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Negociación de créditos (Orientación)', '026911901274', '0666', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Consulta de saldos y movimientos no atendida', '026911901274', '0712', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Actualización de historial crediticio no realizada', '026911901274', '0730', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911901274', '0734', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911901274', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'No entrega de acuse de recepción de la aclaración', '026911901274', '0770', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Crédito no reconocido en el historial crediticio', '026911901274', '0835', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Cobro de comisión por pago efectuado no aplicado', '026911901274', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911901274', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Convenio/reestructura de pago no respetado por la Institución', '026911901274', '0842', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Eliminación de historial crediticio no realizada', '026911901274', '0844', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911901274', '0849', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911901274', '0853', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911901274', '0854', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911901274', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad por cambio de Aseguradora', '026911901274', '0857', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911901274', '0858', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911901274', '0939', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911901274', '0967', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con la aclaración de los términos del contrato', '026911901274', '1005', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911901274', '1011', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Incumplimiento con los términos del contrato', '026911901274', '1042', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911901274', '1058', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911901274', '1060', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911901274', '1064', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911901274', '1074', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911901274', '1075', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911901274', '1079', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911901274', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911901274', '1101', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Información sobre la actualización de historial crediticio', '026911901274', '1200', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911901274', '1204', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Solicitud de estados de cuenta', '026911901274', '1207', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911901274', '1211', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Información para la cancelación de producto o servicio', '026911901274', '1217', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911901274', '1221', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911901274', '1319', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Inconformidad con el cobro de gastos de investigación', '026911901274', '1321', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911901274', '1323', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'No entrega de saldo a favor', '026911901274', '1324', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Otorgamiento de crédito a menores de edad', '026911901274', '1325', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos de habilitación y avío', 'Crédito Simple (CPHA)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911901274', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Solicitud de estados de cuenta no atendida', '026911911275', '0188', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911911275', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911911275', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Crédito aprobado sin la entrega de recursos', '026911911275', '0583', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el monto de las primas de los seguros por lo que respecta a la amortización', '026911911275', '0611', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Negociación de créditos (Orientación)', '026911911275', '0666', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Consulta de saldos y movimientos no atendida', '026911911275', '0712', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Actualización de historial crediticio no realizada', '026911911275', '0730', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911911275', '0734', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el monto de las primas devengadas del seguro vinculado', '026911911275', '0751', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'No entrega de acuse de recepción de la aclaración', '026911911275', '0770', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Crédito no reconocido en el historial crediticio', '026911911275', '0835', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Cobro de comisión por pago efectuado no aplicado', '026911911275', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911911275', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Convenio/reestructura de pago no respetado por la Institución', '026911911275', '0842', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Eliminación de historial crediticio no realizada', '026911911275', '0844', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911911275', '0849', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911911275', '0853', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911911275', '0854', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911911275', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad por cambio de Aseguradora', '026911911275', '0857', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911911275', '0858', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911911275', '0939', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911911275', '0967', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con la aclaración de los términos del contrato', '026911911275', '1005', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911911275', '1011', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Incumplimiento con los términos del contrato', '026911911275', '1042', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911911275', '1058', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911911275', '1060', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911911275', '1064', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'No entrega de tabla de amortización al momento de formalizar el contrato', '026911911275', '1074', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911911275', '1075', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911911275', '1079', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911911275', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911911275', '1101', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Información sobre la actualización de historial crediticio', '026911911275', '1200', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Consulta del monto de las primas de los seguros por lo que respecta a la amortización', '026911911275', '1204', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Solicitud de estados de cuenta', '026911911275', '1207', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911911275', '1211', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Información para la cancelación de producto o servicio', '026911911275', '1217', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911911275', '1221', 'SI', '', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911911275', '1319', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Inconformidad con el cobro de gastos de investigación', '026911911275', '1321', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911911275', '1323', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'No entrega de saldo a favor', '026911911275', '1324', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Otorgamiento de crédito a menores de edad', '026911911275', '1325', '', 'SI', ''),
('Operaciones Activas', 'Créditos y préstamos refaccionarios', 'Crédito Simple (CPR)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911911275', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Incumplimiento en la entrega de documentos', '026911921276', '0162', '', 'SI', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Solicitud de estados de cuenta no atendida', '026911921276', '0188', '', 'SI', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Cargos no reconocidos en la cuenta', '026911921276', '0552', '', 'SI', 'SI'),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'No entrega de acuse de recepción de la aclaración', '026911921276', '0770', '', 'SI', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911921276', '0858', '', 'SI', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Incumplimiento con los términos del contrato', '026911921276', '1042', '', 'SI', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911921276', '1079', 'SI', '', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911921276', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Solicitud de estados de cuenta', '026911921276', '1207', 'SI', '', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911921276', '1221', 'SI', '', ''),
('Operaciones Activas', 'Factoraje Financiero', 'Crédito Simple (FF)', 'Disposición de efectivo en ventanilla y/o sucursal no reconocida por el Usuario, cliente y/o socio', '026911921276', '1236', '', 'SI', ''),
('Operaciones Activas', 'Información sobre productos y servicios financieros', 'Información sobre productos y servicios financieros', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911931277', '1079', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Solicitud de estados de cuenta no atendida', '026911941280', '0188', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911941280', '0197', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con la recepción de pagos', '026911941280', '0353', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con la aplicación de los programas de apoyo', '026911941280', '0368', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911941280', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911941280', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Crédito aprobado sin la entrega de recursos', '026911941280', '0583', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Negociación de créditos (Orientación)', '026911941280', '0666', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Consulta de saldos y movimientos no atendida', '026911941280', '0712', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Actualización de historial crediticio no realizada', '026911941280', '0730', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'No entrega de acuse de recepción de la aclaración', '026911941280', '0770', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Crédito no reconocido en el historial crediticio', '026911941280', '0835', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Cobro de comisión por pago efectuado no aplicado', '026911941280', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Convenio/reestructura de pago no respetado por la Institución', '026911941280', '0842', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Eliminación de historial crediticio no realizada', '026911941280', '0844', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911941280', '0849', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911941280', '0853', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911941280', '0854', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911941280', '0858', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911941280', '0939', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911941280', '0967', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con la aclaración de los términos del contrato', '026911941280', '1005', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911941280', '1011', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Incumplimiento con los términos del contrato', '026911941280', '1042', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911941280', '1058', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911941280', '1060', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911941280', '1064', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911941280', '1079', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911941280', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Información sobre la actualización de historial crediticio', '026911941280', '1200', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Solicitud de estados de cuenta', '026911941280', '1207', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911941280', '1211', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911941280', '1221', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Cobro no reconocido de intereses ordinarios, moratorios y/o gastos de cobranza', '026911941280', '1314', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911941280', '1319', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Inconformidad con el cobro de gastos de investigación', '026911941280', '1321', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911941280', '1323', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Simple (MC)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911941280', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Solicitud de estados de cuenta no atendida', '026911941281', '0188', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Negativa al otorgamiento de apoyo (programas de apoyo)', '026911941281', '0197', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con la recepción de pagos', '026911941281', '0353', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con la aplicación de los programas de apoyo', '026911941281', '0368', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911941281', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el monto de los gastos de apertura del crédito', '026911941281', '0582', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Crédito aprobado sin la entrega de recursos', '026911941281', '0583', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Negociación de créditos (Orientación)', '026911941281', '0666', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Consulta de saldos y movimientos no atendida', '026911941281', '0712', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Actualización de historial crediticio no realizada', '026911941281', '0730', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'No entrega de acuse de recepción de la aclaración', '026911941281', '0770', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Crédito no reconocido en el historial crediticio', '026911941281', '0835', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Cobro de comisión por pago efectuado no aplicado', '026911941281', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Convenio/reestructura de pago no respetado por la Institución', '026911941281', '0842', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Eliminación de historial crediticio no realizada', '026911941281', '0844', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911941281', '0849', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911941281', '0853', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911941281', '0854', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'La Institución no entrega la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911941281', '0858', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'El Usuario, cliente y/o socio no recibió el estado de cuenta con la leyenda de liquidación', '026911941281', '0939', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911941281', '0967', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con la aclaración de los términos del contrato', '026911941281', '1005', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911941281', '1011', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Incumplimiento con los términos del contrato', '026911941281', '1042', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911941281', '1058', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911941281', '1060', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Negativa a cumplir con la conclusión anticipada establecida en el contrato', '026911941281', '1064', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911941281', '1079', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911941281', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Información sobre la actualización de historial crediticio', '026911941281', '1200', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Solicitud de estados de cuenta', '026911941281', '1207', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911941281', '1211', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Información para la entrega de la carta liberación de adeudos y/o carta finiquito, factura, garantía, gravamen, 1er testimonio', '026911941281', '1221', 'SI', '', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Cobro no reconocido de intereses ordinarios, moratorios y/o gastos de cobranza', '026911941281', '1314', '', 'SI', 'SI'),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911941281', '1319', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Inconformidad con el cobro de gastos de investigación', '026911941281', '1321', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911941281', '1323', '', 'SI', ''),
('Operaciones Activas', 'Microcréditos', 'Crédito Cuenta Corriente (MC)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911941281', '1326', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Solicitud de estados de cuenta no atendida', '026911951282', '0188', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Cargo indebido de intereses y gastos de cobranza', '026911951282', '0367', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Cuota anual cobrada sin recepción del plástico', '026911951282', '0399', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Devolución en comercio no aplicada', '026911951282', '0519', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Consumos no reconocidos', '026911951282', '0557', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Consumos vía internet no reconocidos', '026911951282', '0559', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el saldo del crédito o del monto de las amortizaciones', '026911951282', '0577', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Negociación de créditos (Orientación)', '026911951282', '0666', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Consulta de saldos y movimientos no atendida', '026911951282', '0712', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Actualización de historial crediticio no realizada', '026911951282', '0730', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Cobro de nuevas comisiones sin aviso previo al Usuario, cliente y/o socio', '026911951282', '0734', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Emisión de tarjeta de crédito sin solicitud', '026911951282', '0749', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad por el importe de un consumo en comercio', '026911951282', '0752', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad por cargo duplicado', '026911951282', '0769', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'No entrega de acuse de recepción de la aclaración', '026911951282', '0770', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Solicitud de cancelación de cargos recurrentes no atendida', '026911951282', '0828', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Crédito no reconocido en el historial crediticio', '026911951282', '0835', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Cobro de comisión por pago efectuado no aplicado', '026911951282', '0840', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Cobro no reconocido de intereses ordinarios y/o moratorios', '026911951282', '0841', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Convenio/reestructura de pago no respetado por la Institución', '026911951282', '0842', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Eliminación de historial crediticio no realizada', '026911951282', '0844', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '026911951282', '0849', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro de intereses moratorios y accesorios durante el proceso de aclaración', '026911951282', '0853', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro de intereses no pactados en el contrato', '026911951282', '0854', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el monto de la prima de los seguros y/o con la forma del pago del mismo', '026911951282', '0855', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Bloqueo o cancelación del producto o servicio sin previo aviso', '026911951282', '0895', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Fusión de tarjetas de crédito no atendida', '026911951282', '0948', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro de comisión por anualidad', '026911951282', '0952', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '026911951282', '0967', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con el cobro del saldo a los Usuarios, clientes y/o socios adicionales no pactado en el contrato', '026911951282', '0971', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con la no aceptación de pago con otro medio diferente al efectivo', '026911951282', '1011', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad por aumento de la línea de crédito sin previo aviso', '026911951282', '1019', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Incumplimiento con los términos del contrato', '026911951282', '1042', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'La Institución no puso a disposición del Usuario, cliente y/o socio el dictamen y la evidencia de su aclaración al término del plazo correspondiente (45 días naturales para operaciones en el país o 180 en el extranjero)', '026911951282', '1055', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '026911951282', '1058', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Modificación de tasa contractual sin aviso previo al Usuario, cliente y/o socio', '026911951282', '1060', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'No envío de estados de cuenta al domicilio del Usuario, cliente y/o socio', '026911951282', '1075', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '026911951282', '1079', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '026911951282', '1081', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Reposición de plástico no atendida', '026911951282', '1091', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '026911951282', '1101', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Información sobre la actualización de historial crediticio', '026911951282', '1200', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Solicitud de estados de cuenta', '026911951282', '1207', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad con la disminución de la línea de crédito sin previo aviso', '026911951282', '1209', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Información del cobro de intereses ordinarios y/o moratorios', '026911951282', '1211', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Información para la cancelación de producto o servicio', '026911951282', '1217', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Información para la fusión de tarjetas de crédito', '026911951282', '1222', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Disposición de efectivo en ventanilla y/o sucursal no reconocida por el Usuario, cliente y/o socio', '026911951282', '1236', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Disposición de efectivo en cajero automático no reconocida por el Usuario, cliente y/o socio', '026911951282', '1237', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Seguimiento de Aclaración (estatus de su solicitud de aclaración)', '026911951282', '1245', 'SI', '', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Consumo no reconocido, no presencial, por internet', '026911951282', '1316', '', 'SI', '');
INSERT INTO `catalogo_productos_causas` (`tipo_operacion`, `tipo_producto`, `tipo_credito`, `causa`, `codigo_producto`, `codigo_causa`, `aplica_consulta`, `aplica_reclamacion`, `aplica_aclaracion`) VALUES
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Consumos no reconocidos (de forma presencial y/o en TPV)', '026911951282', '1317', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Crédito, TDC o cuenta otorgados sin ser solicitados ni autorizados por el Usuario, cliente y/o socio', '026911951282', '1319', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'El Usuario, cliente y/o socio no reconoce haber celebrado contrato con la Institución (crédito o depósito)', '026911951282', '1320', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Inconformidad por cargos no reconocidos en la cuenta por otras Instituciones financieras (Aseguradoras, Bancos, Sofom, etc.)', '026911951282', '1322', '', 'SI', 'SI'),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'La institución financiera no reflejó en tiempo el pago efectuado por el usuario y/o cliente para la actualización del historial crediticio', '026911951282', '1323', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'No entrega de saldo a favor', '026911951282', '1324', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Otorgamiento de crédito a menores de edad', '026911951282', '1325', '', 'SI', ''),
('Operaciones Activas', 'Tarjeta de crédito', 'Crédito Cuenta Corriente (TC)', 'Promociones, beneficios, meses sin intereses, sorteos y/o premios no entregados o aplicados al Usuario, cliente y/o socio', '026911951282', '1326', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'Entrega de billete falso y/o mutilado', '027011961283', '0585', '', 'SI', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'Traspaso solicitado y no aplicado a cuenta destino', '027011961283', '0588', '', 'SI', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'El cajero automático no muestra la comisión a cobrar', '027011961283', '0768', '', 'SI', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'No entrega de acuse de recepción de la aclaración', '027011961283', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'Plástico retenido en cajero automático', '027011961283', '0774', '', 'SI', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'El cajero automático no entrega la cantidad solicitada', '027011961283', '0936', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027011961283', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Cajero automático', 'Servicio Tradicional (CA)', 'Disposición de efectivo en cajero automático no reconocida por el Usuario, cliente y/o socio', '027011961283', '1237', '', 'SI', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'No entrega de acuse de recepción de la aclaración', '027011971284', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'Pago o depósito realizado a través de un corresponsal no aplicado en cuenta', '027011971284', '0773', '', 'SI', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '027011971284', '0849', '', 'SI', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '027011971284', '1058', '', 'SI', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027011971284', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Corresponsales', 'Servicio Tradicional (CORR)', 'Inconformidad con la atención proporcionada por el personal de la Institución', '027011971284', '1227', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Reverso de pago no atendido', '027011981285', '0466', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Inconformidad por cargo duplicado', '027011981285', '0769', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'No entrega de acuse de recepción de la aclaración', '027011981285', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Solicitud de domiciliación no atendida', '027011981285', '0830', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Domiciliación realizada en fecha distinta a la establecida', '027011981285', '0867', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Bloqueo o cancelación del producto o servicio sin previo aviso', '027011981285', '0895', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Inconformidad por domiciliación no contratada', '027011981285', '1022', '', 'SI', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027011981285', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '027011981285', '1081', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Información para solicitar domiciliación', '027011981285', '1226', 'SI', '', ''),
('Operaciones de Servicios', 'Domiciliación', 'Servicio Tradicional (D)', 'Inconformidad con la atención proporcionada por el personal de la Institución', '027011981285', '1227', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Incumplimiento en la entrega de documentos', '027011991286', '0162', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Negativa a rendir cuentas', '027011991286', '0195', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Inconformidad con la administración de los bienes fideicomitidos', '027011991286', '0371', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Inconformidad con el saldo de los bienes fideicomitidos', '027011991286', '0372', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'No se entrega bienes y/o rendimientos fideicomitidos', '027011991286', '0532', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'No entrega de acuse de recepción de la aclaración', '027011991286', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '027011991286', '0849', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Solicitud de instrucciones no atendida', '027011991286', '0869', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '027011991286', '0967', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Incumplimiento con los términos del contrato', '027011991286', '1042', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '027011991286', '1058', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027011991286', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Pago o depósito no aplicado total o parcialmente al producto o servicio', '027011991286', '1081', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '027011991286', '1101', '', 'SI', ''),
('Operaciones de Servicios', 'Fideicomisos', 'Servicio Tradicional (F)', 'Información para la cancelación de producto o servicio', '027011991286', '1217', 'SI', '', ''),
('Operaciones de Servicios', 'Información sobre productos y servicios financieros', 'Información sobre productos y servicios financieros', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027012001287', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Transferencia electrónica no reconocida', '027012011288', '0548', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Transferencia electrónica no aplicada', '027012011288', '0729', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'No entrega de acuse de recepción de la aclaración', '027012011288', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Inconformidad con el cobro de comisión no reconocida o no pactada en el contrato', '027012011288', '0849', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Bloqueo o cancelación del producto o servicio sin previo aviso', '027012011288', '0895', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Modificación de comisiones sin aviso previo al Usuario, cliente y/o socio', '027012011288', '1058', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027012011288', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Solicitud de cancelación de producto o servicio no atendida y/o no aplicada', '027012011288', '1101', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Información para la cancelación de producto o servicio', '027012011288', '1217', 'SI', '', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Aceptación de promoción efectivo inmediato no reconocida', '027012011288', '1247', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Compra de tiempo aire no aplicada', '027012011288', '1248', '', 'SI', 'SI'),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Compra de tiempo aire no reconocida', '027012011288', '1249', '', 'SI', ''),
('Operaciones de Servicios', 'Servicio móvil', 'Servicio Electrónico (SM)', 'Envío y/o retiro de dinero móvil no reconocida', '027012011288', '1250', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'No entrega de acuse de recepción de la aclaración', '027012021289', '0770', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'Bloqueo o cancelación del producto o servicio sin previo aviso', '027012021289', '0895', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'Inconformidad con el cobro de productos o servicios no contratados por el Usuario, cliente y/o socio', '027012021289', '0967', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'La Institución no puso a disposición del Usuario, cliente y/o socio el dictamen y la evidencia de su aclaración al término del plazo correspondiente (45 días naturales para operaciones en el país o 180 en el extranjero)', '027012021289', '1055', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027012021289', '1079', 'SI', '', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'Inconformidad con la atención proporcionada por el personal de la Institución', '027012021289', '1227', '', 'SI', ''),
('Operaciones de Servicios', 'Servicios en sucursal y/o UNE', 'Servicio Tradicional (UNE)', 'Disposición de efectivo en ventanilla y/o sucursal no reconocida por el Usuario, cliente y/o socio', '027012021289', '1236', '', 'SI', ''),
('Información sobre productos y servicios financieros', 'Información sobre productos y servicios financieros', 'Información sobre productos y servicios financieros', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027112031290', '1079', 'SI', '', ''),
('REUS', 'REUS', 'REUS', 'Aviso de infracción del REUS', '027212041291', '0601', '', 'SI', ''),
('REUS', 'REUS', 'REUS', 'Orientación sobre el funcionamiento de productos y servicios financieros', '027212041291', '1079', 'SI', '', '');

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
-- Estructura de tabla para la tabla `consultas_data`
--

CREATE TABLE `consultas_data` (
  `id` int(11) NOT NULL,
  `data_json` longtext DEFAULT NULL,
  `f_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `enviada` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_federativas`
--

CREATE TABLE `entidades_federativas` (
  `clave` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entidades_federativas`
--

INSERT INTO `entidades_federativas` (`clave`, `descripcion`) VALUES
(1, 'Aguascalientes '),
(2, 'Baja California '),
(3, 'Baja California Sur '),
(4, 'Campeche '),
(5, 'Coahuila '),
(6, 'Colima '),
(7, 'Chiapas '),
(8, 'Chihuahua '),
(9, 'Ciudad de México '),
(10, 'Durango '),
(11, 'Guanajuato '),
(12, 'Guerrero '),
(13, 'Hidalgo '),
(14, 'Jalisco '),
(15, 'México '),
(16, 'Michoacán '),
(17, 'Morelos '),
(18, 'Nayarit '),
(19, 'Nuevo León '),
(20, 'Oaxaca '),
(21, 'Puebla '),
(22, 'Querétaro '),
(23, 'Quintana Roo '),
(24, 'San Luis Potosí '),
(25, 'Sinaloa '),
(26, 'Sonora '),
(27, 'Tabasco '),
(28, 'Tamaulipas '),
(29, 'Tlaxcala '),
(30, 'Veracruz '),
(31, 'Yucatán '),
(32, 'Zacatecas ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_sofom`
--

CREATE TABLE `info_sofom` (
  `id` int(11) NOT NULL,
  `denominacion` varchar(500) DEFAULT NULL,
  `sector` varchar(500) DEFAULT NULL,
  `f_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_sofom`
--

INSERT INTO `info_sofom` (`id`, `denominacion`, `sector`, `f_actualizacion`) VALUES
(1, 'Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.', 'Sociedades Financieras de Objeto Múltiple E.N.R.', '2024-07-17 20:23:51');

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
  `enviada` tinyint(1) DEFAULT 0,
  `respuesta_api` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `quejas_data`
--

INSERT INTO `quejas_data` (`id_quejas`, `data_queja`, `fcreacion_queja`, `enviada`, `respuesta_api`) VALUES
(1, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/5ebcafe2\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 1008,\n    \"QuejasLocId\": 26,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:30:36', 1, NULL),
(2, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/94d2cfbe\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:33:22', 1, NULL),
(3, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/4d87f249\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76134,\n    \"QuejasColId\": 111,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:34:50', 1, NULL),
(4, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/73c5eabb\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:36:32', 1, NULL),
(5, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/76b1835f\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:36:55', 1, NULL),
(6, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector1\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/30f261d0\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:37:46', 0, NULL),
(7, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/63561f39\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:39:54', 1, NULL),
(8, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/f350927c\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 20:41:16', 1, NULL),
(9, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/04e35d4f\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 24,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 22:06:45', 1, NULL),
(10, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/d019f34a\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911831261\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 2,\n    \"QuejasCP\": 76904,\n    \"QuejasColId\": 24,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 6,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 31,\n    \"QuejasFecResolucion\": \"15/07/2024\",\n    \"QuejasFecNotificacion\": \"17/07/2024\",\n    \"QuejasRespuesta\": 1,\n    \"QuejasNumPenal\": 1,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-05 23:05:36', 1, NULL),
(11, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/d6bea261\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"Solicitud de estados de cuenta no atendida\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:28:13', 0, NULL),
(12, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/8f38c84b\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"Crédito aprobado sin la entrega de recursos\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 887,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:29:04', 0, NULL),
(13, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/c5989536\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 1,\n    \"QuejasLocId\": 1,\n    \"QuejasMunId\": 1,\n    \"QuejasEstados\": 1,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:41:53', 0, NULL),
(14, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 1,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/99a6156d\",\n    \"QuejasFecRecepcion\": \"01/01/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 122,\n    \"QuejasLocId\": 21,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:42:25', 0, NULL),
(15, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 1,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/ef7e559e\",\n    \"QuejasFecRecepcion\": \"01/01/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:44:54', 0, NULL),
(16, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/e7428b31\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:45:34', 1, NULL),
(17, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 3,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/6-2024/7f31dec3\",\n    \"QuejasFecRecepcion\": \"01/03/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0563\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 2,\n    \"QuejasSexo\": null,\n    \"QuejasEdad\": null,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-07-17 20:47:15', 1, NULL),
(18, '[\n  {\n    \"QuejasDenominacion\": \"Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R.\",\n    \"QuejasSector\": \"Sociedades Financieras de Objeto Múltiple E.N.R.\",\n    \"QuejasNoMes\": 1,\n    \"QuejasNum\": 1,\n    \"QuejasFolio\": \"Sefi/8-2024/d68f6a27\",\n    \"QuejasFecRecepcion\": \"01/01/2024\",\n    \"QuejasMedio\": 1,\n    \"QuejasNivelAT\": 1,\n    \"QuejasProducto\": \"026911801257\",\n    \"QuejasCausa\": \"0\",\n    \"QuejasPORI\": \"SI\",\n    \"QuejasEstatus\": 1,\n    \"QuejasCP\": 76138,\n    \"QuejasColId\": 119,\n    \"QuejasLocId\": 9,\n    \"QuejasMunId\": 14,\n    \"QuejasEstados\": 22,\n    \"QuejasTipoPersona\": 1,\n    \"QuejasSexo\": \"H\",\n    \"QuejasEdad\": 18,\n    \"QuejasFecResolucion\": null,\n    \"QuejasFecNotificacion\": null,\n    \"QuejasRespuesta\": null,\n    \"QuejasNumPenal\": null,\n    \"QuejasPenalizacion\": 1\n  }\n]', '2024-08-01 20:35:07', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamacion_data`
--

CREATE TABLE `reclamacion_data` (
  `id` int(11) NOT NULL,
  `data_json` longtext DEFAULT NULL,
  `f_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `enviada` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens_redeco_reune_superuser`
--

CREATE TABLE `tokens_redeco_reune_superuser` (
  `id` int(11) NOT NULL,
  `institucion` varchar(200) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `f_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tokens_redeco_reune_superuser`
--

INSERT INTO `tokens_redeco_reune_superuser` (`id`, `institucion`, `token`, `f_creacion`) VALUES
(1, 'REDECO', '40380|69|694326|NO|NO', '2024-07-17 23:04:33'),
(2, 'REUNE', ' 40380|69|694326|SI|NO', '2024-07-17 23:05:23');

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
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `token`, `f_creacion`, `tipo_usuario`, `json_usuario`, `last_update`) VALUES
(1, 'admin', 'Sefi2015', 'Este usuario es solo para administración', '2024-07-19 23:33:09', NULL, NULL, '2024-08-02 22:38:43'),
(2, 'AdminSefi', 'Se2024fi', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MjhlYzIzMS1mYmI4LTQxOGYtODZjYS1mMzk4Nzk1NThiZjkiLCJ1c2VybmFtZSI6IkFkbWluU2VmaSIsImluc3RpdHVjaW9uaWQiOiI0OUE4QzJERi01OTQyLTRFMTQtOUQzNi1FRDMwNzBENCIsImluc3RpdHVjaW9uQ2xhdmUiOjEzNDYwLCJkZW5vbWluYWNpb25fc29jaWFsIjoiU2VmaSBFc3RyYXTDqWdpY29zLCBTLkEuUC5JLiBkZSBDLlYuLCBTT0ZPTSwgRS5OLlIuIiwic2VjdG9yaWQiOjI0LCJzZWN0b3IiOiJTT0NJRURBREVTIEZJTkFOQ0lFUkFTIERFIE9CSkVUTyBNVUxUSVBMRSBFTlIiLCJzeXN0ZW0iOiJSRURFQ08iLCJpYXQiOjE3MTk0MzQwMzUsImV4cCI6MTcyMjAyNjAzNX0.NfgQJYSsc5ptxN5I0si_j191srsJeNEjTJCQOLL1HPI', '2024-07-19 23:33:09', NULL, NULL, '2024-08-02 22:38:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aclaracion_data`
--
ALTER TABLE `aclaracion_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_redeco`
--
ALTER TABLE `config_redeco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consultas_data`
--
ALTER TABLE `consultas_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `info_sofom`
--
ALTER TABLE `info_sofom`
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
-- Indices de la tabla `reclamacion_data`
--
ALTER TABLE `reclamacion_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tokens_redeco_reune_superuser`
--
ALTER TABLE `tokens_redeco_reune_superuser`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aclaracion_data`
--
ALTER TABLE `aclaracion_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `config_redeco`
--
ALTER TABLE `config_redeco`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas_data`
--
ALTER TABLE `consultas_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `info_sofom`
--
ALTER TABLE `info_sofom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quejas_data`
--
ALTER TABLE `quejas_data`
  MODIFY `id_quejas` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `reclamacion_data`
--
ALTER TABLE `reclamacion_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tokens_redeco_reune_superuser`
--
ALTER TABLE `tokens_redeco_reune_superuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
