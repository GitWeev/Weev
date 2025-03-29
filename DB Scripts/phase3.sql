USE `weev`;
DROP procedure IF EXISTS `GetTwowheelerdataByVehicleType`;

USE `weev`;
DROP procedure IF EXISTS `weev`.`GetTwowheelerdataByVehicleType`;
;

DELIMITER $$
USE `weev`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTwowheelerdataByVehicleType`(
	IN Vehicle VARCHAR(255)
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
           SuspensionRear, BrakesFront, BrakesRear, TyreSize, WheelSize, WheelsType ,OurRating ,VehicleType,        
           CONCAT(twi.Path,'/',twi.Image1 ,'.jpeg') Path
 	FROM twowheelerdata twd
  INNER JOIN 
    main_image twi
ON 
    twd.TWId = twi.TW_Ref_ID 
    
	WHERE VehicleType = Vehicle;
END$$

DELIMITER ;
;

