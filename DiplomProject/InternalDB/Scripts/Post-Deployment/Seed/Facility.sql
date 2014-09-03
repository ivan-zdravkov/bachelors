-- dbo.Facility

SET IDENTITY_INSERT [dbo].[Facility] ON

INSERT [dbo].[Facility] ([Id], [Name], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'ТУ Фитнес - Пловдив', N'001e2bfd-cac1-4584-8a49-93e9102fa019', 1, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Facility] ([Id], [Name], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt]) 
	VALUES (2, N'ТУ Фитнес - София', N'6e46e6c5-ea32-49d7-a016-7db46650b102', 2, 2, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Facility] ([Id], [Name], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt]) 
	VALUES (3, N'ТУ Фитнес - Сливен', N'f5cc5cb0-c9c0-4d8b-a46e-e67c471cbd95', 3, 3, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[Facility] OFF