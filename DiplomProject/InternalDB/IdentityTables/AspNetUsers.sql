CREATE TABLE [dbo].[AspNetUsers](
	[Id]					nvarchar(128)			NOT NULL,
	[UserName]				nvarchar(max)			NULL,
	[PasswordHash]			nvarchar(max)			NULL,
	[SecurityStamp]			nvarchar(max)			NULL,
	[Discriminator]			nvarchar(128)			NOT NULL,
	[Email]					nvarchar(255)			NOT NULL,
	[PersonalDetailsId]		int						NULL,

	[CreatedBy]				nvarchar(128)			NULL,
	[CreatedAt]				datetime				NULL,
	[LastModifiedBy]		nvarchar(128)			NULL,
	[LastModifiedAt]		datetime				NULL,

	CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_AspNetUsers_PersonalDetails] FOREIGN KEY ([PersonalDetailsId]) REFERENCES [dbo].[PersonalDetails] (Id),
)