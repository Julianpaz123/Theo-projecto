-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2023 a las 01:27:47
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project_2`
--
CREATE DATABASE IF NOT EXISTS `project_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project_2`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `pa_actualizarempleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actualizarempleado` (IN `pidEmpleado` INT(11), IN `pnumDocEmpleado` VARCHAR(15), IN `ptipoDocEmpleado` VARCHAR(20), IN `pnombreEmpleado` VARCHAR(50), IN `papellidoEmpleado` VARCHAR(50), IN `pdireccionEmpleado` VARCHAR(50), IN `ptelefonoEmpleado` VARCHAR(20), IN `pestadoEmpleado` VARCHAR(20), IN `pidUsuarioFK` INT(11))   BEGIN
INSERT INTO empleado (idEmpleado, numDocEmpleado, tipoDocEmpleado, nombreEmpleado, apellidoEmpleado, direccionEmpleado, telefonoEmpleado,
estadoEmpleado, idUsuarioFK) 
VALUES(pidEmpleado, pnumDocEmpleado, ptipoDocEmpleado, pnombreEmpleado, papellidoEmpleado, pdireccionEmpleado, ptelefonoEmpleado,
pestadoEmpleado, pidUsuarioFK);
END$$

DROP PROCEDURE IF EXISTS `pa_consultarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_consultarCita` (IN `pidCita` INT(11), IN `pfechaCita` DATE, IN `phoraCita` TIME, IN `pestadocita` VARCHAR(20), IN `pidEmpleadoFK` INT(11), IN `pidClienteFK` INT(11), IN `pidServicioFK` INT(11))   BEGIN 
INSERT INTO cita(idCita, fechaCita, horaCita, estadoCita, idEmpleadoFK, idClienteFK, idServicioFK)
VALUES(pidCita, pfechaCita, phoraCita, pestadoCita, pidEmpleadoFK, pidClienteFK, pidServicioFK); END$$

DROP PROCEDURE IF EXISTS `pa_eliminarusuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_eliminarusuario` (IN `pidUsuario` INT(11), IN `pcorreoUsuario` VARCHAR(50), IN `ppasswordUsuario` INT(20), IN `pestadoUsuario` VARCHAR(20), IN `pidRolFK` INT(11))   BEGIN
INSERT INTO usuario (idUsuario, correoUsuario, passwordUsuario, estadoUsuario, idRolFK) 
VALUES(pidUsuario, pcorreoUsuario, ppasswordUsuario, pestadoUsuario, pidRolFK);
END$$

DROP PROCEDURE IF EXISTS `pa_insertarcliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insertarcliente` (IN `pidCliente` INT(11), IN `pnumDocCliente` VARCHAR(15), IN `ptipoDocCliente` VARCHAR(20), IN `pnombreCliente` VARCHAR(50), IN `papellidoCliente` VARCHAR(50), IN `pdireccionCliente` VARCHAR(20), IN `ptelefonoCliente` VARCHAR(20), IN `pestadoCliente` VARCHAR(20), IN `pidUsuarioFK` INT(11))   BEGIN
INSERT INTO cliente (idCliente,numDocCliente,tipoDocCliente,nombreCliente,apellidoCliente,direccionCliente,telefonoCliente,estadoCliente,idUsuarioFK) VALUES (pidCliente,pnumDocCliente,ptipoDocCliente,pnombreCliente,papellidoCliente,pdireccionCliente,ptelefonoCliente,pestadoCliente,pidUsuarioFK);
END$$

DROP PROCEDURE IF EXISTS `sp_insert_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_user` (IN `idusuario` INT, IN `Useremail` VARCHAR(50), IN `Userpassword` VARCHAR(20), IN `statusid` INT, IN `idRolFK` INT)   BEGIN
IF (SELECT COUNT(*) FROM user WHERE  User_email=Useremail)=0 THEN
INSERT INTO `user`(`idUsuario`, `User_email`, `User_password`, `status_id`, `idRolFK`)
VALUES (idusuario,Useremail,Userpassword,statusid,idRolFK);
SELECT 'USER INSERT' AS errormessage;
ELSE
SELECT 'DUPLICATE KEY ERROR' AS errormessage;
END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_email`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_email` (IN `Useremail` VARCHAR(50))   BEGIN
SELECT * FROM user WHERE User_email=Useremail;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_user_id` (IN `idUsuario` INT)   BEGIN
SELECT User_password FROM user WHERE User_id=Userid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE `administrador` (
  `IdEmpleado` int(11) NOT NULL,
  `numDocEmpleado` varchar(15) DEFAULT NULL,
  `tipoDocEmpleado` varchar(20) DEFAULT NULL,
  `nombreEmpleado` varchar(50) DEFAULT NULL,
  `apellidoEmpleado` varchar(50) DEFAULT NULL,
  `direccionEmpleado` varchar(50) DEFAULT NULL,
  `telefonoEmpleado` varchar(20) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`IdEmpleado`, `numDocEmpleado`, `tipoDocEmpleado`, `nombreEmpleado`, `apellidoEmpleado`, `direccionEmpleado`, `telefonoEmpleado`, `status_id`, `idUsuarioFK`) VALUES
(2, '1212121', 'CC', 'DIego', 'Casallas', 'Calle ', '21212', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL,
  `fechaCita` date DEFAULT NULL,
  `horaCita` time DEFAULT NULL,
  `estadoCita` varchar(20) DEFAULT NULL,
  `idEmpleadoFK` int(11) DEFAULT NULL,
  `idClienteFK` int(11) DEFAULT NULL,
  `idServivioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`idCita`, `fechaCita`, `horaCita`, `estadoCita`, `idEmpleadoFK`, `idClienteFK`, `idServivioFK`) VALUES
(1, '0000-00-00', '00:10:20', 'activa', 102030, 10125, 2133452),
(2, '2010-02-20', '110:00:23', 'activa', 12010, 12575, 212582);

--
-- Disparadores `cita`
--
DROP TRIGGER IF EXISTS `Cita_Cliente`;
DELIMITER $$
CREATE TRIGGER `Cita_Cliente` BEFORE INSERT ON `cita` FOR EACH ROW begin 
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `numDocCliente` varchar(15) DEFAULT NULL,
  `tipoDocCliente` varchar(20) DEFAULT NULL,
  `nombreCliente` varchar(50) DEFAULT NULL,
  `apellidoCliente` varchar(50) DEFAULT NULL,
  `direccionCliente` varchar(20) DEFAULT NULL,
  `telefonoCliente` varchar(20) DEFAULT NULL,
  `estadoCliente` varchar(20) DEFAULT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `numDocCliente`, `tipoDocCliente`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`, `estadoCliente`, `idUsuarioFK`) VALUES
(1, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560),
(2, '16845551', 'CC', 'Gerardo', 'Gomez', 'Calle 29-28 #45', '3212565289', 'Afiliado', 745289),
(3, '10452659', 'CC', 'Pepe', 'Pinilla', 'Calle 58-32 #42', '3214026599', 'Afiliado', 258690),
(4, '11025628', 'CC', 'Julio', 'Lopez', 'Calle 25-48 #47', '3125689452', 'Afiliado', 245786),
(5, '10145895', 'CC', 'Julio', 'Dominguez', 'Calle 66-07 #18', '3256964', 'Afiliado', 54545469),
(6, '12574669', 'CC', 'Pavlito', 'Lozas', 'Calle 124-167 #44', '3214275289', 'Afiliado', 5741560),
(7, '10241454', 'CC', 'Selina', 'Gonzales', 'Calle 412-277 #4', '3214065289', 'Afiliado', 575460),
(8, '45678546', 'CC', 'Juan', 'Perez', 'Calle 481-287 #4', '3214065289', 'Afiliado', 57550),
(9, '55684561', 'CC', 'Jose', 'Gales', 'Calle 15-267 #4', '3214065289', 'Afiliado', 774710),
(10, '86783215', 'CC', 'Leonardo', 'Mendoza', 'Calle 78-257 #4', '3214065289', 'Afiliado', 77857540),
(11, '65463243', 'CC', 'Maicol', 'De nazaret', 'Calle 4845-287 #4', '3214065289', 'Afiliado', 745754),
(12, '56453243', 'CC', 'Esperanza', 'Ramirez', 'Calle 448-257 #4', '384654689', 'Afiliado', 7785460),
(13, '54655546', 'CC', 'Juan', 'ventero', 'Calle 4855-207 #4', '326845689', 'Afiliado', 4758540),
(14, '12432135', 'CC', 'alvaro', 'perez', 'Calle 486-627 #4', '3354326665289', 'Afiliado', 74460),
(15, '54987561', 'CC', 'jose', 'Marin', 'Calle 4885-217 #4', '33423289', 'Afiliado', 75432),
(16, '54323445', 'CC', 'venzema', 'pedraza', 'Calle 48-2784 #4', '325432489', 'Afiliado', 76452141),
(17, '10242431', 'CC', 'Yina', 'uzumaki', 'Calle 48-278 #4', '354234589', 'Afiliado', 7735430),
(18, '58524612', 'CC', 'Mario', 'dicarpo', 'Calle 4488-227 #4', '3684564865289', 'Afiliado', 76440),
(19, '54684265', 'CC', 'Carlos', 'ronaldo', 'Calle 4848-237 #4', '368456489', 'Afiliado', 75654),
(20, '68456845', 'CC', 'tocalo', 'riconetti', 'Calle 48884-272 2#4', '38645648', 'Afiliado', 5788),
(21, '32486354', 'CC', 'holmes', 'guzman', 'Calle 48-2057 #4', '35464865489', 'Afiliado', 447457),
(22, '68456845', 'CC', 'jose', 'caicedo', 'Calle 4818-271 #4', '25446456', 'Afiliado', 8765760),
(23, '54685648', 'CC', 'johan', 'cediel', 'Calle 4848-275 #4', '232456468', 'Afiliado', 776750),
(24, '78923912', 'CC', 'lucas', 'rivieros', 'Calle 4878-274 #4', '64564865', 'Afiliado', 786540),
(25, '18283941', 'CC', 'Radamel', 'Funca', 'Calle 458-2327 #4', '35342289', 'Afiliado', 224560),
(26, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560),
(27, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560),
(28, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560),
(29, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560),
(30, '29838412', 'CC', 'Juan', 'Gonzales', 'Calle 48-27 #4', '3214065289', 'Afiliado', 778560);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_serv`
--

DROP TABLE IF EXISTS `cli_serv`;
CREATE TABLE `cli_serv` (
  `estadoCliente` varchar(20) DEFAULT NULL,
  `estadoServicio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crear`
--

DROP TABLE IF EXISTS `crear`;
CREATE TABLE `crear` (
  `nombreCliente` varchar(50) DEFAULT NULL,
  `fechaCita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jem`
--

DROP TABLE IF EXISTS `jem`;
CREATE TABLE `jem` (
  `numDocEmpleado` varchar(15) DEFAULT NULL,
  `desccripcionRol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `desccripcionRol` varchar(30) DEFAULT NULL,
  `estadoRol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `desccripcionRol`, `estadoRol`) VALUES
(1, 'Cliente', NULL),
(2, 'Empleado', NULL);

--
-- Disparadores `rol`
--
DROP TRIGGER IF EXISTS `Administrador_Rol`;
DELIMITER $$
CREATE TRIGGER `Administrador_Rol` BEFORE INSERT ON `rol` FOR EACH ROW BEGIN
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

DROP TABLE IF EXISTS `servicio`;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `descripcionServicio` varchar(30) DEFAULT NULL,
  `estadoServicio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Disparadores `servicio`
--
DROP TRIGGER IF EXISTS `Cliente_Servicio`;
DELIMITER $$
CREATE TRIGGER `Cliente_Servicio` AFTER INSERT ON `servicio` FOR EACH ROW BEGIN
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUsuario` int(11) NOT NULL,
  `User_email` varchar(50) DEFAULT NULL,
  `User_password` varchar(20) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `idRolFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUsuario`, `User_email`, `User_password`, `status_id`, `idRolFK`) VALUES
(1, 'diehe@gmail.com', '123456', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usu_ser`
--

DROP TABLE IF EXISTS `usu_ser`;
CREATE TABLE `usu_ser` (
  `idUsuario` int(11) DEFAULT NULL,
  `estadoServicio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`IdEmpleado`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`,`idClienteFK`,`idServivioFK`),
  ADD KEY `idCita` (`idCita`),
  ADD KEY `idCita_2` (`idCita`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRolFK` (`idRolFK`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `IdEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
