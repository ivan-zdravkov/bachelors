-- dbo.PersonalDetails

SET IDENTITY_INSERT [dbo].[PersonalDetails] ON

INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'Господин', N'Петров', N'Таракчиев', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (2, N'Васил', NULL, N'Караиванов', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (3, N'Венелина', N'Райкова', N'Петкова', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (4, N'Иван', N'Иванов', N'Здравков', NULL, NULL, 2, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (5, N'Камелия', N'Стоянова', N'Вълчева', NULL, NULL, 3, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (6, N'Велизар', N'Петков', N'Стойнов', NULL, NULL, 4, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt]) 
	VALUES (7, N'System', N'', N'Administrator', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[PersonalDetails] OFF