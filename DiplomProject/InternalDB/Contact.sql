CREATE TABLE [dbo].[Contact](
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[Phone]				nvarchar(50)			NULL,
	[GSM]				nvarchar(50)			NULL,
	[Fax]				nvarchar(50)			NULL,
	[Email]				nvarchar(255)			NULL,
	[Website]			nvarchar(255)			NULL,

	CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([Id] ASC),
)
