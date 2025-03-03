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

-- UPDATE `main_image`  
-- SET  
--   Path = '../../../assets/images/2W/Bounce/Infinity E1/Images',  
--   Image1 = '1',  
--   Image2 = '2',  
--   Image3 = '3',  
--   Image4 = '4',  
--   Image5 = '5',  
--   Image6 = '6',  
--   Image7 = '7',  
--   Image8 = '8'  
-- WHERE TW_Ref_ID IN (43, 44, 45, 46);


-- UPDATE `twimagedata`
-- SET  
--   Path = '../../../assets/images/2W/Bounce/Infinity E1/Color',  
--   Grey1 = 'Bounce-Infinity E1-Comet Grey',  
--   Grey2 = 'Bounce-Infinity E1-Desat Silver',  
--   White = 'Bounce-Infinity E1-Pearl White',  
--   Black1 = 'Bounce-Infinity E1-Sparkle Black',  
--   Red = 'Bounce-Infinity E1-Sporty Red'  
-- WHERE Id = 43;

-- DELETE FROM `twimagedata` WHERE `Id` = 43;
DELETE FROM `twowheelerdata` WHERE `TWId` IN (43, 44, 45, 46);


select * from main_image
