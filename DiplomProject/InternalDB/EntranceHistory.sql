CREATE TABLE [dbo].[EntranceHistory]
(
	[Id]					int						IDENTITY (1, 1) NOT NULL,
	[CardId]				int						NOT NULL,
	[FacilityId]			int						NOT NULL,
	[EntryStatus]			bit						NOT NULL,

	[CreatedBy]				nvarchar(128)			NULL,
	[CreatedAt]				datetime				NULL,
	[LastModifiedBy]		nvarchar(128)			NULL,
	[LastModifiedAt]		datetime				NULL,

	CONSTRAINT [PK_EntranceHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_EntranceHistory_Card] FOREIGN KEY ([CardId]) REFERENCES [dbo].[Card] (Id),
	CONSTRAINT [FK_EntranceHistory_Facility] FOREIGN KEY ([FacilityId]) REFERENCES [dbo].[Facility] (Id),
)
