SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS sistema_libreria;

USE sistema_libreria;

DROP TABLE IF EXISTS administrador;

CREATE TABLE `administrador` (
  `CodigoAdmin` varchar(70) NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Clave` varchar(535) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`CodigoAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO administrador VALUES("I777YA1N5802","Activo","Administrador","SuperAdministrador","YnRXSjhwRTNTRXJpV3k0MUtVSTloQT09","");



DROP TABLE IF EXISTS bitacora;

CREATE TABLE `bitacora` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(100) NOT NULL,
  `CodigoUsuario` varchar(70) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  `Fecha` varchar(30) NOT NULL,
  `Entrada` varchar(30) NOT NULL,
  `Salida` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PrimaryKey` (`CodigoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO bitacora VALUES("1","UKI777YA1N5802N6873-1","I777YA1N5802","Administrador","12-08-2025","11:16:41","Sin registrar");
INSERT INTO bitacora VALUES("2","UKI777YA1N5802N3976-2","I777YA1N5802","Administrador","17-08-2025","20:34:56","20:38:20");
INSERT INTO bitacora VALUES("3","UKI777YA1N5802N2384-3","I777YA1N5802","Administrador","17-08-2025","21:16:25","Sin registrar");
INSERT INTO bitacora VALUES("4","UKI777YA1N5802N3391-4","I777YA1N5802","Administrador","17-08-2025","21:16:25","21:28:24");
INSERT INTO bitacora VALUES("5","UKI777YA1N5802N8029-5","I777YA1N5802","Administrador","17-08-2025","21:30:14","21:46:49");
INSERT INTO bitacora VALUES("6","UKI777YA1N5802N3850-6","I777YA1N5802","Administrador","17-08-2025","21:46:54","Sin registrar");
INSERT INTO bitacora VALUES("7","UKI777YA1N5802N6021-7","I777YA1N5802","Administrador","17-08-2025","21:47:08","21:59:24");
INSERT INTO bitacora VALUES("8","UKI777YA1N5802N6411-8","I777YA1N5802","Administrador","17-08-2025","22:14:38","Sin registrar");
INSERT INTO bitacora VALUES("9","UKI777YA1N5802N1009-9","I777YA1N5802","Administrador","25-08-2025","03:35:59","Sin registrar");
INSERT INTO bitacora VALUES("10","UKI777YA1N5802N7247-10","I777YA1N5802","Administrador","30-08-2025","00:44:51","Sin registrar");
INSERT INTO bitacora VALUES("11","UKI777YA1N5802N4851-11","I777YA1N5802","Administrador","30-08-2025","01:33:27","Sin registrar");
INSERT INTO bitacora VALUES("12","UKI777YA1N5802N0118-12","I777YA1N5802","Administrador","30-08-2025","22:57:20","Sin registrar");
INSERT INTO bitacora VALUES("13","UKI777YA1N5802N7950-13","I777YA1N5802","Administrador","31-08-2025","01:11:32","Sin registrar");
INSERT INTO bitacora VALUES("14","UKI777YA1N5802N6202-14","I777YA1N5802","Administrador","31-08-2025","01:30:18","Sin registrar");



DROP TABLE IF EXISTS categoria;

CREATE TABLE `categoria` (
  `CodigoCategoria` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`CodigoCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO categoria VALUES("1","Matemáticas");
INSERT INTO categoria VALUES("2","Cuentos");
INSERT INTO categoria VALUES("3","Inglés ");
INSERT INTO categoria VALUES("4","Geografía");



DROP TABLE IF EXISTS docente;

CREATE TABLE `docente` (
  `DUI` varchar(20) NOT NULL,
  `CodigoSeccion` varchar(70) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Clave` varchar(535) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Especialidad` varchar(40) NOT NULL,
  `Jornada` varchar(50) NOT NULL,
  PRIMARY KEY (`DUI`),
  KEY `CodigoSeccion` (`CodigoSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS encargado;

CREATE TABLE `encargado` (
  `DUI` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS estudiante;

CREATE TABLE `estudiante` (
  `DNI` varchar(20) NOT NULL,
  `DUI` varchar(20) NOT NULL,
  `CodigoSeccion` varchar(70) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Clave` varchar(535) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Parentesco` varchar(50) NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `DUI` (`DUI`),
  KEY `CodigoSeccion` (`CodigoSeccion`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`DUI`) REFERENCES `encargado` (`DUI`),
  CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`CodigoSeccion`) REFERENCES `seccion` (`CodigoSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS institucion;

CREATE TABLE `institucion` (
  `CodigoInfraestructura` varchar(30) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `NombreDirector` varchar(100) NOT NULL,
  `NombreBibliotecario` varchar(100) NOT NULL,
  `Moneda` varchar(2) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Year` int(4) NOT NULL,
  PRIMARY KEY (`CodigoInfraestructura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO institucion VALUES("125","Escuela Técnica Nro1","Alberto Paz ","Daniel Juarez","$","115767781","2025");



DROP TABLE IF EXISTS libro;

CREATE TABLE `libro` (
  `CodigoLibro` varchar(100) NOT NULL,
  `CodigoLibroManual` varchar(100) NOT NULL,
  `CodigoCategoria` varchar(20) NOT NULL,
  `CodigoProveedor` varchar(70) NOT NULL,
  `CodigoInfraestructura` varchar(20) NOT NULL,
  `Autor` varchar(70) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `Year` varchar(7) NOT NULL,
  `Estimado` decimal(30,2) NOT NULL,
  `Titulo` varchar(77) NOT NULL,
  `Edicion` varchar(50) NOT NULL,
  `Ubicacion` varchar(50) NOT NULL,
  `Cargo` varchar(100) NOT NULL,
  `Editorial` varchar(70) NOT NULL,
  `Existencias` int(7) NOT NULL,
  `Prestado` int(20) NOT NULL,
  `Imagen` varchar(535) NOT NULL,
  `PDF` varchar(535) NOT NULL,
  `Download` varchar(5) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`CodigoLibro`),
  KEY `CodigoCategoria` (`CodigoCategoria`),
  KEY `CodigoProveedor` (`CodigoProveedor`),
  KEY `CodigoInfraestructura` (`CodigoInfraestructura`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`CodigoCategoria`) REFERENCES `categoria` (`CodigoCategoria`),
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`CodigoProveedor`) REFERENCES `proveedor` (`CodigoProveedor`),
  CONSTRAINT `libro_ibfk_5` FOREIGN KEY (`CodigoInfraestructura`) REFERENCES `institucion` (`CodigoInfraestructura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO libro VALUES("I125Y2025C1B16N8546","978-950-46-1865-2","1","I125Y2025P2N3440","125","Marina E. Andrés","Argentina","2011","0.00","Matemática 1","1ª","Estante 16-1","Entrega del ministerio","Santillana","22","0","","","","Matemática para primer año ");
INSERT INTO libro VALUES("I125Y2025C1B17N4108","978-950-46-1863-8","1","I125Y2025P2N3440","125","Andrea Berman","Argentina","2011","0.00","Matemática 2","1ª","Estante 16-1","Entrega del ministerio","Santillana","30","0","I125Y2025C1B17N4108.jpg","I125Y2025C1B17N4108.pdf","","Libro de matemática para segundo año");
INSERT INTO libro VALUES("I125Y2025C1B18N0630","978-950-46-1886-7","1","I125Y2025P2N3440","125","Gustavo E. Piñero","Argentina","2011","0.00","Matemática 3","1ª","Estante 16-1","Entrega del ministerio","Santillana","9","0","I125Y2025C1B18N0630.jpg","I125Y2025C1B18N0630.pdf","","Matemática para tercer año");
INSERT INTO libro VALUES("I125Y2025C1B23N2704","950-13-2433-8","1","I125Y2025P2N3440","125","Susana N. Etchegoyen","Argentina","2004","0.00","Matemática 1","1ª","Estante 21-3","Entrega del ministerio","Kapelusz","30","0","","","","Actividades de investigación metodológicas como las que realiza un científico");
INSERT INTO libro VALUES("I125Y2025C1B24N7457","950-46-0561-3","1","I125Y2025P2N3440","125","Pablo J. Kaczor","Argentina","2004","0.00","Matemática 1","7ª","Estante 21-5/6","Entrega del ministerio","Santillana Polimodal","27","0","I125Y2025C1B24N7457.jpg","I125Y2025C1B24N7457.pdf","","Números Reales, funciones, ecuaciones e inecuaciones, polinomios y expresiones algebraicas, trigonometría, cónicas, probabilidad y estadística ");
INSERT INTO libro VALUES("I125Y2025C1B25N0893","978-987-576-979-3","1","I125Y2025P2N3440","125","Horacio Itzovich","Argentina","2018","0.00","Nuevo Matemática 1","1ª","Estante 19-","Entrega del ministerio","TintaFresca","110","0","","","","");
INSERT INTO libro VALUES("I125Y2025C1B26N4923","950-01-0777-5","1","I125Y2025P2N3440","125","María Beatriz Camuyrano","Argentina","2004","0.00","Matemática 1","1ª","Estante 22-2","Entrega del ministerio","Estrada Polimodal","33","0","I125Y2025C1B26N4923.jpg","I125Y2025C1B26N4923.pdf","","Modelos matemáticos para interpretar la realidad ");
INSERT INTO libro VALUES("I125Y2025C2B1N8433","978-950-901-09-6","2","I125Y2025P1N1270","125","Anónimo","España","2014","0.00","Poema del Mio Cíd","Primera Edicion","Estanteria Nro 6","Otros","Gárgola","10","0","","","","El Cantar de mio Cid es un cantar de gesta anónimo que relata hazañas heroicas inspiradas libremente en los últimos años de la vida del caballero castellano Rodrigo Díaz de Vivar el Campeador");
INSERT INTO libro VALUES("I125Y2025C2B2N2422","978-987-566-648-1","2","I125Y2025P1N1270","125","Jorge Luis Borges","Argentina","2015","0.00","El Aleph","8ta edición","No disponible","Presupuesto escolar","DEBOLSILLO","2","0","","","","El Aleph es relatado por un narrador en primera persona llamada \"Borges\", nombre que solo se descubre hasta la mitad del texto. Este Borges ficcional comienza relatando el estado de la cosas tras la muerte de Beatriz Viterbo, a la que había amado sin ser correspondido. A Borges solo le quedaba mantener intacto, lo más posible, el mundo y las costumbres asociadas a su relación con Beatriz.");
INSERT INTO libro VALUES("I125Y2025C2B3N3383","978-950-07-5167-4","2","I125Y2025P2N3440","125","Gabriel García Márquez","Colombia","2015","0.00","Crónica de una Muerte Anunciada","Primera Edición","Estante Nro 3","Presupuesto escolar","Sudamericana","5","0","","",""," Narra la historia del asesinato de Santiago Nasar, un joven que es víctima de la venganza de los hermanos Vicario por el honor de su hermana Ángela.");
INSERT INTO libro VALUES("I125Y2025C3B10N9883","978-987-1147-70-0","3","I125Y2025P2N3440","125","Cathy Myers","Argentina","2007","0.00","What´s Up? 2","1ra","Estante 1-3","Entrega del ministerio","Pearson Longman","36","0","I125Y2025C3B10N9883.jpg","I125Y2025C3B10N9883.pdf","","Curso de ingles con actividades complementarias en otro libro (se pueden encontrar en el apartado \"Actividades\")");
INSERT INTO libro VALUES("I125Y2025C3B11N2224","978-987-1147-63-2","3","I125Y2025P2N3440","125","Cathy Myers","Argentina","2007","0.00","What´s Up? 1","1ª","Estante 1-2","Entrega del ministerio","Pearson Longman","2","0","I125Y2025C3B11N2224.jpg","I125Y2025C3B11N2224.pdf","","Curso de ingles con actividades complementarias  ");
INSERT INTO libro VALUES("I125Y2025C3B12N5081","0-8384-3258-1","3","I125Y2025P2N3440","125","Anna Uhl Chamot","Argentina","2002","0.00","Up Close 2","1ª","Estante 1-2","Entrega del ministerio","THOMSON HEINLE","17","0","","","","Ingles para la comunidad");
INSERT INTO libro VALUES("I125Y2025C3B13N5269","0-8384-3285-9","3","I125Y2025P2N3440","125","Anna Uhl Chamot","Argentina","2002","0.00","Up Close 3","1ª","Estante 1-4","Entrega del ministerio","THOMSON HEINLE","14","0","","","","Curso de ingles para la comunicación global ");
INSERT INTO libro VALUES("I125Y2025C3B14N4765","0-582-42133-0","3","I125Y2025P2N3440","125","Michael Harris ","Inglaterra","2000","0.00","Opportunities","1ª","1-2","Entrega del ministerio","Pearson Logman","13","0","I125Y2025C3B14N4765.jpg","I125Y2025C3B14N4765.pdf","","Curso de inglés con Actividades integradas en el mismo libro");
INSERT INTO libro VALUES("I125Y2025C3B15N8282","0-521-65720-2","3","I125Y2025P2N3440","125","Remacha Esteras","Estados Unidos","1999","0.00","Infotech","2ª","Estante 1-2","Entrega del ministerio","Cambridge","3","0","I125Y2025C3B15N8282.jpg","I125Y2025C3B15N8282.pdf","","Curso de inglés para usuarios de computadoras");
INSERT INTO libro VALUES("I125Y2025C3B4N3862","0-19-436670","3","I125Y2025P2N3440","125","John y Liz Soars","Estados Unidos ","2000","0.00","New Headway ","1ra","Estante 1-1","Donaciones","Oxford","16","0","I125Y2025C3B4N3862.jpg","I125Y2025C3B4N3862.pdf","","Curso de Inglés");
INSERT INTO libro VALUES("I125Y2025C3B5N7434","0-19-437631-1","3","I125Y2025P2N3440","125","Liz y John Soars","Estados Unidos","2002","0.00","New Headway","1ra","Estante 1-1","Entrega del ministerio","Oxford","16","0","I125Y2025C3B5N7434.jpg","I125Y2025C3B5N7434.pdf","","Curso de Inglés");
INSERT INTO libro VALUES("I125Y2025C3B6N8593","978-0-19-453643-1","3","I125Y2025P2N3440","125","Gregory J.Manin","Estados Unidos","2011","0.00","Engage","1ra","Estante 1-5","Entrega del ministerio","Oxford","59","0","","","","Curso Multi-nivel ");
INSERT INTO libro VALUES("I125Y2025C3B7N0983","978-0-19-453637-0","3","I125Y2025P2N3440","125","Gregory J.Manin","Estados Unidos","2011","0.00","Engage ","1ra","Estante 1-1","Entrega del ministerio","Oxford","18","0","I125Y2025C3B7N0983.jpg","I125Y2025C3B7N0983.pdf","","Curso de inglés multi-nivel ");
INSERT INTO libro VALUES("I125Y2025C3B8N1281","978-987-1147-33-5","3","I125Y2025P2N3440","125","Leonor Corradi y Pupi Ravinovich","Argentina","2006","0.00","For Teens 3","1ra","Estante 1-1","Entrega del ministerio","Pearson Longman","24","0","I125Y2025C3B8N1281.jpg","I125Y2025C3B8N1281.pdf","","Curso de inglés de cuatro niveles");
INSERT INTO libro VALUES("I125Y2025C3B9N3383","978-987-1147-10-6","3","I125Y2025P2N3440","125","Leonor Corradi y Pupi Rabinovich","Argentina","2004","0.00","For Teens 1","1ra","Estante 1-2","Entrega del ministerio","Pearson Longman","22","0","I125Y2025C3B9N3383.jpg","I125Y2025C3B9N3383.pdf","","Curso de ingles de cuatro niveles");
INSERT INTO libro VALUES("I125Y2025C4B19N3056","950-701-527-2","4","I125Y2025P2N3440","125","J. Blanco","Argentina","2000","0.00","Geografía Mundial Contemporánea","3ª","Estante 22-1","Entrega del ministerio","Aique Polimodal","6","0","","","","Los territorios en la economía globalizada");
INSERT INTO libro VALUES("I125Y2025C4B20N7481","950-01-0771-6","4","I125Y2025P2N3440","125","Raquel Alvarado Quetgles","Argentina","2005","0.00","La organización del espacio mundial","3ª","Estante 22-1","Entrega del ministerio","Estrada","17","0","","","","Atlas geográfico y análisis del caso");
INSERT INTO libro VALUES("I125Y2025C4B21N4216","978-950-46-2274-1","4","I125Y2025P2N3440","125","Mariana.B Arzeno ","Argentina","2011","0.00","Argentina en la Globalización","1ª","Estante 22-1","Entrega del ministerio","Santillana","20","0","","","","");
INSERT INTO libro VALUES("I125Y2025C4B22N5916","978-987-683-442","4","I125Y2025P2N3440","125","Fabián Flores","Argentina","2015","0.00","Espacios geográficos latinoamericanos ","1ª","Estante 22-1","Entrega del ministerio","Longseller","68","0","","","","");



DROP TABLE IF EXISTS personal;

CREATE TABLE `personal` (
  `DUI` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Clave` varchar(535) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamo;

CREATE TABLE `prestamo` (
  `CodigoPrestamo` varchar(70) NOT NULL,
  `CodigoLibro` varchar(100) NOT NULL,
  `CodigoAdmin` varchar(70) NOT NULL,
  `FechaSalida` varchar(30) NOT NULL,
  `FechaEntrega` varchar(30) NOT NULL,
  `Estado` varchar(30) NOT NULL,
  PRIMARY KEY (`CodigoPrestamo`),
  KEY `CodigoLibro` (`CodigoLibro`),
  KEY `CodigoAdmin` (`CodigoAdmin`),
  CONSTRAINT `prestamo_ibfk_5` FOREIGN KEY (`CodigoLibro`) REFERENCES `libro` (`CodigoLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamodocente;

CREATE TABLE `prestamodocente` (
  `CodigoPrestamo` varchar(70) NOT NULL,
  `DUI` varchar(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  KEY `CodigoPrestamo` (`CodigoPrestamo`),
  KEY `DUI` (`DUI`),
  KEY `CodigoPrestamo_2` (`CodigoPrestamo`),
  CONSTRAINT `prestamodocente_ibfk_1` FOREIGN KEY (`CodigoPrestamo`) REFERENCES `prestamo` (`CodigoPrestamo`),
  CONSTRAINT `prestamodocente_ibfk_2` FOREIGN KEY (`DUI`) REFERENCES `docente` (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamoestudiante;

CREATE TABLE `prestamoestudiante` (
  `CodigoPrestamo` varchar(70) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  KEY `CodigoPrestamo` (`CodigoPrestamo`),
  KEY `NIE` (`DNI`),
  CONSTRAINT `prestamoestudiante_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `estudiante` (`DNI`),
  CONSTRAINT `prestamoestudiante_ibfk_2` FOREIGN KEY (`CodigoPrestamo`) REFERENCES `prestamo` (`CodigoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamopersonal;

CREATE TABLE `prestamopersonal` (
  `CodigoPrestamo` varchar(70) NOT NULL,
  `DUI` varchar(20) NOT NULL,
  KEY `CodigoPrestamo` (`CodigoPrestamo`),
  KEY `DUI` (`DUI`),
  CONSTRAINT `prestamopersonal_ibfk_1` FOREIGN KEY (`CodigoPrestamo`) REFERENCES `prestamo` (`CodigoPrestamo`),
  CONSTRAINT `prestamopersonal_ibfk_2` FOREIGN KEY (`DUI`) REFERENCES `personal` (`DUI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamovisitante;

CREATE TABLE `prestamovisitante` (
  `CodigoPrestamo` varchar(70) NOT NULL,
  `DUI` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Institucion` varchar(70) NOT NULL,
  KEY `CodigoPrestamo` (`CodigoPrestamo`),
  CONSTRAINT `prestamovisitante_ibfk_1` FOREIGN KEY (`CodigoPrestamo`) REFERENCES `prestamo` (`CodigoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS proveedor;

CREATE TABLE `proveedor` (
  `CodigoProveedor` varchar(70) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `ResponAtencion` varchar(50) NOT NULL,
  PRIMARY KEY (`CodigoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO proveedor VALUES("I125Y2025P1N1270","Municipalidad de Malvinas Argentinas","municipio@gmail.com","Malvinas","12456789","Dirección Escolar");
INSERT INTO proveedor VALUES("I125Y2025P2N3440","Ministerio de Educación ","educacion@educacion.gob.ar","Pizzurno 935","01141291000","Jaime Perczyk");



DROP TABLE IF EXISTS seccion;

CREATE TABLE `seccion` (
  `CodigoSeccion` varchar(70) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`CodigoSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO seccion VALUES("I125Y2025S1N2391","1 Ciclo básico A");



SET FOREIGN_KEY_CHECKS=1;