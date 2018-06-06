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

ALTER TABLE Euref.Station ADD CONSTRAINT PK_Station PRIMARY KEY (StationId)
GO
