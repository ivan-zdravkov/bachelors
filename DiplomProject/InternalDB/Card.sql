CREATE TABLE [dbo].[Card]
(
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[CardId]			nvarchar(128)			NOT NULL,
	[UserProfileId]		nvarchar(128)			NOT NULL,
	[IsActive]			bit						NOT NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Card_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [dbo].[AspNetUsers] (Id),
)
