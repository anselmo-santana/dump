CREATE DATABASE  IF NOT EXISTS `tcc_pep_2025` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tcc_pep_2025`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tcc_pep_2025
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `pais` varchar(50) DEFAULT 'Brasil',
  `ponto_referencia` varchar(100) DEFAULT NULL,
  `zona` enum('Urbana','Rural','Indígena') DEFAULT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minha_tabela`
--

DROP TABLE IF EXISTS `minha_tabela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minha_tabela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dados` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minha_tabela`
--

LOCK TABLES `minha_tabela` WRITE;
/*!40000 ALTER TABLE `minha_tabela` DISABLE KEYS */;
/*!40000 ALTER TABLE `minha_tabela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `cpf` char(11) DEFAULT NULL,
  `sus` char(15) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `etnia` char(15) DEFAULT NULL,
  `genero` char(25) DEFAULT NULL,
  `escolaridade` varchar(20) DEFAULT NULL,
  `nacionalidade` char(15) DEFAULT NULL,
  `naturalidade_estado` char(20) DEFAULT NULL,
  `naturalidade_municipio` char(25) DEFAULT NULL,
  `profissao` json DEFAULT NULL,
  `estado_clinico` varchar(10) DEFAULT NULL,
  `responsavel_legal` varchar(5) DEFAULT NULL,
  `filiacao_mae` char(40) DEFAULT NULL,
  `filiacao_pai` char(40) DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto_saude`
--

DROP TABLE IF EXISTS `posto_saude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto_saude` (
  `id_posto` int NOT NULL AUTO_INCREMENT,
  `nome_posto` varchar(100) NOT NULL,
  `endereco` int DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `horario_funcionamento` varchar(50) DEFAULT NULL,
  `tipo_atendimento` enum('UBS','UPA','AMA') DEFAULT NULL,
  `capacidade` int DEFAULT NULL,
  `servicos_disponiveis` json DEFAULT NULL,
  `responsavel_posto` json DEFAULT NULL,
  `regiao_de_abrangencia` int DEFAULT NULL,
  PRIMARY KEY (`id_posto`),
  KEY `fk_endereco` (`endereco`),
  KEY `fk_regiao` (`regiao_de_abrangencia`),
  CONSTRAINT `fk_endereco` FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_regiao` FOREIGN KEY (`regiao_de_abrangencia`) REFERENCES `endereco` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto_saude`
--

LOCK TABLES `posto_saude` WRITE;
/*!40000 ALTER TABLE `posto_saude` DISABLE KEYS */;
/*!40000 ALTER TABLE `posto_saude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissional`
--

DROP TABLE IF EXISTS `profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissional` (
  `id_profissional` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `cbo` varchar(6) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `data_demissao` date DEFAULT NULL,
  `id_posto` int DEFAULT NULL,
  `horario_atendimento` json DEFAULT NULL,
  `contato_email` varchar(100) DEFAULT NULL,
  `contato_telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_profissional`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_posto` (`id_posto`),
  CONSTRAINT `fk_posto` FOREIGN KEY (`id_posto`) REFERENCES `posto_saude` (`id_posto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissional`
--

LOCK TABLES `profissional` WRITE;
/*!40000 ALTER TABLE `profissional` DISABLE KEYS */;
/*!40000 ALTER TABLE `profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_atividade`
--

DROP TABLE IF EXISTS `registro_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_atividade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `agente` varchar(100) NOT NULL,
  `paciente` varchar(100) NOT NULL,
  `observacoes` text,
  `acoes_realizadas` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_atividade`
--

LOCK TABLES `registro_atividade` WRITE;
/*!40000 ALTER TABLE `registro_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_profissao`
--

DROP TABLE IF EXISTS `tabela_profissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_profissao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dados` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_profissao`
--

LOCK TABLES `tabela_profissao` WRITE;
/*!40000 ALTER TABLE `tabela_profissao` DISABLE KEYS */;
INSERT INTO `tabela_profissao` VALUES (1,'{\"Tipo\": \"Ocupação\", \"Título\": \"Profissão\", \"CBO_2002\": \"Código\"}');
/*!40000 ALTER TABLE `tabela_profissao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 16:54:02
