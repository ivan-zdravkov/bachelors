USE [master]
GO
/****** Object:  Database [InternalDB]    Script Date: 8/26/2014 9:05:31 PM ******/
CREATE DATABASE [InternalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\InternalDB_Primary.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InternalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\InternalDB_Primary.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InternalDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternalDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [InternalDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [InternalDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [InternalDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [InternalDB] SET ARITHABORT ON 
GO
ALTER DATABASE [InternalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InternalDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [InternalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternalDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [InternalDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [InternalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternalDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [InternalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InternalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternalDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InternalDB] SET  MULTI_USER 
GO
ALTER DATABASE [InternalDB] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [InternalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternalDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InternalDB', N'ON'
GO
USE [InternalDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[Town] [nvarchar](50) NULL,
	[PostCode] [nvarchar](10) NULL,
	[Address] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PersonalDetailsId] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[GSM] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Website] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facility]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ManagerId] [nvarchar](128) NOT NULL,
	[AddressId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonalDetails]    Script Date: 8/26/2014 9:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NULL,
	[ContactId] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_PersonalDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'264eb5d4-de5f-4f45-8403-262335c108e0', N'Client', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'2a148a58-c3a3-4126-9d61-4a4fb6c932d6', N'System Administrator', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4A AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'30dce180-a3ac-4b9f-a63a-40354da0c7d2', N'Administrator', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4A AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'445352ff-9727-49d4-86e5-e8d2fa25586e', N'Staff', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'86f3102e-51be-4349-b1d0-5dc15f0a330e', N'Facility Manager', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'a8cef656-428b-410c-9193-759c6223bbfa', N'Receptionist', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'b7b1c839-2e07-4bda-955f-6fee32f639d1', N'Trainer', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserLogins] ([UserId], [LoginProvider], [ProviderKey], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'306e3395-7d90-45a0-90ad-fd5265c19704', N'Facebook', N'10203926123147137', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUserLogins] ([UserId], [LoginProvider], [ProviderKey], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'69d6c0e2-f638-40c8-b8ce-b0f01805aa69', N'Twitter', N'322266262', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUserLogins] ([UserId], [LoginProvider], [ProviderKey], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'e51f7f42-a919-4934-bc87-6c636d4e18f8', N'Google', N'117814716320902862984', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'3bed7cb8-3c46-4312-a5dd-c407f377a587', N'2a148a58-c3a3-4126-9d61-4a4fb6c932d6', NULL, CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'306e3395-7d90-45a0-90ad-fd5265c19704', N'IvanZdravkov12', NULL, N'2619c242-a998-4905-9c00-c461d3481b1c', N'ApplicationUser', N'Zdr@abv.bg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'3bed7cb8-3c46-4312-a5dd-c407f377a587', N'SystemAdministrator', N'APP9gtvgN6cvsmOM3WZITyRJtkNqSp6mFIe+1UQOsURMWgOU+EJxcUDafZneZEPUDg==', N'bfc6489f-3720-419b-913c-a34e98078c80', N'ApplicationUser', N'IvanZdravkovBG@gmail.com', NULL, NULL, CAST(0x0000A38601811F4B AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'69d6c0e2-f638-40c8-b8ce-b0f01805aa69', N'SharkyDoggy', NULL, N'80d123a0-c41a-4c2a-a607-94f138f08752', N'ApplicationUser', N'IvanZdr@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'e51f7f42-a919-4934-bc87-6c636d4e18f8', N'IvanZdravkov', NULL, N'09db96f9-560c-4e57-a25b-f4807ffdca9d', N'ApplicationUser', N'IvanZdravkov@gmail.com', NULL, NULL, NULL, NULL, NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 8/26/2014 9:05:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 8/26/2014 9:05:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 8/26/2014 9:05:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 8/26/2014 9:05:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_AspNetUsers] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_AspNetUsers]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_FacilityDetails_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_FacilityDetails_Address]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_FacilityDetails_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_FacilityDetails_Contact]
GO
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetails_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[PersonalDetails] CHECK CONSTRAINT [FK_PersonalDetails_Address]
GO
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetails_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[PersonalDetails] CHECK CONSTRAINT [FK_PersonalDetails_Contact]
GO
USE [master]
GO
ALTER DATABASE [InternalDB] SET  READ_WRITE 
GO
