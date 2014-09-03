-- dbo.Address

SET IDENTITY_INSERT [dbo].[Address] ON

INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'Bulgaria', N'Plovdiv', N'4000', N'ул. "Цанко Дюстабанов" №25', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt]) 
	VALUES (2, N'Bulgaria', N'Sofia', N'1000', N'ул. "Студентски парк" №1', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())
INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt]) 
	VALUES (3, N'Bulgaria', N'Sliven', N'8800', N'ул. "Даме Груев" №13', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[Address] OFF