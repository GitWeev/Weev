use weev;
SELECT * FROM weev.twowheelerdata;
ALTER TABLE Customerenquiries ADD COLUMN Url VARCHAR(2083);
SET SQL_SAFE_UPDATES = 0;




DROP PROCEDURE InsertCustomerenquiries;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomerenquiries`(
    IN UserNames VARCHAR(45),
    IN Emails VARCHAR(50),
    IN Mobiles VARCHAR(15), -- Increased length for flexibility
    IN Url VARCHAR(1000)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM customerenquiries 
        WHERE UserName = UserNames 
          AND email = Emails 
          AND Mobile = Mobiles 
          AND Url = Url
    ) 
    THEN
        INSERT INTO customerenquiries (UserName, email, Mobile, Url) 
        VALUES (UserNames, Emails, Mobiles, Url);
    END IF;
END $$

DELIMITER ;
