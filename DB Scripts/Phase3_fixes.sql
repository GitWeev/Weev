UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` IN ('Ola', 'Ampere', 'Ather', 'TVS', 'Bajaj', 'Hero', 'Simple', 'Okinawa', 'Benling', 'Okaya', 'River', 'Rowwet');

UPDATE `twowheelerdata`
SET `VehicleType` = 'Bike'
WHERE `Manufacturer` IN ('Torq', 'Oben', 'Kabira Mobility', 'Odysse', 'Atumobile', 'HOP', 'Ultraviolette', 'EVeium', 'Komaki', 'Revolt', 'One Electric Motorcycles');

UPDATE `twowheelerdata`
SET `VehicleType` = 'Bike'
WHERE `Manufacturer` = 'Pure EV' AND `Model` = 'eTryst 350';

UPDATE `twowheelerdata`
SET `VehicleType` = 'Scooter'
WHERE `Manufacturer` = 'Pure EV' AND `Model` = 'Epluto 7G';
