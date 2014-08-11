CREATE TABLE [dbo].[AspNetUserLogins] (
	[UserId]			nvarchar(128)			NOT NULL,
    [LoginProvider]		nvarchar(128)			NOT NULL,
    [ProviderKey]		nvarchar(128)			NOT NULL,
	
	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [ProviderKey] ASC),
	CONSTRAINT [FK_AspNetUserLogins_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
)