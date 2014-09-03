-- dbo.Contact

SET IDENTITY_INSERT [dbo].[Contact] ON

INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'032/661218', N'0886326476', N'032/661218', N'PlovdivFitness@tu.com', N'http://plovdiv.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt]) 
	VALUES (2, N'02/122144', N'08853325364', N'02/122144', N'SofiaFitness@tu.com', N'http://sofia.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt]) 
	VALUES (3, N'044/622188', N'0878123575', NULL, N'SlivenFitness@tu.com', N'http://sliven.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())	

SET IDENTITY_INSERT [dbo].[Contact] OFF