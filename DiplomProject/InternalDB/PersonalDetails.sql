CREATE TABLE [dbo].[PersonalDetails](
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[FirstName]			nvarchar(50)			NOT NULL,
	[MiddleName]		nvarchar(50)			NULL,
	[LastName]			nvarchar(50)			NOT NULL,
	[AddressID]			int						NULL,
	[ContactID]			int						NULL,

	CONSTRAINT [PK_PersonalDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_PersonalDetails_Address] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] (ID),
	CONSTRAINT [FK_PersonalDetails_Contact] FOREIGN KEY ([ContactID]) REFERENCES [dbo].[Contact] (ID),
)
