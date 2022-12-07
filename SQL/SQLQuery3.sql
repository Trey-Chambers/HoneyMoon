USE [master]
IF db_id('HoneyMoon') IS NULL
CREATE DATABASE [HoneyMoon]
GO

USE [HoneyMoon]
GO

DROP TABLE IF EXISTS [Hotel];
DROP TABLE IF EXISTS [Activity];
DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Iteniary];
DROP TABLE IF EXISTS [Location];
DROP TABLE IF EXISTS [ActivityType];


CREATE TABLE [Hotel] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(255) NOT NULL,
  [hotelURL] nvarchar(MAX)NOT NULL,
  [hotelImage] nvarchar(MAX),
  [locationId] int NOT NULL
)
GO

CREATE TABLE [Activity] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(255)NOT NULL,
  [description] nvarchar(MAX)NOT NULL,
  [activityTypeId] int NOT NULL,
  [locationId] int NOT NULL
)
GO

CREATE TABLE [UserProfile] (
  [id] int PRIMARY KEY IDENTITY,
  [firstName] nvarchar(255)NOT NULL,
  [lastName] nvarchar(255)NOT NULL,
  [username] nvarchar(255)NOT NULL,
  [email] nvarchar(255)NOT NULL,
  [isAdmin] bit
)
GO

CREATE TABLE [Itinerary] (
  [id] int PRIMARY KEY IDENTITY,
  [userProfileId] int NOT NULL,
  [locationId] int NOT NULL,
  [hotelId] int NOT NULL,
  [activityId] int NOT NULL
)
GO

CREATE TABLE [Location] (
  [id] int PRIMARY KEY IDENTITY,
  [city/region] nvarchar(255)NOT NULL,
  [country] nvarchar(255)NOT NULL
)
GO

CREATE TABLE [ActivityType] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(255) NOT NULL
)
GO

ALTER TABLE [Itinerary] ADD FOREIGN KEY ([hotelId]) REFERENCES [Hotel] ([id])
GO

ALTER TABLE [Itinerary] ADD FOREIGN KEY ([activityId]) REFERENCES [Activity] ([id])
GO

ALTER TABLE [Itinerary] ADD FOREIGN KEY ([userProfileId]) REFERENCES [UserProfile] ([id])
GO

ALTER TABLE [Hotel] ADD FOREIGN KEY ([locationId]) REFERENCES [Location] ([id])
GO

ALTER TABLE [Activity] ADD FOREIGN KEY ([activityTypeId]) REFERENCES [ActivityType] ([id])
GO

ALTER TABLE [Activity] ADD FOREIGN KEY ([locationId]) REFERENCES [Location] ([id])
GO

ALTER TABLE [Itinerary] ADD FOREIGN KEY ([locationId]) REFERENCES [Location] ([id])
GO