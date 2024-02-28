-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: pokemon_game
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `pokemon_game`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pokemon_game` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pokemon_game`;

--
-- Table structure for table `battle_result`
--

DROP TABLE IF EXISTS `battle_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_result` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `pokemon_id_1` int NOT NULL,
                                 `pokemon_id_2` int NOT NULL,
                                 `winner_id` int DEFAULT NULL,
                                 `result_memo` varchar(50) DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `fk_battleresult_pokemon_1` (`pokemon_id_1`),
                                 KEY `fk_battleresult_pokemon_2` (`pokemon_id_2`),
                                 CONSTRAINT `battle_result_ibfk_1` FOREIGN KEY (`pokemon_id_1`) REFERENCES `pokemon` (`id`),
                                 CONSTRAINT `battle_result_ibfk_2` FOREIGN KEY (`pokemon_id_2`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_result`
--

LOCK TABLES `battle_result` WRITE;
/*!40000 ALTER TABLE `battle_result` DISABLE KEYS */;
INSERT INTO `battle_result` VALUES (1,1,2,2,'Charizard wins against Pikachu'),(2,3,1,NULL,'Squirtle and Bulbasaur battle results in a draw'),(3,2,3,2,'Charizard wins against Squirtle'),(4,4,5,4,'Jigglypuff wins against Geodude'),(5,6,7,NULL,'Gastly and Onix battle results in a draw'),(6,8,9,8,'Eevee wins against Vaporeon'),(7,10,11,10,'Jolteon wins against Flareon'),(8,12,13,NULL,'Mewtwo and Mew battle results in a draw'),(9,14,15,14,'Dragonite wins against Lapras'),(10,16,17,16,'Gyarados wins against Arcanine'),(11,18,19,NULL,'Alakazam and Snorlax battle results in a draw'),(12,20,1,1,'Pikachu wins against Alakazam');
/*!40000 ALTER TABLE `battle_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_dex`
--

DROP TABLE IF EXISTS `poke_dex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poke_dex` (
                            `monster_id` int NOT NULL,
                            `monster_name` varchar(10) NOT NULL,
                            `monster_type` varchar(10) NOT NULL,
                            `max_hp` int NOT NULL,
                            `evolution_stage` int NOT NULL DEFAULT '1',
                            `evolves_from` int DEFAULT NULL,
                            `is_legendary` tinyint(1) DEFAULT '0',
                            PRIMARY KEY (`monster_id`),
                            KEY `idx_monstertype` (`monster_type`),
                            KEY `fk_evolvesfrom` (`evolves_from`),
                            CONSTRAINT `poke_dex_ibfk_1` FOREIGN KEY (`evolves_from`) REFERENCES `poke_dex` (`monster_id`),
                            CONSTRAINT `evolutiontage_range` CHECK ((`evolution_stage` between 1 and 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_dex`
--

LOCK TABLES `poke_dex` WRITE;
/*!40000 ALTER TABLE `poke_dex` DISABLE KEYS */;
INSERT INTO `poke_dex` VALUES (1,'Bulbasaur','Grass',45,1,NULL,0),
                              (2,'Charmander','Fire',39,1,NULL,0),
                              (3,'Squirtle','Water',44,1,NULL,0),
                              (4,'Pikachu','Electric',35,1,NULL,0),(5,'Jigglypuff','Normal',115,1,NULL,0),(6,'Geodude','Rock',40,1,NULL,0),(7,'Gastly','Ghost',30,1,NULL,0),(8,'Onix','Rock',35,1,NULL,0),(9,'Eevee','Normal',55,1,NULL,0),(10,'Vaporeon','Water',130,2,9,0),(11,'Jolteon','Electric',65,2,9,0),(12,'Flareon','Fire',65,2,9,0),(13,'Snorlax','Normal',160,1,NULL,0),(14,'Dragonite','Dragon',91,3,148,0),(15,'Mewtwo','Psychic',106,1,NULL,1),(16,'Mew','Psychic',100,1,NULL,1),(17,'Lapras','Water',130,1,NULL,0),(18,'Gyarados','Water',95,2,129,0),(19,'Arcanine','Fire',90,1,NULL,0),(20,'Alakazam','Psychic',55,2,64,0),(63,'Abra','Psychic',25,1,NULL,0),(64,'Kadabra','Psychic',40,2,63,0),(101,'Rattata','Normal',30,1,NULL,0),(102,'Snorlax','Normal',160,1,NULL,0),(103,'Chansey','Normal',250,1,NULL,0),(104,'Pidgey','Normal',40,1,NULL,0),(105,'Tauros','Normal',75,1,NULL,0),(106,'Charmander','Fire',39,1,NULL,0),(107,'Vulpix','Fire',38,1,NULL,0),(108,'Ponyta','Fire',50,1,NULL,0),(109,'Magmar','Fire',65,1,NULL,0),(110,'Growlithe','Fire',55,1,NULL,0),(111,'Squirtle','Water',44,1,NULL,0),(112,'Psyduck','Water',50,1,NULL,0),(113,'Poliwag','Water',40,1,NULL,0),(114,'Krabby','Water',30,1,NULL,0),(115,'Horsea','Water',30,1,NULL,0),(116,'Bulbasaur','Grass',45,1,NULL,0),(117,'Oddish','Grass',45,1,NULL,0),(118,'Bellsprout','Grass',50,1,NULL,0),(119,'Tangela','Grass',65,1,NULL,0),(120,'Exeggcute','Grass',60,1,NULL,0),(121,'Pikachu','Electric',35,1,NULL,0),(122,'Magnemite','Electric',25,1,NULL,0),(123,'Voltorb','Electric',40,1,NULL,0),(124,'Electabuzz','Electric',65,1,NULL,0),(125,'Jolteon','Electric',65,2,121,0),(126,'Pidgey','Flying',40,1,NULL,0),(127,'Zubat','Flying',40,1,NULL,0),(128,'Farfetch\'d','Flying',52,1,NULL,0),(129,'Magikarp','Water',20,1,NULL,0),(130,'Scyther','Flying',70,1,NULL,0),(131,'Ekans','Poison',35,1,NULL,0),(132,'Grimer','Poison',80,1,NULL,0),(133,'Gastly','Poison',30,1,NULL,0),(134,'Koffing','Poison',40,1,NULL,0),(135,'Nidoran','Poison',55,1,NULL,0),(136,'Caterpie','Bug',45,1,NULL,0),(137,'Weedle','Bug',40,1,NULL,0),(138,'Paras','Bug',35,1,NULL,0),(139,'Venonat','Bug',60,1,NULL,0),(140,'Scyther','Bug',70,1,NULL,0),(141,'Mankey','Fighting',40,1,NULL,0),(142,'Machop','Fighting',70,1,NULL,0),(143,'Hitmonlee','Fighting',50,1,NULL,0),(144,'Hitmonchan','Fighting',50,1,NULL,0),(145,'Machamp','Fighting',90,1,NULL,0),(146,'Abra','Psychic',25,1,NULL,0),(147,'Dratini','Dragon',41,1,NULL,0),(148,'Dragonair','Dragon',61,2,147,0),(149,'Mr. Mime','Psychic',40,1,NULL,0),(150,'Mewtwo','Psychic',106,1,NULL,1),(151,'Shellder','Ice',30,1,NULL,0),(152,'Jynx','Ice',65,1,NULL,0),(153,'Seel','Ice',65,1,NULL,0),(154,'Dewgong','Ice',90,1,NULL,0),(155,'Cloyster','Ice',50,1,NULL,0),(156,'Sandshrew','Ground',50,1,NULL,0),(157,'Diglett','Ground',10,1,NULL,0),(158,'Geodude','Ground',40,1,NULL,0),(159,'Onix','Ground',35,1,NULL,0),(160,'Rhyhorn','Ground',80,1,NULL,0),(161,'Geodude','Rock',40,1,NULL,0),(162,'Onix','Rock',35,1,NULL,0),(163,'Kabuto','Rock',30,1,NULL,0),(164,'Kabutops','Rock',60,1,NULL,0),(165,'Omanyte','Rock',35,1,NULL,0),(166,'Gastly','Ghost',30,1,NULL,0),(167,'Haunter','Ghost',45,2,166,0),(168,'Gengar','Ghost',60,3,167,0),(169,'Misdreavus','Ghost',60,1,NULL,0),(170,'Lavitar','Ghost',50,1,NULL,0),(171,'Dratini','Dragon',41,1,NULL,0),(172,'Dragonair','Dragon',61,2,171,0),(173,'Dragonite','Dragon',91,3,172,0),(174,'Aerodactyl','Dragon',80,1,NULL,0),(175,'Mew','Dragon',100,1,NULL,1),(176,'Magnemite','Steel',25,1,NULL,0),(177,'Magneton','Steel',50,1,NULL,0),(178,'Steelix','Steel',75,1,NULL,0),(179,'Scizor','Steel',70,1,NULL,0),(180,'Skarmory','Steel',65,1,NULL,0),(181,'Clefairy','Fairy',70,1,NULL,0),(182,'Clefable','Fairy',95,1,NULL,0),(183,'Jigglypuff','Fairy',115,1,NULL,0),(184,'Wigglytuff','Fairy',140,1,NULL,0),(185,'Mew','Fairy',100,1,NULL,1),(195,'Salamence','Dragon',95,3,148,0),(196,'Machamp','Fighting',90,3,142,0),(198,'Nidoking','Poison',81,3,135,0),(200,'Gengar','Ghost',60,3,167,0),(202,'Clefable','Fairy',95,1,NULL,0),(204,'Lugia','Legendary',106,1,NULL,1),(205,'Alakazam','Champion',55,3,147,0),(206,'Poochyena','Dark',35,1,NULL,0),(207,'Mightyena','Dark',70,2,206,0),(246,'Larvitar','Rock',50,1,NULL,0),(247,'Pupitar','Rock',70,2,246,0);
/*!40000 ALTER TABLE `poke_dex` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `monster_id` int NOT NULL,
                           `skill1` int NOT NULL,
                           `skill2` int DEFAULT NULL,
                           `owner` int DEFAULT NULL,
                           `nickname` varchar(20) NOT NULL,
                           `hp` int NOT NULL,
                           `is_surfable` tinyint(1) DEFAULT '0',
                           `is_flyable` tinyint(1) DEFAULT '0',
                           PRIMARY KEY (`id`),
                           KEY `fk_monsterid2` (`monster_id`),
                           KEY `fk_pokemon_skill1` (`skill1`),
                           KEY `fk_pokemon_skill2` (`skill2`),
                           KEY `fk_pokemon_trainer` (`owner`),
                           CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`monster_id`) REFERENCES `poke_dex` (`monster_id`),
                           CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`skill1`) REFERENCES `pokemon_skills` (`id`),
                           CONSTRAINT `pokemon_ibfk_3` FOREIGN KEY (`skill2`) REFERENCES `pokemon_skills` (`id`),
                           CONSTRAINT `pokemon_ibfk_4` FOREIGN KEY (`owner`) REFERENCES `pokemon_trainer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,1,1,3,1,'Pikachu',35,0,0),(2,2,1,2,1,'Charizard',78,1,1),(3,3,1,NULL,2,'Squirtle',44,1,0),(4,4,1,NULL,3,'Pikachu2',35,0,0),(5,5,2,NULL,4,'Jigglypuff',115,0,0),(6,6,3,NULL,5,'Geodude',40,0,0),(7,7,4,NULL,6,'Gastly',30,0,0),(8,8,5,NULL,7,'Onix',35,0,0),(9,9,6,NULL,8,'Eevee',55,0,0),(10,10,7,NULL,9,'Vaporeon',130,0,0),(11,11,8,NULL,10,'Jolteon',65,0,0),(12,12,9,NULL,11,'Flareon',65,0,0),(13,13,10,NULL,12,'Snorlax',160,0,0),(14,14,11,NULL,13,'Dragonite',91,0,0),(15,15,12,NULL,14,'Mewtwo',106,0,0),(16,16,13,NULL,15,'Mew',100,0,0),(17,17,14,NULL,16,'Lapras',130,0,0),(18,18,15,NULL,17,'Gyarados',95,0,0),(19,19,16,NULL,18,'Arcanine',90,0,0),(20,20,17,NULL,19,'Alakazam',55,0,0),(21,1,1,NULL,2,'Bulbasaur_19',128,0,0),(22,2,7,NULL,8,'Charmander_79',136,0,0),(23,3,19,NULL,1,'Squirtle_46',67,1,0),(24,4,10,NULL,17,'Pikachu_70',56,0,0),(25,5,5,NULL,17,'Jigglypuff_58',91,0,0),(26,6,6,NULL,5,'Geodude_23',99,0,0),(27,7,16,NULL,9,'Gastly_74',96,0,1),(28,8,2,NULL,2,'Onix_11',85,0,0),(29,9,9,NULL,20,'Eevee_66',89,0,0),(30,10,20,NULL,16,'Vaporeon_92',76,1,0),(31,11,12,NULL,20,'Jolteon_25',82,1,0),(32,12,17,NULL,6,'Flareon_75',148,1,0),(33,13,14,NULL,10,'Snorlax_31',62,0,0),(34,14,15,NULL,4,'Dragonite_67',141,1,1),(35,15,11,NULL,17,'Mewtwo_67',132,0,1),(36,16,3,NULL,1,'Mew_93',103,0,1),(37,17,17,NULL,13,'Lapras_60',64,1,0),(38,18,19,NULL,3,'Gyarados_86',148,1,0),(39,19,6,NULL,12,'Arcanine_85',113,0,0),(40,20,13,NULL,3,'Alakazam_85',138,1,1),(52,1,1,NULL,6,'Bulbasaur_23',117,0,0),(53,2,2,NULL,1,'Charmander_70',97,0,0),(54,2,2,NULL,4,'Charmander_28',148,0,0),(55,3,3,NULL,2,'Squirtle_6',89,1,0),(56,3,3,NULL,5,'Squirtle_74',106,1,0),(57,4,4,NULL,7,'Pikachu_59',75,0,0),(58,5,5,NULL,21,'Jigglypuff_49',120,0,0),(59,6,6,NULL,3,'Geodude_6',71,0,0),(60,6,6,NULL,11,'Geodude_84',110,0,0),(61,7,7,NULL,18,'Gastly_48',111,0,1),(62,8,8,NULL,3,'Onix_61',72,0,0),(63,8,8,NULL,11,'Onix_26',115,0,0),(64,9,9,NULL,21,'Eevee_48',94,0,0),(65,10,10,NULL,2,'Vaporeon_78',109,1,0),(66,10,10,NULL,5,'Vaporeon_60',76,1,0),(67,11,11,NULL,7,'Jolteon_49',118,1,0),(68,12,12,NULL,1,'Flareon_95',122,1,0),(69,12,12,NULL,4,'Flareon_74',105,1,0),(70,13,13,NULL,21,'Snorlax_52',146,0,0),(71,14,14,NULL,13,'Dragonite_23',77,1,1),(72,15,15,NULL,10,'Mewtwo_69',112,0,1),(73,16,16,NULL,10,'Mew_5',89,0,1),(74,17,17,NULL,2,'Lapras_82',144,1,0),(75,17,17,NULL,5,'Lapras_22',79,1,0),(76,18,18,NULL,2,'Gyarados_78',55,1,0),(77,18,18,NULL,5,'Gyarados_89',84,1,0),(78,19,19,NULL,1,'Arcanine_2',58,0,0),(79,19,19,NULL,4,'Arcanine_37',109,0,0),(80,20,20,NULL,10,'Alakazam_84',95,1,1),(83,1,1,NULL,6,'Bulbasaur_74',85,0,0),(84,2,2,NULL,1,'Charmander_52',108,0,0),(85,2,2,NULL,4,'Charmander_32',139,0,0),(86,3,3,NULL,2,'Squirtle_50',133,1,0),(87,3,3,NULL,5,'Squirtle_64',122,1,0),(88,4,4,NULL,7,'Pikachu_70',83,0,0),(89,5,5,NULL,21,'Jigglypuff_55',125,0,0),(90,6,6,NULL,3,'Geodude_14',94,0,0),(91,6,6,NULL,11,'Geodude_80',118,0,0),(92,7,7,NULL,18,'Gastly_2',55,0,1),(93,8,8,NULL,3,'Onix_21',140,0,0),(94,8,8,NULL,11,'Onix_86',113,0,0),(95,9,9,NULL,21,'Eevee_57',145,0,0),(96,10,10,NULL,2,'Vaporeon_5',92,1,0),(97,10,10,NULL,5,'Vaporeon_96',105,1,0),(98,11,11,NULL,7,'Jolteon_87',119,1,0),(99,12,12,NULL,1,'Flareon_86',73,1,0),(100,12,12,NULL,4,'Flareon_58',72,1,0),(101,13,13,NULL,21,'Snorlax_35',58,0,0),(102,14,14,NULL,13,'Dragonite_38',117,1,1),(103,15,15,NULL,10,'Mewtwo_20',148,0,1),(104,16,16,NULL,10,'Mew_32',115,0,1),(105,17,17,NULL,2,'Lapras_30',105,1,0),(106,17,17,NULL,5,'Lapras_84',107,1,0),(107,18,18,NULL,2,'Gyarados_33',143,1,0),(108,18,18,NULL,5,'Gyarados_68',111,1,0),(109,19,19,NULL,1,'Arcanine_0',67,0,0),(110,19,19,NULL,4,'Arcanine_87',136,0,0),(111,20,20,NULL,10,'Alakazam_67',128,1,1),(114,1,1,NULL,6,'Bulbasaur_88',59,0,0),(115,2,2,NULL,1,'Charmander_83',135,0,0),(116,2,2,NULL,4,'Charmander_78',86,0,0),(117,3,3,NULL,2,'Squirtle_44',66,1,0),(118,3,3,NULL,5,'Squirtle_46',133,1,0),(119,4,4,NULL,7,'Pikachu_77',85,0,0),(120,5,5,NULL,21,'Jigglypuff_45',73,0,0),(121,6,6,NULL,3,'Geodude_79',75,0,0),(122,6,6,NULL,11,'Geodude_90',126,0,0),(123,7,7,NULL,18,'Gastly_10',70,0,1),(124,8,8,NULL,3,'Onix_74',59,0,0),(125,8,8,NULL,11,'Onix_24',143,0,0),(126,9,9,NULL,21,'Eevee_92',133,0,0),(127,10,10,NULL,2,'Vaporeon_40',102,1,0),(128,10,10,NULL,5,'Vaporeon_41',100,1,0),(129,11,11,NULL,7,'Jolteon_26',130,1,0),(130,12,12,NULL,1,'Flareon_24',132,1,0),(131,12,12,NULL,4,'Flareon_37',88,1,0),(132,13,13,NULL,21,'Snorlax_82',147,0,0),(133,14,14,NULL,13,'Dragonite_38',51,1,1),(134,15,15,NULL,10,'Mewtwo_91',101,0,1),(135,16,16,NULL,10,'Mew_84',115,0,1),(136,17,17,NULL,2,'Lapras_77',139,1,0),(137,17,17,NULL,5,'Lapras_15',59,1,0),(138,18,18,NULL,2,'Gyarados_99',121,1,0),(139,18,18,NULL,5,'Gyarados_55',116,1,0),(140,19,19,NULL,1,'Arcanine_64',72,0,0),(141,19,19,NULL,4,'Arcanine_21',87,0,0),(142,20,20,NULL,10,'Alakazam_25',62,1,1),(145,1,1,NULL,6,'Bulbasaur_85',140,0,0),(146,2,2,NULL,1,'Charmander_96',62,0,0),(147,2,2,NULL,4,'Charmander_72',72,0,0),(148,3,3,NULL,2,'Squirtle_96',63,1,0),(149,3,3,NULL,5,'Squirtle_77',96,1,0),(150,4,4,NULL,7,'Pikachu_0',113,0,0),(151,5,5,NULL,21,'Jigglypuff_17',145,0,0),(152,6,6,NULL,3,'Geodude_24',88,0,0),(153,6,6,NULL,11,'Geodude_17',122,0,0),(154,7,7,NULL,18,'Gastly_7',72,0,1),(155,8,8,NULL,3,'Onix_90',135,0,0),(156,8,8,NULL,11,'Onix_54',65,0,0),(157,9,9,NULL,21,'Eevee_12',67,0,0),(158,10,10,NULL,2,'Vaporeon_49',146,1,0),(159,10,10,NULL,5,'Vaporeon_31',120,1,0),(160,11,11,NULL,7,'Jolteon_57',124,1,0),(161,12,12,NULL,1,'Flareon_2',139,1,0),(162,12,12,NULL,4,'Flareon_36',66,1,0),(163,13,13,NULL,21,'Snorlax_72',63,0,0),(164,14,14,NULL,13,'Dragonite_49',58,1,1),(165,15,15,NULL,10,'Mewtwo_92',86,0,1),(166,16,16,NULL,10,'Mew_6',70,0,1),(167,17,17,NULL,2,'Lapras_85',115,1,0),(168,17,17,NULL,5,'Lapras_71',110,1,0),(169,18,18,NULL,2,'Gyarados_86',101,1,0),(170,18,18,NULL,5,'Gyarados_97',84,1,0),(171,19,19,NULL,1,'Arcanine_77',134,0,0),(172,19,19,NULL,4,'Arcanine_89',146,0,0),(173,20,20,NULL,10,'Alakazam_12',124,1,1),(176,1,1,NULL,6,'Bulbasaur_33',94,0,0),(177,2,2,NULL,1,'Charmander_21',125,0,0),(178,2,2,NULL,4,'Charmander_11',79,0,0),(179,3,3,NULL,2,'Squirtle_15',140,1,0),(180,3,3,NULL,5,'Squirtle_3',94,1,0),(181,4,4,NULL,7,'Pikachu_15',91,0,0),(182,5,5,NULL,21,'Jigglypuff_62',137,0,0),(183,6,6,NULL,3,'Geodude_50',138,0,0),(184,6,6,NULL,11,'Geodude_92',146,0,0),(185,7,7,NULL,18,'Gastly_3',80,0,1),(186,8,8,NULL,3,'Onix_42',70,0,0),(187,8,8,NULL,11,'Onix_76',68,0,0),(188,9,9,NULL,21,'Eevee_62',107,0,0),(189,10,10,NULL,2,'Vaporeon_1',82,1,0),(190,10,10,NULL,5,'Vaporeon_58',146,1,0),(191,11,11,NULL,7,'Jolteon_5',89,1,0),(192,12,12,NULL,1,'Flareon_80',133,1,0),(193,12,12,NULL,4,'Flareon_78',89,1,0),(194,13,13,NULL,21,'Snorlax_61',141,0,0),(195,14,14,NULL,13,'Dragonite_70',129,1,1),(196,15,15,NULL,10,'Mewtwo_86',143,0,1),(197,16,16,NULL,10,'Mew_8',110,0,1),(198,17,17,NULL,2,'Lapras_77',56,1,0),(199,17,17,NULL,5,'Lapras_97',120,1,0),(200,18,18,NULL,2,'Gyarados_59',134,1,0),(201,18,18,NULL,5,'Gyarados_44',118,1,0),(202,19,19,NULL,1,'Arcanine_8',88,0,0),(203,19,19,NULL,4,'Arcanine_68',74,0,0),(204,20,20,NULL,10,'Alakazam_18',68,1,1);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_skills`
--

DROP TABLE IF EXISTS `pokemon_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_skills` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `skill_name` varchar(20) NOT NULL,
                                  `skill_effect` varchar(20) NOT NULL,
                                  `skill_type` varchar(10) NOT NULL,
                                  `skill_damage` varchar(10) NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_skills`
--

LOCK TABLES `pokemon_skills` WRITE;
/*!40000 ALTER TABLE `pokemon_skills` DISABLE KEYS */;
INSERT INTO `pokemon_skills` VALUES (1,'Tackle','Normal','Physical','40'),(2,'Thunderbolt','Electric','Special','90'),(3,'Water Gun','Water','Special','40'),(4,'Scratch','Normal','Physical','40'),(5,'Ember','Fire','Special','40'),(6,'Quick Attack','Normal','Physical','40'),(7,'Vine Whip','Grass','Physical','45'),(8,'Bubble','Water','Special','40'),(9,'Gust','Flying','Special','40'),(10,'Peck','Flying','Physical','35'),(11,'Bite','Dark','Physical','60'),(12,'Confusion','Psychic','Special','50'),(13,'Poison Sting','Poison','Physical','15'),(14,'Thunder Shock','Electric','Special','40'),(15,'Razor Leaf','Grass','Physical','55'),(16,'Ice Beam','Ice','Special','90'),(17,'Body Slam','Normal','Physical','85'),(18,'Earthquake','Ground','Physical','100'),(19,'Psychic','Psychic','Special','90'),(20,'Blizzard','Ice','Special','110'),(21,'Hydro Pump','Water','Special','110'),(22,'Hyper Beam','Normal','Special','150');
/*!40000 ALTER TABLE `pokemon_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_trainer`
--

DROP TABLE IF EXISTS `pokemon_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_trainer` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `name` varchar(20) DEFAULT NULL,
                                   `trainer_type` varchar(20) DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `fk_trainertype_monstertype` (`trainer_type`),
                                   CONSTRAINT `pokemon_trainer_ibfk_1` FOREIGN KEY (`trainer_type`) REFERENCES `poke_dex` (`monster_type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_trainer`
--

LOCK TABLES `pokemon_trainer` WRITE;
/*!40000 ALTER TABLE `pokemon_trainer` DISABLE KEYS */;
INSERT INTO `pokemon_trainer` VALUES (1,'Ash Ketchum','Fire'),(2,'Misty','Water'),(3,'Brock','Rock'),(4,'Red','Fire'),(5,'Blue','Water'),(6,'Green','Grass'),(7,'Yellow','Electric'),(8,'Gold','Ground'),(9,'Silver','Ice'),(10,'Crystal','Psychic'),(11,'Ruby','Rock'),(12,'Sapphire','Steel'),(13,'Emerald','Dragon'),(14,'Diamond','Fighting'),(15,'Pearl','Flying'),(16,'Platinum','Poison'),(17,'Black','Bug'),(18,'White','Ghost'),(19,'X','Dark'),(20,'Y','Fairy'),(21,'Sun','Normal'),(22,'Moon','Legendary'),(23,'Champion','Champion');
/*!40000 ALTER TABLE `pokemon_trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 14:28:23
