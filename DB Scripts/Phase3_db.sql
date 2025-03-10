use weev;
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE `twowheelerdata`  
MODIFY COLUMN BookingPrice VARCHAR(255) DEFAULT NULL;

UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '2699' 
WHERE MANUFACTURER = 'Ola' 
AND MODEL = 'S1 Air';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = 'NA' 
WHERE MANUFACTURER = 'OLA' 
AND MODEL = 'S1';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = 'NA' 
WHERE MANUFACTURER = 'OLA' 
AND MODEL = 'S1 Pro';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '2699' 
WHERE MANUFACTURER = 'Ather' 
AND MODEL = '450X';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '999' 
WHERE MANUFACTURER = 'Ather' 
AND MODEL = '450X';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '4999' 
WHERE MANUFACTURER = 'TVS' 
AND MODEL = 'iQube';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '499' 
WHERE MANUFACTURER = 'Revolt' 
AND MODEL = 'RV400';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '1999' 
WHERE MANUFACTURER = 'Bajaj' 
AND MODEL = 'Chetak';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = 'NA'
WHERE MANUFACTURER = 'Ampere' 
AND MODEL = 'Magnus EX';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '1999' 
WHERE MANUFACTURER = 'Okinawa' 
AND MODEL = 'PraisePro';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '299' 
WHERE MANUFACTURER = 'Oben' 
AND MODEL = 'Rorr';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '499' 
WHERE MANUFACTURER = 'Kabira Mobility' 
AND MODEL = 'KM 4000';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '499' 
WHERE MANUFACTURER = 'Kabira Mobility' 
AND MODEL = 'KM 3000';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '499' 
WHERE MANUFACTURER = 'Odysse' 
AND MODEL = 'Evoqis';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '999' 
WHERE MANUFACTURER = 'Atumobile' 
AND MODEL = 'Atum Vader';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '1999' 
WHERE MANUFACTURER = 'Pure EV' 
AND MODEL = 'eTryst 350';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '1999' 
WHERE MANUFACTURER = 'Pure EV' 
AND MODEL = 'Epluto 7G';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '1999' 
WHERE MANUFACTURER = 'Pure EV' 
AND MODEL = 'Neo Etrance';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '4999' 
WHERE MANUFACTURER = 'Ultraviolette' 
AND MODEL = 'F77';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '4999' 
WHERE MANUFACTURER = 'Ultraviolette' 
AND MODEL = 'F77';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = '4999' 
WHERE MANUFACTURER = 'Ultraviolette' 
AND MODEL = 'F77 Limited';
UPDATE `twowheelerdata` 
SET BOOKINGPRICE = 'NA' 
WHERE MANUFACTURER = 'One Electric Motorcycles' 
AND MODEL = 'KRIDN';


SELECT MANUFACTURER,MODEL,BOOKINGPRICE FROM TWOWHEELERDATA;
DELETE FROM `twowheelerdata` WHERE `TWId` IN (25,39);

ALTER TABLE `twowheelerdata`  
MODIFY COLUMN Accelration0To60kmph VARCHAR(30) DEFAULT NULL;
ALTER TABLE `twowheelerdata`  
MODIFY COLUMN Accelration0To40kmph VARCHAR(30) DEFAULT NULL;

UPDATE`twowheelerdata`
SET Accelration0To60kmph ='NA'
WHERE Accelration0To60kmph=0;
UPDATE`twowheelerdata`
SET Accelration0To40kmph ='NA'
WHERE Accelration0To40kmph=0;


ALTER TABLE `twowheelerdata`
MODIFY COLUMN ChargerOutputMin varchar (30);
ALTER TABLE `twowheelerdata`
MODIFY COLUMN ChargerOutputMax varchar (30);


UPDATE`twowheelerdata`
SET ChargerOutputMin ='NA'
WHERE ChargerOutputMin=0;
UPDATE`twowheelerdata`
SET ChargerOutputMax ='NA'
WHERE ChargerOutputMax=0;


ALTER TABLE `twowheelerdata`
MODIFY COLUMN `MotorWarrantyForMonths` VARCHAR(30);
ALTER TABLE `twowheelerdata`
MODIFY COLUMN `MotorWarrantyForKm` VARCHAR(30);
UPDATE `twowheelerdata`
SET MotorWarrantyForMonths='NA'
WHERE MotorWarrantyForMonths=0;
UPDATE `twowheelerdata`
SET MotorWarrantyForKm='NA'
WHERE MotorWarrantyForKm=0;


ALTER TABLE `twowheelerdata`
MODIFY COLUMN `BatteryWarrantyForMonths` VARCHAR(30);
UPDATE `twowheelerdata`
SET BatteryWarrantyForMonths='NA'
WHERE BatteryWarrantyForMonths=0;

ALTER TABLE `twowheelerdata`
MODIFY COLUMN `BatteryWarrantyForKm` VARCHAR(30);
UPDATE `twowheelerdata`
SET BatteryWarrantyForKm='NA'
WHERE BatteryWarrantyForKm=0;

ALTER TABLE `twowheelerdata`
MODIFY COLUMN `NoOfBatteries` VARCHAR(30);
UPDATE `twowheelerdata`
SET NoOfBatteries='1'
WHERE NoOfBatteries=0;

ALTER TABLE `twowheelerdata`
MODIFY COLUMN `Width` VARCHAR(30),
MODIFY COLUMN `Length` VARCHAR(30),
MODIFY COLUMN `Height` VARCHAR(30),
MODIFY COLUMN `SaddleHeight` VARCHAR(30),
MODIFY COLUMN `GroundClearance` VARCHAR(30);
UPDATE `twowheelerdata`
SET 
    `Width` = 'NA',
    `Length` = 'NA',
    `Height` = 'NA',
    `SaddleHeight` = 'NA',
    `GroundClearance` = 'NA'
WHERE 
    Width = 0 
    OR Length = 0 
    OR Height = 0 
    OR SaddleHeight = 0 
    OR GroundClearance = 0;




