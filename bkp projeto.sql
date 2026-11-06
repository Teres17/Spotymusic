-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 172.16.22.12    Database: spotymusic_127
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `tituloalbum` varchar(50) NOT NULL,
  `data_lancamento` date DEFAULT NULL,
  `fk_artista` int DEFAULT NULL,
  PRIMARY KEY (`id_album`),
  KEY `fk_artista` (`fk_artista`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`fk_artista`) REFERENCES `artista` (`id_artista`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Castelos & Ruínas','2016-03-16',1),(2,'ICARUS','2022-11-17',1),(3,'Heresia','2017-03-13',2),(4,'Ladrão','2019-03-13',2),(5,'Mundos','2021-08-20',3),(6,'Amanhecer','2023-05-12',3),(7,'O Glorioso Retorno de Quem Vos Fala','2013-08-21',4),(8,'AmarElo','2019-10-30',4),(9,'ASTROWORLD','2018-08-03',5),(10,'UTOPIA','2023-07-28',5),(11,'Samba Esquema Novo','1963-01-01',6),(12,'A Tábua de Esmeralda','1974-05-15',6),(13,'237','2020-06-19',7),(14,'SUITE146','2023-06-30',7),(15,'Taurus','2023-06-08',8),(16,'Taurus Vol. 2','2024-05-02',8),(17,'Longe Demais das Capitais','1986-10-15',9),(18,'A Revolta dos Dândis','1987-03-25',9),(19,'City of Evil','2005-06-06',10),(20,'Nightmare','2010-07-27',10);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nomeartista` varchar(100) NOT NULL,
  `pais_origem` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'BK','Brasil'),(2,'Djonga','Brasil'),(3,'GIANA','Brasil'),(4,'Emicida','Brasil'),(5,'Travis Scott','Estados Unidos'),(6,'Jorge Ben Jor','Brasil'),(7,'Yunk Vino','Brasil'),(8,'Duquesa','Brasil'),(9,'Engenheiros do Hawaii','Brasil'),(10,'Avenged Sevenfold','Estados Unidos');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_artista` AFTER INSERT ON `artista` FOR EACH ROW begin
insert into artista_log values(null, new.id_artista, new.nomeartista,
 new.pais_origem,'Insert', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_del_artista` BEFORE DELETE ON `artista` FOR EACH ROW begin
insert into artista_log values(null, old.id_artista,old.nomeartista, old.pais_origem,
'Delete', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `artista_log`
--

DROP TABLE IF EXISTS `artista_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_log` (
  `id_artista_log` int NOT NULL AUTO_INCREMENT,
  `id_artista` int DEFAULT NULL,
  `nomeartista` varchar(100) DEFAULT NULL,
  `pais_origem` varchar(100) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_artista_log`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_log`
--

LOCK TABLES `artista_log` WRITE;
/*!40000 ALTER TABLE `artista_log` DISABLE KEYS */;
INSERT INTO `artista_log` VALUES (1,1,'BK','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(2,2,'Djonga','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(3,3,'GIANA','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(4,4,'Emicida','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(5,5,'Travis Scott','Estados Unidos','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(6,6,'Jorge Ben Jor','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(7,7,'Yunk Vino','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(8,8,'Duquesa','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(9,9,'Engenheiros do Hawaii','Brasil','Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(10,10,'Avenged Sevenfold','Estados Unidos','Insert','admin@172.16.22.120','2026-09-29 22:12:33');
/*!40000 ALTER TABLE `artista_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_musica`
--

DROP TABLE IF EXISTS `artista_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_musica` (
  `id_am` int NOT NULL AUTO_INCREMENT,
  `fk_artista` int DEFAULT NULL,
  `fk_musica` int DEFAULT NULL,
  PRIMARY KEY (`id_am`),
  KEY `fk_artista` (`fk_artista`),
  KEY `fk_musica` (`fk_musica`),
  CONSTRAINT `artista_musica_ibfk_1` FOREIGN KEY (`fk_artista`) REFERENCES `artista` (`id_artista`) ON DELETE CASCADE,
  CONSTRAINT `artista_musica_ibfk_2` FOREIGN KEY (`fk_musica`) REFERENCES `musica` (`id_musica`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_musica`
--

LOCK TABLES `artista_musica` WRITE;
/*!40000 ALTER TABLE `artista_musica` DISABLE KEYS */;
INSERT INTO `artista_musica` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,4,31),(32,4,32),(33,4,33),(34,4,34),(35,4,35),(36,4,36),(37,4,37),(38,4,38),(39,4,39),(40,4,40),(41,5,41),(42,5,42),(43,5,43),(44,5,44),(45,5,45),(46,5,46),(47,5,47),(48,5,48),(49,5,49),(50,5,50),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60),(61,7,61),(62,7,62),(63,7,63),(64,7,64),(65,7,65),(66,7,66),(67,7,67),(68,7,68),(69,7,69),(70,7,70),(71,8,71),(72,8,72),(73,8,73),(74,8,74),(75,8,75),(76,8,76),(77,8,77),(78,8,78),(79,8,79),(80,8,80),(81,9,81),(82,9,82),(83,9,83),(84,9,84),(85,9,85),(86,9,86),(87,9,87),(88,9,88),(89,9,89),(90,9,90),(91,10,91),(92,10,92),(93,10,93),(94,10,94),(95,10,95),(96,10,96),(97,10,97),(98,10,98),(99,10,99),(100,10,100);
/*!40000 ALTER TABLE `artista_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositor`
--

DROP TABLE IF EXISTS `compositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositor` (
  `id_compositor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_compositor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositor`
--

LOCK TABLES `compositor` WRITE;
/*!40000 ALTER TABLE `compositor` DISABLE KEYS */;
INSERT INTO `compositor` VALUES (1,'Abebe Bikila'),(2,'Gustavo Pereira'),(3,'Leandro Roque de Oliveira'),(4,'Jacques Morelenbaum'),(5,'Jacques Leiner');
/*!40000 ALTER TABLE `compositor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_compositor` AFTER INSERT ON `compositor` FOR EACH ROW begin
insert into compositor_log values(null, new.id_compositor, new.nome,
'Insert', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_del_compositor` BEFORE DELETE ON `compositor` FOR EACH ROW begin
insert into compositor_log values(null, old.id_compositor, old.nome,
'Delete', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compositor_log`
--

DROP TABLE IF EXISTS `compositor_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositor_log` (
  `id_compositor_log` int NOT NULL AUTO_INCREMENT,
  `id_compositor` int DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compositor_log`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositor_log`
--

LOCK TABLES `compositor_log` WRITE;
/*!40000 ALTER TABLE `compositor_log` DISABLE KEYS */;
INSERT INTO `compositor_log` VALUES (1,1,'Abebe Bikila','Insert','admin@172.16.22.120','2026-09-29 22:12:42'),(2,2,'Gustavo Pereira','Insert','admin@172.16.22.120','2026-09-29 22:12:42'),(3,3,'Leandro Roque de Oliveira','Insert','admin@172.16.22.120','2026-09-29 22:12:42'),(4,4,'Jacques Morelenbaum','Insert','admin@172.16.22.120','2026-09-29 22:12:42'),(5,5,'Jacques Leiner','Insert','admin@172.16.22.120','2026-09-29 22:12:42');
/*!40000 ALTER TABLE `compositor_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositor_musica`
--

DROP TABLE IF EXISTS `compositor_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositor_musica` (
  `id_cm` int NOT NULL AUTO_INCREMENT,
  `fk_compositor` int DEFAULT NULL,
  `fk_musica` int DEFAULT NULL,
  PRIMARY KEY (`id_cm`),
  KEY `fk_compositor` (`fk_compositor`),
  KEY `fk_musica` (`fk_musica`),
  CONSTRAINT `compositor_musica_ibfk_1` FOREIGN KEY (`fk_compositor`) REFERENCES `compositor` (`id_compositor`) ON DELETE CASCADE,
  CONSTRAINT `compositor_musica_ibfk_2` FOREIGN KEY (`fk_musica`) REFERENCES `musica` (`id_musica`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositor_musica`
--

LOCK TABLES `compositor_musica` WRITE;
/*!40000 ALTER TABLE `compositor_musica` DISABLE KEYS */;
INSERT INTO `compositor_musica` VALUES (1,1,2),(2,1,3),(3,1,7),(4,2,11),(5,2,16),(6,3,31),(7,3,32),(8,3,39),(9,4,51),(10,4,56);
/*!40000 ALTER TABLE `compositor_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nomegenero` varchar(20) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Rap/Hip-Hop','Gênero focado em rimas, ritmos falados e batidas urbanas.'),(2,'Trap','Subgênero do hip-hop com graves profundos, caixas rápidas e sintetizadores.'),(3,'Pop','Música popular com foco em melodias marcantes e apelo comercial.'),(4,'R&B','Rhythm and Blues moderno, mesclando soul, pop e hip-hop.'),(5,'MPB','Música Popular Brasileira, rica em arranjos e diversidade de ritmos.'),(6,'Samba','Gênero tradicional brasileiro marcado por ritmo sincopado e percussão.'),(7,'Samba-Rock','Fusão do samba brasileiro com influências do rock, soul e funk.'),(8,'Rock Nacional','Rock produzido no Brasil, com letras marcantes em português.'),(9,'Heavy Metal','Subgênero do rock com guitarras distorcidas, bateria pesada e vocais intensos.');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `id_musica` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `duracao` time NOT NULL,
  `fk_album` int DEFAULT NULL,
  `fk_genero` int DEFAULT NULL,
  PRIMARY KEY (`id_musica`),
  KEY `fk_album` (`fk_album`),
  KEY `fk_genero` (`fk_genero`),
  CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`fk_album`) REFERENCES `album` (`id_album`) ON DELETE CASCADE,
  CONSTRAINT `musica_ibfk_2` FOREIGN KEY (`fk_genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'Um Aumento de Velocidade','00:01:28',1,1),(2,'Siga os Seus Passos','00:03:42',1,1),(3,'Castelos & Ruínas','00:03:15',1,1),(4,'Caminhos','00:04:10',1,1),(5,'O Que Sobra Disso','00:03:50',1,1),(6,'LUZES','00:03:02',2,2),(7,'MUSEU','00:03:25',2,2),(8,'SEMENTES','00:03:10',2,2),(9,'LUGAR AO SOL','00:03:45',2,2),(10,'TUDO MUDOU','00:02:58',2,2),(11,'Atípico','00:03:30',3,1),(12,'Heresia','00:03:12',3,1),(13,'O Mundo é Nosso','00:04:05',3,1),(14,'Esquiva','00:03:48',3,1),(15,'Irmãos e Irmãs','00:03:20',3,1),(16,'Hat-Trick','00:03:40',4,1),(17,'Bença','00:04:15',4,1),(18,'Leal','00:03:10',4,1),(19,'MIGA','00:03:05',4,1),(20,'Deus e o Diabo na Terra','00:04:30',4,1),(21,'Intro','00:01:15',5,4),(22,'Mundos','00:02:50',5,4),(23,'Passado','00:03:05',5,4),(24,'Sem Hora','00:02:45',5,4),(25,'Voar','00:03:12',5,4),(26,'Amanhecer','00:02:40',6,3),(27,'Nossa Sorte','00:03:00',6,3),(28,'Luz','00:02:35',6,3),(29,'Recomeço','00:03:10',6,3),(30,'Final Feliz','00:02:55',6,3),(31,'Levanta e Anda','00:02:30',7,5),(32,'Hoje Cedo','00:03:16',7,5),(33,'Zoião','00:03:40',7,5),(34,'Crisântemo','00:05:10',7,5),(35,'Gueto','00:03:25',7,5),(36,'Principia','00:05:54',8,5),(37,'A Ordem Natural das Coisas','00:03:36',8,5),(38,'Pequenas Alegrias da Vida','00:03:28',8,5),(39,'AmarElo','00:05:22',8,5),(40,'Ismália','00:03:48',8,5),(41,'STARGAZING','00:04:31',9,2),(42,'SICKO MODE','00:05:12',9,2),(43,'RIP SCREW','00:03:05',9,2),(44,'STOP TRYING TO BE GOD','00:05:38',9,2),(45,'BUTTERFLY EFFECT','00:03:10',9,2),(46,'HYENA','00:03:42',10,2),(47,'THANK GOD','00:03:04',10,2),(48,'MODERN JAM','00:04:15',10,2),(49,'MY EYES','00:04:11',10,2),(50,'FE!N','00:03:11',10,2),(51,'Mas Que Nada','00:03:02',11,6),(52,'Tim Dom Dom','00:02:23',11,6),(53,'Balanço Zona Sul','00:02:53',11,6),(54,'Por Causa de Você, Menina','00:02:47',11,6),(55,'Chove Chuva','00:03:06',11,6),(56,'Os Alquimistas Estão Chegando','00:03:15',12,7),(57,'O Homem da Gravata Florida','00:03:05',12,7),(58,'Errare Humanum Est','00:04:50',12,7),(59,'Menina Mulher da Pele Preta','00:02:58',12,7),(60,'Zumbi','00:03:30',12,7),(61,'Diálogo','00:02:40',13,2),(62,'Leal','00:02:55',13,2),(63,'A2','00:03:10',13,2),(64,'Vivências','00:02:45',13,2),(65,'Check','00:03:00',13,2),(66,'SUITE146','00:02:30',14,2),(67,'Sinais','00:02:50',14,2),(68,'Sempre','00:03:05',14,2),(69,'Luzes da Cidade','00:02:40',14,2),(70,'Noite Fria','00:03:15',14,2),(71,'Taurus','00:02:35',15,2),(72,'Única','00:02:50',15,2),(73,'90 PHS','00:02:40',15,2),(74,'Big Mistake','00:03:00',15,2),(75,'Giro','00:02:25',15,2),(76,'Taurus Vol. 2','00:02:45',16,2),(77,'Atitude','00:02:30',16,2),(78,'Anota Aí','00:03:00',16,2),(79,'Visão','00:02:55',16,2),(80,'Topo','00:02:40',16,2),(81,'Toda Forma de Poder','00:03:15',17,8),(82,'Sopa de Letrinhas','00:03:08',17,8),(83,'Segurança','00:03:18',17,8),(84,'Longe Demais das Capitais','00:02:50',17,8),(85,'Crônica','00:02:45',17,8),(86,'A Revolta dos Dândis I','00:04:10',18,8),(87,'Infinita Highway','00:06:11',18,8),(88,'Reesscrevendo o Passado','00:03:22',18,8),(89,'Terra de Gigantes','00:03:59',18,8),(90,'Além dos Outdoors','00:03:33',18,8),(91,'Beast and the Harlot','00:05:40',19,9),(92,'Bat Country','00:05:13',19,9),(93,'Seize the Day','00:05:32',19,9),(94,'Sidewinder','00:07:01',19,9),(95,'M.I.A.','00:08:46',19,9),(96,'Nightmare','00:06:16',20,9),(97,'Welcome to the Family','00:04:05',20,9),(98,'So Far Away','00:05:26',20,9),(99,'Buried Alive','00:06:44',20,9),(100,'Fiction','00:05:12',20,9);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_musica` AFTER INSERT ON `musica` FOR EACH ROW begin
insert into musica_log values(null, new.id_musica, new.titulo,
 new.duracao, new.fk_album, new.fk_genero, 'Insert', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_del_musica` BEFORE DELETE ON `musica` FOR EACH ROW begin
insert into musica_log values(null, old.id_musica, old.titulo,
 old.duracao, old.fk_album, old.fk_genero, 'Delete', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `musica_log`
--

DROP TABLE IF EXISTS `musica_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica_log` (
  `id_musica_log` int NOT NULL AUTO_INCREMENT,
  `id_musica` int DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `fk_album` int DEFAULT NULL,
  `fk_genero` int DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_musica_log`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica_log`
--

LOCK TABLES `musica_log` WRITE;
/*!40000 ALTER TABLE `musica_log` DISABLE KEYS */;
INSERT INTO `musica_log` VALUES (1,1,'Um Aumento de Velocidade','00:01:28',1,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(2,2,'Siga os Seus Passos','00:03:42',1,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(3,3,'Castelos & Ruínas','00:03:15',1,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(4,4,'Caminhos','00:04:10',1,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(5,5,'O Que Sobra Disso','00:03:50',1,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:33'),(6,6,'LUZES','00:03:02',2,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(7,7,'MUSEU','00:03:25',2,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(8,8,'SEMENTES','00:03:10',2,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(9,9,'LUGAR AO SOL','00:03:45',2,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(10,10,'TUDO MUDOU','00:02:58',2,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(11,11,'Atípico','00:03:30',3,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(12,12,'Heresia','00:03:12',3,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:34'),(13,13,'O Mundo é Nosso','00:04:05',3,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:40'),(14,14,'Esquiva','00:03:48',3,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:40'),(15,15,'Irmãos e Irmãs','00:03:20',3,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:40'),(16,16,'Hat-Trick','00:03:40',4,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:40'),(17,17,'Bença','00:04:15',4,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(18,18,'Leal','00:03:10',4,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(19,19,'MIGA','00:03:05',4,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(20,20,'Deus e o Diabo na Terra','00:04:30',4,1,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(21,21,'Intro','00:01:15',5,4,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(22,22,'Mundos','00:02:50',5,4,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(23,23,'Passado','00:03:05',5,4,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(24,24,'Sem Hora','00:02:45',5,4,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(25,25,'Voar','00:03:12',5,4,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(26,26,'Amanhecer','00:02:40',6,3,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(27,27,'Nossa Sorte','00:03:00',6,3,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(28,28,'Luz','00:02:35',6,3,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(29,29,'Recomeço','00:03:10',6,3,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(30,30,'Final Feliz','00:02:55',6,3,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(31,31,'Levanta e Anda','00:02:30',7,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(32,32,'Hoje Cedo','00:03:16',7,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(33,33,'Zoião','00:03:40',7,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(34,34,'Crisântemo','00:05:10',7,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(35,35,'Gueto','00:03:25',7,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(36,36,'Principia','00:05:54',8,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(37,37,'A Ordem Natural das Coisas','00:03:36',8,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(38,38,'Pequenas Alegrias da Vida','00:03:28',8,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(39,39,'AmarElo','00:05:22',8,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(40,40,'Ismália','00:03:48',8,5,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(41,41,'STARGAZING','00:04:31',9,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(42,42,'SICKO MODE','00:05:12',9,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(43,43,'RIP SCREW','00:03:05',9,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(44,44,'STOP TRYING TO BE GOD','00:05:38',9,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(45,45,'BUTTERFLY EFFECT','00:03:10',9,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(46,46,'HYENA','00:03:42',10,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(47,47,'THANK GOD','00:03:04',10,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(48,48,'MODERN JAM','00:04:15',10,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(49,49,'MY EYES','00:04:11',10,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(50,50,'FE!N','00:03:11',10,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(51,51,'Mas Que Nada','00:03:02',11,6,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(52,52,'Tim Dom Dom','00:02:23',11,6,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(53,53,'Balanço Zona Sul','00:02:53',11,6,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(54,54,'Por Causa de Você, Menina','00:02:47',11,6,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(55,55,'Chove Chuva','00:03:06',11,6,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(56,56,'Os Alquimistas Estão Chegando','00:03:15',12,7,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(57,57,'O Homem da Gravata Florida','00:03:05',12,7,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(58,58,'Errare Humanum Est','00:04:50',12,7,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(59,59,'Menina Mulher da Pele Preta','00:02:58',12,7,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(60,60,'Zumbi','00:03:30',12,7,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(61,61,'Diálogo','00:02:40',13,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(62,62,'Leal','00:02:55',13,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(63,63,'A2','00:03:10',13,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(64,64,'Vivências','00:02:45',13,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(65,65,'Check','00:03:00',13,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(66,66,'SUITE146','00:02:30',14,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(67,67,'Sinais','00:02:50',14,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(68,68,'Sempre','00:03:05',14,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(69,69,'Luzes da Cidade','00:02:40',14,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(70,70,'Noite Fria','00:03:15',14,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(71,71,'Taurus','00:02:35',15,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(72,72,'Única','00:02:50',15,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(73,73,'90 PHS','00:02:40',15,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(74,74,'Big Mistake','00:03:00',15,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(75,75,'Giro','00:02:25',15,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(76,76,'Taurus Vol. 2','00:02:45',16,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(77,77,'Atitude','00:02:30',16,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(78,78,'Anota Aí','00:03:00',16,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(79,79,'Visão','00:02:55',16,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(80,80,'Topo','00:02:40',16,2,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(81,81,'Toda Forma de Poder','00:03:15',17,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(82,82,'Sopa de Letrinhas','00:03:08',17,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(83,83,'Segurança','00:03:18',17,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(84,84,'Longe Demais das Capitais','00:02:50',17,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(85,85,'Crônica','00:02:45',17,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(86,86,'A Revolta dos Dândis I','00:04:10',18,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(87,87,'Infinita Highway','00:06:11',18,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(88,88,'Reesscrevendo o Passado','00:03:22',18,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(89,89,'Terra de Gigantes','00:03:59',18,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(90,90,'Além dos Outdoors','00:03:33',18,8,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(91,91,'Beast and the Harlot','00:05:40',19,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(92,92,'Bat Country','00:05:13',19,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(93,93,'Seize the Day','00:05:32',19,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(94,94,'Sidewinder','00:07:01',19,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(95,95,'M.I.A.','00:08:46',19,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(96,96,'Nightmare','00:06:16',20,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(97,97,'Welcome to the Family','00:04:05',20,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(98,98,'So Far Away','00:05:26',20,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(99,99,'Buried Alive','00:06:44',20,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41'),(100,100,'Fiction','00:05:12',20,9,'Insert','admin@172.16.22.120','2026-09-29 22:12:41');
/*!40000 ALTER TABLE `musica_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `nomeplaylist` varchar(100) NOT NULL,
  `data_criacao` date NOT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Nacional & Rap Highlights','2026-09-23'),(2,'Trap & Urban Vibe','2026-09-23'),(3,'MPB & Clássicos Brasileiros','2026-09-23'),(4,'Rock & Heavy Hits','2026-09-23');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_upd_playlist` AFTER UPDATE ON `playlist` FOR EACH ROW begin
insert into playlist_log values(null, old.id_playlist, old.nomeplaylist,
new.nomeplaylist, old.data_criacao, 'Update', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `tr_log_del_playlist` BEFORE DELETE ON `playlist` FOR EACH ROW begin
insert into playlist_log values(null, old.id_playlist, old.nomeplaylist,
null, old.data_criacao, 'Delete', user(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `playlist_log`
--

DROP TABLE IF EXISTS `playlist_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_log` (
  `id_playlist_log` int NOT NULL AUTO_INCREMENT,
  `id_playlist` int DEFAULT NULL,
  `nomeplaylist` varchar(100) DEFAULT NULL,
  `nomeplaylist_atual` varchar(100) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_playlist_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_log`
--

LOCK TABLES `playlist_log` WRITE;
/*!40000 ALTER TABLE `playlist_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_musica`
--

DROP TABLE IF EXISTS `playlist_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_musica` (
  `id_pm` int NOT NULL AUTO_INCREMENT,
  `ordem` int DEFAULT NULL,
  `fk_playlist` int DEFAULT NULL,
  `fk_musica` int DEFAULT NULL,
  PRIMARY KEY (`id_pm`),
  KEY `fk_musica` (`fk_musica`),
  KEY `fk_playlist` (`fk_playlist`),
  CONSTRAINT `playlist_musica_ibfk_1` FOREIGN KEY (`fk_musica`) REFERENCES `musica` (`id_musica`) ON DELETE CASCADE,
  CONSTRAINT `playlist_musica_ibfk_2` FOREIGN KEY (`fk_playlist`) REFERENCES `playlist` (`id_playlist`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_musica`
--

LOCK TABLES `playlist_musica` WRITE;
/*!40000 ALTER TABLE `playlist_musica` DISABLE KEYS */;
INSERT INTO `playlist_musica` VALUES (1,1,1,2),(2,2,1,3),(3,3,1,7),(4,4,1,11),(5,5,1,16),(6,6,1,18),(7,7,1,22),(8,8,1,31),(9,9,1,32),(10,10,1,39),(11,1,2,42),(12,2,2,45),(13,3,2,49),(14,4,2,50),(15,5,2,62),(16,6,2,66),(17,7,2,71),(18,8,2,73),(19,9,2,76),(20,10,2,78),(21,1,3,34),(22,2,3,37),(23,3,3,38),(24,4,3,51),(25,5,3,53),(26,6,3,55),(27,7,3,56),(28,8,3,57),(29,9,3,58),(30,10,3,60),(31,1,4,81),(32,2,4,83),(33,3,4,86),(34,4,4,87),(35,5,4,89),(36,6,4,91),(37,7,4,92),(38,8,4,93),(39,9,4,96),(40,10,4,98);
/*!40000 ALTER TABLE `playlist_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_album_mais_antigo`
--

DROP TABLE IF EXISTS `vw_album_mais_antigo`;
/*!50001 DROP VIEW IF EXISTS `vw_album_mais_antigo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_album_mais_antigo` AS SELECT 
 1 AS `Música:`,
 1 AS `Data de Lançamento:`,
 1 AS `Álbum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_comp_not_music`
--

DROP TABLE IF EXISTS `vw_comp_not_music`;
/*!50001 DROP VIEW IF EXISTS `vw_comp_not_music`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_comp_not_music` AS SELECT 
 1 AS `Compositor:`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_musica_recente`
--

DROP TABLE IF EXISTS `vw_musica_recente`;
/*!50001 DROP VIEW IF EXISTS `vw_musica_recente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_musica_recente` AS SELECT 
 1 AS `Música:`,
 1 AS `Álbum:`,
 1 AS `Lançamento:`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'spotymusic_127'
--

--
-- Dumping routines for database 'spotymusic_127'
--
/*!50003 DROP PROCEDURE IF EXISTS `del_artista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `del_artista`(id_artista_del int)
begin
delete from artista where id_artista = id_artista_del;
select * from artista;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_musica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `del_musica`(id_musica_del int)
begin
delete from musica where id_musica = id_musica_del;
select * from musica;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_album` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_album`(tituloalbum varchar(50), data_lancamento date , fk_artista int)
begin
insert into album values(null, tituloalbum, data_lancamento, fk_artista);
select * from album;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_artista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_artista`(nomeartista varchar(100), pais_origem varchar(100))
begin
insert into artista values(null, nomeartista, pais_origem);
select * from artista;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_compositor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_compositor`(nome varchar(100))
begin
insert into compositor values(null, nome);
select * from compositor;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_genero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_genero`(nomegenero varchar(20), descricao varchar(100))
begin
insert into genero values(null, nomegenero, descricao);
select * from genero;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_musica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_musica`(titulo varchar(30), duracao time, fk_album int, fk_genero int)
begin
insert into musica values(null, titulo, duracao, fk_album, fk_genero);
select * from musica;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ins_playlist`(nomeplaylist varchar(100), data_criacao date)
begin
insert into playlist values(null, nomeplaylist, data_criacao);
select * from playlist;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `upd_playlist`(nomeplaylist_upd varchar(100), id_playlist_upd int)
begin
update playlist
set nomeplaylist = nomeplaylist_upd
where id_playlist = id_playlist_upd;
select * from playlist;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_album_mais_antigo`
--

/*!50001 DROP VIEW IF EXISTS `vw_album_mais_antigo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_album_mais_antigo` AS select `m`.`titulo` AS `Música:`,`a`.`data_lancamento` AS `Data de Lançamento:`,`a`.`tituloalbum` AS `Álbum` from (`musica` `m` join `album` `a` on((`a`.`id_album` = `m`.`fk_album`))) where (`a`.`id_album` = (select `a`.`id_album` from `album` `a` order by `a`.`data_lancamento` limit 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_comp_not_music`
--

/*!50001 DROP VIEW IF EXISTS `vw_comp_not_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_comp_not_music` AS select `c`.`nome` AS `Compositor:` from (`compositor` `c` left join `compositor_musica` `cm` on((`c`.`id_compositor` = `cm`.`fk_compositor`))) where (`cm`.`fk_musica` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_musica_recente`
--

/*!50001 DROP VIEW IF EXISTS `vw_musica_recente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_musica_recente` AS select `m`.`titulo` AS `Música:`,`a`.`tituloalbum` AS `Álbum:`,`a`.`data_lancamento` AS `Lançamento:` from (`musica` `m` join `album` `a` on((`a`.`id_album` = `m`.`fk_album`))) order by `a`.`data_lancamento` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 21:18:12
