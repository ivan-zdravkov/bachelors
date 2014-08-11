CREATE TABLE [dbo].[AspNetUserClaims](
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[ClaimType]			nvarchar(max)			NULL,
	[ClaimValue]		nvarchar(max)			NULL,
	[User_Id]			nvarchar(128)			NOT NULL,
	
	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_AspNetUserClaims_AspNetUsers] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
)