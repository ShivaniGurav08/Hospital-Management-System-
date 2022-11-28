
-- Over All Hotels Data PROJECT With Using CRUD(CREATE,READ,UPDATE,DELETE) Operations--

-- Creating database --

CREATE DATABASE DATA;
USE DATA;

-- creating table 1 --
CREATE TABLE Hospitals_Data(
ProviderID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
HospitalName VARCHAR(100) NOT NULL,
Address VARCHAR(90) NULL ,
City VARCHAR(50) NOT NULL,
State VARCHAR(500) NULL,
ZIPCode INT,
CountyName VARCHAR(60) NOT NULL,
Contact	VARCHAR(30) NULL
);

DESCRIBE Hospitals_Data;

-- Inserting records in table 1 --

INSERT INTO Hospitals_Data(HospitalName,Address,City,State,ZIPCode,CountyName,Contact)
VALUES
("DEKALB REGIONAL MEDICAL CENTER","200 MED CENTER DRIVE","FORT PAYNE","AL",35968,"DE KALB",2568453150),
("WEDOWEE HOSPITAL","209 NORTH MAIN STREET","WEDOWEE","AL",36278,"RANDOLPH",2563572111),
("HALE COUNTY HOSPITAL","508 GREEN STREET","GREENSBORO","AL",36744,"HALE",3346243024),
("CRESTWOOD MEDICAL CENTER","ONE HOSPITAL DR SE","HUNTSVILLE","AL",35801,"MADISON",2568823100),
("CHOCTAW GENERAL HOSPITAL","401 VANITY FAIR LANE, PO BOX 618","BUTLER","AL",36904,"CHOCTAW",2054599100),
("YUKON KUSKOKWIM DELTA REG HOSPITAL","PO BOX 287","BETHEL","AK",99559,"BETHEL",9075436300),
("NORTON SOUND REGIONAL HOSPITAL","1000 GREG KRUSCHEK AVENUE (P O BOX 966)","NOME","AK",99762,"NOME",9074433311),
("KANAKANAK HOSPITAL","P O BOX 130","DILLINGHAM","AK",99576,"DILLINGHAM",9078425201),
("MANIILAQ HEALTH CENTER","PO BOX 43","KOTZEBUE","AK",99752,"NORTHWEST ARCTIC",9074423321),
("FORT DEFIANCE INDIAN HOSPITAL","PO BOX 649","FORT DEFIANCE","AZ",86504,"APACHE",9287298000),
("TUBA CITY REGIONAL HEALTH CARE CORPORATION","PO BOX 600","TUBA CITY","AZ",86045,"COCONINO",9282832501),
("SELLS HOSPITAL","HIGHWAY 86, AT TOPAWA ROAD","SELLS","AZ",85634,"PIMA",5203627003),
("SAN CARLOS APACHE HEALTHCARE","103 MEDICINE WAY ROAD","PERIDOT","AZ",85542,"GILA",9284751200),
("CHINLE COMPREHENSIVE HEALTH CARE FACILITY","US HWY 191, HOSPITAL ROAD","CHINLE","AZ",86503,"APACHE",9286747001),
("HOPI HEALTH CARE CENTER","HIGHWAY 264, MILEPOST 388","POLACCA","AZ",86042,"NAVAJO",9287376000),
("HUHU KAM MEMORIAL HOSPITAL","483 WEST SEED FARM ROAD","SACATON","AZ",85147,"PINAL",5205623321),
("SAGE MEMORIAL HOSPITAL","STATE ROUTE 264 SOUTH 191","GANADO","AZ",86505,"APACHE",9287554541),
("CHI-ST VINCENT INFIRMARY","TWO ST VINCENT CIRCLE","LITTLE ROCK","AR",72205,"PULASKI",5015523000);


-- Creating table 2--
CREATE TABLE H_details(
HID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
HospitalType VARCHAR(50) ,	
Hospitalownership VARCHAR(80) NULL,
Emergencyservices ENUM("TRUE","FALSE"),
ProviderID INT NOT NULL,
FOREIGN KEY(ProviderID) REFERENCES Hospitals_Data(ProviderID));


DESCRIBE H_details;

-- Inserting records in table 2--
INSERT INTO H_details(HospitalType,Hospitalownership,Emergencyservices,ProviderID)
VALUES
("Acute Care Hospitals","Government - Hospital District or Authority","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="DEKALB REGIONAL MEDICAL CENTER" )),
("Acute Care Hospitals","Proprietary","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="WEDOWEE HOSPITAL")),
("Acute Care Hospitals","Government - Hospital District or Authority","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="HALE COUNTY HOSPITAL")),
("Acute Care Hospitals","Government - Local","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="CRESTWOOD MEDICAL CENTER")),
("Acute Care Hospitals","Proprietary","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="CHOCTAW GENERAL HOSPITAL")),
("Critical Access Hospitals","Voluntary non-profit - Private","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="YUKON KUSKOKWIM DELTA REG HOSPITAL")),
("Acute Care Hospitals","Tribal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="NORTON SOUND REGIONAL HOSPITAL")),
("Critical Access Hospitals","Tribal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="KANAKANAK HOSPITAL")),
("Critical Access Hospitals","Voluntary non-profit - Private","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="MANIILAQ HEALTH CENTER")),
("Critical Access Hospitals","Tribal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="FORT DEFIANCE INDIAN HOSPITAL")),
("Acute Care Hospitals","Government - Federal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="TUBA CITY REGIONAL HEALTH CARE CORPORATION")),
("Acute Care Hospitals","Voluntary non-profit - Other","FALSE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="SELLS HOSPITAL")),
("Acute Care Hospitals","Tribal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="SAN CARLOS APACHE HEALTHCARE")),
("Acute Care Hospitals","Government - Federal","FALSE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="CHINLE COMPREHENSIVE HEALTH CARE FACILITY")),
("Acute Care Hospitals","Government - Federal","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="HOPI HEALTH CARE CENTER")),
("Critical Access Hospitals","Tribal","FALSE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="HUHU KAM MEMORIAL HOSPITAL")),
("Critical Access Hospitals","Government - Hospital District or Authority","TRUE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="SAGE MEMORIAL HOSPITAL")),
("Critical Access Hospitals","Voluntary non-profit - Private","FALSE",( SELECT ProviderID FROM Hospitals_Data where HospitalName="CHI-ST VINCENT INFIRMARY"));

-- read operatiom --

-- HospitalName from DILLINGHAM country --
SELECT * FROM Hospitals_Data
WHERE CountyName="DILLINGHAM";

-- records using AND operator where
SELECT HospitalName,Address,City,CountyName FROM Hospitals_Data
WHERE State="AK" AND CountyName LIKE "D%";

-- records of multiple or condition which start with letter C -- 
SELECT HospitalName,Address,City,State,CountyName FROM Hospitals_Data
WHERE State="AL" OR CountyName LIKE "C%";

-- records in ascending order --
SELECT * FROM Hospitals_Data
ORDER BY HospitalName;

-- Concating two columns   STRING FUNCTIONS --
SELECT CONCAT(HospitalName," - ",City) AS Hospital_Details FROM Hospitals_Data;

-- AGGRIGATE FUNCTIONS --
SELECT COUNT(ProviderID) AS TotalNoOfHospitalsHavingEmergencyServices FROM H_details
WHERE Emergencyservices="TRUE";


-- records of HospitalName of state AZ With emergencyservices is in critical access hospitals
SELECT HospitalName,State FROM Hospitals_Data WHERE State="AZ"
UNION 
SELECT  Emergencyservices,HospitalType FROM H_details WHERE HospitalType="Critical Access Hospitals";

-- SUBQUERIES --
SELECT HospitalName FROM Hospitals_Data 
WHERE ProviderID IN (SELECT ProviderID  FROM H_details WHERE Emergencyservices="FALSE");


-- INNER JOINS --
SELECT H.HospitalName,H.Contact,D.Hospitalownership FROM Hospitals_Data H INNER JOIN H_details D ON
H.ProviderID=D.ProviderID;
 
 
 
 -- LEFT JOIN --
 SELECT * FROM Hospitals_Data LEFT JOIN H_details ON
 Hospitals_Data.ProviderID=H_details.ProviderID;
 
 
 -- RIGHT JOIN --
 SELECT HospitalName,Contact,Hospitalownership FROM Hospitals_Data RIGHT JOIN H_details ON
 Hospitals_Data.ProviderID=H_details.ProviderID;
 -- UPDATE --
 UPDATE h_details SET
 HospitalType="Critical Access Hospitals" WHERE HID=3;
 
 