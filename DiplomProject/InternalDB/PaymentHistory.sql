CREATE TABLE [dbo].[PaymentHistory]
(
	[Id]					int						IDENTITY (1, 1) NOT NULL,
	[RecepientId]			nvarchar(128)			NOT NULL,
	[IssuerId]				nvarchar(128)			NOT NULL,
	[Amount]				smallmoney				NOT NULL,

	[CreatedBy]				nvarchar(128)			NULL,
	[CreatedAt]				datetime				NULL,
	[LastModifiedBy]		nvarchar(128)			NULL,
	[LastModifiedAt]		datetime				NULL,

	CONSTRAINT [PK_PaymentHystory] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_PaymentHystory_Recepient] FOREIGN KEY ([RecepientId]) REFERENCES [dbo].[AspNetUsers] (Id),
	CONSTRAINT [FK_PaymentHystory_Issuer] FOREIGN KEY ([IssuerId]) REFERENCES [dbo].[AspNetUsers] (Id),
)