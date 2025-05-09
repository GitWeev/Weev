 
 use weev;
SET SQL_SAFE_UPDATES = 0;
 UPDATE main_image
SET Path = '../../../assets/images/2W/Hop/OXO/Images', 
    Image1 = '1'
WHERE TW_Ref_ID IN (32);

UPDATE main_image
SET Path = '../../../assets/images/2W/Okinawa/iPraise-Plus/Images'
WHERE TW_Ref_ID = 36 AND Path = '../../../assets/images/2W/Okinawa/iPraise+/Images';

DELETE FROM twimagedata
WHERE TW_Ref_ID = 36;

INSERT INTO `twimagedata`
VALUES
  (
    36, 36, '../../../assets/images/2W/Okinawa/iPraise-Plus/Color', '', '', '', 'Okinava-iPraise-Plus-Black',  'Okinava-iPraise-Plus-Liquid Metal', 'Okinava-iPraise-Plus-Red', 'Okinava-iPraise-Plus-Ocean Blue', '', '', 'Okinava-iPraise-Plus-Electric Mauve Purple', 'Okinava-iPraise-Plus-Electric Green', '', '', ''
  )