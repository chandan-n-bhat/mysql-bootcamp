USE martian_db;

SHOW TABLES;

DROP TABLE IF EXISTS base;
DROP TABLE IF EXISTS martian;

CREATE TABLE base(
    base_id    INT    PRIMARY KEY AUTO_INCREMENT,
    base_name    VARCHAR(30),
    founded    DATE
);

CREATE TABLE supply(
    supply_id   INT    PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(15),
    description    VARCHAR(100),
    quantity    INT
);

CREATE TABLE martian(
    martian_id    INT    PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(20),
    last_name    VARCHAR(20),
    base_id    INT,
    super_id   INT,
    FOREIGN KEY(base_id) REFERENCES base(base_id),
    FOREIGN KEY(super_id) REFERENCES martian(martian_id)
)

CREATE TABLE inventory(
    base_id    INT,
    supply_id    INT,
    quantity    INT,
    PRIMARY KEY(base_id,supply_id),
    FOREIGN KEY(base_id) REFERENCES base(base_id),
    FOREIGN KEY(supply_id) REFERENCES supply(supply_id)
);

CREATE TABLE visitor(
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    host_id    INT,
    first_name    VARCHAR(20),
    last_name    VARCHAR(20),
    FOREIGN KEY(host_id) REFERENCES martian(martian_id)
)

-- Insert Statements
INSERT INTO base (base_name,founded)
VALUES ('Tharisland','2037-06-03'),
('Valles Marineris 2.0','2040-12-01'),
('Gale Cratertown','2041-08-15'),
('New New New York','2042-02-10'),
('Olympus Mons Spa & Casino',NULL);


INSERT INTO supply(name,description,quantity)
VALUES ('Solar Panel','Standard 1x1 meter cell',912),
('Water Filter','This takes things out of your water',6),
('Duct Tape','A 10 meter roll of duct tape',951),
('Ketchup','It\'s Ketchup...',206),
('Battery Cell','Standard 1000kAh battery cell for power grid',17),
('USB 6.0 Cable','Carbon fibre coated/ 15Tbs spool',42),
('Fuzzy Duster','It gets dusty around here',19),
('Mars Bars','The original nutrient bar made with the finest ingredients',3801),
('Air Filter','Removes 99% of all martian dust from ventilation unit',23),
('Famous Pizza','This favourite is covered in all your favorite toppings',823);


INSERT INTO inventory(base_id,supply_id,quantity)
VALUES(1,1,8),
(1,3,5),
(1,5,1),
(1,6,2),
(1,8,12),
(1,9,1),
(2,4,5),
(2,8,62),
(2,10,37),
(3,2,11),
(3,7,2),
(4,10,91);

INSERT INTO martian(first_name,last_name,base_id,super_id)
VALUES ('Ray','Bradbury',1,NULL),
('John','Black',4,10),
('Samuel','Hinkston',4,2),
('Jeff','Spender',1,9),
('Sam','Parkhill',2,12),
('Elma','Parkhill',3,8),
('Melissa','Lewis',1,1),
('Mark','Watney',3,NULL),
('Beth','Johanssen',1,1),
('Chris','Beck',4,NULL),
('Nathaniel','York',4,2),
('Elon','Musk',2,NULL),
('John','Carter',NULL,8);

INSERT INTO visitor (host_id,first_name,last_name)
VALUES (7,'George','Ambrose'),
(1,'Kris','Cardenas'),
(9,'Priscilla','Lane'),
(11,'Jane','Thornton'),
(NULL,'Doug','Stavenger'),
(NULL,'Jamie','Waterman'),
(8,'Martin','Humphries');