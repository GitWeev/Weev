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

