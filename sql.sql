-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: salao
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamento` (
  `cod_agen` int(11) NOT NULL AUTO_INCREMENT,
  `data_agen` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_cli` int(11) NOT NULL,
  `cod_ser` int(11) NOT NULL,
  PRIMARY KEY (`cod_agen`),
  KEY `fk_agendamento_cliente_idx` (`cod_cli`),
  KEY `fk_agendamento_servico_idx` (`cod_ser`),
  CONSTRAINT `fk_agendamento_cliente` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_servico` FOREIGN KEY (`cod_ser`) REFERENCES `servico` (`cod_ser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,'2017-06-22 22:39:07',3,1);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `cod_car` int(11) NOT NULL AUTO_INCREMENT,
  `nome_car` varchar(100) NOT NULL,
  `descricao_car` text,
  PRIMARY KEY (`cod_car`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Cabeleireira','Cortes profissionais de cabelo'),(2,'Manicure e Pedicure','Fazer a mão e o pé das clientes'),(4,'Maquiador','Fazer a maquiagem no rosto dos clientes');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cod_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cli` varchar(200) DEFAULT NULL,
  `cpf_cli` varchar(50) DEFAULT NULL,
  `rg_cli` varchar(50) DEFAULT NULL,
  `endereco_cli` varchar(100) DEFAULT NULL,
  `numero_cli` int(11) DEFAULT NULL,
  `bairro_cli` varchar(100) DEFAULT NULL,
  `complemento_cli` varchar(50) DEFAULT NULL,
  `email_cli` text,
  `sexo_cli` enum('M','F') DEFAULT NULL,
  `dataNasc_cli` date DEFAULT NULL,
  `telefone_cli` char(14) DEFAULT NULL,
  `cidade_cli` varchar(50) DEFAULT NULL,
  `estado_cli` varchar(100) DEFAULT NULL,
  `baseNatural_cli` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Leonardo','013.276.212-90','1150802','Rua Sena Madureira',27578,'Cafezinho','T18 com t19','lhleonardo05@gmail.com','M','1999-05-02','1999-02-05','69993129710','Ji-PAraná','RO'),(2,'Stephanie','033.605.842-01','249322','ssadf',1234,'dssf','stepkfsn','stephaie@gmail.com','F','1999-07-15','2017-05-12','69932314','ji-parana','AC'),(3,'Jéssica','560.363.621-10','12345644','Rua Tal',222,'Vasdfkljasfd','CAsdfljkashdfkjasdfh','332144622155','F','1999-02-05','1223334651','Ji-Parana','AC','');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `cod_comp` int(11) NOT NULL AUTO_INCREMENT,
  `data_comp` varchar(50) DEFAULT NULL,
  `valor_comp` varchar(50) DEFAULT NULL,
  `quantidade_comp` int(11) DEFAULT NULL,
  `forma_pag` varchar(50) DEFAULT NULL,
  `cod_forn` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  PRIMARY KEY (`cod_comp`),
  KEY `cod_forn` (`cod_forn`),
  KEY `cod_prod` (`cod_prod`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cod_forn`) REFERENCES `fornecedor` (`cod_forn`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesas`
--

DROP TABLE IF EXISTS `despesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesas` (
  `cod_desp` int(11) NOT NULL AUTO_INCREMENT,
  `dataVenc_desp` varchar(50) DEFAULT NULL,
  `formaPag_desp` varchar(100) DEFAULT NULL,
  `cod_forn` int(11) NOT NULL,
  PRIMARY KEY (`cod_desp`),
  KEY `cod_forn` (`cod_forn`),
  CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`cod_forn`) REFERENCES `fornecedor` (`cod_forn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesas`
--

LOCK TABLES `despesas` WRITE;
/*!40000 ALTER TABLE `despesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `despesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `cod_forn` int(11) NOT NULL AUTO_INCREMENT,
  `razaoSocial_forn` varchar(100) DEFAULT NULL,
  `fantasia_forn` varchar(200) DEFAULT NULL,
  `cnpj_forn` varchar(20) DEFAULT NULL,
  `ie_forn` varchar(50) DEFAULT NULL,
  `telefone_forn` varchar(50) DEFAULT NULL,
  `endereco_forn` varchar(100) DEFAULT NULL,
  `numero_forn` int(11) DEFAULT NULL,
  `bairro_forn` varchar(50) DEFAULT NULL,
  `complemento_forn` varchar(50) DEFAULT NULL,
  `email_forn` varchar(100) DEFAULT NULL,
  `dataFundacao_forn` varchar(50) DEFAULT NULL,
  `cidade_forn` varchar(100) DEFAULT NULL,
  `estado_forn` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cod_forn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Meu primeiro fornecedor','Forn1','72.911.181/0001-19','912939121111','(69)993129710','Rua das palmeiras',234,'Cafezinho','T18 com o bar','stephanie@gmail.com','1978-02-05','Ji-Paraná','RO'),(2,'Nome diferente do fornecedor','minha fantasia','12.345.678/9098-76','912939121111','(69)993129710','Rua das palmeiras',234,'Cafezinho','T18 com o bar','ioooii@gmail.com','1978-02-05','Ji-Paraná','RO');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `cod_func` int(11) NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(200) DEFAULT NULL,
  `sexo_func` enum('M','F') DEFAULT NULL,
  `cpf_func` varchar(15) DEFAULT NULL,
  `rg_func` varchar(50) DEFAULT NULL,
  `dataNasc_func` date DEFAULT NULL,
  `telefone_func` varchar(50) DEFAULT NULL,
  `email_func` text,
  `logradouro_func` varchar(100) DEFAULT NULL,
  `numero_func` int(11) DEFAULT NULL,
  `bairro_func` varchar(100) DEFAULT NULL,
  `complemento_func` varchar(100) DEFAULT NULL,
  `cidade_func` varchar(100) DEFAULT NULL,
  `estado_func` char(2) DEFAULT NULL,
  `dataAdmissao_func` date DEFAULT NULL,
  `salario_func` decimal(10,2) DEFAULT NULL,
  `diaPagamento_func` int(11) DEFAULT '1',
  `cargo_cod` int(11) NOT NULL,
  PRIMARY KEY (`cod_func`),
  KEY `fk_cargo_func_idx` (`cargo_cod`),
  CONSTRAINT `fk_cargo_func` FOREIGN KEY (`cargo_cod`) REFERENCES `cargo` (`cod_car`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Stephanie','F','033.605.842-01','01240211','2017-06-23','34217030','stephanie@gmail.com','dasdas',86778,'fdsfsdf','gfgfd','gfdgdf','AM','2017-06-03',876900.00,4,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `cod_mar` int(11) NOT NULL AUTO_INCREMENT,
  `nome_mar` varchar(100) NOT NULL,
  `descricao_mar` text,
  PRIMARY KEY (`cod_mar`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'AVON',NULL),(2,'Boticário',NULL),(3,'Hinode',NULL),(4,'Jequiti',NULL);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `cod_prod` int(11) NOT NULL AUTO_INCREMENT,
  `nome_prod` varchar(100) DEFAULT NULL,
  `vendaParcial_prod` varchar(50) DEFAULT NULL,
  `quantidade_prod` varchar(50) DEFAULT NULL,
  `tipo_prod` varchar(50) DEFAULT NULL,
  `marca_cod` int(11) NOT NULL,
  `descricao_prod` varchar(300) DEFAULT NULL,
  `preco_prod` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cod_prod`),
  KEY `prod_mar_idx` (`marca_cod`),
  CONSTRAINT `prod_mar` FOREIGN KEY (`marca_cod`) REFERENCES `marca` (`cod_mar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (3,'baton','0','13','UN',1,'asdfjaskdfasdf',7.00),(4,'Bati','1','23','KG',2,'dsa	',21.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_fornecedor` (
  `cod_forn` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  PRIMARY KEY (`cod_forn`,`cod_prod`),
  KEY `cod_prod_idx` (`cod_prod`),
  CONSTRAINT `cod_forn` FOREIGN KEY (`cod_forn`) REFERENCES `fornecedor` (`cod_forn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_prod` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,3),(1,4);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `cod_ser` int(11) NOT NULL AUTO_INCREMENT,
  `nome_ser` varchar(100) NOT NULL,
  `preco_ser` decimal(10,2) NOT NULL,
  `cargo_cod` int(11) NOT NULL,
  PRIMARY KEY (`cod_ser`),
  KEY `cargo_servico_idx` (`cargo_cod`),
  CONSTRAINT `cargo_servico` FOREIGN KEY (`cargo_cod`) REFERENCES `cargo` (`cod_car`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Corte de Cabelos',33.17,1),(2,'Combo pé e mão',15.00,2),(3,'SERVIÇO COMPLETO PÉ E MÃO',50.00,2);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-22 22:53:59
