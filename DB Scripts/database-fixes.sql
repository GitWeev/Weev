use weev;
ALTER TABLE twowheelerdata ADD COLUMN VehicleType VARCHAR(20);
select*from twowheelerdata;
SET SQL_SAFE_UPDATES = 0;
UPDATE twowheelerdata
SET VehicleType = 'Scooter'
WHERE Manufacturer IN ('Ola', 'Ampere','Ather','TVS','Bajaj','Hero','Simple','Ampere','Okinawa','Pure','Benling','Okinawa','Okaya','River','Bounce','Rowwet','One Electric Motorcycles');


UPDATE twowheelerdata
SET VehicleType = 'Bike'
WHERE Manufacturer IN ('Torq', 'Oben','Kabira Mobility','Odysse','Atumobile','Pure EV','HOP','Ultraviolette','EVeium','Komaki','Revolt');

UPDATE twowheelerdata
SET NoOfBatteries = 1
WHERE NoOfBatteries = 0;

USE `weev-dev`;
DROP procedure IF EXISTS `GetAlltwowheelerdata`;

USE `weev-dev`;
DROP procedure IF EXISTS `weev-dev`.`GetAlltwowheelerdata`;
;

DELIMITER $$
USE `weev-dev`$$
CREATE DEFINER=`admin`@`%` PROCEDURE `GetAlltwowheelerdata`()
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
           CONCAT(twi.Path,'/',twi.Image1 ,'.jpeg') Path,VehicleType
 	FROM twowheelerdata twd
    INNER JOIN main_image twi
    ON twd.TWId=twi.TW_Ref_ID;
END$$

DELIMITER ;
;

