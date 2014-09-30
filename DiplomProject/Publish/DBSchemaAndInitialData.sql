USE [master]
GO
/****** Object:  Database [InternalDB]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/30/2014 11:41:53 PM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [nvarchar](128) NOT NULL,
	[UserProfileId] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/30/2014 11:41:54 PM ******/
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
/****** Object:  Table [dbo].[EntranceHistory]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntranceHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[EntryStatus] [bit] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_EntranceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facility]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DeviceId] [int] NULL,
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
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecepientId] [nvarchar](128) NOT NULL,
	[IssuerId] [nvarchar](128) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PayPalEmail] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_PaymentHystory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonalDetails]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[AddressId] [int] NULL,
	[ContactId] [int] NULL,
	[SubscriptionPlanId] [int] NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Display] [nvarchar](max) NULL,
	[Value] [smallmoney] NOT NULL,
	[Currency] [nvarchar](3) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriptionPlan]    Script Date: 9/30/2014 11:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnlimitedAccess] [bit] NOT NULL,
	[ActiveUntil] [datetime] NULL,
	[Credits] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedBy] [nvarchar](128) NULL,
	[LastModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_SubscriptionPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'Bulgaria', N'Plovdiv', N'4000', N'ул. "Цанко Дюстабанов" №25', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, N'Bulgaria', N'Sofia', N'1000', N'ул. "Студентски парк" №1', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Address] ([Id], [Country], [Town], [PostCode], [Address], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, N'Bulgaria', N'Sliven', N'8800', N'ул. "Даме Груев" №13', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Address] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'264eb5d4-de5f-4f45-8403-262335c108e0', N'Client', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BD AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'30dce180-a3ac-4b9f-a63a-40354da0c7d2', N'Administrator', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BD AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'86f3102e-51be-4349-b1d0-5dc15f0a330e', N'FacilityManager', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BD AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'a8cef656-428b-410c-9193-759c6223bbfa', N'Receptionist', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BD AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'001e2bfd-cac1-4584-8a49-93e9102fa019', N'86f3102e-51be-4349-b1d0-5dc15f0a330e', NULL, CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'3cf4a1ed-a093-49f0-99ac-ec65db71d2b5', N'264eb5d4-de5f-4f45-8403-262335c108e0', NULL, CAST(0x0000A3B6018661C1 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'56e744bb-1619-41a7-9828-76083c50cbdb', N'30dce180-a3ac-4b9f-a63a-40354da0c7d2', NULL, CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'6e46e6c5-ea32-49d7-a016-7db46650b102', N'86f3102e-51be-4349-b1d0-5dc15f0a330e', NULL, CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'76aaf95a-9498-4624-9cd1-1df45e1ac9be', N'264eb5d4-de5f-4f45-8403-262335c108e0', NULL, CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'cab764af-8d7f-4186-bed6-727292697f75', N'264eb5d4-de5f-4f45-8403-262335c108e0', NULL, CAST(0x0000A3B6018661C1 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'f5cc5cb0-c9c0-4d8b-a46e-e67c471cbd95', N'86f3102e-51be-4349-b1d0-5dc15f0a330e', NULL, CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'001e2bfd-cac1-4584-8a49-93e9102fa019', N'ManagerPlovdiv', N'ABtbGY+QCT71PL5gh704ErQsWBgunuL8OJMapoXHTpUIZiQmHqOUPzfnWc0caXl7Hg==', N'd6b24fc9-1778-4bc0-955b-e026038fcad5', N'ApplicationUser', N'ManagerPlovdiv@tu.com', 1, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'3cf4a1ed-a093-49f0-99ac-ec65db71d2b5', N'UncreditedClient', N'ABvXH6obmru4retVSYfoBQi2XJKw9iNj7AdlkpZXsOY1MN5aiabjuiEKyZUd3iY6TA==', N'fa92f962-0466-4da6-b0ba-d81260150011', N'ApplicationUser', N'UncreditedClient@gmail.com', 6, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'56e744bb-1619-41a7-9828-76083c50cbdb', N'Administrator', N'ALnz8NdzGrNt1tIhyTA7LsMkx4UPIu0YAr/HXHiqMea86czFbt6g/tzA9CYG5mi6+g==', N'b43130e9-3991-4de9-8651-f0245e4080fb', N'ApplicationUser', N'Administrator@tu.com', 7, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'6e46e6c5-ea32-49d7-a016-7db46650b102', N'ManagerSofia', N'AFpb1K3oGK4VkEUYN1yV5SkR+V1bWsSYNOCAPa82wG6H72m8rlKJxoGXS7qNXhnElA==', N'e57e1f02-2541-4970-a21e-bd11fb4cc923', N'ApplicationUser', N'ManagerSofia@tu.com', 2, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'76aaf95a-9498-4624-9cd1-1df45e1ac9be', N'SubscribedClient', N'AJj4FHV68W3KGyZoIbqzJ4UycshGyVwaDDS1Kq21iUkwdmQ4ZGFldXlL36E6wIlsMA==', N'fb3b6a41-0b23-48ac-87cf-d4ee9dcce66e', N'ApplicationUser', N'SubscribedClient@gmail.com', 4, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'cab764af-8d7f-4186-bed6-727292697f75', N'CreditedClient', N'ABIM6TEFAzx165oQNnGgVxzwEMrtrXc6QQPL0rQJrebk5h1ul2JX+2RBz9XhedaIRw==', N'fee3d22e-43a0-42bf-8648-e6e96fcf1102', N'ApplicationUser', N'CreditedClient@gmail.com', 5, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [Email], [PersonalDetailsId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (N'f5cc5cb0-c9c0-4d8b-a46e-e67c471cbd95', N'ManagerSliven', N'ABEFU6fnihjPTPabPyGPsNoFXCNUPn7vhFKam0S7zjrPQgepWSFt5TJr8jSTQ9C2eQ==', N'64fd7454-d72b-4881-9d45-c5f76ec3f505', N'ApplicationUser', N'ManagerSliven@tu.com', 3, NULL, CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([Id], [CardId], [UserProfileId], [IsActive], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'5B64836E', N'cab764af-8d7f-4186-bed6-727292697f75', 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661C0 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Card] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'032/661218', N'0886326476', N'032/661218', N'PlovdivFitness@tu.com', N'http://plovdiv.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, N'02/122144', N'08853325364', N'02/122144', N'SofiaFitness@tu.com', N'http://sofia.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([Id], [Phone], [GSM], [Fax], [Email], [Website], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, N'044/622188', N'0878123575', NULL, N'SlivenFitness@tu.com', N'http://sliven.tu.com', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Facility] ON 

INSERT [dbo].[Facility] ([Id], [Name], [DeviceId], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'ТУ Фитнес - Пловдив', 5649, N'001e2bfd-cac1-4584-8a49-93e9102fa019', 1, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661C1 AS DateTime), NULL, NULL)
INSERT [dbo].[Facility] ([Id], [Name], [DeviceId], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, N'ТУ Фитнес - София', NULL, N'6e46e6c5-ea32-49d7-a016-7db46650b102', 2, 2, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661C1 AS DateTime), NULL, NULL)
INSERT [dbo].[Facility] ([Id], [Name], [DeviceId], [ManagerId], [AddressId], [ContactId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, N'ТУ Фитнес - Сливен', NULL, N'f5cc5cb0-c9c0-4d8b-a46e-e67c471cbd95', 3, 3, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661C1 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Facility] OFF
SET IDENTITY_INSERT [dbo].[PersonalDetails] ON 

INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'Господин', N'Петров', N'Таракчиев', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, N'Васил', NULL, N'Караиванов', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, N'Венелина', N'Райкова', N'Петкова', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (4, N'Иван', N'Иванов', N'Здравков', NULL, NULL, 2, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (5, N'Камелия', N'Стоянова', N'Вълчева', NULL, NULL, 3, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (6, N'Велизар', N'Петков', N'Стойнов', NULL, NULL, 4, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[PersonalDetails] ([Id], [FirstName], [MiddleName], [LastName], [AddressId], [ContactId], [SubscriptionPlanId], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (7, N'System', N'', N'Administrator', NULL, NULL, 1, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PersonalDetails] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, 1, 1, N'50 Credits', N'50', 9.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, 1, 1, N'100 Credits', N'100', 18.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, 1, 1, N'200 Credits', N'200', 35.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (4, 1, 1, N'500 Credits', N'500', 74.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (5, 2, 1, N'1 Month Subscription', N'1', 29.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (6, 2, 1, N'3 Month Subscription', N'3', 79.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (7, 2, 1, N'6 Month Subscription', N'6', 149.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (8, 2, 1, N'12 Month Subscription', N'12', 279.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (9, 3, 1, N'PracticeCostBGN', N'', 2.9900, N'BGN', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductTypeId], [IsActive], [Name], [Display], [Value], [Currency], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (10, 3, 1, N'PracticeCostCredits', N'', 10.0000, N'CRD', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BF AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, N'Credit', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[ProductType] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, N'Subscription', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[ProductType] ([Id], [Name], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, N'PracticeCost', N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[SubscriptionPlan] ON 

INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (1, 1, NULL, 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BD AS DateTime), NULL, NULL)
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (2, 0, CAST(0x0000A58000000000 AS DateTime), 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (3, 0, CAST(0x0000A2A600000000 AS DateTime), 200, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
INSERT [dbo].[SubscriptionPlan] ([Id], [UnlimitedAccess], [ActiveUntil], [Credits], [CreatedBy], [CreatedAt], [LastModifiedBy], [LastModifiedAt]) VALUES (4, 0, CAST(0x0000A2A600000000 AS DateTime), 0, N'3bed7cb8-3c46-4312-a5dd-c407f377a587', CAST(0x0000A3B6018661BE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubscriptionPlan] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 9/30/2014 11:41:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/30/2014 11:41:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 9/30/2014 11:41:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/30/2014 11:41:54 PM ******/
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
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_PersonalDetails] FOREIGN KEY([PersonalDetailsId])
REFERENCES [dbo].[PersonalDetails] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_PersonalDetails]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_UserProfile]
GO
ALTER TABLE [dbo].[EntranceHistory]  WITH CHECK ADD  CONSTRAINT [FK_EntranceHistory_Card] FOREIGN KEY([CardId])
REFERENCES [dbo].[Card] ([Id])
GO
ALTER TABLE [dbo].[EntranceHistory] CHECK CONSTRAINT [FK_EntranceHistory_Card]
GO
ALTER TABLE [dbo].[EntranceHistory]  WITH CHECK ADD  CONSTRAINT [FK_EntranceHistory_Facility] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facility] ([Id])
GO
ALTER TABLE [dbo].[EntranceHistory] CHECK CONSTRAINT [FK_EntranceHistory_Facility]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_Address]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_AspNetUsers] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_AspNetUsers]
GO
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_Contact]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHystory_Issuer] FOREIGN KEY([IssuerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHystory_Issuer]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHystory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHystory_Product]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHystory_Recepient] FOREIGN KEY([RecepientId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_PaymentHystory_Recepient]
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
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetails_SubscriptionPlan] FOREIGN KEY([SubscriptionPlanId])
REFERENCES [dbo].[SubscriptionPlan] ([Id])
GO
ALTER TABLE [dbo].[PersonalDetails] CHECK CONSTRAINT [FK_PersonalDetails_SubscriptionPlan]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
USE [master]
GO
ALTER DATABASE [InternalDB] SET  READ_WRITE 
GO
