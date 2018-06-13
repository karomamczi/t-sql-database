CREATE DATABASE sz_37305

USE sz_37305
GO

CREATE SCHEMA Euref AUTHORIZATION [dbo]
GO

CREATE TABLE Euref.Station (
  StationId int IDENTITY NOT NULL,
  Name nchar(9),
  City nvarchar(50),
  Country nvarchar(50),
  Latitude decimal(6,4),
  Longitude decimal(7,4),
  Height decimal(4,1),
  ModifiedDate datetime
)

CREATE TABLE Euref.TrackSystem (
  StationId int IDENTITY NOT NULL,
  TrackGps bit,
  TrackGlo bit,
  TrackGal bit,
  TrackBds bit,
  ModifiedDate datetime
)

CREATE TABLE Euref.StationConfiguration (
  StationId int IDENTITY NOT NULL,
  IntegrationDate date,
  OperatingInstitutionId int,
  ReceiverId int,
  AntennaId int,
  IndividualCalibration	bit,
  ModifiedDate datetime
)

CREATE TABLE Euref.Institution (
  OperatingInstitutionId int IDENTITY NOT NULL,
  Name nvarchar(200),
  Acronym nvarchar(20),
  AddressLine nvarchar(200),
  PostalCode nvarchar(20),
  City nvarchar(50),
  Country nvarchar(50),	
  ModifiedDate datetime
)

CREATE TABLE Euref.Receiver (
  ReceiverId int IDENTITY NOT NULL,
  Name nvarchar(50),	
  ModifiedDate datetime
)

CREATE TABLE Euref.Antenna (
  AntennaId int IDENTITY NOT NULL,
  Name nvarchar(50),
  ModifiedDate datetime,
  DummyColumn money
)

ALTER TABLE Euref.Antenna
DROP COLUMN DummyColumn


INSERT INTO Euref.Station (Name, City, Country, Latitude, Longitude, Height, ModifiedDate)
VALUES 
('AUTN00FRA', 'Autun', 'France', 46.9538, 4.2890, 353.0, GETDATE()),
('BPDL00POL', 'Biala Podlaska', 'Poland', 52.0352, 23.1273, 196.8, GETDATE()),
('CASE00ESP', 'Cassa de la Selva', 'Spain', 41.8828, 2.9042, 250.6, GETDATE()),
('DOUR00BEL', 'Dourbes', 'Belgium', 50.0949, 4.5949, 283.0, GETDATE()),
('GELL00DEU', 'Gellin', 'Germany', 53.4503, 14.3212, 75.3, GETDATE()),
('IENG00ITA', 'Torino', 'Italy ', 45.0151, 7.6394, 316.6, GETDATE()),
('KRA100POL', 'Krakow', 'Poland', 50.0661, 19.9204, 267.1, GETDATE()),
('KRAW00POL', 'Krakow', 'Poland', 50.0661, 19.9205, 267.3, GETDATE())

INSERT INTO Euref.TrackSystem (TrackGps, TrackGlo, TrackGal, TrackBds, ModifiedDate)
VALUES
(1, 1, 1, 1, GETDATE()),
(1, 1, 0, 0, GETDATE()),
(1, 1, 1, 1, GETDATE()),
(1, 1, 1, 0, GETDATE()),
(1, 1, 1, 1, GETDATE()),
(1, 1, 0, 0, GETDATE()),
(1, 1, 0, 0, GETDATE()),
(1, 0, 0, 0, GETDATE())

INSERT INTO Euref.Institution (Name, Acronym, AddressLine, PostalCode, City, Country, ModifiedDate)
VALUES
('Institut National de l''Information Geographique et Forestiere', 'IGN_RGP', 'avenue de Paris 73', '94165', 'Saint-Mandé', 'France', GETDATE()),
('ASG-EUPOS Management Center in Warsaw Head Office of Geodesy and Cartography', 'ASGEUPOS', 'Wspolna 2', '00-926', 'Warsaw', 'Poland', GETDATE()),
('Institut Cartografic i Geologic de Catalunya', 'ICGC', 'Parc de Montjuic', 'E-08038', 'Barcelona', 'Spain', GETDATE()),
('Royal Observatory of Belgium', 'ROB', 'avenue Circulaire 3', 'B-1180', 'Brussels', 'Belgium', GETDATE()),
('Bundesamt fuer Kartographie und Geodaesie', 'BKG', 'Richard-Strauss-Allee 11', 'D-60598', 'Frankfurt a.M.', 'Germany', GETDATE()),
('Istituto Nazionale di Ricerca Metrologica', 'INRIM', 'Strada delle Cacce 91', '10135', 'Torino', 'Italy', GETDATE()),
('AGH University of Science and Technology', 'AGH', 'Mickiewicz Avenue 30', '30-059', 'Krakow', 'Poland', GETDATE())

INSERT INTO Euref.Receiver (Name, ModifiedDate)
VALUES
('LEICA GR25', GETDATE()),
('TRIMBLE NETR5', GETDATE()),
('LEICA GR50', GETDATE()),
('SEPT POLARX4', GETDATE()),
('SEPT POLARX4TR', GETDATE()),
('ASHTECH UZ-12', GETDATE())

INSERT INTO Euref.Antenna (Name, ModifiedDate)
VALUES
('TRM57971.00 NONE', GETDATE()),
('TRM55971.00 TZGD', GETDATE()),
('LEIAR25.R4 NONE', GETDATE()),
('LEIAR25.R3 NONE', GETDATE()),
('LEIAR25.R4 LEIT', GETDATE()),
('ASH701945C_M NONE', GETDATE()),
('ASH701945C_M SNOW', GETDATE())

INSERT INTO Euref.StationConfiguration (IntegrationDate, OperatingInstitutionId, ReceiverId, AntennaId, IndividualCalibration, ModifiedDate)
VALUES 
('20050703', 1, 1, 1, 0, GETDATE()),
('20080608', 2, 2, 2, 1, GETDATE()),
('20160703', 3, 3, 3, 1, GETDATE()),
('19960114', 4, 4, 4, 1, GETDATE()),
('20160814', 5, 1, 5, 1, GETDATE()),
('20040201', 6, 5, 6, 0, GETDATE()),
('20100321', 7, 2, 1, 1, GETDATE()),
('20030126', 7, 6, 7, 0, GETDATE())

ALTER TABLE Euref.Station ADD CONSTRAINT PK_Station PRIMARY KEY (StationId)
ALTER TABLE Euref.StationConfiguration ADD CONSTRAINT PK_StationConfiguration PRIMARY KEY (StationId)
ALTER TABLE Euref.TrackSystem ADD CONSTRAINT PK_TrackSystem PRIMARY KEY (StationId)
ALTER TABLE Euref.Institution ADD CONSTRAINT PK_Institution PRIMARY KEY (OperatingInstitutionId)
ALTER TABLE Euref.Receiver ADD CONSTRAINT PK_Receiver PRIMARY KEY (ReceiverId)
ALTER TABLE Euref.Antenna ADD CONSTRAINT PK_Antenna PRIMARY KEY (AntennaId)

ALTER TABLE Euref.StationConfiguration 
ADD CONSTRAINT FK_OperatingInstitution_OperatingInstitutionId 
FOREIGN KEY (OperatingInstitutionId)
REFERENCES Euref.Institution (OperatingInstitutionId)

ALTER TABLE Euref.StationConfiguration 
ADD CONSTRAINT FK_Receiver_ReceiverId
FOREIGN KEY (ReceiverId)
REFERENCES Euref.Receiver (ReceiverId)

ALTER TABLE Euref.StationConfiguration 
ADD CONSTRAINT FK_Antenna_AntennaId
FOREIGN KEY (AntennaId)
REFERENCES Euref.Antenna (AntennaId)

ALTER TABLE Euref.StationConfiguration 
ADD CONSTRAINT CK_StationConfiguration_ValidIntegrationDate CHECK (IntegrationDate <= GETDATE())

SELECT 
  StationId AS [Identyfikator stacji],
  Name AS Nazwa,
  City AS Miasto,
  Country AS Pañstwo,
  Latitude AS [Szerokoœæ geograficzna],
  Longitude AS [D³ugoœæ geograficzna],
  Height AS Wysokoœæ,
  ModifiedDate AS [Data modyfikacji]
FROM Euref.Station


UPDATE Euref.TrackSystem SET ModifiedDate = GETDATE() WHERE StationId > 1 AND StationId < 5
SELECT * FROM Euref.TrackSystem

SELECT Name, Country FROM Euref.Institution
ORDER BY Country DESC

SELECT DISTINCT Country FROM Euref.Institution

SELECT
  PostalCode,
  CASE
	WHEN CHARINDEX('-', PostalCode) = 0 THEN PostalCode
	ELSE SUBSTRING(PostalCode, 1, CHARINDEX('-', PostalCode)-1) + SUBSTRING(PostalCode, CHARINDEX('-', PostalCode)+1, LEN(PostalCode))
  END AS NoDashPostalCode
FROM Euref.Institution

SELECT StationId, IntegrationDate FROM Euref.StationConfiguration
WHERE IntegrationDate BETWEEN '1995-01-01' AND '2005-01-01'
