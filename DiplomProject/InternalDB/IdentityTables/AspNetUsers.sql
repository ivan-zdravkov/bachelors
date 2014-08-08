﻿CREATE TABLE [dbo].[AspNetUsers](
	[Id]					nvarchar(128)			NOT NULL,
	[UserName]				nvarchar(max)			NULL,
	[PasswordHash]			nvarchar(max)			NULL,
	[SecurityStamp]			nvarchar(max)			NULL,
	[Discriminator]			nvarchar(128)			NOT NULL,

	CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
)