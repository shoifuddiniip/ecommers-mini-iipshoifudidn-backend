-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `qty` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (116,1,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',2,'2025-08-13 00:40:16'),(117,1,4,'Skinny Fit Jeans',240,'Skinny_Fit_Jeans.png','M','Blue',3,'2025-08-13 00:40:16'),(118,2,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:34:03'),(119,2,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:34:07'),(120,2,9,'Loose Fit Bermuda Shorts',80,'Loose_Fit_Bermuda_Shorts.png','M','Blue',1,'2025-08-13 02:34:07'),(121,2,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:34:10'),(122,2,9,'Loose Fit Bermuda Shorts',80,'Loose_Fit_Bermuda_Shorts.png','M','Blue',1,'2025-08-13 02:34:10'),(123,2,7,'Vertical Striped Shirt',212,'Vertical_Striped_Shirt.png','XL','Green',1,'2025-08-13 02:34:10'),(124,2,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:34:15'),(125,2,9,'Loose Fit Bermuda Shorts',80,'Loose_Fit_Bermuda_Shorts.png','M','Blue',1,'2025-08-13 02:34:15'),(126,2,7,'Vertical Striped Shirt',212,'Vertical_Striped_Shirt.png','XL','Green',1,'2025-08-13 02:34:15'),(127,2,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:34:15'),(128,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:36:43'),(129,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',2,'2025-08-13 02:36:43'),(130,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',3,'2025-08-13 02:36:43'),(131,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',3,'2025-08-13 02:37:21'),(132,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:18'),(133,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:45'),(134,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:48'),(135,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:48'),(136,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:56'),(137,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:56'),(138,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:56'),(139,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:57'),(140,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:57'),(141,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:57'),(142,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:54:58'),(143,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:58'),(144,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:58'),(145,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',2,'2025-08-13 02:54:58'),(146,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:58'),(147,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:58'),(148,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',3,'2025-08-13 02:54:58'),(149,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:58'),(150,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:58'),(151,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',4,'2025-08-13 02:54:58'),(152,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:58'),(153,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:58'),(154,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',5,'2025-08-13 02:54:58'),(155,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:58'),(156,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:58'),(157,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',6,'2025-08-13 02:54:59'),(158,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:54:59'),(159,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:54:59'),(160,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:01'),(161,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',1,'2025-08-13 02:55:01'),(162,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:01'),(163,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:01'),(164,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',2,'2025-08-13 02:55:01'),(165,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:01'),(166,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:01'),(167,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',3,'2025-08-13 02:55:01'),(168,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:01'),(169,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:01'),(170,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',4,'2025-08-13 02:55:01'),(171,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:01'),(172,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:02'),(173,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',5,'2025-08-13 02:55:02'),(174,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:02'),(175,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:02'),(176,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',6,'2025-08-13 02:55:02'),(177,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:02'),(178,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:04'),(179,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',7,'2025-08-13 02:55:04'),(180,3,2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','L','Blue',1,'2025-08-13 02:55:04'),(181,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',7,'2025-08-13 02:55:23'),(182,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',7,'2025-08-13 02:55:23'),(183,3,1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','M','Red',7,'2025-08-13 02:55:24'),(184,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 02:59:29'),(185,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 03:02:54'),(186,3,4,'Skinny Fit Jeans',240,'Skinny_Fit_Jeans.png','M','Blue',1,'2025-08-13 03:02:54'),(187,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 03:03:44'),(188,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,'2025-08-13 03:04:00'),(189,3,6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','M','Orange',1,NULL),(190,3,9,'Loose Fit Bermuda Shorts',80,'Loose_Fit_Bermuda_Shorts.png','M','Blue',1,NULL);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,'2025-08-12 14:54:58','2025-08-13 00:40:16','2025-08-13 00:40:16'),(2,1,'2025-08-13 02:33:39','2025-08-13 02:34:16','2025-08-13 02:34:16'),(3,1,'2025-08-13 02:36:39','2025-08-13 02:36:39',NULL);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `qty` int NOT NULL,
  `price` float DEFAULT NULL,
  `size` varchar(16) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,'ORDER11755045142714350000',1,'Gradient Graphic T-Shirt',2,180,'M','Red'),(2,'ORDER11755045142714350000',4,'Skinny Fit Jeans',3,240,'M','Blue'),(3,'ORDER11755045616050017200',1,'Gradient Graphic T-Shirt',2,180,'M','Red'),(4,'ORDER11755045616050017200',4,'Skinny Fit Jeans',3,240,'M','Blue'),(5,'ORDER11755052455845804700',6,'Sleeve Striped T-Shirt',1,150,'M','Orange'),(6,'ORDER11755052455845804700',9,'Loose Fit Bermuda Shorts',1,80,'M','Blue'),(7,'ORDER11755052455845804700',7,'Vertical Striped Shirt',1,212,'XL','Green'),(8,'ORDER11755052455845804700',2,'Polo with Tipping Details',1,150,'L','Blue');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(32) NOT NULL,
  `user_id` int DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `delivery_fee` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `promo_code` varchar(32) DEFAULT NULL,
  `status` varchar(16) DEFAULT 'pending',
  `payment_code` varchar(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORDER11755045142714350000',1,1080,216,15,879,NULL,'pending','ORDER11755045142714350000','2025-08-13 00:32:22'),('ORDER11755045616050017200',1,1080,216,15,879,NULL,'pending','ORDER11755045616050017200','2025-08-13 00:40:16'),('ORDER11755052455845804700',1,592,118,15,489,NULL,'pending','ORDER11755052455845804700','2025-08-13 02:34:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `original_price` float DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT '',
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Gradient Graphic T-Shirt',180,'Gradient_Graphic_T-Shirt.png','Red','M',NULL,'T-Shirts',100),(2,'Polo with Tipping Details',150,'Polo_with_Tipping_Details.png','Blue','L',NULL,'T-Shirts',100),(3,'Black Striped T-Shirt',130,'Black_Striped_T-Shirt.png','Black','S',NULL,'T-Shirts',100),(4,'Skinny Fit Jeans',240,'Skinny_Fit_Jeans.png','Blue','M',260,'Jeans',100),(5,'Checkered Shirt',180,'Checkered_Shirt.png','Red','L',NULL,'Shirts',100),(6,'Sleeve Striped T-Shirt',150,'Sleeve_Striped_T-Shirt.png','Orange','M',180,'T-Shirts',100),(7,'Vertical Striped Shirt',212,'Vertical_Striped_Shirt.png','Green','XL',232,'Shirts',100),(8,'Orange Graphic T-Shirt',145,'Orange_Graphic_T-Shirt.png','Orange','S',NULL,'T-Shirts',100),(9,'Loose Fit Bermuda Shorts',80,'Loose_Fit_Bermuda_Shorts.png','Blue','M',NULL,'Shorts',100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'demo','45153ecd716a4b5bb7779d43fb38b3b115e384425ce7d4a75fc410199b19558055dd6d09b8b96847ad658f1c474ed081c252e40a0078dd8b0a41bebefa857721','John Doe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-13 10:09:34
