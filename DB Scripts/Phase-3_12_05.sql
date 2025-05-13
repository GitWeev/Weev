use weev;


UPDATE twowheelerdata
SET ChargingTime = '300'
WHERE twid in('31','32','38');       

UPDATE twowheelerdata
SET ChargingTime = '240'
WHERE twid in('43','44');    

UPDATE twowheelerdata
SET MaxSpeed = '65'
WHERE twid in('43','44','46');        

UPDATE twowheelerdata
SET MaxSpeed = '120'
WHERE twid in('23');    

UPDATE twowheelerdata
SET MaxSpeed = '90'
WHERE twid in('32'); 

UPDATE twowheelerdata
SET RangeofVehicle = '212'
WHERE twid in('15');


UPDATE twowheelerdata
SET RangeofVehicle = '81'
WHERE twid in('19');

UPDATE twowheelerdata
SET RangeofVehicle = '120'
WHERE twid in('20');

UPDATE twowheelerdata
SET RangeofVehicle = '100'
WHERE twid in('26');

UPDATE twowheelerdata
SET RangeofVehicle = '130'
WHERE twid in('37');

UPDATE twowheelerdata
SET RangeofVehicle = '110'
WHERE twid in('40');
UPDATE twowheelerdata
SET RangeofVehicle = '85'
WHERE twid in('43','44');

UPDATE twowheelerdata
SET Variant = 'F4'
WHERE twid in('37');

ALTER TABLE twowheelerdata 
CHANGE COLUMN `Accelration0To60kmph` `Acceleration0To60kmph` DECIMAL(10,3);

ALTER TABLE twowheelerdata
CHANGE COLUMN `Accelration0To40kmph` `Acceleration0To40kmph` DECIMAL(10,3);

DELETE FROM main_image
WHERE TW_Ref_ID = 32;
INSERT INTO `main_image`
VALUES ( 32, '../../../assets/images/2W/Hop/OXO/Images','1', '2', '3', '4', '5', '6', '7', '8', '', '', '', '', '', '', '', '', '', '', '', '');


DROP procedure IF EXISTS `GetTwowheelerdataByTWId`;
DROP procedure IF EXISTS `GetAlltwowheelerdata`;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwowheelerdataByTWId`(
	IN Id Int
)
BEGIN
	SELECT TWId, Manufacturer, Model, Variant, VariantType, ExShowroomPrice, MaxSpeed,
           ChargingTime, ConditionOfVehicle, Acceleration0To60kmph, Acceleration0To40kmph, 
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
           SuspensionRear, BrakesFront, BrakesRear, TyreSize, WheelSize, WheelsType ,OurRating , VehicleType,         
 CONCAT(twi.Path, '/', twi.Image1, '.jpeg') AS Path
FROM 
    twowheelerdata twd
INNER JOIN 
    main_image twi
ON 
    twd.TWId = twi.TW_Ref_ID 
WHERE 
    twd.TWId = Id;
 
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlltwowheelerdata`()
BEGIN
	SELECT TWId, Manufacturer, Model, Variant, VariantType, ExShowroomPrice, MaxSpeed,
           ChargingTime, ConditionOfVehicle, Acceleration0To60kmph, Acceleration0To40kmph, 
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
    INNER JOIN main_image twi
    ON twd.TWId=twi.TW_Ref_ID
    WHERE twd.IsActive = 1;

END ;;
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` = 'Pure EV' AND `Model` = 'Epluto 7G';

UPDATE `twowheelerdata`
SET `VehicleType` = 'Bike'
WHERE `Manufacturer` IN ('Torq', 'Oben', 'Kabira Mobility', 'Odysse', 'Atumobile', 'HOP', 'Ultraviolette', 'EVeium', 'Komaki', 'Revolt', 'One Electric Motorcycles');
