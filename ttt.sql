DROP TABLE IF EXISTS tier, preise,animal;
CREATE TABLE tier(
   tiernummer INTEGER,
   tiername varchar(225),
   tierart varchar(200),
   geburstjahr DATE NOT NULL
   );
   
CREATE TABLE IF NOT EXISTS preise(
   tiernummer INTEGER,
   preis FLOAT,
   kaufjahr date
   );
INSERT INTO preise VALUES(1, 1000,"2022-01-01"),
(2, "500","2023-01-03"),
(3, "1500", "2023-05-06");

INSERT INTO tier VALUES(1, "bELLO","Hund","2002-03-03"),
(2, "Socke","Katze","2004-03-03");

ALTER TABLE tier
ADD COLUMN FRR VARCHAR(200),
ADD primary key (tiernummer);

ALTER TABLE preise
ADD primary key (tiernummer);

SET SQL_SAFE_UPDATES = 0;

UPDATE tier 
SET FRR = 'PP' 
WHERE tierart = 'Hund';

UPDATE  tier
SET FRR = "KK"
WHERE tierart = "Katze";

SET SQL_SAFE_UPDATES = 1;
INSERT INTO  tier VALUES(3,"KING", "Vögel", "1999-01-01","ZZZ");

RENAME TABLE tier TO animal;

INSERT into animal Values (4, "ANNA", "Hund", "1999-12-12","tt");

INSERT INTO preise VALUES(4, "300","1777-03-06");

SELECT 
*



from animal t

LEFT JOIN preise p ON t.tiernummer = p.tiernummer
WHERE p.kaufjahr between "1776-01-01" and "1778-01-02"

