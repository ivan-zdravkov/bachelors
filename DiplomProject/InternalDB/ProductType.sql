CREATE TABLE [dbo].[ProductType] (
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[Name]				nvarchar(255)			NOT NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED ([Id] ASC),
)

