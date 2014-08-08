CREATE TABLE [dbo].[AspNetUserLogins] (
	[UserId]			nvarchar(128)			NOT NULL,
    [LoginProvider]		nvarchar(128)			NOT NULL,
    [ProviderKey]		nvarchar(128)			NOT NULL,
	[LastModifiedBy]	int						NULL, 
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [ProviderKey] ASC),
	CONSTRAINT [FK_AspNetUserLogins_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
)