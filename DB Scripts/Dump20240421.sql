CREATE DATABASE  IF NOT EXISTS `weev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `weev`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: weev
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `customerenquiries`
--

DROP TABLE IF EXISTS `customerenquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerenquiries` (
  `CustomerEnquiriesId` int unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerEnquiriesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerenquiries`
--

LOCK TABLES `customerenquiries` WRITE;
/*!40000 ALTER TABLE `customerenquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerenquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twimagedata`
--

DROP TABLE IF EXISTS `twimagedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twimagedata` (
  `Id` int NOT NULL,
  `TW_Ref_ID` int DEFAULT NULL,
  `Path` varchar(255) DEFAULT NULL,
  `Grey1` varchar(50) DEFAULT NULL,
  `Grey2` varchar(50) DEFAULT NULL,
  `White` varchar(50) DEFAULT NULL,
  `Black1` varchar(50) DEFAULT NULL,
  `Black2` varchar(50) DEFAULT NULL,
  `Red` varchar(50) DEFAULT NULL,
  `Blue` varchar(50) DEFAULT NULL,
  `Silver` varchar(50) DEFAULT NULL,
  `Yellow` varchar(50) DEFAULT NULL,
  `Pink` varchar(50) DEFAULT NULL,
  `Green` varchar(100) DEFAULT NULL,
  `Gerua` varchar(50) DEFAULT NULL,
  `Orange` varchar(50) DEFAULT NULL,
  `Bronze` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twimagedata`
--

LOCK TABLES `twimagedata` WRITE;
/*!40000 ALTER TABLE `twimagedata` DISABLE KEYS */;
INSERT INTO `twimagedata` VALUES (1,1,'E:\\2W\\ola\\S1 air','','','ola-S1 air-White','ola-S1 air-Jet Black','','','ola-S1 air-Neo Mint','ola-S1 air-Liquid Silver','','','','','',''),(2,2,'E:\\2W\\ola\\S1 air','ola-S1-Anthracite Grey','','ola-S1-Porcelain White','','','ola-S1-Coral Glam','','','','','','','',''),(3,3,'E:\\2W\\ola\\S1 Pro','ola-S1-Pro-Anthracite Grey','','ola-S1-Pro-Porcelain White','','','ola-S1 Pro-coral Glam','ola-S1 Pro-Midnight Blue','ola-S1 Pro-liquid silver','ola-S1 Pro-Marshmellow','ola-S1 Pro-Millenial Pink','ola-S1 Pro-Khaki- Freedom Edition','ola-S1 Pro-Gerua','',''),(4,4,'E:\\2W\\Ather','Ather-Lunar Grey','Ather-Space Grey','Ather-Still white','Ather-Cosmic Black','','Ather-True Red','','','','','Ather-Salt Green','','',''),(5,5,'E:\\2W\\Ather','Ather-Lunar Grey','Ather-Space Grey','Ather-Still white','Ather-Cosmic Black','','Ather-True Red','','','','','Ather-Salt Green','','',''),(6,6,'E:\\2W\\TVS\\iQube','TVS-iQube-Mercury Grey','TVS-iQube-Titanium Grey','TVS-iQube-Pearl White','','','','TVS-iQube-Mint Blue','','TVS-iQube-Lucid Yellow','','','','','TVS-iQube-Copper bronze'),(7,7,'E:\\2W\\TVS\\EVeium\\CZAR','TVS-Evium-CZAR-Pearl Grey','','TVS-Evium-CZAR-Moonlight White','TVS-Evium-CZAR-Cold Black','TVS-Evium-CZAR-Argent Black','TVS-Evium-CZAR-Satin Red','TVS-Evium-CZAR-Hazy Blue','','TVS-Evium-CZAR-Auroral Yellow','','TVS-Evium-CZAR-Minted Green','','',''),(8,8,'E:\\2W\\TVS\\iQube','','','','','','','','','','','','','',''),(9,9,'E:\\2W\\Revolt','Revolt-Mist Grey','','','Revolt-Comic Black','','Revolt-Rebel Red','','','','','','','',''),(10,10,'E:\\2W\\Bajaj\\Chetak Premium','Bajaj-Chetak Premium-Hazel nut','','','Bajaj-Chetak Premium-Brooklun Black','','','Bajaj-Chetak Premium-Indigo Metallic','','','','','','',''),(11,11,'E:\\2W\\Bajaj\\Chetak Premium 2023','Bajaj-Chetak Premium 2023-Matte Coarse Grey','','','','','','Bajaj-Chetak Premium 2023-Matte Carebbean Blue','','','','','','',''),(12,12,'E:\\2W\\Hero\\Vida','','','Hero -Vida-White','','','Hero -Vida-Red','','','','','','','Hero -Vida-Orange',''),(13,13,'E:\\2W\\Hero\\Vida','','','','','','','','','','','','','',''),(14,14,'E:\\2W\\Simple\\One','','','Simple-one-grace white','Simple-One-brazen black','','Simple-One-azure- namma red','Simple-One-azure- blue','','','','','','',''),(15,15,'E:\\2W\\Simple\\One','','','','','','','','','','','','','',''),(16,16,'E:\\2W\\Torq\\Kartos','','','Torq-Kartos-white','Torq-Kartos-black','','Torq-Kartos-red','Torq-Kartos-blue','','','','','','',''),(17,17,'E:\\2W\\Torq\\Kartos','','','','','','','','','','','','','',''),(18,18,'../../../assets/images/2W/Ampere','Ampere-Magnus EX-Galactic Grey','','Ampere-Magnus EX-Glacial White','Ampere-Magnus EX-Graphite Black','','Ampere-Magnus EX-Metallic Red','Ampere-Magnus EX-Ocean Blue','','','','','','',''),(19,19,'E:\\2W\\Okinawa\\PraisePro','','','','Okinawa-PrasePro-Sparkle Black','','Okinawa-PrasePro-Glosy Red Black','Okinawa-PrasePro-Sparkle Blue','','','','Okinawa-PrasePro-Seafoam Green/Okinawa-PrasePro-Military Green','','Okinawa-PrasePro-Sun Orange','Okinawa-PrasePro-Mocha Brown'),(20,20,'E:\\2W\\Oben\\Rorr','','','','','','Oben-Rorr-Electric Red','','','Oben-Rorr-Voltaic Yellow','','','','',''),(21,21,'E:\\2W\\Kabira Mobility\\KM 4000','','','','','','','','','','','Kabira Mobility-KM 4000-Green','','',''),(22,22,'E:\\2W\\Odysse\\Evoqis','','','Odysse-Evoqis-Magna White','Odysse-Evoqis-Black','','Odysse-Evoqis-Fire Red','Odysse-Evoqis-Cobalt Blue','','','','Odysse-Evoqis-Lime Green','','',''),(23,23,'E:\\2W\\Kabira Mobility\\KM 3000','','','','','','Kabira Mobility-KM 3000-Red','','','','','','','',''),(24,24,'E:\\2W\\Atumobile\\Atum Vader','Atumobile-Atum vader-Grey','','Atumobile-Atum vader-White','Atumobile-Atum vader-Black','','Atumobile-Atum vader-Red','Atumobile-Atum vader-Blue','','','','','','',''),(25,25,'','','','','','','','','','','','','','',''),(26,26,'E:\\2W\\Atumobile\\Atum 1.0','Atumobile-Atum 1.0-Grey','','Atumobile-Atum 1.0-White','Atumobile-Atum 1.0-Black','','Atumobile-Atum 1.0-Red','Atumobile-Atum 1.0-Blue','','','','','','',''),(27,27,'E:\\2W\\Pure\\eTryst 350','','','','Pure-eTryst 350-Punch Black','','Pure-eTryst 350-Tan Red','Pure-eTryst 350-Sea Blue','','','','','','',''),(28,28,'E:\\2W\\Pure\\epluto 7g','Pure-epluto 7g-Active Grey','','Pure-epluto 7g-Pearly White','Pure-epluto 7g-Shadow Black','','Pure-epluto 7g-Ruby Red','Pure-epluto 7g-Electronic Blue','','Pure-epluto 7g-Stripling Yellow','','','','',''),(29,29,'','','','','','','','','','','','','','',''),(30,30,'E:\\2W\\Okinawa\\Okhi 90','Okinawa-Okhi 90-Grey','','Okinawa-Okhi 90-White','','','Okinawa-Okhi 90-Red','Okinawa-Okhi 90-Blue','','','','','','',''),(31,31,'E:\\2W\\Hop\\OXO','Hop-OXO-Twilight Grey','','','Hop-OXO-True Black','','Hop-OXO-Candy Red','Hop-OXO-Magnetic Blue','','Hop-OXO-Electric Yellow','','','','',''),(32,32,'E:\\2W\\Hop\\OXO','','','','','','','','','','','','','',''),(33,33,'E:\\2W\\Ultraviolette\\F77','Ultraviolette-F77-Airstrike','','','Ultraviolette-F77-Shadow','','Ultraviolette-F77-Laser','','','','','','','',''),(34,34,'E:\\2W\\Ultraviolette\\F77','','','','','','','','','','','','','',''),(35,35,'E:\\2W\\Ultraviolette\\F77 Limited','','','','','','','','','','','','','',''),(36,36,'E:\\2W\\Okinawa\\Okinava-iPraise+','Okinava-iPraise+ -Liquid Metal','','','Okinava-iPraise+ -Black','','Okinava-iPraise+ -Red','Okinava-iPraise+ -Ocean Blue','','','','Okinava-iPraise+ -Electric Green','','',''),(37,37,'E:\\2W\\Okaya\\Faast F4','Okaya-FaastF4-Metallic Grey','','Okaya-FaastF4-Metallic White','Okaya-FaastF4-Metallic Black','','Okaya-FaastF4-Mettalic Red','Okaya-FaastF4-metallic Cyan','Okaya-FaastF4-Metallic Silver','','','Okaya-FaastF4-Matte Green','','',''),(38,38,'E:\\2W\\One Electric\\Kridn','','','','','','One Electric-Kridin-Red','','','','','','','',''),(39,39,'E:\\2W\\Rowwet\\Trono','Rowwet-Trono-Grey','','','','','','','','','','','','',''),(40,40,'E:\\2W\\River\\Indie','','','','','','River-Indie-Summer Red','River-Indie-Monsoon Blue','','River-Indie-Spring Yellow','','','','',''),(41,41,'E:\\2W\\Komaki\\Ranger','','','','','','','','','','','','','',''),(42,42,'','','','','','','','','','','','','','',''),(43,43,'E:\\2W\\Bounce','Bounce-Infinity E1-Comet Grey','','Bounce-Infinity E1-Pearl White','Bounce-Infinity E1-Sparkle Black','','Bounce-Infinity E1-Sporty Red','','Bounce-Infinity E1-Desat Silver','','','','','',''),(44,44,'E:\\2W\\Bounce','Bounce-Infinity E1-Comet Grey','','Bounce-Infinity E1-Pearl White','Bounce-Infinity E1-Sparkle Black','','Bounce-Infinity E1-Sporty Red','','Bounce-Infinity E1-Desat Silver','','','','','',''),(45,45,'E:\\2W\\Bounce','Bounce-Infinity E1-Comet Grey','','Bounce-Infinity E1-Pearl White','Bounce-Infinity E1-Sparkle Black','','Bounce-Infinity E1-Sporty Red','','Bounce-Infinity E1-Desat Silver','','','','','',''),(46,46,'E:\\2W\\Bounce','Bounce-Infinity E1-Comet Grey','','Bounce-Infinity E1-Pearl White','Bounce-Infinity E1-Sparkle Black','','Bounce-Infinity E1-Sporty Red','','Bounce-Infinity E1-Desat Silver','','','','','','');
/*!40000 ALTER TABLE `twimagedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twowheelerdata`
--

DROP TABLE IF EXISTS `twowheelerdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twowheelerdata` (
  `TWId` int NOT NULL AUTO_INCREMENT,
  `Manufacturer` text,
  `Model` text,
  `Variant` text,
  `VariantType` text,
  `ExShowroomPrice` int DEFAULT NULL,
  `MaxSpeed` int DEFAULT NULL,
  `ChargingTime` int DEFAULT NULL,
  `ConditionOfVehicle` text,
  `Accelration0To60kmph` decimal(10,3) DEFAULT NULL,
  `Accelration0To40kmph` decimal(10,3) DEFAULT NULL,
  `Category` text,
  `Available` text,
  `OfflineOROnline` text,
  `BookingSite` text,
  `BookingPrice` int DEFAULT NULL,
  `ContinuousPower` decimal(10,3) DEFAULT NULL,
  `MotorPower` decimal(10,3) DEFAULT NULL,
  `RangeOfVehicle` int DEFAULT NULL,
  `BatteryType` text,
  `BatteryCapacity` decimal(10,3) DEFAULT NULL,
  `ChargingTime0To80Perc` int DEFAULT NULL,
  `ChargingTime0To100Perc` int DEFAULT NULL,
  `ChargingAtHome` text,
  `NoOfBatteries` int DEFAULT NULL,
  `SwappableBattery` text,
  `InstrumentConsole` text,
  `BluetoothConnectivity` text,
  `Navigation` text,
  `GeoFencing` text,
  `AntiTheftAlarm` text,
  `USBChargingPort` text,
  `UnderseatStorage` int DEFAULT NULL,
  `DistanceToEmptyIndicator` text,
  `ChargerOutputMin` decimal(10,3) DEFAULT NULL,
  `ChargerOutputMax` decimal(10,3) DEFAULT NULL,
  `ChargingPoint` text,
  `FastCharging` text,
  `FastChargingTimeUpto80Perc` text,
  `RidingModes` text,
  `AdditionalFeatures` varchar(10000) DEFAULT NULL,
  `CallORSMSAlerts` text,
  `MusicControl` text,
  `CentralLocking` text,
  `CruiseControl` text,
  `ExternalSpeakers` text,
  `Speedometer` text,
  `Tripmeter` text,
  `Odometer` text,
  `CarryHook` text,
  `ArtificialExhaustSoundSystem` text,
  `InternetConnectivity` text,
  `OperatingSystem` text,
  `Processor` text,
  `MobileApplication` text,
  `ChargingStationLocater` text,
  `Gradeability` int DEFAULT NULL,
  `Clock` text,
  `LowBatteryIndicator` text,
  `BodyType` text,
  `DimensionsAndCapacity` text,
  `BootSpace` text,
  `Width` int DEFAULT NULL,
  `Length` int DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `SaddleHeight` int DEFAULT NULL,
  `GroundClearance` int DEFAULT NULL,
  `Wheelbase` int DEFAULT NULL,
  `KerbWeight` decimal(10,3) DEFAULT NULL,
  `LoadCarryingCapacity` int DEFAULT NULL,
  `TurnSignalLamp` text,
  `DRLs` text,
  `TopSpeed` int DEFAULT NULL,
  `MotorType` text,
  `MotorWarrantyForMonths` int DEFAULT NULL,
  `MotorWarrantyForKm` int DEFAULT NULL,
  `DriveType` text,
  `BatteryWarrantyForMonths` int DEFAULT NULL,
  `BatteryWarrantyForKm` int DEFAULT NULL,
  `WaterProofRating` text,
  `SuspensionFront` text,
  `SuspensionRear` text,
  `BrakesFront` text,
  `BrakesRear` text,
  `TyreSize` text,
  `WheelSize` text,
  `WheelsType` text,
  `OurRating` int DEFAULT NULL,
  PRIMARY KEY (`TWId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twowheelerdata`
--

LOCK TABLES `twowheelerdata` WRITE;
/*!40000 ALTER TABLE `twowheelerdata` DISABLE KEYS */;
INSERT INTO `twowheelerdata` VALUES (1,'Ola','S1 Air','','',79999,85,270,'',0.000,0.000,'High Speed','Yes','Online','website',0,4.500,4.500,101,'',2.500,0,0,'',0,'','Digital','Bluetooth,WiFi','Yes','Yes','Yes','',34,'',0.000,0.000,'Yes','Yes','0','Yes','Drive Modes - Normal | Sports | Eco, LTE Connectivity','Yes','Yes','','','Yes','Digital','Digital','','','','Yes','MoveOS 2','','Yes','',15,'Yes','Yes','Electric Bikes','','Yes',712,1859,1160,792,165,1359,99.000,0,'LED','',90,'Mid Drive IPM',0,0,'Belt Drive',0,0,'IP67','Telescopic Fork','Twin Suspension','Drum','Drum','Front :- 110/70-12, Rear :- 110/70-12','Front :-304.8 mm,Rear :-304.8 mm','Aluminium Alloy',4),(2,'Ola','S1','','Base',99999,95,300,'',5.900,0.000,'High Speed','Yes','Online','website',0,5.500,8.500,141,'',3.000,0,0,'',0,'','Digital','Bluetooth,WiFi','Yes','Yes','Yes','',36,'',0.750,0.000,'Yes','Yes','0','Yes','Drive Modes - Normal | Sports | Eco, Charger Capacity - 750 W, Seat Length - 738 mm, Remote Boot Lock, Predictive Maintenance, Key Sharing, 3 GB RAM, LTE Connectivity','Yes','Yes','','','Yes','Digital','Digital','','','','Yes','MoveOS 2','','Yes','',15,'Yes','Yes','Electric Bikes','','Yes',712,1859,1160,792,165,1359,121.000,0,'LED','',95,'Mid Drive IPM',0,0,'Belt Drive',0,0,'IP67','Single Fork','Mono Shock','Disc','Disc','Front :- 110/70-12, Rear :- 110/70-12','Front :-304.8 mm,Rear :-304.8 mm','Aluminium Alloy',4),(3,'Ola','S1 Pro','','Top',139999,116,390,'',4.500,0.000,'High Speed','Yes','Online','website',0,5.500,8.500,170,'',4.000,0,0,'',0,'','Digital','Bluetooth,WiFi','Yes','Yes','Yes','',36,'',0.750,0.000,'Yes','Yes','0','Yes','Drive Modes - Normal | Sports | Hyper | Eco, Seat Length - 738 mm, Remote Boot Lock, Predictive Maintenance, Key Sharing, 3 GB RAM, LTE Connectivity','Yes','Yes','','Yes','Yes','Digital','Digital','','','','Yes','MoveOS 2','2.2 GHZ 8-Core','Yes','',15,'Yes','Yes','Electric Bikes','','NA',712,1859,1160,792,165,1359,125.000,0,'LED','',116,'Mid Drive IPM',0,0,'Belt Drive',0,0,'IP67','Single Fork','Mono Shock','Disc','Disc','Front :- 110/70-12, Rear :- 110/70-12','Front :-304.8 mm,Rear :-304.8 mm','Aluminium Alloy',4),(4,'Ather','450X','','Base',171932,80,270,'',0.000,0.000,'High Speed','Yes','Online','website',0,3.300,6.200,105,'Lithium-ion',3.700,270,340,'',0,'','NA','Bluetooth,WiFi','Yes','NA','NA','',22,'',0.000,0.000,'Yes','Yes','0','Yes','Top Speed (Display) - 90 km/charge, Warp Range - 65 km/charge, Riding Modes - Warp | Sport | Ride | Eco | Smart Eco, IP Rating (Controller) - IP65, Usable Battery Capacity - 3.24h, Transmission Ratio - 7.8:1, Side Stand Motor cut-off, Water wading limit - 300 mm, ROM - 16 GB, RAM - 2 GB, Resolution - 800 X 480 Pixels, Brightness - 800 Nits, Aspect Ratio - 5:3, Themes, Positioning System - GNSS with AGPSM, 4G LTE, Auto Indicator Off, Guide Me Home Light, On Board Maps, Document Storage, Ride Statics, Remote Location Tracking, Remote Charge Monitoring','Yes','Yes','','NA','NA','Digital','Digital','','','','Yes','Android OS','Snapdragon 212','Yes','',20,'Yes','Yes','Electric Bikes','','NA',734,1837,1250,780,153,1295,111.600,0,'LED','',80,'PMSM',0,0,'Belt Drive',36,0,'IP67','Telescopic forks','Symmetrically mounted progressive monoshock','Disc','Disc','Front :-90/90-12, Rear :-100/80-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(5,'Ather','450X','With Pro Pack','Top',202243,80,270,'',0.000,0.000,'High Speed','Yes','Online','website',0,3.300,5.400,75,'Lithium-ion',3.700,270,340,'NA',0,'','NA','WiFi','Yes','NA','NA','NA',22,'NA',0.000,0.000,'Yes','Yes','0','Yes','Top Speed (Display) - 90 km/charge, Riding Modes - Sport | Ride | Eco | Smart Eco, IP Rating (Controller) - IP65, Usable Battery Capacity - 2.6h, Transmission Ratio - 7.8:1, Side Stand Motor cut-off, Water wading limit - 300 mm, ROM - 16 GB, RAM - 2 GB, Resolution - 800 X 480 Pixels, Brightness - 800 Nits, Aspect Ratio - 5:3, Themes, Positioning System - GNSS with AGPSM, 4G LTE, Auto Indicator Off, Guide Me Home Light, On Board Maps, Document Storage, Ride Statics, Remote Location Tracking, Remote Charge Monitoring','NA','NA','','NA','NA','Digital','Digital','NA','NA','','Yes','Android OS','Snapdragon 212','Yes','NA',18,'Yes','Yes','Electric Bikes','','NA',734,1837,1250,780,153,1295,111.600,0,'LED','NA',80,'PMSM',0,0,'Belt Drive',36,0,'IP67','Telescopic forks','Symmetrically mounted progressive monoshock','Disc','Disc','Front :-90/90-12, Rear :-100/80-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(6,'TVS','iQube','STD','Base',159103,78,270,'',0.000,0.000,'High Speed','Yes','Both','website',0,3.000,4.400,100,'Lithium Ion',3.040,270,0,'Yes',0,'','Digital','Bluetooth','Yes','Yes','Yes','Yes',17,'Yes',0.650,0.950,'Yes','Yes','170','Yes','Number Plate Lamp, Parking Assist, Live Location Status, Crash & Fall Alert, GSM Connectivity, Parking Brake Lever, BMS-Controlled Protection System, Spike Proctection, Resolution - 800 X 480 PPI, Brightness - 1000 LUX Dark Mode, Flip Key with LED Light, Riding Modes - Eco | Power, Hazard Lamp, Cluster Themes','Yes','NA','','NA','Yes','Digital','Digital','','Yes','','NA','NA','NA','Yes','',10,'Yes','Yes','Electric Bikes','','Yes',645,1805,1140,770,157,1301,117.200,0,'LED','Yes',78,'BLDC',0,0,'Hub Motor',0,0,'IP67 (Battery)','Telescopic','Hydraulic twin tube shock absorber','Disc','Drum','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(7,'TVS','iQube','S','Mid',160938,78,270,'',0.000,0.000,'High Speed','Yes','Both','website',0,3.000,4.400,100,'Lithium Ion',3.040,270,0,'Yes',0,'','Digital','Bluetooth','Yes','Yes','Yes','Yes',17,'Yes',0.650,0.950,'Yes','Yes','170','Yes','Number Plate Lamp, Parking Assist, Live Location Status, Crash & Fall Alert, GSM Connectivity, Parking Brake Lever, BMS-Controlled Protection System, Spike Proctection, Resolution - 800 X 480 PPI, Brightness - 1000 LUX Dark Mode | Iincognito Mode, Flip Key with LED Light, Riding Modes - Eco | Power, Hazard Lamp, Cluster Themes, HMI, Document Storage','Yes','Yes','','NA','Yes','Digital','Digital','','Yes','','NA','NA','NA','Yes','',10,'Yes','Yes','Electric Bikes','','Yes',645,1805,1140,770,157,1301,118.800,0,'LED','Yes',78,'BLDC',0,0,'Hub Motor',0,0,'IP67 (Battery)','Telescopic','Adjustable Hydraulic Twin Tube Shock Absorber','Disc','Drum','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(8,'TVS','iQube','ST','Top',0,82,270,'',0.000,0.000,'High Speed','No','Both','website',0,3.000,4.400,145,'Lithium Ion',4.560,276,0,'Yes',0,'','Digital','Bluetooth','Yes','Yes','Yes','Yes',17,'Yes',1.500,0.950,'Yes','Yes','170','Yes','Number Plate Lamp, Parking Assist, Live Location Status, Crash & Fall Alert, GSM Connectivity, Parking Brake Lever, BMS-Controlled Protection System, Spike Proctection, Resolution - 800 X 480 PPI, Brightness - 1000 LUX Dark Mode | Iincognito Mode, Flip Key with LED Light, Riding Modes - Eco | Power, Hazard Lamp, Cluster Themes, HMI, Document Storage','Yes','Yes','','NA','Yes','Digital','Digital','','Front & Rear','','NA','NA','NA','Yes','',10,'Yes','Yes','Electric Bikes','','Yes',645,1805,1140,770,157,1301,128.000,0,'LED','Yes',82,'BLDC',0,0,'Hub Motor',0,0,'IP67 (Battery)','Telescopic','Adjustable Hydraulic Twin Tube Shock Absorber','Disc','Drum','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(9,'Revolt','RV400','STD','',124999,85,270,'',0.000,0.000,'High Speed','Yes','Online','website',0,3.000,3.000,150,'Lithium-Ion',3.240,180,270,'NA',0,'','Digital','Bluetooth,WiFi','Yes','Yes','NA','NA',0,'NA',0.000,0.000,'Yes','Yes','0','Yes','Ambient Light Sensor, Battery Status, Parking Signal, Locate my motorcycle','NA','NA','','NA','Yes','Digital','Digital','','NA','','Yes','NA','NA','Yes','',0,'Yes','Yes','Electric Bikes','','NA',0,0,0,814,215,1350,108.000,0,'LED','Yes',85,'Mid Drive',0,0,'Belt Drive',0,0,'NA','Upside Down Forks','Monoshock(Adjustable)','Disc','Disc','Front 90/80-17, Rear 120/80-17','Front :-431.8 mm,Rear :-431.8 mm','Alloy',4),(10,'Bajaj','Chetak','Premium','',121429,63,300,'',0.000,0.000,'High Speed','Yes','Both','website',0,3.800,4.800,90,'Lithium Ion',3.000,0,0,'NA',0,'','NA','Bluetooth','NA','Yes','NA','Yes',18,'NA',0.000,0.000,'Yes','Yes','0','Yes','Tamper Alert, Locate your Chetak','NA','NA','','NA','NA','Digital','Digital','','Yes','','Yes','NA','NA','Yes','',0,'Yes','Yes','Electric Bikes','','NA',0,0,0,0,0,0,132.000,0,'LED','Yes',63,'BLDC',0,0,'Hub Motor',36,50000,'IP67','Leading-link Suspension','Monoshock','Disc','Drum','Front :-90/90-12 Rear :-90/100-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(11,'Bajaj','Chetak','Premium 2023','',150934,63,300,'',0.000,0.000,'High Speed','Yes','Both','website',0,4.000,4.200,90,'Lithium Ion',3.000,165,240,'No',0,'','Digital','Bluetooth','NA','Yes','NA','Yes',18,'NA',0.000,0.000,'Yes','NA','0','Yes','Glove Box 4 L, Touch Sensitive Switches, Charging Time (0 - 25%) - 0.75 Hours, Auxiliary Battery - 12 V / 3 Ah, Continous Torque - 10 Nm','NA','NA','NA','NA','NA','Digital','Digital','Digital','Yes','NA','Yes','NA','NA','Yes','NA',25,'Yes','Yes','Electric Bikes','','NA',725,1890,0,760,160,1330,133.000,0,'LED','Yes',63,'BLDC',0,0,'Hub Motor',36,50000,'67','Single Sided Leading Link','Offset Mono Shock','Disc','Drum','Front :-90/90-12 Rear :-90/100-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(12,'Hero','Vida','Plus','Base',1199400,80,309,'',0.000,3.400,'High Speed','Yes','Online','site',499,3.900,6.000,143,'NA',3.440,309,0,'NA',2,'','Digital','Bluetooth,WiFi','Yes','Yes','Yes','Yes',26,'NA',0.000,0.000,'Yes','Yes','65','Yes','Document Storage, Parking Assistance, Emergency Alert, Follow me headlamp, Riding Modes - Eco | Ride | Sports | Custom, Vida Cloud, 4g Connectivity, Track My Bike, Remote Immobilisation, SOS Alert and Button','Yes','Yes','','Yes','NA','Digital','Digital','Digital','NA','','Yes','NA','NA','Yes','Yes',20,'Digital','Yes','Electric Bikes','','NA',0,0,0,0,0,0,0.000,0,'LED','NA',80,'NA',0,0,'Hub Motor',36,30000,'IP67 ( Battery )','NA','NA','Disc','Drum','NA','NA','Alloy',4),(13,'Hero','Vida','Pro','Top',139900,80,333,'',0.000,3.200,'High Speed','Yes','Online','site',499,3.900,6.000,165,'NA',3.940,333,0,'NA',2,'','Digital','Bluetooth,WiFi','Yes','Yes','Yes','Yes',26,'NA',0.000,0.000,'Yes','Yes','65','Yes','Document Storage, Parking Assistance, Emergency Alert, Follow me headlamp, Riding Modes - Eco | Ride | Sports | Custom, Vida Cloud, 4g Connectivity, Track My Bike, Remote Immobilisation, SOS Alert and Button','Yes','Yes','','Yes','NA','Digital','Digital','Digital','NA','','Yes','NA','NA','Yes','Yes',20,'Digital','Yes','Electric Bikes','','NA',0,0,0,0,0,0,0.000,0,'LED','NA',80,'NA',0,0,'Hub Motor',36,30000,'IP67 ( Battery )','NA','NA','Disc','Drum','NA','NA','Alloy',4),(14,'Simple','One','STD','Base',109999,105,90,'',0.000,0.000,'High Speed','Yes','Online','site',1947,4.500,8.500,203,'Lithium Ion',4.800,0,0,'Yes',1,'Yes','NA','Bluetooth,WiFi','Yes','Yes','NA','NA',30,'NA',0.000,0.000,'Yes','Yes','0','Yes','Dark Mode On Display, Remote access, Ride statistics, Save and forward routes','Yes','Yes','','NA','NA','Digital','Digital','NA','NA','','Yes','Android OS','NA','Yes','NA',20,'Yes','Yes','Electric Bikes','','NA',0,0,0,0,0,0,110.000,0,'LED','NA',105,'NA',0,0,'Chain Drive',0,0,'NA','Telescopic Fork','Mono Tube - Mono Shock','Disc','Disc','Front :- 110/80-12, Rear :- 110/80-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(15,'Simple','One','Extra Range','Top',144999,105,90,'',0.000,0.000,'High Speed','Yes','Online','site',1947,4.500,8.500,0,'Lithium Ion',6.400,0,0,'Yes',2,'Yes','NA','Bluetooth,WiFi','Yes','Yes','NA','NA',30,'NA',0.000,0.000,'Yes','Yes','0','Yes','Dark Mode On Display, Remote access, Ride statistics, Save and forward routes','Yes','Yes','','NA','NA','Digital','Digital','NA','NA','','Yes','Android OS','NA','Yes','NA',20,'Yes','Yes','Electric Bikes','','NA',0,0,0,0,0,0,110.000,0,'LED','NA',105,'NA',0,0,'Chain Drive',0,0,'NA','Telescopic Fork','Mono Tube - Mono Shock','Disc','Disc','Front :- 110/80-12, Rear :- 110/80-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(16,'Tork','Kratos','STD','Base',122499,100,270,'',0.000,0.000,'High Speed','Yes','Online','site',2999,4.000,7.500,120,'NA',4.000,0,0,'NA',0,'NA','Digital','WiFi','Yes','NA','Yes','Yes',0,'NA',0.750,0.000,'Yes','NA','0','Yes','Active Throttle Control, Front storage box, Hazard Lights, Safe home feature, Remote Charge Status, Crash alert, Ride Analytics, Guide me Home Lights, Vacation Mode, Riding Modes - Eco | City | Sports | Reverse, Reverse Speed - 5 kmph','NA','NA','','NA','NA','Digital','Digital','NA','NA','','Yes','TIROS','NA','Yes','NA',14,'Digital','Yes','Electric Bikes','','NA',0,1960,0,785,165,1336,140.000,0,'LED','Yes',100,'PMAC',0,0,'Mid Drive Electric Motor',36,0,'NA','Hydraulic Telescopic','Mono shock Hydraulic','Disc','Disc','Front :-90/80-17, Rear :-120/80-17','Front :-431.8 mm, Rear :-431.8 mm','Alloy',4),(17,'Tork','Kratos','R','Top',137499,105,270,'',0.000,0.000,'High Speed','Yes','Online','site',2999,4.500,9.000,120,'NA',4.000,0,0,'NA',0,'NA','Digital','WiFi','Yes','Yes','Yes','Yes',0,'NA',0.750,0.000,'Yes','Yes','0','Yes','Active Throttle Control, Front storage box, Hazard Lights, Safe home feature, Remote Charge Status, Crash alert, Ride Analytics, Guide me Home Lights, Vacation Mode, Riding Modes - Eco | City | Sports | Reverse, Motor Walk Assist, Track Mode, Track mode analytics, Smart Analytics, Reverse Speed - 5 kmph','NA','NA','','NA','NA','Digital','Digital','NA','NA','','Yes','TIROS','NA','Yes','NA',16,'Digital','Yes','Electric Bikes','','NA',0,1960,0,785,165,1336,140.000,0,'LED','Yes',105,'PMAC',0,0,'Mid Drive Electric Motor',36,0,'NA','Hydraulic Telescopic','Mono shock Hydraulic','Disc','Disc','Front :-90/80-17, Rear :-120/80-17','Front :-431.8 mm, Rear :-431.8 mm','Alloy',4),(18,'Ampere','Magnus EX','','Base',77249,50,390,'',0.000,0.000,'High Speed','Yes','Both','site',0,0.000,2.100,83,'Lithium Ion',2.300,0,0,'NA',0,'NA','NA','NA','NA','NA','Yes','NA',0,'NA',0.450,0.000,'NA','NA','0','NA','Front Glove Box','NA','NA','','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','NA','NA',13,'NA','NA','Electric Bikes','','Yes',685,1920,1120,0,147,1390,82.000,150,'LED','NA',50,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic','Coil Spring','Drum','Drum','NA','Front :-254 mm,Rear :-254 mm','Alloy',3),(19,'Okinawa','PraisePro','','',87593,58,150,'',0.000,0.000,'High Speed','Yes','Online','site',0,1.000,2.500,0,'Lithium Ion',2.000,0,0,'NA',0,'NA','Digital','NA','NA','NA','Yes','NA',0,'NA',0.000,0.000,'Yes','NA','0','NA','E-ABS, Micro- Charger with Auto Cut Function, ARAI/ICAT Approved, Road Side Assistance, Brake Lever - CNC Machined with Lever Adjustment','NA','NA','Yes','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','NA','NA',7,'NA','Yes','Electric Bikes','','Yes',745,1970,1165,800,175,0,0.000,150,'LED','Yes',58,'BLDC',36,30000,'Hub Motor',36,0,'NA','Hydraulic Telescopic','Double shocker with dual tube technology','Disc','Disc','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',3),(20,'Oben','Rorr','','',102999,100,120,'',0.000,0.000,'High Speed','Yes','Online','site',0,0.000,1.000,0,'NA',4.400,0,0,'NA',0,'NA','NA','Bluetooth,WiFi','NA','NA','Yes','NA',0,'NA',0.000,0.000,'Yes','Yes','0','Yes','GPS, MHX (Maximum Heat Exchanging), Driver Alert System, IoT-led Gamification','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','Yes','NA',0,'Digital','Yes','Electric Bikes','','NA',0,0,0,0,230,0,0.000,0,'LED','NA',100,'IPMSM Motor',36,0,'Belt Drive',36,0,'IP67','NA','NA','Disc','Disc','NA','NA','Alloy',4),(21,'Kabira Mobility','KM 4000','','',0,150,150,'up to 80%',0.000,0.000,'High Speed','Coming Soon','','',0,8.000,5.000,150,'Lithium ion',4.400,150,390,'No',0,'NA','Digital','NA','NA','NA','NA','NA',0,'NA',0.000,0.000,'Yes','Yes','50','NA','NA','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','Yes','NA',19,'Yes','NA','Electric Bikes','','NA',740,2050,1280,800,200,1500,0.000,0,'LED','NA',120,'BLDC',0,0,'Hub Motor',0,0,'IP65','NA','NA','Double Disc','Disc','NA','NA','Alloy',4),(22,'Odysse','Evoqis','','',171250,80,360,'',0.000,0.000,'High Speed','Yes','Both','site',0,4.300,3.000,140,'Lithium-Ion',4.320,0,0,'NA',0,'NA','Digital','NA','NA','NA','Yes','NA',0,'NA',0.000,0.000,'Yes','NA','0','NA','Drive Modes - City | Parking | Sports | Reverse, Motor cut-off switch','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','NA','NA',0,'Yes','Yes','Electric Bikes','','NA',740,2060,1150,750,170,1410,0.000,170,'LED','NA',80,'NA',0,0,'NA',0,0,'NA','Telescopic','Spring Suspension','Disc','Disc','Front :-110/70-17, Rear :- 140/70-17','Front :-431.8 mm,Rear :-431.8 mm','Alloy',4),(23,'Kabira Mobility','KM 3000','','',165690,0,378,'',0.000,0.000,'High Speed','Yes','Both','site',0,6.000,3.500,120,'Lithium Ion',4.000,150,390,'No',0,'NA','Digital','NA','NA','NA','NA','NA',0,'NA',0.000,0.000,'Yes','Yes','50','NA','NA','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','Yes','NA',19,'Yes','NA','Electric Bikes','','NA',760,2100,1200,830,170,1430,112.000,100,'LED','NA',100,'BLDC',0,0,'Hub Motor',0,0,'IP65','Spring Loaded Hydraulic','NA','Disc','Disc','NA','NA','Alloy',4),(24,'Atumobile','Atum Vader','','',99999,65,198,'',0.000,0.000,'High Speed','Yes','','site',0,0.000,2.700,100,'Lithium Ion',2.300,0,0,'NA',0,'Yes','NA','NA','NA','NA','NA','NA',25,'NA',1.400,0.000,'Yes','NA','0','Yes','Speed Modes - (3 - L,M,H ), Kill Switch, Combination Switch, Brake Lever cut-off Switch, Charger cut-off sensor','NA','NA','NA','NA','NA','Digital','Digital','Digital','NA','','NA','NA','NA','NA','NA',7,'NA','Yes','Electric Bikes, Cafe Racer Bikes','','NA',700,2020,1030,809,230,1350,100.000,0,'LED','NA',65,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic, 31mm Conventional Fork','Twin Shock Aborber, Gas Filled With Canister','Drum','Drum','Front :-100/90-17 Rear :-100/90-17','Front :-431.8 mm,Rear :-431.8 mm','Spoke',4),(25,'Benling','Believe','','',97520,75,0,'',0.000,0.000,'High Speed','No','','',0,3.000,3.200,120,'Lithium-Ion',3.200,0,0,'NA',0,'Yes','Digital','NA','NA','NA','Yes','Yes',0,'NA',0.000,0.000,'NA','NA','0','Yes','Parking Assist, Smart Break Down Assist','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','NA','NA',18,'NA','NA','Electric Bikes','','NA',690,1800,1140,0,160,1420,0.000,248,'LED','NA',75,'BLDC',0,0,'NA',36,50000,'NA','Telescopic','Telescopic','Disc','Disc','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',3),(26,'Atumobile','Atum 1.0','','',59999,25,192,'',0.000,0.000,'Ristricted Speed','','Online','site',1019,0.000,2.500,0,'Lithium Ion',1.248,0,0,'NA',0,'Yes','Digital','NA','NA','NA','NA','NA',14,'NA',0.336,0.000,'NA','NA','0','NA','Charger Warranty - 1 Year','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','','NA','NA','NA','NA','NA',0,'NA','NA','Electric Bikes','','NA',0,0,0,750,280,0,51.000,0,'LED','NA',25,'NA',12,0,'Hub Motor',24,0,'NA','NA','NA','Disc','Disc','Front :-4.00-20, Rear :-4.00-20','Front :-508 mm,Rear :-508 mm','Spoke',4),(27,'Pure EV','eTryst 350','','',154999,85,360,'',0.000,0.000,'High Speed','Enquiry only','','',0,3.000,4.000,140,'Lithium Ion',3.500,0,0,'NA',0,'NA','NA','NA','NA','NA','NA','NA',0,'NA',0.672,0.000,'NA','NA','0','Yes','Ride Mode - Drive 60 kmph | Cross Over 75 kmph | Thrill 85 kmph, Controller - 72 V 4 Vector Looped, BMS - Active Balance 100 A','NA','NA','Yes','NA','NA','Digital','Digital','Digital','NA','','NA','NA','NA','NA','NA',16,'Yes','NA','Electric Bikes','','NA',0,2040,0,770,180,1375,120.000,150,'LED','Yes',85,'BLDC',0,0,'Hub Motor',0,0,'NA','Hydraulic Dual Suspension','Hydraulic Dual Suspension','Disc','Disc','Front :-2.75-18, Rear :-3.00-17','Front :-457.2 mm,Rear :-431.8 mm','Alloy',3),(28,'Pure EV','Epluto 7G','','',92999,60,240,'',0.000,0.000,'High Speed','Enquiry only','','',0,1.500,2.200,123,'Lithium Ion',2.500,0,0,'NA',0,'Yes','Digital','NA','NA','NA','Yes','NA',0,'NA',0.806,0.000,'Yes','NA','0','NA','Anti-theft Smart Lock, Controller - 60V 20 Tube Vector Looped, Battery Casing - Metallic, Cells - NMC 18650 3C Ultra Performance, BMS - Smart Active Balance 50A, Twist Throttle, Reflector, Left and Right Blinkers, Ladies Footrest','NA','NA','NA','NA','NA','Digital','Digital','Digital','NA','','NA','NA','NA','NA','NA',12,'NA','Yes','Electric Bikes','','NA',0,0,0,0,0,0,79.000,180,'LED','NA',60,'BLDC',0,0,'Hub motor',0,0,'NA','NA','NA','Disc','Drum','Front :-90/100-10 Rear :-3.00-10','Front :-254 mm,Rear :-254 mm','Alloy',3),(29,'Pure EV','Neo Etrance','','',87999,60,240,'',0.000,0.000,'High Speed','Enquiry only','','',0,0.000,2.200,120,'Lithium-ion',2.500,0,0,'NA',0,'NA','NA','NA','NA','NA','NA','NA',0,'NA',0.000,0.000,'Yes','NA','0','NA','Regenerative Braking, Reflector, Blinkers','NA','NA','NA','NA','NA','Digital','NA','NA','NA','','NA','NA','NA','NA','NA',12,'NA','Yes','Electric Bikes','','NA',0,0,0,0,0,0,0.000,150,'LED','NA',60,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic','NA','Disc','Drum','Front :-: 90/100-10, Rear :-3.00-10','Front :-254 mm,Rear :-254 mm','Cast Alloy',3),(30,'Okinawa','Okhi90','','',186006,90,330,'',0.000,0.000,'','','','',500,0.000,3.800,160,'Lithium Ion ( Detachable Battery )',3.600,60,0,'NA',0,'NA','Digital','Bluetooth,WiFi','Yes','NA','Yes','Yes',40,'NA',0.000,0.000,'Yes','NA','0','NA','E-ABS, Brake Lever - Aluminium Lever, Outer Appearance- Garnish – Chrome Plated, Parking Mode, Real-Time Asset Tracking, Find my device, Driver Behavior, Micro Charger with Auto Cut, ICAT/ARAI Approved - Yes','Yes','NA','NA','NA','NA','Digital','Digital','Digital','NA','','Yes','NA','NA','Yes','NA',12,'Yes','Yes','Electric Bikes','','Yes',710,2220,1160,900,175,1520,0.000,250,'LED','Yes',90,'NA',0,0,'Hub Motor',0,0,'NA','Hydraulic Telescopic','Double shocker with dual tube technology','Disc','Disc','Front :-100/80-16 Rear :-120/80','Front :-406.4 mm,Rear :-','Alloy',3),(31,'Hop','Exo','','Base',147024,90,0,'',0.000,0.000,'High speed','Yes','Online','Site',999,3.000,5.200,135,'Lithium-ion',3.750,240,300,'NA',0,'NA','Digital','Bluetooth','Yes','NA','Yes','Yes',0,'NA',0.850,0.000,'Yes','Yes','0','Yes','Riding Mode - Eco | Power | Sports, E-ABS, Park Assist, Helmet reminder','NA','NA','NA','NA','NA','Digital','Digital','Digital','NA','','NA','NA','NA','NA','NA',15,'Yes','Yes','Electric Bikes','','NA',793,2100,1065,780,180,0,140.000,250,'LED','Yes',90,'BLDC Hub motor',36,0,'Hub Motor',48,50000,'IP 67','Upright Telescopic Forks','Hydraulic spring loaded shock absorber','Disc','Disc','Front :-90/90-18 Rear :-130/70-17','Front :-457.2 mm,Rear :-431.8 mm','Alloy',4),(32,'Hop','Exo','Pro','Top',149024,0,0,'',0.000,0.000,'High speed','Yes','Online','Site',999,3.000,5.200,150,'Lithium-ion',3.750,240,300,'NA',0,'NA','Digital','Bluetooth','Yes','NA','Yes','Yes',0,'NA',0.850,0.000,'Yes','Yes','0','Yes','Riding Mode - Eco | Power | Sports, E-ABS, Park Assist, Helmet reminder','NA','NA','NA','NA','NA','Digital','Digital','Digital','NA','','NA','NA','NA','NA','NA',18,'Yes','Yes','Electric Bikes','','NA',793,2100,1065,780,180,0,140.000,250,'LED','Yes',90,'BLDC Hub motor',36,0,'Hub Motor',48,50000,'IP 67','Upright Telescopic Forks','Hydraulic spring loaded shock absorber','Disc','Disc','Front :-90/90-18 Rear :-130/70-17','Front :-457.2 mm,Rear :-431.8 mm','Alloy',4),(33,'Ultraviolette','F77','ORIGNAL','Base',380000,140,300,'',3.400,0.000,'High speed','Yes','Online','Site',0,0.000,27.000,176,'Lithium-ion',7.100,0,300,'NA',3,'Yes','Digital','Bluetooth,WiFi','Yes','Yes','NA','Yes',0,'NA',0.000,0.000,'Yes','Yes','0','Yes','Ride Modes - Glide | Combat | Ballistic, Park Assist, SRB7 Battery Pack, Battery Management System, IEC 62196-6 Charging Port, Throttle Control, Up To 75 km Of Range Per Hour Of Charge, Ambient Light Sensor, Headlight Auto On/Off, GNSS enabled real-time position and velocity discovery, Maps with real-time traffic information, Vehicle Locator, Ride History & Ride Analytics, Temperature, Voltage and Current Sensors with Active Tracking and Efficiency Mapping across the Vehicle, Sensor Fusion technology using 9- axis Inertial Measurement Unit (IMU) along with built-in accelerometer, gyroscope & magnetometer Shock and Impact sensors for Fall and Crash Detection Error reporting through Ultraviolette Smartphone App , LTE connectivity with integrated eSIM, WLAN, GPS/GLONASS, Hazard Lights, Lockdown Mode, Fall & Crash Sensor, Emergency Contact Alert','Yes','Yes','NA','NA','Yes','Digital','Digital','Digital','NA','Yes','Yes','UV Automotive Linux OS','NA','Yes','NA',0,'Yes','Yes','Electric Bikes, Sports Bikes','','NA',0,0,0,800,160,1340,197.000,0,'LED','NA',140,'Permanent Magnet AC Motor',0,0,'Chain Drive',36,30000,'IP67 ( Battery )','Upside-down Telescopic fork with a diameter of 41 mm','Monoshock - preload adjustable','Disc','Disc','Front :-110/70-17 Rear :-150/60-17','Front :-431.8 mm,Rear :-431.8 mm','Alloy',4),(34,'Ultraviolette','F77','RECON','Top',455000,147,300,'',3.100,0.000,'High speed','Yes','Online','Site',0,0.000,29.000,261,'Lithium-ion',10.300,0,300,'NA',3,'Yes','Digital','Bluetooth,WiFi','Yes','Yes','NA','Yes',0,'NA',0.000,0.000,'Yes','Yes','0','Yes','Ride Modes - Glide | Combat | Ballistic, Park Assist, SRB10 Battery Pack, Battery Management System, IEC 62196-6 Charging Port, Throttle Control, Up To 75 km Of Range Per Hour Of Charge, Ambient Light Sensor, Headlight Auto On/Off, GNSS enabled real-time position and velocity discovery, Maps with real-time traffic information, Vehicle Locator, Ride History & Ride Analytics, Temperature, Voltage and Current Sensors with Active Tracking and Efficiency Mapping across the Vehicle, Sensor Fusion technology using 9- axis Inertial Measurement Unit (IMU) along with built-in accelerometer, gyroscope & magnetometer Shock and Impact sensors for Fall and Crash Detection Error reporting through Ultraviolette Smartphone App , LTE connectivity with integrated eSIM, WLAN, GPS/GLONASS, Hazard Lights, Lockdown Mode, Fall & Crash Sensor, Emergency Contact Alert','Yes','Yes','NA','NA','Yes','Digital','Digital','Digital','NA','Yes','Yes','UV Automotive Linux OS','NA','Yes','NA',0,'Yes','Yes','Electric Bikes, Sports Bikes','','NA',0,0,0,800,160,1340,207.000,0,'LED','NA',147,'Permanent Magnet AC Motor',0,0,'Chain Drive',60,50000,'IP67 ( Battery )','Upside-down Telescopic fork with a diameter of 41 mm','Monoshock - preload adjustable','Disc','Disc','Front :-110/70-17 Rear :-150/60-17','Front :-431.8 mm,Rear :-431.8 mm','Alloy',4),(35,'Ultraviolette','F77 Limited','','',550000,152,300,'',2.900,0.000,'High speed','Sold Out','','',0,0.000,32.000,261,'Lithium-ion',10.300,0,300,'NA',3,'Yes','Digital','Bluetooth,WiFi','Yes','Yes','NA','Yes',0,'NA',0.000,0.000,'Yes','Yes','0','Yes','Ride Modes - Glide | Combat | Ballistic, Park Assist, SRB10 Battery Pack, Battery Management System, IEC 62196-6 Charging Port, Throttle Control, Up To 75 km Of Range Per Hour Of Charge, Ambient Light Sensor, Headlight Auto On/Off, GNSS enabled real-time position and velocity discovery, Maps with real-time traffic information, Vehicle Locator, Ride History & Ride Analytics, Temperature, Voltage and Current Sensors with Active Tracking and Efficiency Mapping across the Vehicle, Sensor Fusion technology using 9- axis Inertial Measurement Unit (IMU) along with built-in accelerometer, gyroscope & magnetometer Shock and Impact sensors for Fall and Crash Detection Error reporting through Ultraviolette Smartphone App , LTE connectivity with integrated eSIM, WLAN, GPS/GLONASS, Hazard Lights, Lockdown Mode, Fall & Crash Sensor, Emergency Contact Alert , Aero Wheel Disc, Lever Guard','Yes','Yes','NA','NA','Yes','Digital','Digital','Digital','NA','Yes','Yes','UV Automotive Linux OS','NA','Yes','NA',0,'Yes','Yes','Electric Bikes, Sports Bikes','','NA',0,0,0,800,160,1340,207.000,0,'LED','NA',152,'Permanent Magnet AC Motor',0,0,'Chain Drive',96,100000,'IP67 ( Battery )','Upside-down Telescopic fork with a diameter of 41 mm','Monoshock - preload adjustable','Disc','Disc','Front :-110/70-17 Rear :-150/60-17','Front :-431.8 mm,Rear :-431.8 mm','Alloy',4),(36,'Okinawa','Praise+','','',145965,58,270,'',0.000,0.000,'High speed','Yes','Online','Site',2000,1.000,2.500,139,'Lithium Ion',3.300,0,0,'NA',0,'NA','Digital','NA','Yes','NA','Yes','NA',0,'NA',0.000,0.000,'Yes','NA','0','NA','Road Side Assistance, ARAI/ICAT Approved, Micro- Charger with Auto Cut Function, E-ABS (Electronic- Assisted Braking System), Brake Lever - CNC Machined with Lever Adjustment','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',7,'Digital','Yes','Electric Bikes','','NA',745,1970,1165,800,175,0,0.000,150,'LED','Yes',58,'BLDC',0,0,'Belt Drive',0,0,'NA','Hydraulic Telescopic','Double shocker with dual tube technology','Disc','Disc','Front :-90/90-12 Rear :-90/90-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',3),(37,'Okaya','Faast','','',109000,70,330,'',0.000,0.000,'','Yes','Online','Site',2500,1.200,2.000,0,'Lithium Ion',4.400,0,0,'NA',2,'Yes','Digital','NA','NA','NA','Yes','NA',0,'NA',0.000,0.000,'Yes','Yes','0','Sports,Yes','Motor Lock, Drive Modes - Eco | City | Sports, Walk Assist','NA','NA','Yes','NA','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','NA','NA',9,'NA','NA','Electric Bikes','','NA',710,1280,710,0,195,0,0.000,0,'LED','Yes',70,'BLDC',36,0,'Hub Motor',36,0,'NA','Telescopic','Spring Loaded','Drum','Drum','NA','Front :-304.8 mm,Rear :-304.8 mm','NA',3),(38,'One Electric Motorcycles','KRIDN','','',135000,95,0,'',8.000,0.000,'High Speed','','','',0,0.000,5.500,110,'Lithium Ion',3.000,0,0,'NA',0,'NA','Digital','NA','NA','NA','NA','NA',0,'NA',0.000,0.000,'NA','NA','0','NA','GPS/App Connect-Optional','NA','NA','NA','NA','NA','Digital','NA','Digital','NA','NA','NA','NA','NA','NA','NA',0,'NA','NA','Electric Bikes','','NA',0,0,0,0,0,0,0.000,0,'NA','Yes',95,'NA',0,0,'NA',0,0,'NA','Telescopic Hydrolic','Hydraulic','Disc','Disc','Front :-80/100-17, Rear :- 120/80-16','Front :-431.8 mm,Rear :-406.4 mm','Alloy',3),(39,'Rowwet','Trono','','',0,100,180,'',0.000,0.000,'High Speed','No','','',0,0.000,3.700,100,'Lithium Ion',3.000,0,0,'NA',0,'NA','Digital','NA','NA','NA','NA','Yes',0,'NA',0.000,0.000,'NA','NA','0','NA','NA','NA','NA','NA','NA','NA','Digital','Digital','Digital','NA','NA','NA','NA','NA','NA','NA',0,'NA','NA','Electric Bikes, Sports Bikes','NA','NA',0,0,0,0,0,0,0.000,0,'LED','NA',100,'NA',0,0,'Hub Motor',0,0,'NA','NA','NA','Disc','Disc','NA','NA','Alloy',2),(40,'River','Indie','','',125000,90,300,'',0.000,0.000,'High Speed','Yes','online','site',1250,0.000,6.700,0,'Lithium-Ion',4.000,300,0,'NA',0,'NA','Digital','NA','NA','NA','NA','Yes',43,'NA',0.000,0.000,'NA','Yes','0','NA','Riding Modes - Eco | Ride | Rush, Position Lamp, Hazard Light, Boot Light, Swingarm - Dual sided - Aluminium alloy, Side stand motor cut-off, SafeGuards, Ingress Protection (Controller) - IP67, Glovebox - 12L, Accessory mounts - Yes (Grab Rail, Handlebar), Pannier Stay Both sides, Bag Hook, Foot-pegs - Aluminium alloy - Front & Rear, Reverse Parking Assist, Center Stand, Floorboard Size (Diagonally) - 20\", Water wade - 300 mm, Pannier Mounts - 2','NA','NA','NA','NA','NA','Digital','NA','NA','NA','NA','NA','NA','NA','NA','NA',18,'NA','NA','Electric Bikes','','Yes',0,0,0,770,165,1365,0.000,0,'LED','NA',90,'Mid-Drive PMSM',60,50000,'Belt Drive',60,50000,'IP65','Telescopic Suspension with Hydraulic Dampers','Coil spring with Twin Hydraulic Dampers','Disc','Disc','NA','NA','Alloy Wheels',4),(41,'Komaki','Ranger','','',185506,80,240,'',0.000,0.000,'High Speed','Yes','online','site',799,0.000,4.000,200,'Lithium Ion',3.600,0,0,'NA',0,'NA','NA','Bluetooth','NA','NA','NA','Yes',0,'NA',0.000,0.000,'Yes','NA','0','Yes','Dual Sound pipes with flame effect, Front Body Guard, Turbo Mode, Rear Protection Guard, Gear Mode','Yes','NA','NA','Yes','Yes','Digital','Digital','NA','NA','NA','NA','NA','NA','NA','NA',0,'NA','Yes','Electric Bikes, Cruiser Bikes','','Yes',0,0,0,0,0,0,0.000,0,'LED','NA',0,'BLDC',0,0,'NA',0,0,'NA','Telescopic Front Fork','Telescopic','Disc','Disc','NA','Front :-431.8 mm,Rear :-431.8 mm','Alloy',2),(42,'EVeium','czar','','',207700,85,240,'',0.000,0.000,'High Speed','Yes','online','site',999,0.000,4.000,150,'Lithium Ion',3.000,0,0,'NA',0,'NA','NA','NA','NA','Yes','Yes','NA',0,'NA',0.000,0.000,'NA','NA','0','NA','Riding Modes - Eco | Normal | Sport, Keyless Start, Find my Vehicle, Real-time Tracking, Over-speed Alert','NA','NA','NA','NA','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',0,'NA','NA','Electric Bikes','','NA',720,1890,1090,0,0,1390,115.000,150,'LED','NA',85,'BLDC',0,0,'Hub Motor',0,0,'NA','NA','NA','Disc','Disc','Front :-120/70-12 Rear :-120/70-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',2),(43,'Bounce','Infinity e.1','With Battery As A Service','',64299,65,0,'',0.000,0.000,'','Yes','Online','Site, Flipkart',499,0.000,1.500,0,'NA',1.900,0,0,'NA',0,'Yes','NA','Bluetooth','NA','Yes','Yes','NA',12,'NA',0.000,0.000,'Yes','NA','0','Yes','( On Dashboard - Ignition Status, Indicator status, Battery SOC Status, Speed Display, Odometer Reading, Vehicle Status, Bluetooth Status, High Beam Status, Hazard light status ), EBS, Drag Mode, Drive Modes - Power | Eco, Location Tracking, Tow Alert','NA','NA','NA','Yes','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',0,'Digital','NA','Electric Bikes','','NA',695,1820,1120,780,155,1260,94.000,0,'LED','NA',65,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic Hydraulic','Twin Shock Absorber','Disc','Disc','Front :-90/90-12 Rear :-120/70-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(44,'Bounce','Infinity e.1','With Battery As A Service Pro','',76799,65,0,'',0.000,0.000,'','Yes','Online','Site, Flipkart',499,0.000,1.500,0,'NA',1.900,0,0,'NA',0,'Yes','NA','Bluetooth','NA','Yes','Yes','NA',12,'NA',0.000,0.000,'Yes','NA','0','Yes','( On Dashboard - Ignition Status, Indicator status, Battery SOC Status, Speed Display, Odometer Reading, Vehicle Status, Bluetooth Status, High Beam Status, Hazard light status ), EBS, Drag Mode, Drive Modes - Power | Eco, Location Tracking, Tow Alert','NA','NA','NA','Yes','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',0,'Digital','NA','Electric Bikes','','NA',695,1820,1120,780,155,1260,94.000,0,'LED','NA',65,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic Hydraulic','Twin Shock Absorber','Disc','Disc','Front :-90/90-12 Rear :-120/70-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(45,'Bounce','Infinity e.1','With Battery','',103000,65,240,'',0.000,0.000,'','Yes','Online','Site, Flipkart',499,0.000,1.500,85,'NA',1.900,0,0,'NA',1,'Yes','Digital','Bluetooth','NA','Yes','Yes','NA',12,'NA',0.000,0.000,'Yes','NA','0','Yes','EBS, Drag Mode, Drive Modes - Power | Eco, Location Tracking, Tow Alert','NA','NA','NA','Yes','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',0,'Digital','NA','Electric Bikes','1820','NA',695,1820,1120,780,155,1260,94.000,0,'LED','NA',65,'BLDC',0,0,'Hub Motor',0,0,'NA','Telescopic Hydraulic','Twin Shock Absorber','Disc','Disc','Front :-90/90-12 Rear :-120/70-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4),(46,'Bounce','Infinity e.1','Limited Edition','',114000,0,240,'',0.000,0.000,'','Yes','Online','Site, Flipkart',499,0.000,1.500,85,'Lithium Ion',1.900,0,0,'NA',1,'Yes','Digital','Bluetooth','NA','Yes','Yes','NA',12,'NA',0.000,0.000,'Yes','NA','0','Yes','EBS, Drag Mode, Drive Modes - Power | Eco, Location Tracking, Tow Alert','NA','NA','NA','Yes','NA','Digital','Digital','NA','NA','NA','NA','NA','NA','Yes','NA',0,'Digital','Yes','Electric Bikes','','NA',695,1820,1120,780,155,1260,94.000,0,'LED','NA',65,'BLDC',0,0,'Hub Motor',0,0,'IP67 (Battery)','Telescopic Hydraulic','Twin Shock Absorber','Disc','Disc','Front :-90/90-12 Rear :-120/70-12','Front :-304.8 mm,Rear :-304.8 mm','Alloy',4);
/*!40000 ALTER TABLE `twowheelerdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'weev'
--

--
-- Dumping routines for database 'weev'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAlltwowheelerdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlltwowheelerdata`()
BEGIN
	SELECT TWId, Manufacturer, Model, Variant, VariantType, ExShowroomPrice, MaxSpeed,
           ChargingTime, ConditionOfVehicle, Accelration0To60kmph, Accelration0To40kmph, 
           Category, Available, OfflineOROnline, BookingSite, BookingPrice, ContinuousPower, 
           MotorPower, RangeOfVehicle, BatteryType, BatteryCapacity, ChargingTime0To80Perc, 
           ChargingTime0To100Perc, ChargingAtHome, NoOfBatteries, SwappableBattery, InstrumentConsole, 
           BluetoothConnectivity, Navigation, GeoFencing, AntiTheftAlarm, USBChargingPort, 
           UnderseatStorage, DistanceToEmptyIndicator, ChargerOutputMin, ChargerOutputMax, ChargingPoint, 
           FastCharging, FastChargingTimeUpto80Perc, RidingModes, AdditionalFeatures, CallORSMSAlerts, MusicControl,
           CentralLocking, CruiseControl, ExternalSpeakers, Speedometer, Tripmeter, Odometer, CarryHook, 
           ArtificialExhaustSoundSystem, InternetConnectivity, OperatingSystem, Processor, MobileApplication, 
           ChargingStationLocater, Gradeability, Clock, LowBatteryIndicator, BodyType, DimensionsAndCapacity, 
           BootSpace, Width, Length, Height, SaddleHeight, GroundClearance, Wheelbase, KerbWeight, LoadCarryingCapacity,
           TurnSignalLamp, DRLs, TopSpeed, MotorType, MotorWarrantyForMonths, MotorWarrantyForKm, DriveType, 
           BatteryWarrantyForMonths, BatteryWarrantyForKm, WaterProofRating, SuspensionFront,
           SuspensionRear, BrakesFront, BrakesRear, TyreSize, WheelSize, WheelsType ,OurRating ,          
           CONCAT(twi.Path,'/',twi.grey1 ,'.jpeg') Path
 	FROM twowheelerdata twd
    INNER JOIN twimagedata twi
    ON twd.TWId=twi.TW_Ref_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTwimagedataByTWId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwimagedataByTWId`(
	IN Id Int
)
BEGIN

	SELECT Id, TW_Ref_ID, Path, 
    CONCAT(Path,'/',Grey1 ,'.jpeg') Grey, 
    CONCAT(Path,'/',Grey2 ,'.jpeg') Gray, 
    CONCAT(Path,'/',White ,'.jpeg') White, 
    CONCAT(Path,'/',Black1 ,'.jpeg') Black, 
    CONCAT(Path,'/',Black2 ,'.jpeg') Blacklight, 
    CONCAT(Path,'/',Red ,'.jpeg') Red, 
    CONCAT(Path,'/',Blue ,'.jpeg') Blue, 
    CONCAT(Path,'/',Silver ,'.jpeg') Silver, 
    CONCAT(Path,'/',Yellow ,'.jpeg') Yellow, 
    CONCAT(Path,'/',Pink ,'.jpeg') Pink, 
    CONCAT(Path,'/',Green ,'.jpeg') Green, 
    CONCAT(Path,'/',Gerua ,'.jpeg') Saffron, 
    CONCAT(Path,'/',Orange ,'.jpeg') Orange, 
    CONCAT(Path,'/',Bronze ,'.jpeg') Bronze  FROM twimagedata
    Where TW_Ref_ID = Id; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTwoimageTabNameByTWId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwoimageTabNameByTWId`(
IN Id Int
)
BEGIN

select coalesce (GROUP_CONCAT(col_name),'No_Result') INTO @ColumnNames  
        from (
        select 'Grey' as col_name, count( distinct Grey1) as count from twimagedata
        where Grey1  !=''   and TW_Ref_ID= Id
        union
        select 'light Grey' as col_name, count( distinct Grey2) from twimagedata
        where Grey2  !=''  and TW_Ref_ID= Id
        union
        select 'White' as col_name, count( distinct White) from twimagedata
        where White  !=''  and TW_Ref_ID= Id
        union
        select 'Black' as col_name, count( distinct Black1) from twimagedata
        where Black1 !=''  and TW_Ref_ID= Id
        Union
        select 'Blacklight' as col_name, count( distinct Black2) from twimagedata
        where Black2 !=''  and TW_Ref_ID= Id
        Union
        select 'Red' as col_name, count( distinct Red) from twimagedata
        where Red !=''  and TW_Ref_ID= Id
        Union
        select 'Blue' as col_name, count( distinct Blue) from twimagedata
        where Blue !=''  and TW_Ref_ID= Id
         Union       
        select 'Silver' as col_name, count( distinct Silver) from twimagedata
        where Silver !=''  and TW_Ref_ID= Id
         Union
        select 'Yellow' as col_name, count( distinct Yellow) from twimagedata
        where Yellow !=''  and TW_Ref_ID= Id
         Union
        select 'Pink' as col_name, count( distinct Pink) from twimagedata
        where Pink !=''  and TW_Ref_ID= Id
         Union
        select 'Saffron' as col_name, count( distinct Gerua) from twimagedata
        where Gerua !=''  and TW_Ref_ID= Id
         Union
        select 'Orange' as col_name, count( distinct Orange) from twimagedata
        where Orange !=''  and TW_Ref_ID= Id
         Union
        select 'Bronze' as col_name, count( distinct Bronze) from twimagedata
        where Bronze !=''  and TW_Ref_ID= Id
         
        )a where count >0;
        
		select  @ColumnNames as ColumnNames;   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTwowheelerdataByModel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwowheelerdataByModel`(
	IN ModelName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM twowheelerdata
	WHERE Model = ModelName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTwowheelerdataByTWId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwowheelerdataByTWId`(
	IN Id Int
)
BEGIN
	SELECT TWId, Manufacturer, Model, Variant, VariantType, ExShowroomPrice, MaxSpeed,
           ChargingTime, ConditionOfVehicle, Accelration0To60kmph, Accelration0To40kmph, 
           Category, Available, OfflineOROnline, BookingSite, BookingPrice, ContinuousPower, 
           MotorPower, RangeOfVehicle, BatteryType, BatteryCapacity, ChargingTime0To80Perc, 
           ChargingTime0To100Perc, ChargingAtHome, NoOfBatteries, SwappableBattery, InstrumentConsole, 
           BluetoothConnectivity, Navigation, GeoFencing, AntiTheftAlarm, USBChargingPort, 
           UnderseatStorage, DistanceToEmptyIndicator, ChargerOutputMin, ChargerOutputMax, ChargingPoint, 
           FastCharging, FastChargingTimeUpto80Perc, RidingModes, AdditionalFeatures, CallORSMSAlerts, MusicControl,
           CentralLocking, CruiseControl, ExternalSpeakers, Speedometer, Tripmeter, Odometer, CarryHook, 
           ArtificialExhaustSoundSystem, InternetConnectivity, OperatingSystem, Processor, MobileApplication, 
           ChargingStationLocater, Gradeability, Clock, LowBatteryIndicator, BodyType, DimensionsAndCapacity, 
           BootSpace, Width, Length, Height, SaddleHeight, GroundClearance, Wheelbase, KerbWeight, LoadCarryingCapacity,
           TurnSignalLamp, DRLs, TopSpeed, MotorType, MotorWarrantyForMonths, MotorWarrantyForKm, DriveType, 
           BatteryWarrantyForMonths, BatteryWarrantyForKm, WaterProofRating, SuspensionFront,
           SuspensionRear, BrakesFront, BrakesRear, TyreSize, WheelSize, WheelsType ,OurRating ,           
           CONCAT(twi.Path,'/',twi.Blue ,'.jpeg') Path
 	FROM twowheelerdata twd
    INNER JOIN twimagedata twi
    ON twd.TWId=twi.TW_Ref_ID 
	WHERE TWId = Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCustomerenquiries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomerenquiries`(IN UserNames varchar(45),IN Emails varchar(50),IN Mobiles varchar(10))
BEGIN   
  IF NOT EXISTS (Select CustomerEnquiriesId from customerenquiries where UserName=UserNames AND email=Emails AND Mobile=Mobiles)
    THEN
      INSERT IGNORE INTO customerenquiries (UserName,email,Mobile,last_update) 
      VALUES (UserNames,Emails,Mobiles,CURRENT_TIMESTAMP);
  END IF;
END ;;
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

-- Dump completed on 2024-04-21  6:43:52
