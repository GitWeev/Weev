Use weev;
SET SQL_SAFE_UPDATES=0;
Update twowheelerdata
Set VariantType='Top'
Where Model='S1 Air';

 

Update twowheelerdata
Set OurRating =3
Where TWid in('47','48','50','51','57','58','60','64','62');

Update twowheelerdata
Set OurRating =4
Where TWid in('49','52','53','54','55','56','59','61','63','65','66','67','68');


Update twowheelerdata
Set VehicleType='Scooter'
Where TWid In('64','65','66');


UPDATE twowheelerdata
SET available = 'Available'
WHERE TWId IN (1, 3, 4, 5, 6, 7, 8, 9, 10,12, 13, 14, 17, 18, 19, 20,22, 24, 26, 27, 28, 29, 30,31, 33, 34, 35, 36, 37, 38,40, 41, 42, 43, 44, 45, 46,
               47, 48, 49, 50, 51, 52, 53,54, 55, 56, 57, 59, 60, 61,62, 63, 64, 65, 66, 67, 68);
UPDATE twowheelerdata
SET available = 'Discontinued'
WHERE TWId IN (2, 11, 15, 16, 21, 23, 32, 58);
 