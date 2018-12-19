CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_amigo_archivo_compartido`
--

DROP TABLE IF EXISTS `tbl_amigo_archivo_compartido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_amigo_archivo_compartido` (
  `id_Tbl_Usuarios` int(11) NOT NULL,
  `id_Tbl_Amigos` int(11) NOT NULL,
  KEY `fk_Tbl_amigo_archivo_compartido_Tbl_Usuarios2_idx` (`id_Tbl_Amigos`),
  KEY `fk_Tbl_amigo_archivo_compartido_Tbl_Usuarios1` (`id_Tbl_Usuarios`),
  CONSTRAINT `fk_Tbl_amigo_archivo_compartido_Tbl_Usuarios1` FOREIGN KEY (`id_Tbl_Usuarios`) REFERENCES `tbl_usuarios` (`id_tbl_usuarios`),
  CONSTRAINT `fk_Tbl_amigo_archivo_compartido_Tbl_Usuarios2` FOREIGN KEY (`id_Tbl_Amigos`) REFERENCES `tbl_usuarios` (`id_tbl_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_amigo_archivo_compartido`
--

LOCK TABLES `tbl_amigo_archivo_compartido` WRITE;
/*!40000 ALTER TABLE `tbl_amigo_archivo_compartido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_amigo_archivo_compartido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_archivos`
--

DROP TABLE IF EXISTS `tbl_archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_archivos` (
  `id_Tbl_Archivos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_ulti_modificacion` datetime NOT NULL,
  `Contenido` varchar(20000) NOT NULL,
  `tipo_lenguaje` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Tbl_Archivos`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_archivos`
--

LOCK TABLES `tbl_archivos` WRITE;
/*!40000 ALTER TABLE `tbl_archivos` DISABLE KEYS */;
INSERT INTO `tbl_archivos` VALUES (1,'arch','2017-10-12','2017-10-12 00:00:00','function function_name(argument) {\n    // body...\n}','js'),(2,'arch2','2018-10-12','2017-10-15 00:00:00','.body{\n    \n}','css'),(3,'arch3','2018-10-10','2018-10-10 00:00:00','<html>\n  <body>\n      <div id=\"asa\">\n          <p>asdsad</p>\n         <br />\n         \n         \n         <ul>\n             <li></li>\n             \n         </ul>\n         \n         \n         <form id=\"\" action=\"\" method=\"get\" accept-charset=\"utf-8\">\n             <input type=\"number\" name=\"\" id=\"\" value=\"\" />\n         </form>\n         \n         <div id=\"\">\n             aaah era en este\n         </div>\n          \n      </div>\n  </body>\n</html>','html'),(4,'nombre1','2018-12-18','2018-12-18 16:46:18','contenido html','html'),(5,'nombre1','2018-12-18','2018-12-18 16:46:19','contenido css','css'),(6,'nombre1','2018-12-18','2018-12-18 16:46:19','contenido js','js'),(7,'nombre1','2018-12-18','2018-12-18 17:23:08','','html'),(8,'nombre1','2018-12-18','2018-12-18 17:23:08','','css'),(9,'nombre1','2018-12-18','2018-12-18 17:23:08','','js'),(10,'nombre1','2018-12-18','2018-12-18 17:30:49','','html'),(11,'nombre1','2018-12-18','2018-12-18 17:30:49','','css'),(12,'nombre1','2018-12-18','2018-12-18 17:30:49','','js'),(13,'nombre1','2018-12-18','2018-12-18 17:35:29','','html'),(14,'nombre1','2018-12-18','2018-12-18 17:35:29','','css'),(15,'nombre1','2018-12-18','2018-12-18 17:35:29','','js'),(16,'nombre1','2018-12-18','2018-12-18 18:05:04','','html'),(17,'nombre1','2018-12-18','2018-12-18 18:05:04','','css'),(18,'nombre1','2018-12-18','2018-12-18 18:05:04','','js'),(19,'nombre1','2018-12-18','2018-12-18 18:08:19','','html'),(20,'nombre1','2018-12-18','2018-12-18 18:08:19','','css'),(21,'nombre1','2018-12-18','2018-12-18 18:08:20','','js'),(22,'nombre1','2018-12-18','2018-12-18 18:22:11','','html'),(23,'nombre1','2018-12-18','2018-12-18 18:22:11','','css'),(24,'nombre1','2018-12-18','2018-12-18 18:22:11','','js'),(25,'nombre1','2018-12-18','2018-12-18 18:34:23','<!DOCTYPE html>\n<html>\n    <head>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n        <title>`substitute(Filename(\'\', \'Page Title\'), \'^.\', \'\\u','html'),(26,'nombre1','2018-12-18','2018-12-18 18:34:23','asdasdasdsadasd','css'),(27,'nombre1','2018-12-18','2018-12-18 18:34:23','function function_name(argument) {\n    // body...\n}','js'),(28,'nombre1','2018-12-18','2018-12-18 18:43:44','<!DOCTYPE html>\n<html>\n    <head>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n        <title>`substitute(Filename(\'\', \'Page Title\'), \'^.\', \'\\u','html'),(29,'nombre1','2018-12-18','2018-12-18 18:43:44','asdasdasdasdsad','css'),(30,'nombre1','2018-12-18','2018-12-18 18:43:44','function function_name(argument) {\n    // body...\n}','js'),(31,'nombre1','2018-12-18','2018-12-18 19:18:24','<!DOCTYPE html>\n<html>\n\n    <body>\n        body\n        <ul id=\"\">\n            asczc\n        </ul>\n        cas.','html'),(32,'nombre1','2018-12-18','2018-12-18 19:18:24','body{\n    background: fff;\n}\n','css'),(33,'nombre1','2018-12-18','2018-12-18 19:18:24','function function_name(argument) {\n    // body...\n}','js'),(34,'nombre1','2018-12-18','2018-12-18 23:50:22','<html>\n<body>\n    tonto\n</body>\n</html>','html'),(35,'nombre1','2018-12-18','2018-12-18 23:50:22','cursor: text;','css'),(36,'nombre1','2018-12-18','2018-12-18 23:50:22','var x=1;','js');
/*!40000 ALTER TABLE `tbl_archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_carpeta`
--

DROP TABLE IF EXISTS `tbl_carpeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_carpeta` (
  `id_Tbl_carpeta` int(11) NOT NULL,
  `fec_creacion` datetime NOT NULL,
  `fec_modificacion` datetime NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Tbl_carpeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_carpeta`
--

LOCK TABLES `tbl_carpeta` WRITE;
/*!40000 ALTER TABLE `tbl_carpeta` DISABLE KEYS */;
INSERT INTO `tbl_carpeta` VALUES (1,'2017-11-12 00:00:00','2017-11-12 00:00:00','carpeta1'),(2,'2017-11-12 00:00:00','2017-11-12 00:00:00','carpeta2'),(3,'2017-11-12 00:00:00','2017-11-12 00:00:00','carpeta3'),(4,'2018-12-10 22:59:40','2018-12-10 22:59:40','carpeta5'),(5,'2018-12-16 12:47:10','2018-12-16 12:47:10','proyecto2'),(7,'2018-12-16 12:58:28','2018-12-16 12:58:28','proyecto nuvo'),(8,'2018-12-16 13:02:57','2018-12-16 13:02:57','nuevo total'),(11,'2018-12-18 17:00:02','2018-12-18 17:00:02','nuevooooo'),(12,'2018-12-18 19:15:46','2018-12-18 19:15:46','2323'),(13,'2018-12-18 23:49:46','2018-12-18 23:49:46','aaaaa');
/*!40000 ALTER TABLE `tbl_carpeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_carpeta_has_tbl_archivos`
--

DROP TABLE IF EXISTS `tbl_carpeta_has_tbl_archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_carpeta_has_tbl_archivos` (
  `Tbl_carpeta_id_Tbl_carpeta` int(11) NOT NULL,
  `Tbl_Archivos_id_Tbl_Archivos` int(11) NOT NULL,
  PRIMARY KEY (`Tbl_carpeta_id_Tbl_carpeta`,`Tbl_Archivos_id_Tbl_Archivos`),
  KEY `fk_Tbl_carpeta_has_Tbl_Archivos_Tbl_Archivos1_idx` (`Tbl_Archivos_id_Tbl_Archivos`),
  KEY `fk_Tbl_carpeta_has_Tbl_Archivos_Tbl_carpeta1_idx` (`Tbl_carpeta_id_Tbl_carpeta`),
  CONSTRAINT `fk_Tbl_carpeta_has_Tbl_Archivos_Tbl_Archivos1` FOREIGN KEY (`Tbl_Archivos_id_Tbl_Archivos`) REFERENCES `tbl_archivos` (`id_tbl_archivos`),
  CONSTRAINT `fk_Tbl_carpeta_has_Tbl_Archivos_Tbl_carpeta1` FOREIGN KEY (`Tbl_carpeta_id_Tbl_carpeta`) REFERENCES `tbl_carpeta` (`id_tbl_carpeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_carpeta_has_tbl_archivos`
--

LOCK TABLES `tbl_carpeta_has_tbl_archivos` WRITE;
/*!40000 ALTER TABLE `tbl_carpeta_has_tbl_archivos` DISABLE KEYS */;
INSERT INTO `tbl_carpeta_has_tbl_archivos` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(4,7),(4,8),(4,9),(5,10),(5,11),(5,12),(7,16),(7,17),(7,18),(8,19),(8,20),(8,21),(11,28),(11,29),(11,30),(12,31),(12,32),(12,33),(13,34),(13,35),(13,36);
/*!40000 ALTER TABLE `tbl_carpeta_has_tbl_archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planesdepago`
--

DROP TABLE IF EXISTS `tbl_planesdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_planesdepago` (
  `id_Tbl_PlanesDePago` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Tbl_PlanesDePago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planesdepago`
--

LOCK TABLES `tbl_planesdepago` WRITE;
/*!40000 ALTER TABLE `tbl_planesdepago` DISABLE KEYS */;
INSERT INTO `tbl_planesdepago` VALUES (1,'free'),(2,'basic'),(3,'premium');
/*!40000 ALTER TABLE `tbl_planesdepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuarios` (
  `id_Tbl_Usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `fecha_nacimiento` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `Tbl_PlanesDePago_id_Tbl_PlanesDePago` int(11) NOT NULL,
  PRIMARY KEY (`id_Tbl_Usuarios`),
  KEY `fk_Tbl_Usuarios_Tbl_PlanesDePago1_idx` (`Tbl_PlanesDePago_id_Tbl_PlanesDePago`),
  CONSTRAINT `fk_Tbl_Usuarios_Tbl_PlanesDePago1` FOREIGN KEY (`Tbl_PlanesDePago_id_Tbl_PlanesDePago`) REFERENCES `tbl_planesdepago` (`id_tbl_planesdepago`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'juan','perez','jp@gmail.com','02/12/2018','asd.456',1),(2,'carlos','perez','cp@gmail.com','02/12/2018','asd.456',2),(3,'maria','sharapova','maria@gmail.com','02/12/1999','asd.456',1),(7,'fran','ardon','fran@gmail.com','asd.456','2018-11-02',2),(8,'fran','ardon','fran@unah.com','2018-12-01','asd.456',2),(9,'lalo','perez','lp@gmail.com','2018-12-05','asd.456',3);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios_has_tbl_carpeta`
--

DROP TABLE IF EXISTS `tbl_usuarios_has_tbl_carpeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuarios_has_tbl_carpeta` (
  `Tbl_Usuarios_id_Tbl_Usuarios` int(11) NOT NULL,
  `Tbl_carpeta_id_Tbl_carpeta` int(11) NOT NULL,
  PRIMARY KEY (`Tbl_Usuarios_id_Tbl_Usuarios`,`Tbl_carpeta_id_Tbl_carpeta`),
  KEY `fk_Tbl_Usuarios_has_Tbl_carpeta_Tbl_carpeta1_idx` (`Tbl_carpeta_id_Tbl_carpeta`),
  KEY `fk_Tbl_Usuarios_has_Tbl_carpeta_Tbl_Usuarios1_idx` (`Tbl_Usuarios_id_Tbl_Usuarios`),
  CONSTRAINT `fk_Tbl_Usuarios_has_Tbl_carpeta_Tbl_Usuarios1` FOREIGN KEY (`Tbl_Usuarios_id_Tbl_Usuarios`) REFERENCES `tbl_usuarios` (`id_tbl_usuarios`),
  CONSTRAINT `fk_Tbl_Usuarios_has_Tbl_carpeta_Tbl_carpeta1` FOREIGN KEY (`Tbl_carpeta_id_Tbl_carpeta`) REFERENCES `tbl_carpeta` (`id_tbl_carpeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios_has_tbl_carpeta`
--

LOCK TABLES `tbl_usuarios_has_tbl_carpeta` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios_has_tbl_carpeta` DISABLE KEYS */;
INSERT INTO `tbl_usuarios_has_tbl_carpeta` VALUES (1,1),(1,2),(2,3),(1,4),(1,5),(1,7),(1,8),(1,11),(1,12),(1,13);
/*!40000 ALTER TABLE `tbl_usuarios_has_tbl_carpeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'proyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_carpeta_guardar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carpeta_guardar`(nombre_carpeta varchar(30), codigo_usuario int)
begin
  declare var int;
  set var = (select id_Tbl_carpeta + 1 from tbl_carpeta order by id_Tbl_carpeta desc limit 1);
  #select x;

  insert into tbl_carpeta(id_Tbl_carpeta, fec_creacion, fec_modificacion, nombre) values (var, now(), now(), nombre_carpeta);
  insert into tbl_usuarios_has_tbl_carpeta values (codigo_usuario, var);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_carpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_carpeta`(idCarpeta varchar(10))
begin
    delete from tbl_usuarios_has_tbl_carpeta where Tbl_carpeta_id_Tbl_carpeta=idCarpeta;
    delete from tbl_carpeta_has_tbl_archivos where Tbl_carpeta_id_Tbl_carpeta=idCarpeta;
    delete from tbl_carpeta where id_Tbl_carpeta=idCarpeta;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_guardar_archivos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_guardar_archivos`(contenidoHtml varchar(500),contenidoCss varchar(500),contenidoJs varchar(500),carpeta varchar(25))
begin
  declare var int;
   declare var1 int;
   declare var2 int;

   if exists(select * from tbl_carpeta_has_tbl_archivos where Tbl_carpeta_id_Tbl_carpeta=carpeta) then
    begin
          update tbl_archivos a
          inner join tbl_carpeta_has_tbl_archivos b
          on a.id_Tbl_Archivos=b.Tbl_Archivos_id_Tbl_Archivos
                set a.Contenido=contenidoJs
                where b.Tbl_carpeta_id_Tbl_carpeta=carpeta and a.tipo_lenguaje='js';

          update tbl_archivos a
          inner join tbl_carpeta_has_tbl_archivos b
          on a.id_Tbl_Archivos=b.Tbl_Archivos_id_Tbl_Archivos
                set a.Contenido=contenidoCss
                where b.Tbl_carpeta_id_Tbl_carpeta=carpeta and a.tipo_lenguaje='css';

          update tbl_archivos a
          inner join tbl_carpeta_has_tbl_archivos b
          on a.id_Tbl_Archivos=b.Tbl_Archivos_id_Tbl_Archivos
                set a.Contenido=contenidoHtml
                where b.Tbl_carpeta_id_Tbl_carpeta=carpeta and a.tipo_lenguaje='html';
    end;
    else
     begin



    #si no existe insertarlo   insert into tbl_carpeta(id_Tbl_carpeta, fec_creacion, fec_modificacion, nombre) values (var, now(), now(), carpeta4);
    insert into tbl_archivos( nombre, fecha_creacion, fecha_ulti_modificacion, contenido, tipo_lenguaje) VALUES ('nombre1',now(),now(),contenidoHtml,'html');
    insert into tbl_archivos( nombre, fecha_creacion, fecha_ulti_modificacion, contenido, tipo_lenguaje) VALUES ('nombre1',now(),now(),contenidoCss,'css');
    insert into tbl_archivos( nombre, fecha_creacion, fecha_ulti_modificacion, contenido, tipo_lenguaje) VALUES ('nombre1',now(),now(),contenidoJs,'js');

    set var = (select id_Tbl_Archivos  from tbl_archivos order by id_Tbl_Archivos desc limit 1);
    set var1 = (select id_Tbl_Archivos-1  from tbl_archivos order by id_Tbl_Archivos desc limit 1);
    set var2 = (select id_Tbl_Archivos-2  from tbl_archivos order by id_Tbl_Archivos desc limit 1);

    insert into tbl_carpeta_has_tbl_archivos(Tbl_carpeta_id_Tbl_carpeta, Tbl_Archivos_id_Tbl_Archivos) VALUES(carpeta,var) ;
    insert into tbl_carpeta_has_tbl_archivos(Tbl_carpeta_id_Tbl_carpeta, Tbl_Archivos_id_Tbl_Archivos) VALUES(carpeta,var1) ;
    insert into tbl_carpeta_has_tbl_archivos(Tbl_carpeta_id_Tbl_carpeta, Tbl_Archivos_id_Tbl_Archivos) VALUES(carpeta,var2) ;

    end;
    end if ;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19  2:42:23
