-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.47


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema hospitaladv
--

CREATE DATABASE IF NOT EXISTS hospitaladv;
USE hospitaladv;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`username`,`password`,`name`) VALUES 
 ('admin','admin','John Abc');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `bappointment`
--

DROP TABLE IF EXISTS `bappointment`;
CREATE TABLE `bappointment` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `grouph` varchar(10) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `mob` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `bloodbank` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bappointment`
--

/*!40000 ALTER TABLE `bappointment` DISABLE KEYS */;
INSERT INTO `bappointment` (`name`,`address`,`age`,`gender`,`grouph`,`qty`,`mob`,`email`,`bloodbank`,`city`,`status`,`id`) VALUES 
 ('Mahesh Shinde','Latur',25,'Male','B-',1,'9545245845','mahesh@gmail.com','Suraj Blood Bank','Latur','Confirmed',2);
/*!40000 ALTER TABLE `bappointment` ENABLE KEYS */;


--
-- Definition of table `binstruments`
--

DROP TABLE IF EXISTS `binstruments`;
CREATE TABLE `binstruments` (
  `instrument` varchar(200) DEFAULT NULL,
  `work` varchar(200) DEFAULT NULL,
  `bank` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `binstruments`
--

/*!40000 ALTER TABLE `binstruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `binstruments` ENABLE KEYS */;


--
-- Definition of table `bloodbank`
--

DROP TABLE IF EXISTS `bloodbank`;
CREATE TABLE `bloodbank` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bloodbank`
--

/*!40000 ALTER TABLE `bloodbank` DISABLE KEYS */;
INSERT INTO `bloodbank` (`id`,`username`,`password`,`name`,`owner`,`address`,`licenseno`,`mobile`,`email`,`city`,`photo`) VALUES 
 (3,'suraj','123','Suraj Blood Bank','Suraj Jidge','Latur','blic101','7874874584','suraj@gmail.com','Latur','uploadphoto/Jellyfish.jpg'),
 (8,'bhalchandra','123','Bhalchandra Blood Bank','Bhalchandra','Near bus stand ,','blic102','9823739123','bhalchandra@gmail.com','Latur','3.jpg');
/*!40000 ALTER TABLE `bloodbank` ENABLE KEYS */;


--
-- Definition of table `bloodstock`
--

DROP TABLE IF EXISTS `bloodstock`;
CREATE TABLE `bloodstock` (
  `bank` varchar(200) DEFAULT NULL,
  `apos` varchar(10) DEFAULT NULL,
  `aposprice` varchar(10) DEFAULT NULL,
  `aposstock` varchar(10) DEFAULT NULL,
  `aneg` varchar(10) DEFAULT NULL,
  `anegprice` varchar(10) DEFAULT NULL,
  `anegstock` varchar(10) DEFAULT NULL,
  `bpos` varchar(10) DEFAULT NULL,
  `bposprice` varchar(10) DEFAULT NULL,
  `bposstock` varchar(10) DEFAULT NULL,
  `bneg` varchar(10) DEFAULT NULL,
  `bnegprice` varchar(10) DEFAULT NULL,
  `bnegstock` varchar(10) DEFAULT NULL,
  `abpos` varchar(10) DEFAULT NULL,
  `abposprice` varchar(10) DEFAULT NULL,
  `abposstock` varchar(10) DEFAULT NULL,
  `abneg` varchar(10) DEFAULT NULL,
  `abnegprice` varchar(10) DEFAULT NULL,
  `abnegstock` varchar(10) DEFAULT NULL,
  `opos` varchar(10) DEFAULT NULL,
  `oposprice` varchar(10) DEFAULT NULL,
  `oposstock` varchar(10) DEFAULT NULL,
  `oneg` varchar(10) DEFAULT NULL,
  `onegprice` varchar(10) DEFAULT NULL,
  `onegposstock` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bloodstock`
--

/*!40000 ALTER TABLE `bloodstock` DISABLE KEYS */;
INSERT INTO `bloodstock` (`bank`,`apos`,`aposprice`,`aposstock`,`aneg`,`anegprice`,`anegstock`,`bpos`,`bposprice`,`bposstock`,`bneg`,`bnegprice`,`bnegstock`,`abpos`,`abposprice`,`abposstock`,`abneg`,`abnegprice`,`abnegstock`,`opos`,`oposprice`,`oposstock`,`oneg`,`onegprice`,`onegposstock`) VALUES 
 ('bhim','a+','1000','12','a-','2000','10','b+','1000','10','b-','1100','20','ab+','4000','12','ab-','1000','20','o+','1000','13','o-','1000','10'),
 ('Bhalchandra Blood Bank',NULL,'1000','12',NULL,'2000','10',NULL,'1000','10',NULL,'1100','20',NULL,'4000','12',NULL,'1000','20',NULL,'1000','13',NULL,'1000','10'),
 ('Suraj Blood Bank',NULL,'1000','12',NULL,'2000','10',NULL,'1000','10',NULL,'1100','20',NULL,'4000','12',NULL,'1000','20',NULL,'1000','13',NULL,'1000','10');
/*!40000 ALTER TABLE `bloodstock` ENABLE KEYS */;


--
-- Definition of table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `doctortype` varchar(200) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hospitalname` varchar(200) DEFAULT NULL,
  `homeaddress` varchar(100) DEFAULT NULL,
  `hospitaladdress` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `photo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`id`,`username`,`password`,`name`,`address`,`doctortype`,`education`,`licenseno`,`dob`,`mobile`,`email`,`hospitalname`,`homeaddress`,`hospitaladdress`,`city`,`photo`) VALUES 
 (1,NULL,NULL,'Ravi Jadhav','Bitargaon','Ophthalmologist','M.D.','Licd111','10/10/1980','7798042438','ravi@gmail.com','Vivekanand Hospital ','null','Mini Market, Latur','Latur','uploadphoto/dtyyyyd.jpg'),
 (2,NULL,NULL,'Ram Jadhav','At Takalgaon Tq Renapur Dist Latur','Ophthalmologist','M.D.','Licd112','10/11/1988','878787755','ram@gmail.com','Vivekanand Hospital ','null','Mini Market, Latur','Latur','uploadphoto/Chrysanthemum.jpg'),
 (3,'123','123','Bhimrao Naikwade','Latur11','Ophthalmologist','M.D.','lic1421','10-10-1988','9823778781','bhimraonaikwade@gmail.com','sarthak Hospital','null','Shivaji chouk1','Latur','uploadphoto/Chrysanthemum.jpg');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;


--
-- Definition of table `doctortype`
--

DROP TABLE IF EXISTS `doctortype`;
CREATE TABLE `doctortype` (
  `doctortype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctortype`
--

/*!40000 ALTER TABLE `doctortype` DISABLE KEYS */;
INSERT INTO `doctortype` (`doctortype`) VALUES 
 ('Ophthalmologist'),
 ('Dermatologist'),
 ('Cardiologist'),
 ('Psychiatrist'),
 ('Gastroenterologist'),
 ('Ear-Nose-Throat(ENT)'),
 ('Gynecologist/Obstetrician'),
 ('Neurologist'),
 ('Urologist');
/*!40000 ALTER TABLE `doctortype` ENABLE KEYS */;


--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `feedback` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`id`,`cname`,`email`,`feedback`) VALUES 
 (1,'xsfs','sdfsd@dfgd','sdfsdkf;s');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dean` varchar(50) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `est` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hospitaladdress` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` (`id`,`username`,`password`,`name`,`dean`,`licenseno`,`est`,`mobile`,`email`,`hospitaladdress`,`city`,`web`,`path`) VALUES 
 (15,'vivekanand','123','Vivekanand Hospital','Kukade','Lic1011','1990','9878787845','viv@gmail.com','Mini Market,','Latur','www.vivekananadhospital.com','uploadphoto/Desert.jpg'),
 (16,'Aarti','Aarti','Ajiyankya hospital','Aarti','12','2017','9420847274','kadam80aarti@gmail.com','Nandi stop latur','Latur','www.Ajiyankya@gmail.com','uploadphoto/13325558_246290012416841_4810416035799343571_n.jpg');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;


--
-- Definition of table `hospitalappointment`
--

DROP TABLE IF EXISTS `hospitalappointment`;
CREATE TABLE `hospitalappointment` (
  `oid` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `age` int(4) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `problem` varchar(1000) DEFAULT NULL,
  `mob` varchar(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospitalappointment`
--

/*!40000 ALTER TABLE `hospitalappointment` DISABLE KEYS */;
INSERT INTO `hospitalappointment` (`oid`,`name`,`address`,`age`,`gender`,`problem`,`mob`,`email`,`hospital`,`city`,`status`) VALUES 
 (1,'Dhammanand Sonwane','Latur',28,'Male','headache','7798042438','bhimraonaikwade@gmail.com','Vivekanand Hospital','Latur','Confirmed'),
 (2,'dfsd','jhk',23,'Male','kj','54654654','hk@gmai','jh','kj','Pending'),
 (3,'ll;','lk',56,'Male','kjlkj','654','kjhk@kj','sarthak Hospital','kjhkj','Pending'),
 (4,'dsfsd','dsfsd',21,'Male','sdfsdf','654654','bhimraonaikwade@gmail.com','Vivekanand Hospital','latur','Pending'),
 (5,'raja','nanded',25,'Male','null','9545589566','raja@gmail.com','Suraj Blood Bank','Latur','Pending'),
 (6,'raja','nanded',25,'Male','null','9545589566','raja@gmail.com','Suraj Blood Bank','Latur','Pending'),
 (7,'raja','nanded',25,'Male','null','9545589566','raja@gmail.com','Suraj Blood Bank','Latur','Pending'),
 (8,'raja','nanded',25,'Male','null','9545589566','raja@gmail.com','Suraj Blood Bank','Latur','Pending'),
 (9,'raja','nanded',25,'Male','null','9545589566','raja@gmail.com','Suraj Blood Bank','Latur','Pending'),
 (10,'kamble pratiksha','snmrl',19,'Female','hujh','51654844','kpratiksha@gmail.com','Vivekanand Hospital','','Pending');
/*!40000 ALTER TABLE `hospitalappointment` ENABLE KEYS */;


--
-- Definition of table `hospitalseriveces`
--

DROP TABLE IF EXISTS `hospitalseriveces`;
CREATE TABLE `hospitalseriveces` (
  `name` varchar(255) DEFAULT NULL,
  `hospitalname` varchar(255) DEFAULT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospitalseriveces`
--

/*!40000 ALTER TABLE `hospitalseriveces` DISABLE KEYS */;
INSERT INTO `hospitalseriveces` (`name`,`hospitalname`,`username`) VALUES 
 ('CT-Scan','Vivekanand Hospital ','vivekanand'),
 ('MRI','Vivekanand Hospital ','vivekanand');
/*!40000 ALTER TABLE `hospitalseriveces` ENABLE KEYS */;


--
-- Definition of table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
CREATE TABLE `instruments` (
  `instrument` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `lab` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instruments`
--

/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` (`instrument`,`work`,`lab`) VALUES 
 ('Shugar checker','Chek the shugar','bhim'),
 ('xyz machine','x work','om sai pathology');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;


--
-- Definition of table `pathology`
--

DROP TABLE IF EXISTS `pathology`;
CREATE TABLE `pathology` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pathology`
--

/*!40000 ALTER TABLE `pathology` DISABLE KEYS */;
INSERT INTO `pathology` (`id`,`username`,`password`,`name`,`owner`,`address`,`licenseno`,`mobile`,`email`,`city`,`photo`) VALUES 
 (5,'omsai','123','om sai pathology','suryawanshi a','Near bus stand','plic4154','87845745','sai@gmail.com','Latur','uploadphoto/Hydrangeas.jpg');
/*!40000 ALTER TABLE `pathology` ENABLE KEYS */;


--
-- Definition of table `pathologyappointment`
--

DROP TABLE IF EXISTS `pathologyappointment`;
CREATE TABLE `pathologyappointment` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `problem` varchar(500) DEFAULT NULL,
  `mob` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pathology` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pathologyappointment`
--

/*!40000 ALTER TABLE `pathologyappointment` DISABLE KEYS */;
INSERT INTO `pathologyappointment` (`name`,`address`,`age`,`gender`,`problem`,`mob`,`email`,`pathology`,`city`,`status`,`id`) VALUES 
 ('swami anteshwar','latur',24,'Male','blood test ','878559554','swami@gmail.com','om sai pathology','Latur','Confirmed',1),
 ('xyz','fdgdf',54,'Male','kh','56464','kj@gfdsfs','hkj','fsd','Pending',2);
/*!40000 ALTER TABLE `pathologyappointment` ENABLE KEYS */;


--
-- Definition of table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `test` varchar(255) DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `lab` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` (`test`,`price`,`lab`) VALUES 
 ('Blood','255','bhim'),
 ('null','null','null'),
 ('CBC','150','bhim'),
 ('Blood Test','500','om sai pathology'),
 ('Urine Test','600','om sai pathology');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mob` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` varchar(22) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`username`,`password`,`name`,`mob`,`email`,`age`,`city`) VALUES 
 ('bhim','bhim','bhim','9823739813','bhimraonaikwade@gmail.com','23','Latur');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
