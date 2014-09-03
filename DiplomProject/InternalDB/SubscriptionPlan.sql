CREATE TABLE [dbo].[SubscriptionPlan] (
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[UnlimitedAccess]	bit						NOT NULL,
	[ActiveUntil]		datetime				NULL,
	[Credits]			int						NOT NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_SubscriptionPlan] PRIMARY KEY CLUSTERED ([Id] ASC),
)
