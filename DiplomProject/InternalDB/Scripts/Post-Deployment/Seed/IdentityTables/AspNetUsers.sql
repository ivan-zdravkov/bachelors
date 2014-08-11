-- dbo.AspNetUsers

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp] , [Discriminator], [Email], [PersonalDetailsId], [CreatedAt]) 
	VALUES (N'3bed7cb8-3c46-4312-a5dd-c407f377a587', N'SystemAdministrator', N'APP9gtvgN6cvsmOM3WZITyRJtkNqSp6mFIe+1UQOsURMWgOU+EJxcUDafZneZEPUDg==', N'bfc6489f-3720-419b-913c-a34e98078c80', N'ApplicationUser', N'IvanZdravkovBG@gmail.com', NULL, GETDATE())