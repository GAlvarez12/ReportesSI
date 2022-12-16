/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.1 		*/
/*  Created On : 05-dic.-2022 12:37:21 p. m. 				*/
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `cabeceraRevision17Puntos` CASCADE
;

DROP TABLE IF EXISTS `categoria17P` CASCADE
;

DROP TABLE IF EXISTS `detalleRevision17Puntos` CASCADE
;

DROP TABLE IF EXISTS `puntoEvaluar17P` CASCADE
;

/* Create Tables */

CREATE TABLE `cabeceraRevision17Puntos`
(
	`idCabecera` INTEGER NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`hEntrada` TIME NOT NULL,
	`hSalida` TIME NOT NULL,
	`pOrigen` VARCHAR(50) NOT NULL,
	`pProcedencia` VARCHAR(50) NOT NULL,
	`pDestino` VARCHAR(50) NOT NULL,
	`tipoMercancia` VARCHAR(50) NOT NULL,
	`empresaTransporte` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_cabeceraRevision17Puntos` PRIMARY KEY (`idCabecera` ASC)
)

;

CREATE TABLE `categoria17P`
(
	`idCategoria` INTEGER NOT NULL,
	`nombreCategoria` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_categoria17P` PRIMARY KEY (`idCategoria` ASC)
)

;

CREATE TABLE `detalleRevision17Puntos`
(
	`idDetalle` INTEGER NOT NULL AUTO_INCREMENT,
	`idCatalogo` INTEGER NOT NULL,
	`idCabecera` INTEGER NOT NULL,
	`cumple` INT NOT NULL,
	`observaciones` VARCHAR(250) 	 NULL,
	`img` VARCHAR(100) 	 NULL,
	CONSTRAINT `PK_detalleRevision17Puntos` PRIMARY KEY (`idDetalle` ASC)
)

;

CREATE TABLE `puntoEvaluar17P`
(
	`idCatalogo` INTEGER NOT NULL AUTO_INCREMENT,
	`nombrePunto` VARCHAR(100) NOT NULL,
	`numeroPunto` INTEGER NOT NULL,
	`idCategoria` INTEGER 	 NULL,
	CONSTRAINT `PK_puntoEvaluar17P` PRIMARY KEY (`idCatalogo` ASC)
)
COMMENT='Tabla que contiene los puntos del checklist para el proceso de inspeccion de 17 puntos'

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `detalleRevision17Puntos` 
 ADD INDEX `IXFK_detalleRevision17Puntos_cabeceraRevision17Puntos` (`idCabecera` ASC)
;

ALTER TABLE `detalleRevision17Puntos` 
 ADD INDEX `IXFK_detalleRevision17Puntos_puntoEvaluar17P` (`idCatalogo` ASC)
;

ALTER TABLE `puntoEvaluar17P` 
 ADD INDEX `IXFK_puntoEvaluar17P_categoria17P` (`idCategoria` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `detalleRevision17Puntos` 
 ADD CONSTRAINT `FK_detalleRevision17Puntos_cabeceraRevision17Puntos`
	FOREIGN KEY (`idCabecera`) REFERENCES `cabeceraRevision17Puntos` (`idCabecera`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `detalleRevision17Puntos` 
 ADD CONSTRAINT `FK_detalleRevision17Puntos_puntoEvaluar17P`
	FOREIGN KEY (`idCatalogo`) REFERENCES `puntoEvaluar17P` (`idCatalogo`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `puntoEvaluar17P` 
 ADD CONSTRAINT `FK_puntoEvaluar17P_categoria17P`
	FOREIGN KEY (`idCategoria`) REFERENCES `categoria17P` (`idCategoria`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;

INSERT INTO `categoria17P` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'Observaciones del vehiculo'),
(2, 'Contenedor - Aspectos generales'),
(3, 'Contenedor - Piso'),
(4, 'Contenedor - Techo'),
(5, 'Contenedor - Costados');

INSERT INTO `puntoEvaluar17P` (`idCatalogo`, `nombrePunto`, `numeroPunto`, `idCategoria`) VALUES
(1 ,'Inspeccion de cabezotes y chasis',1, 1),
(2 ,'Compartimiento del motor s/n',2, 1),
(3 ,'Defensa delantera s/n',3, 1),
(4 ,'Llantas delantera izquierda s/n',4, 1),
(16 ,'Longitud interna (alto, ancho, largo) y volumen difieren con estándar',16, 2),
(17 ,'Las características físicas de calidad del contenedor, difieren a las acordadas (Físicas, temperatura, etc.)',17, 2),
(29 ,'Lamina inferior de protección de entrada diferente al estándar del contenedor ',29, 3),
(30 ,'Esta desnivelado con respecto al techo',30, 3),
(35 ,'No se observan los soportes (vigas y barandillas laterales superiores) del contenedor',35, 4),
(36 ,'Orificios de ventilación no están desde 50 hasta 60 cm. de la viga esquinera y a 5 cm. de la barandilla lateral superior',36, 4),
(41 ,'Adhesivo o pegante nuevo en uniones de laminas, que no corresponden a reparaciones estándar',41, 5),
(42 ,'Marcas o quemaduras recientes de soldadura, que no corresponden a reparaciones estándar',42, 5);