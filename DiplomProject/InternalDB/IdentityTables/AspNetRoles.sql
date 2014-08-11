CREATE TABLE [dbo].[AspNetRoles](
	[Id]				nvarchar(128)			NOT NULL,
	[Name]				nvarchar(50)			NOT NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
)