CREATE TABLE [dbo].[Facility](
	[Id]					int					IDENTITY (1, 1) NOT NULL,
	[Name]					nvarchar(50)		NOT NULL,
	[ManagerID]				nvarchar(128)		NOT NULL,
	[AddressID]				int					NOT NULL,
	[ContactID]				int					NOT NULL,

	CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Facility_AspNetUsers] FOREIGN KEY ([ManagerID]) REFERENCES [dbo].[AspNetUsers] (ID),
	CONSTRAINT [FK_FacilityDetails_Address] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] (ID),
	CONSTRAINT [FK_FacilityDetails_Contact] FOREIGN KEY ([ContactID]) REFERENCES [dbo].[Contact] (ID),
)
