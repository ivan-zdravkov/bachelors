﻿CREATE TABLE [dbo].[Facility](
	[Id]					int					IDENTITY (1, 1) NOT NULL,
	[Name]					nvarchar(50)		NOT NULL,
	[ManagerId]				nvarchar(128)		NOT NULL,
	[AddressId]				int					NOT NULL,
	[ContactId]				int					NOT NULL,

	CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Facility_AspNetUsers] FOREIGN KEY ([ManagerId]) REFERENCES [dbo].[AspNetUsers] (Id),
	CONSTRAINT [FK_FacilityDetails_Address] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] (Id),
	CONSTRAINT [FK_FacilityDetails_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] (Id),
)