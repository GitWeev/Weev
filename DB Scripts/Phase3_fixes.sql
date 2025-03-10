use weev;
ALTER TABLE `twowheelerdata` ADD COLUMN `VehicleType` VARCHAR(20);
select*from twowheelerdata;
SET SQL_SAFE_UPDATES = 0;
UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` IN ('Ola', 'Ampere','Ather','TVS','Bajaj','Hero','Simple','Ampere','Okinawa','Benling','Okinawa','Okaya','River','Rowwet');


UPDATE `twowheelerdata`
SET `VehicleType` = 'Bike'
WHERE `Manufacturer` IN ('Torq', 'Oben','Kabira Mobility','Odysse','Atumobile','HOP','Ultraviolette','EVeium','Komaki','Revolt','One Electric Motorcycles','');

UPDATE `twowheelerdata`
SET `VehicleType` = 'Bike'
WHERE `Manufacturer` = 'Pure EV' 
AND `Model` = 'eTryst 350';

UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` = 'Pure EV' 
AND `Model` = 'Epluto 7G';


DELETE FROM `twowheelerdata` WHERE `TWId` IN (43, 44, 45, 46);


UPDATE twowheelerdata
SET ExShowroomPrice = '1,65,900' 
WHERE TWId = 23;


select * from main_image
