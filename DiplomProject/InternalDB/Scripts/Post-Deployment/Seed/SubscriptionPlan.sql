-- dbo.SubscriptionPlan

SET IDENTITY_INSERT [dbo].[SubscriptionPlan] ON

INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt]) 
	VALUES (1, 1, NULL, 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt]) 
	VALUES (2, 0, CONVERT(datetime, '2016-01-01 00:00', 120), 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt]) 
	VALUES (3, 0, CONVERT(datetime, '2014-01-01 00:00', 120), 200, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt]) 
	VALUES (4, 0, CONVERT(datetime, '2014-01-01 00:00', 120), 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[SubscriptionPlan] OFF