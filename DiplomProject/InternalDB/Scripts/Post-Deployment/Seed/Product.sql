-- dbo.Product

SET IDENTITY_INSERT [dbo].[Product] ON

INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (1, 1, 1, N'50 Credits', N'50', N'9.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (2, 1, 1, N'100 Credits', N'100', N'18.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (3, 1, 1, N'200 Credits', N'200', N'35.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (4, 1, 1, N'500 Credits', N'500', N'74.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (5, 2, 1, N'1 Month Subscription', N'1', N'29.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (6, 2, 1, N'3 Month Subscription', N'3', N'79.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (7, 2, 1, N'6 Month Subscription', N'6', N'149.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt]) 
	VALUES (8, 2, 1, N'12 Month Subscription', N'12', N'279.99', N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[Product] OFF