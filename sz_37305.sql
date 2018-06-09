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
  IntegrationDate datetime,
  OperatingInstitutionId int,
  ReceiverId int,
  AntennaId int,
  IndividualCalibration	bit,
  ModifiedDate datetime
)

CREATE TABLE Euref.Institution (
  OperatingInstitutionId int IDENTITY NOT NULL,
  Name nvarchar(200),
  Acronym nchar(6),
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
  ModifiedDate datetime
)


ALTER TABLE Euref.Station ADD CONSTRAINT PK_Station PRIMARY KEY (StationId)


