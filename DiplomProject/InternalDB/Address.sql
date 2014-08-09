CREATE TABLE [dbo].[Address](
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[Country]			nvarchar(50)			NULL,
	[Town]				nvarchar(50)			NULL,
	[PostCode]			nvarchar(10)			NULL,
	[Address]			nvarchar(255)			NULL,

	CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([Id] ASC),
)
