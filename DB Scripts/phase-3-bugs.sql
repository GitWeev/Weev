use weev;
UPDATE twowheelerdata
SET ExShowroomPrice = 179000
WHERE TWId = 39;
UPDATE twowheelerdata
SET ExShowroomPrice = 93089
WHERE TWId = 6;
UPDATE twowheelerdata
SET ExShowroomPrice = 146984
WHERE TWId = 8;
UPDATE main_image
SET Path = '../../../assets/images/',
    Image1 = 'pr1'
WHERE TW_Ref_ID = 25;

UPDATE main_image
SET Path = '../../../assets/images', 
    Image1 = 'pr1'
WHERE TW_Ref_ID IN (25,29,39,40,41,42,43,44,31,32);



