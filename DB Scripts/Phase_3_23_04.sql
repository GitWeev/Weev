use weev;
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE `twowheelerdata`  
MODIFY COLUMN BookingPrice Int(255) DEFAULT NULL;

UPDATE `twowheelerdata` SET BOOKINGPRICE = 2699 WHERE MANUFACTURER = 'Ola' AND MODEL = 'S1 Air';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 0 WHERE MANUFACTURER = 'OLA' AND MODEL = 'S1';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 0 WHERE MANUFACTURER = 'OLA' AND MODEL = 'S1 Pro';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 2699 WHERE MANUFACTURER = 'Ather' AND MODEL = '450X';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 999 WHERE MANUFACTURER = 'Ather' AND MODEL = '450X';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 4999 WHERE MANUFACTURER = 'TVS' AND MODEL = 'iQube';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 499 WHERE MANUFACTURER = 'Revolt' AND MODEL = 'RV400';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 1999 WHERE MANUFACTURER = 'Bajaj' AND MODEL = 'Chetak';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 0 WHERE MANUFACTURER = 'Ampere' AND MODEL = 'Magnus EX';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 1999 WHERE MANUFACTURER = 'Okinawa' AND MODEL = 'PraisePro';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 299 WHERE MANUFACTURER = 'Oben' AND MODEL = 'Rorr';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 499 WHERE MANUFACTURER = 'Kabira Mobility' AND MODEL = 'KM 4000';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 499 WHERE MANUFACTURER = 'Kabira Mobility' AND MODEL = 'KM 3000';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 499 WHERE MANUFACTURER = 'Odysse' AND MODEL = 'Evoqis';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 999 WHERE MANUFACTURER = 'Atumobile' AND MODEL = 'Atum Vader';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 1999 WHERE MANUFACTURER = 'Pure EV' AND MODEL = 'eTryst 350';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 1999 WHERE MANUFACTURER = 'Pure EV' AND MODEL = 'Epluto 7G';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 1999 WHERE MANUFACTURER = 'Pure EV' AND MODEL = 'Neo Etrance';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 4999 WHERE MANUFACTURER = 'Ultraviolette' AND MODEL = 'F77';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 4999 WHERE MANUFACTURER = 'Ultraviolette' AND MODEL = 'F77';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 4999 WHERE MANUFACTURER = 'Ultraviolette' AND MODEL = 'F77 Limited';
UPDATE `twowheelerdata` SET BOOKINGPRICE = 0 WHERE MANUFACTURER = 'One Electric Motorcycles' AND MODEL = 'KRIDN';
DELETE FROM main_image
WHERE TW_Ref_ID = 43;


-- Unlocking the table, in case it was locked in a previous transaction
UNLOCK TABLES;

-- Delete the old entry where TW_Ref_ID is 43


INSERT INTO `main_image`
VALUES (
  43,'../../../assets/images/2W/Bounce/Inifinity E1/Images','1', '2', '3', '4', '5','6', '7', '8', '9',
  '', '', '', '', '',
  '', '', '', '', '',''
);
DELETE FROM twimagedata
WHERE TW_Ref_ID = 43;

-- then run your INSERT

UNLOCK TABLES ;

--
/*!40000 ALTER TABLE `twimagedata` DISABLE KEYS */;
INSERT INTO `twimagedata` 
VALUES
  (
43, 43,'../../../assets/images/2W/Bounce/Inifinity E1/Color','Bounce-Infinity E1-Comet Grey','', 'Bounce-Infinity E1-Pearl White', 'Bounce-Infinity E1-Sparkle Black', 'Bounce-Infinity E1-Sporty Red','', 'Bounce-Infinity E1-Desat Silver', '', '', '', '', '', '', '')

;




UPDATE main_image
SET Path = '../../../assets/images/2W/Bounce/Inifinity E1/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (43,44,45,46);

UPDATE main_image
SET Path = '../../../assets/images/2W/Pure/eTryst 350/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (27);

-- UPDATE main_image
-- SET Path = '../../../assets/images/2W/Rowwet/Trono/Images', 
--     Image1 = '1'
-- WHERE TW_Ref_ID IN (39);

UPDATE main_image
SET Path = '../../../assets/images/2W/Komaki/Ranger/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (41);


ALTER TABLE twowheelerdata
Drop column IsActive,

ADD COLUMN  IsActive BOOLEAN DEFAULT TRUE;



UPDATE `twowheelerdata`
SET IsActive = 0
WHERE TWId in('25','29','30','42');
USE `weev`;
DROP procedure IF EXISTS `GetAllTwowheelerdata`;
;
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
           SuspensionRear, BrakesFront, BrakesRear, TyreSize, WheelSize, WheelsType ,OurRating ,VehicleType,        
           CONCAT(twi.Path,'/',twi.Image1 ,'.jpeg') Path
FROM twowheelerdata twd
INNER JOIN main_image twi ON twd.TWId = twi.TW_Ref_ID
WHERE twd.IsActive = 1;

END ;;
DELIMITER ;
DELETE FROM `twimagedata`
WHERE id = 41;

UNLOCK TABLES ;

--
/*!40000 ALTER TABLE `twimagedata` DISABLE KEYS */;
INSERT INTO `twimagedata` 
VALUES
  (
41, 41,'../../../assets/images/2W/Komaki/Ranger/Color','','', '', 'Komaki Ranger Jet Black', '','Komaki Ranger Red', '', '', '', '', '', '', '', '')

;

Update `twowheelerdata`
SET variant = 'NA'
WHERE Variant = '';

Update `twowheelerdata`
SET ConditionOfVehicle= 'NA'
WHERE ConditionOfVehicle = '';

Update `twowheelerdata`
SET BatteryType= 'NA'
WHERE BatteryType = '';

Update `twowheelerdata`
SET ChargingAtHome= 'NA'
WHERE ChargingAtHome = '';

Update `twowheelerdata`
SET SwappableBattery= 'NA'
WHERE SwappableBattery = '';

Update `twowheelerdata`
SET USBChargingPort= 'NA'
WHERE USBChargingPort = '';

Update `twowheelerdata`
SET DistanceToEmptyIndicator= 'NA'
WHERE DistanceToEmptyIndicator = '';

Update `twowheelerdata`
SET CentralLocking= 'NA'
WHERE CentralLocking = '';

Update `twowheelerdata`
SET CruiseControl= 'NA'
WHERE CruiseControl = '';

Update `twowheelerdata`
SET Odometer= 'NA'
WHERE Odometer = '';

Update `twowheelerdata`
SET CarryHook= 'NA'
WHERE CarryHook = '';


Update `twowheelerdata`
SET ArtificialExhaustSoundSystem= 'NA'
WHERE ArtificialExhaustSoundSystem = '';

Update `twowheelerdata`
SET ArtificialExhaustSoundSystem= 'NA'
WHERE ArtificialExhaustSoundSystem = '';

Update `twowheelerdata`
SET Processor= 'NA'
WHERE Processor = '';

Update `twowheelerdata`
SET DimensionsAndCapacity='NA'
WHERE DimensionsAndCapacity = '';

ALTER TABLE `twowheelerdata`
ADD COLUMN `ChargingStationLocator` VARCHAR(255) DEFAULT 'NA';


Update `twowheelerdata`
SET NoOfBatteries=1
WHERE NoOfBatteries=0;


UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` = 'Bounce';

UPDATE `twowheelerdata`
SET VariantType='Base'
WHERE TWId in('43','44','45');

UPDATE twowheelerdata
SET ExShowroomPrice = 176000
WHERE TWId = 21;

SELECT * FROM weev.twowheelerdata;

SELECT * FROM weev.twowheelerdata;
ALTER TABLE Customerenquiries ADD COLUMN Url VARCHAR(2083);
SET SQL_SAFE_UPDATES = 0;




DROP PROCEDURE InsertCustomerenquiries;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomerenquiries`(
    IN UserNames VARCHAR(45),
    IN Emails VARCHAR(50),
    IN Mobiles VARCHAR(15), -- Increased length for flexibility
    IN Url VARCHAR(1000)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM customerenquiries 
        WHERE UserName = UserNames 
          AND email = Emails 
          AND Mobile = Mobiles 
          AND Url = Url
    ) 
    THEN
        INSERT INTO customerenquiries (UserName, email, Mobile, Url) 
        VALUES (UserNames, Emails, Mobiles, Url);
    END IF;
END $$

DELIMITER ;

