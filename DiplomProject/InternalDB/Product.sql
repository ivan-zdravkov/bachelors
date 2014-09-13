CREATE TABLE [dbo].[Product]
(
	[Id]				int						IDENTITY (1, 1) NOT NULL,
	[ProductTypeId]		int						NOT NULL,
	[IsActive]			bit						NOT NULL,
	[Name]				nvarchar(255)			NOT NULL,
	[Display]			nvarchar(max)			NULL,
	[Value]				smallmoney				NOT NULL,
	[Currency]			nvarchar(3)				NOT NULL,

	[CreatedBy]			nvarchar(128)			NULL,
	[CreatedAt]			datetime				NULL,
	[LastModifiedBy]	nvarchar(128)			NULL,
	[LastModifiedAt]	datetime				NULL,

	CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Product_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] (Id),
)

