 use weev;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM twimagedata
WHERE TW_Ref_ID = 19;

INSERT INTO `twimagedata`
VALUES(
    19, 19, '../../../assets/images/2W/Okinawa/PraisePro/Color', '', '', '', 'Okinawa-PrasePro-Sparkle Black', '', 'Okinawa-PrasePro-Glosy Red Black', 'Okinawa-PrasePro-Sparkle Blue', '', '', '', 'Okinawa-PrasePro-Seafoam Green', '', 'Okinawa-PrasePro-Sun Orange', 'Okinawa-PrasePro-Mocha Brown'
  );
  
  INSERT INTO `twimagedata` 
VALUES
  (
44, 44,'../../../assets/images/2W/Bounce/Inifinity E1/Color','Bounce-Infinity E1-Comet Grey','', 'Bounce-Infinity E1-Pearl White', 'Bounce-Infinity E1-Sparkle Black', 'Bounce-Infinity E1-Sporty Red','', 'Bounce-Infinity E1-Desat Silver', '', '', '', '', '', '', '')

;
INSERT INTO `twimagedata` 
VALUES
  (
45, 45,'../../../assets/images/2W/Bounce/Inifinity E1/Color','Bounce-Infinity E1-Comet Grey','', 'Bounce-Infinity E1-Pearl White', 'Bounce-Infinity E1-Sparkle Black', 'Bounce-Infinity E1-Sporty Red','', 'Bounce-Infinity E1-Desat Silver', '', '', '', '', '', '', '')

;
INSERT INTO `twimagedata` 
VALUES
  (
46, 46,'../../../assets/images/2W/Bounce/Inifinity E1/Color','Bounce-Infinity E1-Comet Grey','', 'Bounce-Infinity E1-Pearl White', 'Bounce-Infinity E1-Sparkle Black', 'Bounce-Infinity E1-Sporty Red','', 'Bounce-Infinity E1-Desat Silver', '', '', '', '', '', '', '')

;
DELETE FROM main_image
WHERE TW_Ref_ID = 44;
INSERT INTO `main_image`
VALUES (
  44,'../../../assets/images/2W/Bounce/Inifinity E1/Images','1', '2', '3', '4', '5','6', '7', '8', '9',
  '', '', '', '', '',
  '', '', '', '', '',''
);
DELETE FROM main_image
WHERE TW_Ref_ID = 45;
INSERT INTO `main_image`
VALUES (
  45,'../../../assets/images/2W/Bounce/Inifinity E1/Images','1', '2', '3', '4', '5','6', '7', '8', '9',
  '', '', '', '', '',
  '', '', '', '', '',''
);
DELETE FROM main_image
WHERE TW_Ref_ID = 46;
INSERT INTO `main_image`
VALUES (
  46,'../../../assets/images/2W/Bounce/Inifinity E1/Images','1', '2', '3', '4', '5','6', '7', '8', '9',
  '', '', '', '', '',
  '', '', '', '', '',''
);
DELETE FROM twimagedata
WHERE TW_Ref_ID = 32;
INSERT INTO `twimagedata` 
VALUES
(
    32, 32, '../../../assets/images/2W/Hop/OXO/Color', 'Hop-OXO-Twilight Grey', '', '', 'Hop-OXO-True Black',  '', 'Hop-OXO-Candy Red', 'Hop-OXO-Magnetic Blue', '', 'Hop-OXO-Electric Yellow', '', '', '', '', ''
  );

UPDATE `twowheelerdata`
SET VariantType='Base'
WHERE TWId in('11');

