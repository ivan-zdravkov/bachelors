-- dbo.Card

SET IDENTITY_INSERT [dbo].[Card] ON

INSERT [dbo].[Card] ([Id], [CardId], [UserProfileId], [IsActive], [CreatedBy], [CreatedAt]) 
	VALUES (1, N'5B64836E', N'cab764af-8d7f-4186-bed6-727292697f75', 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', GETDATE())

SET IDENTITY_INSERT [dbo].[Card] OFF
