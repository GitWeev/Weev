Use weev;
SET SQL_SAFE_UPDATES = 0;

UPDATE twowheelerdata
SET ExShowroomPrice = CASE 
    WHEN manufacturer = 'Ola' AND model = 'S1 Air' AND variant = 'STD' THEN 125885
    WHEN manufacturer = 'Ola' AND model = 'S1' AND variant = 'STD' THEN 69999
    WHEN manufacturer = 'Ola' AND model = 'S1 Pro' AND variant = 'STD' THEN 152000
    WHEN manufacturer = 'Ather' AND model = '450X' AND variant = 'STD' THEN 127000
    WHEN manufacturer = 'Ather' AND model = '450X' AND variant = 'With Pro Pack' THEN 179000
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'STD' THEN 94999
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'S' THEN 117642
    WHEN manufacturer = 'TVS' AND model = 'iQube' AND variant = 'ST' THEN 145000
    WHEN manufacturer = 'Revolt' AND model = 'RV400' AND variant = 'STD' THEN 123750
    WHEN manufacturer = 'Revolt' AND model = 'RV400 BRZ' AND variant = 'STD' THEN 129950
    WHEN manufacturer = 'Bajaj' AND model = 'Chetak' AND variant = 'Premium' THEN 115000
    WHEN manufacturer = 'Bajaj' AND model = 'Chetak' AND variant = 'Premium 2023' THEN 99999
    WHEN manufacturer = 'Hero' AND model = 'Vida' AND variant = 'Plus' THEN 115000
    WHEN manufacturer = 'Hero' AND model = 'Vida' AND variant = 'Pro' THEN 159000
    WHEN manufacturer = 'Simple' AND model = 'One' AND variant = 'STD' THEN 139000
    WHEN manufacturer = 'Simple' AND model = 'One' AND variant = 'Extra Range' THEN 167000
    WHEN manufacturer = 'Torq' AND model = 'Kratos' AND variant = 'STD' THEN 132000
    WHEN manufacturer = 'Torq' AND model = 'Kratos' AND variant = 'R' THEN 149999
    WHEN manufacturer = 'Ampere' AND model = 'Magnus EX' AND variant = 'Top' THEN 84900
    WHEN manufacturer = 'Okinawa' AND model = 'PraisePro' AND variant = 'STD' THEN 84443
    WHEN manufacturer = 'Okinawa' AND model = 'Okhi90' AND variant = 'STD' THEN 149999
    WHEN manufacturer = 'Okinawa' AND model = 'iPraise+' AND variant = 'STD' THEN 123155
    WHEN manufacturer = 'Oben' AND model = 'Rorr' AND variant = 'STD' THEN 149999
    WHEN manufacturer = 'Kabira Mobility' AND model = 'KM 4000' AND variant = 'STD' THEN 151999
    WHEN manufacturer = 'Kabira Mobility' AND model = 'KM 3000' AND variant = 'STD' THEN 149999
    WHEN manufacturer = 'Odys' AND model = 'Evoqis' AND variant = 'STD' THEN 117999
    WHEN manufacturer = 'Atumobile' AND model = 'Atum Vader' AND variant = 'STD' THEN 109999
    WHEN manufacturer = 'Atumobile' AND model = 'Atum 1.0' AND variant = 'STD' THEN 61500
    WHEN manufacturer = 'Pure EV' AND model = 'eTryst 350' AND variant = 'STD' THEN 129999
    WHEN manufacturer = 'Pure EV' AND model = 'Epluto 7G' AND variant = 'STD' THEN 77999
    WHEN manufacturer = 'Pure EV' AND model = 'Neo Etrance' AND variant = 'STD' THEN 73999
    WHEN manufacturer = 'Pure EV' AND model = 'EcoDryft' AND variant = 'Standard' THEN 99999
    WHEN manufacturer = 'Pure EV' AND model = 'EcoDryft' AND variant = '350' THEN 109999
    WHEN manufacturer = 'Hop' AND model = 'OXO' AND variant = 'STD' THEN 127999
    WHEN manufacturer = 'Hop' AND model = 'OXO' AND variant = 'Pro' THEN 132999
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'Prime' THEN 133499
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'Standard' THEN 127922
    WHEN manufacturer = 'HOP' AND model = 'OXO' AND variant = 'X' THEN 160999
    WHEN manufacturer = 'One Electric Motorcycles' AND model = 'KRIDN' AND variant = 'STD' THEN 134999
    WHEN manufacturer = 'River' AND model = 'Indie' AND variant = 'STD' THEN 109999
    WHEN manufacturer = 'Komaki' AND model = 'Ranger' AND variant = 'STD' THEN 119999
    WHEN manufacturer = 'Komaki' AND model = 'MX3' AND variant = 'STD' THEN 129999
    WHEN manufacturer = 'EVeium' AND model = 'czar' AND variant = 'STD' THEN 99999
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery As A Service' THEN 115000
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery As A Service Pro' THEN 125000
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'With Battery' THEN 109999
    WHEN manufacturer = 'Bounce' AND model = 'Infinity e.1' AND variant = 'Limited Edition' THEN 129999
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '3.5 kWh' THEN 99999
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '4.5 kWh' THEN 114999
    WHEN manufacturer = 'Ola' AND model = 'Roadster' AND variant = '6 kWh' THEN 144999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '2.5 kWh' THEN 89999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '3.5 kWh' THEN 104999
    WHEN manufacturer = 'Ola' AND model = 'Roadster X' AND variant = '4.5 kWh' THEN 124999
    WHEN manufacturer = 'Ola' AND model = 'Roadster Pro' AND variant = '8 kWh' THEN 149999
    WHEN manufacturer = 'Ola' AND model = 'Roadster Pro' AND variant = '16 kWh' THEN 174999
    WHEN manufacturer = 'Matter' AND model = 'Aera' AND variant = '5000' THEN 524999
    WHEN manufacturer = 'Matter' AND model = 'Aera' AND variant = '5000+' THEN 554999
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77' AND variant = 'ORIGNAL' THEN 1200000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77' AND variant = 'RECON' THEN 1450000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Limited' AND variant = 'STD' THEN 1499999
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Mach 2' AND variant = 'Standard' THEN 1550000
    WHEN manufacturer = 'Ultraviolette' AND model = 'F77 Mach 2' AND variant = 'Recon' THEN 1750000
    ELSE ExShowroomPrice
END;
