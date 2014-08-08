CREATE TABLE [dbo].[AspNetRoles](
	[Id]				nvarchar (128)			NOT NULL,
	[Name]				nvarchar(50)			NOT NULL,
	[LastModifiedBy]	int						NULL, 
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
)