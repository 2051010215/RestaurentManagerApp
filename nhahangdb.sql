-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: nhahangdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Khai Vị',NULL),(2,'Súp Các Loại',NULL),(3,'Các Món Gà',NULL),(4,'Các Món Bò',''),(5,'Hải Sản',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_idx` (`product_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Good',6,19,'2023-08-27 00:00:00'),(2,'Tốt ',6,19,'2023-08-27 00:00:00'),(3,'Great',8,19,'2023-08-27 00:00:00'),(4,'Dưới ánh mặt trời rạng ngời, một ngày mới bắt đầu. Tôi thức dậy và cảm nhận hơi thở của thiên nhiên xâm nhập qua cửa sổ. Không gian yên bình, chỉ có tiếng ca líu lo của chim hót trong xa vắng. Từng tia nắng đầu tiên len lỏi qua khe rèm, nhấp nháy trên tấm áo trải giường, tạo ra một biểu tượng của sự sống. Tôi cảm thấy lòng mình đang tràn đầy hy vọng và năng lượng, sẵn sàng đối mặt với những thách thức của ngày mới. Đó là một khoảnh khắc tĩnh lặng, nơi tôi tìm thấy sự bình yên giữa cuộc sống hối hả.',6,2,'2023-08-27 00:00:00'),(5,'Mình vừa trải qua một trải nghiệm ẩm thực đáng nhớ khi thử một món ăn mới tại một nhà hàng quen thuộc. Món ăn đó là bánh mì lợn quay. Ngay từ khi mình cắn vào miếng đầu tiên, mình đã bị cuốn hút bởi hương vị đậm đà của lợn quay giòn tan bên ngoài và nhân bánh mì mềm mịn bên trong.',8,2,'2023-08-27 00:00:00'),(6,'Tuyệt vời',6,2,'2023-09-06 00:00:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `num` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ORDERDETAIL_ORDER_idx` (`order_id`),
  KEY `FK_ORDERDETAIL_PRODUCT_idx` (`product_id`),
  CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`),
  CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,4,1,12500000,1),(6,4,2,21000000,1),(7,4,3,17000000,1),(8,5,1,12500000,1),(9,5,3,17000000,1),(10,5,7,10540000,1),(11,6,2,21000000,1),(12,7,5,18600000,1),(13,7,6,12990000,3),(14,8,1,12500000,1),(15,8,2,21000000,2),(16,8,3,17000000,1),(17,9,1,12500000,1),(18,9,2,21000000,2),(19,10,4,28000000,1),(20,10,5,18600000,5),(21,11,1,12500000,2),(22,11,2,21000000,2),(23,11,3,17000000,1),(24,13,2,0,0),(25,13,1,0,0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_tag`
--

DROP TABLE IF EXISTS `prod_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `f1_idx` (`product_id`),
  KEY `f2_idx` (`tag_id`),
  CONSTRAINT `f1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `f2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_tag`
--

LOCK TABLES `prod_tag` WRITE;
/*!40000 ALTER TABLE `prod_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `manufacturer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCE_CATEGORY_idx` (`category_id`),
  CONSTRAINT `FK_PRODUCE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bánh Bao Chiên','6 cái không nhân',1100000,'Khai Vị','https://res.cloudinary.com/dwffijgal/image/upload/v1693137231/k6uoboj80wnswf0dx7gh.jpg','2020-01-20 00:00:00',_binary '',1),(2,'Khoai Tây Chiên','100gram',2100000,'Khai Vị','https://res.cloudinary.com/dwffijgal/image/upload/v1693137214/sxqmzrrtlglj2xo4ph5f.jpg','2020-01-08 00:00:00',_binary '',1),(3,'Bánh Mì','2 ổ',1700000,'Khai Vị','https://res.cloudinary.com/dwffijgal/image/upload/v1693137195/byjehqm5gkyeqm9dumuw.jpg','2020-01-12 00:00:00',_binary '',1),(4,'Súp Cá Hồi ','120gram cá hồi',2800000,'Súp','https://res.cloudinary.com/dwffijgal/image/upload/v1693137491/zhyx0i06eydvcdod5i9b.jpg','2020-01-15 00:00:00',_binary '',2),(5,'Súp Cua ','1 bát lớn',1860000,'Súp','https://res.cloudinary.com/dwffijgal/image/upload/v1693137505/psyksmc6mopffo2rahfa.jpg','2020-01-12 00:00:00',_binary '',2),(6,'Súp Lươn','150gram lươn',1299000,'Súp','https://res.cloudinary.com/dwffijgal/image/upload/v1693137516/iit0pf2phyd3jyifxrpn.jpg','2020-01-18 00:00:00',_binary '',2),(7,'Bò Nướng Lá Lốt','12 cuộn bò nướng',1054000,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1693816740/yazt4zlzfibzucz0n7u9.png',NULL,NULL,4),(16,'Gà Tần Thuốc Bắc','1/2 con',3000000,'Gà','https://res.cloudinary.com/dwffijgal/image/upload/v1693137619/afa0jfvhhgxtebbaiacr.jpg','2020-01-26 00:00:00',_binary '',3),(17,'Gà Hấp Lá Chanh','1/2 con',3000000,'Gà','https://res.cloudinary.com/dwffijgal/image/upload/v1693137661/hogevcoyeno9xcfprgoq.jpg','2020-01-26 00:00:00',_binary '',3),(19,'Gà Lác','Nó lác lác',99999,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1693723857/ytu8qfe9weogf3iqdgf7.jpg',NULL,NULL,3),(24,'Bò Quanh Lửa Hồng','100gr Bò hầm với sốt đặc biệt',999999,NULL,'https://res.cloudinary.com/dxxwcby8l/image/upload/v1694150296/invhzmswxcaejtdpzsdr.png',NULL,NULL,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_USER_idx` (`user_id`),
  CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (4,50500000,'2020-02-03 00:00:00',7),(5,40040000,'2020-02-03 00:00:00',7),(6,21000000,'2020-02-03 00:00:00',7),(7,57570000,'2020-02-04 00:00:00',7),(8,71500000,'2020-02-05 00:00:00',6),(9,54500000,'2020-02-05 00:00:00',7),(10,121000000,'2020-02-07 00:00:00',6),(11,84000000,'2020-02-07 00:00:00',8),(12,100,'2020-11-17 18:43:31',NULL),(13,100,'2020-11-17 18:48:11',NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagcol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Trong Nhan','Le','nhan@gmail.com','0943184736','trongnhan123','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN','https://res.cloudinary.com/dwffijgal/image/upload/v1693137231/k6uoboj80wnswf0dx7gh.jpg'),(7,'Nhan','Lee','nhanlee@gmail.com','0123456789','nhan123','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN',NULL),(8,'Hannah','Mrs','hannanh@gmail.com','0123456789','hannah','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_USER','https://res.cloudinary.com/dwffijgal/image/upload/v1693137231/k6uoboj80wnswf0dx7gh.jpg'),(9,'Khang','Hưng','abc@gmail.com','0123456789','khang123','$2a$10$HmGPusCmd2vBrRDY3Bmj4eOZBuKk35JGPy1OBKBZ5McDdrSDC3Zp.',NULL,'ROLE_USER','https://res.cloudinary.com/dxxwcby8l/image/upload/v1694016602/cr2o6xqathlpjz7yuiyy.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nhahangdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 12:30:49
