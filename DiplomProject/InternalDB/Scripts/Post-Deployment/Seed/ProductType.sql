-- dbo.ProductType

SET IDENTITY_INSERT [dbo].[ProductType] ON

INSERT [dbo].ProductType ([Id], [Name], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'Credit', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].ProductType ([Id], [Name], [CreatedBy], [CreatedAt]) 
	VALUES (2, N'Subscription', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[ProductType] OFF