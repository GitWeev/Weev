Use weev;
SET SQL_SAFE_UPDATES = 0;

UPDATE twowheelerdata
SET ExShowroomPrice = CASE 
    WHEN manufacturer = 'Ola' AND model = 'S1 Air' AND variant = 'STD' THEN 89999
    WHEN manufacturer = 'Ola' AND model = 'S1' AND variant = 'STD' THEN 69999
    WHEN manufacturer = 'Ola' AND model = 'S1 Pro' AND variant = 'STD' THEN 115999
    WHEN manufacturer = 'Ather' AND model = '450X' AND variant = 'STD' THEN 149047
    WHEN manufacturer = 'Ather' AND model = '450X' AND variant = 'With Pro Pack' THEN 166047
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'STD' THEN 94434
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'S' THEN 118000
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'ST' THEN 127935
    WHEN manufacturer = 'Revolt' AND model = 'RV400' AND variant = 'STD' THEN 123750
    WHEN manufacturer = 'Revolt' AND model = 'RV400 BRZ' AND variant = 'STD' THEN 129950
    WHEN manufacturer = 'Bajaj' AND model = 'Chetak' AND variant = 'Premium' THEN 109998
    WHEN manufacturer = 'Bajaj' AND model = 'Chetak' AND variant = 'Premium 2023' THEN 151958
    WHEN manufacturer = 'Hero' AND model = 'Vida' AND variant = 'Plus' THEN 85300
    WHEN manufacturer = 'Hero' AND model = 'Vida' AND variant = 'Pro' THEN 120300
    WHEN manufacturer = 'Simple' AND model = 'One' AND variant = 'STD' THEN 139999
    WHEN manufacturer = 'Simple' AND model = 'One' AND variant = 'Extra Range' THEN 166694
    WHEN manufacturer = 'Torq' AND model = 'Kratos' AND variant = 'STD' THEN 122499
    WHEN manufacturer = 'Torq' AND model = 'Kratos' AND variant = 'R' THEN 149999
    WHEN manufacturer = 'Ampere' AND model = 'Magnus EX' AND variant = 'Top' THEN 84900
    WHEN manufacturer = 'Okinawa' AND model = 'PraisePro' AND variant = 'STD' THEN 84443
    WHEN manufacturer = 'Okinawa' AND model = 'Okhi90' AND variant = 'STD' THEN 149999
    WHEN manufacturer = 'Okinawa' AND model = 'iPraise+' AND variant = 'STD' THEN 123155
    WHEN manufacturer = 'Oben' AND model = 'Rorr' AND variant = 'STD' THEN 118999
    WHEN manufacturer = 'Kabira Mobility' AND model = 'KM 4000' AND variant = 'STD' THEN 160999
    WHEN manufacturer = 'Kabira Mobility' AND model = 'KM 3000' AND variant = 'STD' THEN 160999
    WHEN manufacturer = 'Odysse' AND model = 'Evoqis' AND variant = 'STD' THEN 171250
    WHEN manufacturer = 'Atumobile' AND model = 'Atum Vader' AND variant = 'STD' THEN 108500
    WHEN manufacturer = 'Atumobile' AND model = 'Atum 1.0' AND variant = 'STD' THEN 61500
    WHEN manufacturer = 'Pure EV' AND model = 'eTryst 350' AND variant = 'STD' THEN 129999
    WHEN manufacturer = 'Pure EV' AND model = 'Epluto 7G' AND variant = 'STD' THEN 77999
    WHEN manufacturer = 'Pure EV' AND model = 'Neo Etrance' AND variant = 'STD' THEN 73999
    WHEN manufacturer = 'Pure EV' AND model = 'EcoDryft' AND variant = 'Standard' THEN 99999
    WHEN manufacturer = 'Pure EV' AND model = 'EcoDryft' AND variant = '350' THEN 109999
    WHEN manufacturer = 'Hop' AND model = 'OXO' AND variant = 'STD' THEN 127999
    WHEN manufacturer = 'Hop' AND model = 'OXO' AND variant = 'Pro' THEN 166999
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'Prime' THEN 133499
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'Standard' THEN 127922
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'X' THEN 160999
    WHEN manufacturer = 'One Electric Motorcycles' AND model = 'KRIDN' AND variant = 'STD' THEN 134999
    WHEN manufacturer = 'River' AND model = 'Indie' AND variant = 'STD' THEN 142999
    WHEN manufacturer = 'Komaki' AND model = 'Ranger' AND variant = 'STD' THEN 139999
    WHEN manufacturer = 'Komaki' AND model = 'MX3' AND variant = 'STD' THEN 114509
    WHEN manufacturer = 'EVeium' AND model = 'czar' AND variant = 'STD' THEN 207700
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery As A Service' THEN 115605
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery As A Service Pro' THEN 115605
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery' THEN 118125
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'Limited Edition' THEN 125615
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '3.5 kWh' THEN 104999
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '4.5 kWh' THEN 119999
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '6 kWh' THEN 139999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '2.5 kWh' THEN 99999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '3.5 kWh' THEN 109999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '4.5 kWh' THEN 124999
    WHEN manufacturer = 'Ola' AND model = 'Roadster Pro' AND variant = '8 kWh' THEN 199999
    WHEN manufacturer = 'Ola' AND model = 'Roadster Pro' AND variant = '16 kWh' THEN 249999
    WHEN manufacturer = 'Matter' AND model = 'Aera' AND variant = '5000' THEN 183308
    WHEN manufacturer = 'Matter' AND model = 'Aera' AND variant = '5000+' THEN 193826
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77' AND variant = 'ORIGNAL' THEN 399000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77' AND variant = 'RECON' THEN 299000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Limited' AND variant = 'STD' THEN 299000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Mach 2' AND variant = 'Standard' THEN 299000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Mach 2' AND variant = 'Recon' THEN 399000
	WHEN manufacturer = 'Okaya' AND model = 'Faast' AND variant = 'F4' THEN 109999
	WHEN manufacturer= 'Ather' AND model= 'Rizta' AND variant= 'S' THEN 111999
    WHEN manufacturer= 'Ather' AND model= 'Rizta' AND variant= 'Z (2.9 kWh)' THEN 131547
	WHEN manufacturer= 'Ather' AND model= 'Rizta' AND variant= 'Z (3.7 kWh)' THEN 151547
    ELSE ExShowroomPrice
END;



Use weev;
SET SQL_SAFE_UPDATES = 0;
UPDATE twowheelerdata
SET Variant = CASE 
    WHEN TWid=3 AND manufacturer = 'Ola' AND model = 'S1 Pro'  THEN '3 kWh'
    WHEN TWid=4 AND manufacturer = 'Ather' AND model = '450X' THEN '2.9 kWh'
    WHEN TWid=5 AND manufacturer = 'Ather' AND model = '450X'  THEN '2.9 kWh Pro Pack'
    WHEN TWid=6 AND manufacturer = 'TVS' AND model = 'iQube' THEN 'STD 2.2 kWh'
    WHEN TWid=7 AND manufacturer = 'TVS' AND model = 'iQube' THEN 'ST 3.5 kWh'
    WHEN TWid=8 AND manufacturer = 'TVS' AND model = 'iQube' THEN 'ST 3.5kWh'
    WHEN TWid=9 AND manufacturer = 'Revolt' AND model = 'RV400' THEN 'STD'
    WHEN TWid=57 AND manufacturer = 'Revolt' AND model = 'RV400 BRZ'  THEN 'STD'
    WHEN TWid=10 AND manufacturer = 'Bajaj' AND model = 'Chetak' THEN '3001'
    WHEN TWid=11 AND manufacturer = 'Bajaj' AND model = 'Chetak'  THEN 'Premium 2023'
    WHEN TWid=12 AND manufacturer = 'Hero' AND model = 'Vida' THEN 'V2 Plus'
    WHEN TWid=13 AND manufacturer = 'Hero' AND model = 'Vida'  THEN 'V2 Pro'
    WHEN TWid=14 AND manufacturer = 'Simple' AND model = 'One'  THEN 'STD'
    WHEN TWid=15 AND manufacturer = 'Simple' AND model = 'One'  THEN 'Extra Range'
    WHEN TWid=18 AND manufacturer = 'Ampere' AND model = 'Magnus EX' THEN 'STD'
    WHEN TWid=19 AND manufacturer = 'Okinawa' AND model = 'PraisePro'  THEN 'STD'
    WHEN TWid=30 AND manufacturer = 'Okinawa' AND model = 'Okhi90'  THEN 'STD'
    WHEN TWid=36 AND manufacturer = 'Okinawa' AND model = 'iPraise+'  THEN 'STD'
    WHEN TWid=20 AND manufacturer = 'Oben' AND model = 'Rorr'  THEN 'STD'
    WHEN TWid=22 AND manufacturer = 'Odysse' AND model = 'Evoqis' THEN 'STD'
    WHEN TWid=24 AND manufacturer = 'Atumobile' AND model = 'Atum Vader'  THEN 'S'
    WHEN TWid=25 AND manufacturer = 'Atumobile' AND model = 'Atum 1.0'  THEN 'STD'
    WHEN TWid=27 AND manufacturer = 'Pure EV' AND model = 'eTryst 350' THEN 'STD'
    WHEN TWid=28 AND manufacturer = 'Pure EV' AND model = 'Epluto 7G'  THEN 'CX'
    WHEN TWid=29 AND manufacturer = 'Pure EV' AND model = 'Neo Etrance' THEN 'SX'
    WHEN TWid=31 AND manufacturer = 'Hop' AND model = 'OXO'  THEN 'Prime'
    WHEN TWid=32 AND manufacturer = 'Hop' AND model = 'OXO' THEN 'STD'
    WHEN TWid=61 AND manufacturer = 'HOP' AND model = 'OXO' THEN 'X'
    WHEN TWid=32 AND manufacturer = 'HOP' AND model = 'OXO'  THEN 'Pro'
    WHEN TWid=60 AND manufacturer = 'HOP' AND model = 'OXO' THEN 'STD'
    WHEN TWid=38 AND manufacturer = 'One Electric Motorcycles' AND model = 'KRIDN'  THEN 'STD'
    WHEN TWid=40 AND manufacturer = 'River' AND model = 'Indie'  THEN 'STD'
    WHEN TWid=41 AND manufacturer = 'Komaki' AND model = 'Ranger'  THEN 'XP'
    WHEN TWid=58 AND manufacturer = 'Komaki' AND model = 'MX3'  THEN 'STD'
    WHEN TWid=42 AND manufacturer = 'EVeium' AND model = 'czar'  THEN 'STD'
    WHEN TWid=43 AND manufacturer = 'Bounce' AND model = 'Infinity e.1' THEN 'X'
    WHEN TWid=44 AND manufacturer = 'Bounce' AND model = 'Infinity e.1' THEN 'Plus'
    WHEN TWid=45 AND manufacturer = 'Bounce' AND model = 'Infinity e.1'  THEN 'STD'
    WHEN TWid=46 AND manufacturer = 'Bounce' AND model = 'Infinity e.1'  THEN 'Limited Edition'
    WHEN TWid=1 AND manufacturer = 'Ola' AND model = 'S1 Air'  THEN 'STD'
	WHEN TWid= 17  AND manufacturer='Torq' AND model='Kratos' THEN'R'
	WHEN TWid=26   AND manufacturer='Atumobile' AND model='Atum 1.0' THEN'STD'
	WHEN TWid=33   AND manufacturer='Ultraviolette' AND model='F77' THEN'ORIGINAL'
    WHEN TWid=34   AND manufacturer='Ultraviolette' AND model='F77' THEN'RECON'
    WHEN TWid=35   AND manufacturer='Ultraviolette' AND model='F77 Limited' THEN' STD'
    WHEN TWid=37   AND manufacturer='Okaya' AND model='Faast' THEN'F4'
    WHEN TWid=47   AND manufacturer='Ola' AND model='Roadster' THEN'3.5 kWh'
    WHEN TWid=48   AND manufacturer='Ola' AND model='Roadster' THEN'4.5 kWh'
    WHEN TWid=49   AND manufacturer='Ola' AND model='Roadster' THEN'6 kWh'
    WHEN TWid=50   AND manufacturer='Ola' AND model='Roadster X' THEN'2.5 kWh'
    WHEN TWid=51   AND manufacturer='Ola' AND model='Roadster X' THEN'3.5 kWh'
    WHEN TWid=52   AND manufacturer='Ola' AND model='Roadster X' THEN'4.5 kWh'
    WHEN TWid=53   AND manufacturer='Ola' AND model='Roadster Pro' THEN'8 kWh'
    WHEN TWid=54   AND manufacturer='Ola' AND model='Roadster Pro' THEN'16 kWh'
    WHEN TWid=55   AND manufacturer='Matter' AND model='Aera' THEN'5000'
    WHEN TWid=56   AND manufacturer='Matter' AND model='Aera' THEN'5000+'
    WHEN TWid=59   AND manufacturer='HOP' AND model='OXO' THEN'Prime'
    WHEN TWid=62   AND manufacturer='PURE EV' AND model='EcoDryft' THEN'STD'
    WHEN TWid=63   AND manufacturer='PURE EV' AND model='EcoDryft' THEN'350'
    WHEN TWid=64   AND manufacturer='Ather' AND model='Rizta' THEN'S'
    WHEN TWid=65   AND manufacturer='Ather' AND model='Rizta' THEN'Z(2.9 kWh)'
    WHEN TWid=66   AND manufacturer='Ather' AND model='Rizta' THEN'Z (3.7 kWh)'
    WHEN TWid=67   AND manufacturer='Ultraviolette' AND model='F77 Mach 2' THEN' STD'
    WHEN TWid=68   AND manufacturer='Ultraviolette' AND model='F77 Mach 2' THEN'Recon'
    WHEN TWid=2    AND manufacturer= 'Ola' AND model='S1' THEN 'STD'
	WHEN TWid=16   AND manufacturer= 'Torq' AND model='Kratos' THEN 'STD'
    WHEN TWid=21   AND manufacturer= 'Kabira Mobility' AND model='KM 4000' THEN 'STD'
    WHEN TWid=23   AND manufacturer= 'Kabira Mobility' AND model='KM 3000' THEN 'STD'





	ELSE Available
END;

UPDATE twowheelerdata 
SET manufacturer="Tork"
WHERE manufacturer="Torq";

