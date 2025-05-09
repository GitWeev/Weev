use weev;
UPDATE main_image
SET Path = '../../../assets/images/2W/Okinawa/iPraise+/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (36);

UPDATE main_image
SET Path = '../../../assets/images/2W/Hop/OXO/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (31);

UPDATE main_image
SET Path = '../../../assets/images/2W/Rowwet/Trono/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (39);

UPDATE main_image
SET Path = '../../../assets/images/2W/River/Indie/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (40);


SET SQL_SAFE_UPDATES = 0;

DELETE FROM twimagedata
WHERE TW_Ref_ID = 31;

DELETE FROM twimagedata
WHERE TW_Ref_ID = 36;

INSERT INTO `twimagedata` 
VALUES
(
    31, 31, '../../../assets/images/2W/Hop/OXO/Color', 'Hop-OXO-Twilight Grey', '', '', 'Hop-OXO-True Black',  '', 'Hop-OXO-Candy Red', 'Hop-OXO-Magnetic Blue', '', 'Hop-OXO-Electric Yellow', '', '', '', '', ''
  );
  INSERT INTO `twimagedata` 
VALUES
   (
    36, 36, '../../../assets/images/2W/Okinawa/iPraise+/Color', '', '', '', 'Okinava-iPraise+ -Black',  'Okinava-iPraise+ -Liquid Metal', 'Okinava-iPraise+ -Red', 'Okinava-iPraise+ -Ocean Blue', '', '', 'Okinava-iPraise+ -Electric Mauve Purple', 'Okinava-iPraise+ -Electric Green', '', '', ''
  );
 
