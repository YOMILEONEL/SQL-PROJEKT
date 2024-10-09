USE business;
DROP TABLE IF EXISTS users, autos, locations, bezahlung,reparatur,vertrag;
CREATE TABLE IF NOT EXISTS users(
   user_id INTEGER primary KEY NOT NULL,
   username VARCHAR(200) not null,
   user_birthday DATE,
   roles enum("VERMIETER", "MIETER") not null,
   telefonnummer varchar(20)
   );
  
  
CREATE TABLE autos(
   auto_id INTEGER primary KEY NOT NULL,
   marke VARCHAR(200),
   auto_status enum("VERFÜGBAR", "GEMIETEN","KAPUTT"),
   tagspreis INTEGER
   );
   
CREATE TABLE locations(
   location_id INTEGER primary key not null,
   user_id INTEGER,
   auto_id INTEGER,
   location_start DATE,
   location_ende DATE,
   location_status enum("Aktiv", "FERTIG", "ABGELEHNT"),
   location_preis INTEGER,
   foreign key (user_id) references users(user_id),
   foreign key (auto_id) references autos(auto_id)
   );
   
CREATE TABLE bezahlung(
   bezahlung_id INTEGER primary key not null,
   location_id INTEGER,
   preis INTEGER,
   bezahlumgsdatum DATE,
   foreign key (location_id) references locations(location_id)
   );
   
CREATE TABLE reparatur(
   reparatur_id INTEGER PRIMARY KEY NOT NULL,
   auto_id INTEGER,
   reparatur_preis INTEGER,
   foreign key (auto_id) references autos(auto_id)
   );
   
CREATE TABLE vertrag(
   vertrag_id INTEGER PRIMARY KEY NOT NULL,
   location_id INTEGER,
   vertrag_datum DATE,
   foreign key (location_id) references locations(location_id)
   );
   
   
INSERT INTO users values("0","PAUL","2000-01-01", "VERMIETER","77777"),
("1","MAXIS","1999-02-02","MIETER","4848"),
("2","ALEX","1998-05-06","MIETER","4333");


INSERT INTO autos VALUES
(11, 'PORSCHE', 'GEMIETEN', 1000),
(12, 'BMW', 'VERFÜGBAR', 800),
(13, 'AUDI', 'KAPUTT', 900);

INSERT INTO locations VALUES
(101, 2, 11, '2024-10-01', '2024-10-07', 'Aktiv', 7000);

INSERT INTO vertrag VALUES
(201, 101, '2024-10-01');

INSERT INTO reparatur VALUES
(301, 13, 500);

SELECT 

* 

FROM users u
INNER JOIN locations l ON u.user_id = l.user_id
INNER JOIN autos a on l.auto_id= a.auto_id
INNER JOIN vertrag v on l.location_id = v.location_id
