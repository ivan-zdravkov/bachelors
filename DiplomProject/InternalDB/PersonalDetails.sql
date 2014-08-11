CREATE TABLE [dbo].[PersonalDetails](
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[FirstName]			nvarchar(50)			NOT NULL,
	[MiddleName]		nvarchar(50)			NULL,
	[LastName]			nvarchar(50)			NOT NULL,
	[AddressId]			int						NULL,
	[ContactId]			int						NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_PersonalDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_PersonalDetails_Address] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] (Id),
	CONSTRAINT [FK_PersonalDetails_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] (Id),
)
