USE [master]
GO
/****** Object:  Database [HelperlandDB]    Script Date: 4/18/2022 2:38:55 PM ******/
CREATE DATABASE [HelperlandDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HelperlandDB', FILENAME = N'C:\Users\Mohammad\HelperlandDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HelperlandDB_log', FILENAME = N'C:\Users\Mohammad\HelperlandDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HelperlandDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelperlandDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelperlandDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelperlandDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelperlandDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelperlandDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelperlandDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelperlandDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelperlandDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelperlandDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelperlandDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelperlandDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelperlandDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelperlandDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelperlandDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelperlandDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelperlandDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HelperlandDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelperlandDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelperlandDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelperlandDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelperlandDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelperlandDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelperlandDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelperlandDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HelperlandDB] SET  MULTI_USER 
GO
ALTER DATABASE [HelperlandDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelperlandDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelperlandDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelperlandDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HelperlandDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HelperlandDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HelperlandDB] SET QUERY_STORE = OFF
GO
USE [HelperlandDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [HelperlandDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactUsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Subject] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[UploadFileName] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[FileName] [varchar](500) NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteAndBlocked]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteAndBlocked](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TargetUserId] [int] NOT NULL,
	[IsFavorite] [bit] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
 CONSTRAINT [PK_FavoriteAndBlocked] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NOT NULL,
	[RatingFrom] [int] NOT NULL,
	[RatingTo] [int] NOT NULL,
	[Ratings] [decimal](2, 1) NOT NULL,
	[Comments] [nvarchar](2000) NULL,
	[RatingDate] [datetime] NOT NULL,
	[OnTimeArrival] [decimal](2, 1) NOT NULL,
	[Friendly] [decimal](2, 1) NOT NULL,
	[QualityOfService] [decimal](2, 1) NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[ServiceRequestId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceStartDate] [datetime] NOT NULL,
	[ZipCode] [nvarchar](10) NOT NULL,
	[ServiceHourlyRate] [decimal](8, 2) NULL,
	[ServiceHours] [float] NOT NULL,
	[ExtraHours] [float] NULL,
	[SubTotal] [decimal](8, 2) NOT NULL,
	[Discount] [decimal](8, 2) NULL,
	[TotalCost] [decimal](8, 2) NOT NULL,
	[Comments] [nvarchar](500) NULL,
	[PaymentTransactionRefNo] [nvarchar](50) NULL,
	[PaymentDue] [bit] NOT NULL,
	[ServiceProviderId] [int] NULL,
	[SPAcceptedDate] [datetime] NULL,
	[HasPets] [bit] NOT NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[RefundedAmount] [decimal](8, 2) NULL,
	[Distance] [decimal](18, 2) NOT NULL,
	[HasIssue] [bit] NULL,
	[PaymentDone] [bit] NULL,
	[RecordVersion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequestAddress]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NULL,
	[AddressLine1] [nvarchar](200) NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_ServiceRequestAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequestExtra]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequestExtra](
	[ServiceRequestExtraId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestId] [int] NOT NULL,
	[ServiceExtraId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceRequestExtra] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestExtraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] NOT NULL,
	[TestName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](500) NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[Gender] [int] NULL,
	[DateOfBirth] [datetime] NULL,
	[UserProfilePicture] [nvarchar](200) NULL,
	[IsRegisteredUser] [bit] NOT NULL,
	[PaymentGatewayUserRef] [nvarchar](200) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[WorksWithPets] [bit] NOT NULL,
	[LanguageId] [int] NULL,
	[NationalityId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [int] NULL,
	[BankTokenId] [nvarchar](100) NULL,
	[TaxNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AddressLine1] [nvarchar](200) NOT NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zipcode]    Script Date: 4/18/2022 2:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zipcode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZipcodeValue] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Zipcode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (1, N'taukir khatri', N'khatritaukir@gmail.com', N'General', N'6351443845', N'Test Message', N'cp_profile2.jpg', CAST(N'2022-02-08T16:56:45.430' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\c34fa557-ac32-403a-9423-109f315f3ce1_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (2, N'taukir khatri', N'khatritaukir@gmail.com', N'General', N'6351443845', N'Test Message', N'cp_profile2.jpg', CAST(N'2022-02-08T17:08:19.807' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\d9d9ed97-b3ce-4c65-aa38-5e0dd1ba455a_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (3, N'taukir khatri', N'khatritaukir@gmail.com', N'General', N'6351443845', N'Test Message', N'cp_profile2.jpg', CAST(N'2022-02-08T17:14:40.670' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\fd5923d1-cabd-4913-a483-972bc73ccef3_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (4, N'taukir khatri', N'khatritaukir@gmail.com', N'General', N'6351443845', N'Test Message', N'cp_profile2.jpg', CAST(N'2022-02-08T17:22:32.200' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\1cbb669f-34fe-4ca9-92dd-79a60178da18_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (5, N'taukir khatri', N'khatritaukir@gmail.com', N'General', N'6351443845', N'Test Message', N'cp_profile2.jpg', CAST(N'2022-02-08T17:24:16.090' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\92ae42a3-e2a7-4325-a159-dd00592d4a44_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (6, N'asds asdf', N'abc@def.com', N'Inquiry', N'6969696969', N'asdfasdf', N'cp_profile.jpg', CAST(N'2022-02-08T17:29:05.570' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\205e6d20-bb13-49bf-b832-6c22baee07e0_cp_profile.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (7, N'test5 test1', N'abc@def.com', N'General', N'6969696969', N'asdfadsf', N'cp_profile2.jpg', CAST(N'2022-02-08T17:33:20.137' AS DateTime), 11, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\f1895b48-e097-46b5-bd1f-8c1cb20e3650_cp_profile2.jpg')
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (8, N'asd asd', N'abc@def.com', N'General', N'6969696969', N'adfsf', NULL, CAST(N'2022-02-08T17:45:17.067' AS DateTime), 11, NULL)
INSERT [dbo].[ContactUs] ([ContactUsId], [Name], [Email], [Subject], [PhoneNumber], [Message], [UploadFileName], [CreatedOn], [CreatedBy], [FileName]) VALUES (9, N'Something someone', N'khatritaukir@gmail.com', N'General', N'6545695453', N'asdfdf', N'tatvasoft.png', CAST(N'2022-03-31T14:43:52.027' AS DateTime), NULL, N'E:\Taukir Study\TatvaSoft\Training\Project\Helperland\Helperland\HelperLand\HelperLand\wwwroot\Uploads\e0c91c6d-83aa-469e-b0a6-2d0e24e3c2bc_tatvasoft.png')
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteAndBlocked] ON 

INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (1, 18, 11, 0, 0)
INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (2, 11, 12, 1, 0)
INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (3, 11, 18, 1, 0)
INSERT [dbo].[FavoriteAndBlocked] ([Id], [UserId], [TargetUserId], [IsFavorite], [IsBlocked]) VALUES (4, 18, 31, 0, 0)
SET IDENTITY_INSERT [dbo].[FavoriteAndBlocked] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (5, 32, 11, 18, CAST(2.7 AS Decimal(2, 1)), NULL, CAST(N'2022-03-01T12:33:22.117' AS DateTime), CAST(2.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)))
INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (7, 24, 11, 18, CAST(4.7 AS Decimal(2, 1)), NULL, CAST(N'2022-03-31T15:12:58.933' AS DateTime), CAST(5.0 AS Decimal(2, 1)), CAST(5.0 AS Decimal(2, 1)), CAST(4.0 AS Decimal(2, 1)))
INSERT [dbo].[Rating] ([RatingId], [ServiceRequestId], [RatingFrom], [RatingTo], [Ratings], [Comments], [RatingDate], [OnTimeArrival], [Friendly], [QualityOfService]) VALUES (8, 25, 11, 18, CAST(3.7 AS Decimal(2, 1)), NULL, CAST(N'2022-03-05T17:41:23.527' AS DateTime), CAST(5.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)), CAST(3.0 AS Decimal(2, 1)))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequest] ON 

INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (2, 11, 1000, CAST(N'2022-03-16T10:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), N'dfgdfgdf', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T21:11:45.207' AS DateTime), CAST(N'2022-04-18T14:16:00.053' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'ea986993-e841-430d-b30f-fe8fcf08b076')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (3, 11, 1001, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), N'Something', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T22:47:57.100' AS DateTime), CAST(N'2022-02-16T22:47:57.100' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'03a4514c-d9ac-4ec4-91e7-2b0a61d6e911')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (4, 11, 1002, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'Something', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:16:35.687' AS DateTime), CAST(N'2022-02-16T23:16:35.687' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'76890718-c205-4f15-913f-89158dad14e3')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (5, 11, 1003, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 0, 2, CAST(N'2022-02-16T23:19:33.367' AS DateTime), CAST(N'2022-02-16T23:19:33.367' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'ab4a749b-298d-4a4d-84d1-737a595a7c31')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (6, 11, 1004, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:20:37.457' AS DateTime), CAST(N'2022-02-16T23:20:37.457' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'6baba491-9200-45ea-bef9-7cb45bfb8bb1')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (7, 11, 1005, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:24:20.200' AS DateTime), CAST(N'2022-02-16T23:24:20.200' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'454dad0c-ddc6-459a-8593-4e92ea53e466')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (8, 11, 1006, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:30:26.603' AS DateTime), CAST(N'2022-02-16T23:30:26.603' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'ddb55192-9514-47b0-a2bf-3d9817b2b8cf')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (9, 11, 1007, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:31:36.343' AS DateTime), CAST(N'2022-02-16T23:31:36.343' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'32d9ad9c-f1a1-43e9-8f3d-80cdc9a77f18')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (10, 11, 1008, CAST(N'2022-02-24T08:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:37:48.030' AS DateTime), CAST(N'2022-04-18T11:00:46.653' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'64dbfc88-d556-40f4-b5f9-9a2837a2ec3e')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (11, 11, 1009, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-16T23:41:04.970' AS DateTime), CAST(N'2022-02-16T23:41:04.970' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'7054dc3b-c0dc-4b3c-a5b6-ffb3c8790956')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (12, 11, 1010, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T00:25:39.300' AS DateTime), CAST(N'2022-02-17T00:25:39.300' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'51a6cce8-087b-49c6-a6e1-dd3e09714578')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (13, 11, 1011, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:16:29.727' AS DateTime), CAST(N'2022-02-17T01:16:29.727' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'af832b8c-20aa-47f5-b632-fc53aeac816a')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (14, 11, 1012, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:20:10.920' AS DateTime), CAST(N'2022-02-17T01:20:10.920' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'47cd494b-3ff3-4d54-a912-1ba3d75dcf5c')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (15, 11, 1013, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:22:47.943' AS DateTime), CAST(N'2022-02-17T01:22:47.947' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'47635735-5063-4669-8142-28c4c36609b9')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (16, 11, 1014, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:24:21.130' AS DateTime), CAST(N'2022-02-17T01:24:21.130' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'eac4c5c3-e1b7-4108-881e-7cf5f8ebbf9d')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (17, 11, 1015, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:26:08.323' AS DateTime), CAST(N'2022-02-17T01:26:08.323' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'c92a9033-4913-4709-956e-d9804b01e208')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (18, 11, 1016, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T01:36:16.600' AS DateTime), CAST(N'2022-02-17T01:36:16.600' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'a2bb3bfe-ba0a-4156-94b8-1d7ab31b71fe')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (19, 11, 1017, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'asdf', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T13:03:44.120' AS DateTime), CAST(N'2022-02-17T13:03:44.120' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'c4a60227-167d-441d-a16c-6e1e23bc956e')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (20, 11, 1018, CAST(N'2022-02-23T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(0.00 AS Decimal(8, 2)), CAST(-75.60 AS Decimal(8, 2)), CAST(75.60 AS Decimal(8, 2)), N'asdfasdf', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T16:42:17.130' AS DateTime), CAST(N'2022-02-17T16:42:17.130' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'0049153e-0561-4ddf-b387-9382101198fb')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (21, 11, 1019, CAST(N'2022-03-02T00:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'asdfsdf', NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-02-17T16:46:30.757' AS DateTime), CAST(N'2022-02-17T16:46:30.757' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'7e575138-3635-46bc-8997-160ee2ca00a2')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (22, 11, 1020, CAST(N'2022-03-07T08:00:00.000' AS DateTime), N'53225', NULL, 0, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'asdfdsf', NULL, 0, 18, CAST(N'2022-03-03T23:34:48.247' AS DateTime), 1, 4, CAST(N'2022-02-17T17:26:37.857' AS DateTime), CAST(N'2022-03-08T19:49:12.963' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'e70dd94e-3283-458f-b7d1-f8b552345db0')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (23, 11, 1021, CAST(N'2022-02-26T00:00:00.000' AS DateTime), N'53225', NULL, 6, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'asdfdsf', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-17T17:34:04.537' AS DateTime), CAST(N'2022-02-17T17:34:04.537' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'14e7fc74-f4bb-4157-97d8-c74822ba7f46')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (24, 11, 1022, CAST(N'2022-02-20T00:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), N'something', NULL, 0, 18, CAST(N'2022-03-03T23:28:54.687' AS DateTime), 1, 5, CAST(N'2022-02-19T21:40:50.310' AS DateTime), CAST(N'2022-02-19T21:40:50.310' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'0a2ddce9-7791-4139-8a67-616c47c9df81')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (25, 11, 1023, CAST(N'2022-02-25T14:30:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-02-22T16:37:00.000' AS DateTime), 1, 5, CAST(N'2022-02-21T14:53:02.837' AS DateTime), CAST(N'2022-02-21T14:53:02.837' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'eabda30e-7002-40da-9408-b93f8f11034a')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (26, 11, 1024, CAST(N'2022-02-22T11:30:00.000' AS DateTime), N'53225', NULL, 5.5, 1, CAST(76.50 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), CAST(61.20 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-21T14:59:24.960' AS DateTime), CAST(N'2022-03-08T16:20:35.707' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'ce9b3f90-16d6-46bd-901e-01cd4a602681')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (27, 11, 1025, CAST(N'2022-02-22T08:00:00.000' AS DateTime), N'53225', NULL, 3, 0, CAST(54.00 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(43.20 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-03T23:24:39.747' AS DateTime), 0, 5, CAST(N'2022-02-21T15:59:08.140' AS DateTime), CAST(N'2022-02-21T15:59:08.140' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'5baea435-f61f-4d90-82ce-69843638079a')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (28, 11, 1026, CAST(N'2022-02-28T08:00:00.000' AS DateTime), N'53225', NULL, 6, 1, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'sdfdgf', NULL, 0, 12, CAST(N'2022-03-03T23:21:51.323' AS DateTime), 1, 3, CAST(N'2022-02-21T16:13:40.063' AS DateTime), CAST(N'2022-02-21T16:13:40.063' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'4b01710f-f49b-4b27-836b-2adfa3b9de39')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (29, 11, 1027, CAST(N'2022-03-08T10:00:00.000' AS DateTime), N'53225', NULL, 5.5, 1, CAST(85.50 AS Decimal(8, 2)), CAST(17.10 AS Decimal(8, 2)), CAST(68.40 AS Decimal(8, 2)), N'Need a cleaner ', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-02-25T11:54:51.240' AS DateTime), CAST(N'2022-02-25T11:54:51.240' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'9f81d410-e24c-4174-bc95-6f72b23fe965')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (30, 11, 1028, CAST(N'2022-03-08T10:00:00.000' AS DateTime), N'53225', NULL, 5, 2, CAST(90.00 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(72.00 AS Decimal(8, 2)), N'Again need a cleaner', NULL, 0, 18, CAST(N'2022-02-25T11:58:39.090' AS DateTime), 0, 4, CAST(N'2022-02-25T11:55:39.887' AS DateTime), CAST(N'2022-02-25T11:55:39.887' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'd6367fd5-9faf-45b0-a059-51e5e2f28906')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (31, 11, 1029, CAST(N'2022-03-07T08:00:00.000' AS DateTime), N'53225', NULL, 6, 1, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'Cleaner is needed', NULL, 0, 18, CAST(N'2022-02-25T12:02:39.090' AS DateTime), 1, 5, CAST(N'2022-02-25T11:56:39.090' AS DateTime), CAST(N'2022-03-08T16:42:18.303' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'3a12e75a-e1e9-447b-8de3-df8c635c63ed')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (32, 11, 1030, CAST(N'2022-03-15T11:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-02-25T22:41:50.583' AS DateTime), 1, 5, CAST(N'2022-02-25T22:37:50.583' AS DateTime), CAST(N'2022-02-25T22:37:50.583' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'94b777b0-634d-4d3f-8823-5a509b6c54d4')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (33, 11, 1031, CAST(N'2022-03-24T14:00:00.000' AS DateTime), N'53225', NULL, 6, 1.5, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-03T23:16:58.063' AS DateTime), 1, 4, CAST(N'2022-03-03T18:54:43.557' AS DateTime), CAST(N'2022-03-03T18:54:43.557' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'25dc0540-12b9-42fa-99ea-a6ba9fb75b24')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (34, 11, 1032, CAST(N'2022-03-30T08:00:00.000' AS DateTime), N'53225', NULL, 4.5, 1.5, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, 12, CAST(N'2022-03-04T00:30:28.690' AS DateTime), 0, 3, CAST(N'2022-03-04T00:25:25.320' AS DateTime), CAST(N'2022-03-04T00:25:25.323' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'db4b636b-b0a2-4a44-b12e-fab50e49d1c4')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (35, 11, 1033, CAST(N'2022-03-20T08:00:00.000' AS DateTime), N'53225', NULL, 6, 1.5, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 0, 2, CAST(N'2022-03-07T11:46:49.427' AS DateTime), CAST(N'2022-03-07T11:46:49.427' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'72b8f076-ec19-48ec-a15e-0280f9483d17')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (36, 11, 1034, CAST(N'2022-03-31T08:00:00.000' AS DateTime), N'53225', NULL, 3.5, 0.5, CAST(63.00 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), CAST(50.40 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-30T16:58:23.670' AS DateTime), 0, 5, CAST(N'2022-03-30T16:57:35.993' AS DateTime), CAST(N'2022-03-30T16:57:35.993' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'a76ed555-c108-4d86-aa97-a7c8d3f7e4f3')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (37, 11, 1035, CAST(N'2022-03-31T08:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), N'asdfasdf', NULL, 0, NULL, NULL, 1, 2, CAST(N'2022-03-30T18:51:43.640' AS DateTime), CAST(N'2022-03-30T18:51:43.640' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'd81c6fb0-09f0-44d0-b05d-96233298a152')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (38, 11, 1036, CAST(N'2022-04-01T12:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 0, 4, CAST(N'2022-03-30T20:14:34.487' AS DateTime), CAST(N'2022-03-30T20:14:34.487' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'cc3743ce-2d41-44ad-9465-0cc58da0e8b3')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (39, 26, 1037, CAST(N'2022-04-20T11:00:00.000' AS DateTime), N'53225', NULL, 5, 1, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'Nice to have quality', NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-03-31T14:57:15.827' AS DateTime), CAST(N'2022-03-31T14:57:15.827' AS DateTime), 26, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'26131842-fbad-42a4-91a0-4ec8aee2a45d')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (40, 11, 1038, CAST(N'2022-04-04T10:00:00.000' AS DateTime), N'53225', NULL, 5.5, 0.5, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-03-31T15:32:00.667' AS DateTime), CAST(N'2022-03-31T15:32:00.667' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'7833dc55-4c4a-4972-8ba1-bfb86d96a48c')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (41, 11, 1039, CAST(N'2022-04-01T08:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-03-31T15:32:39.070' AS DateTime), CAST(N'2022-03-31T15:32:39.070' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'bde2a93b-0d71-4753-a8f4-9d8c22c60281')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (42, 11, 1040, CAST(N'2022-04-06T15:00:00.000' AS DateTime), N'53225', NULL, 5.5, 0.5, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'asdf', NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-03-31T15:33:19.660' AS DateTime), CAST(N'2022-03-31T15:33:19.660' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'0fd260b7-1cd6-41cd-8f91-3b5670df19eb')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (43, 11, 1041, CAST(N'2022-04-18T08:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), N'asdf', NULL, 0, 18, CAST(N'2022-03-31T17:47:28.260' AS DateTime), 1, 3, CAST(N'2022-03-31T15:34:16.720' AS DateTime), CAST(N'2022-03-31T15:34:16.720' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'43586e34-e4ce-454b-859b-0e3adea405c9')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (44, 11, 1042, CAST(N'2022-04-20T09:30:00.000' AS DateTime), N'53225', NULL, 7, 0.5, CAST(94.50 AS Decimal(8, 2)), CAST(18.90 AS Decimal(8, 2)), CAST(75.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-31T16:10:37.923' AS DateTime), 0, 4, CAST(N'2022-03-31T16:08:46.370' AS DateTime), CAST(N'2022-03-31T16:08:46.370' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'f34faa19-5c31-497e-a95a-84e2242e7c78')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (45, 11, 1043, CAST(N'2022-04-20T14:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-31T16:11:48.157' AS DateTime), 0, 4, CAST(N'2022-03-31T16:11:32.083' AS DateTime), CAST(N'2022-03-31T16:11:32.083' AS DateTime), 11, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'3486e2a7-f868-45a9-b240-38a3ffc4a01f')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (46, 11, 1044, CAST(N'2022-04-23T11:00:00.000' AS DateTime), N'53225', NULL, 6, 0, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-31T16:24:00.737' AS DateTime), 0, 4, CAST(N'2022-03-31T16:23:20.823' AS DateTime), CAST(N'2022-03-31T16:54:08.863' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'e9c567bf-0d43-4e8f-910b-d9f2d48d6699')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (47, 30, 1045, CAST(N'2022-04-26T08:00:00.000' AS DateTime), N'53225', NULL, 5, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-31T18:53:41.460' AS DateTime), 0, 4, CAST(N'2022-03-31T18:10:42.307' AS DateTime), CAST(N'2022-03-31T19:27:39.983' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'43433f5b-1837-47bf-83f5-876b0bfce3ef')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (48, 30, 1046, CAST(N'2022-04-18T13:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-03-31T19:34:46.653' AS DateTime), 0, 4, CAST(N'2022-03-31T19:34:33.773' AS DateTime), CAST(N'2022-03-31T19:34:33.773' AS DateTime), 30, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'925773c4-e0c8-4240-a80f-490c6cbebc4a')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (49, 31, 1047, CAST(N'2022-04-19T12:30:00.000' AS DateTime), N'53225', NULL, 6, 1, CAST(81.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), CAST(64.80 AS Decimal(8, 2)), N'Need to clean with quality', NULL, 0, NULL, NULL, 1, 4, CAST(N'2022-04-05T13:18:50.670' AS DateTime), CAST(N'2022-04-05T13:18:50.670' AS DateTime), 31, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'56375ba0-75da-4dfc-a3a2-1376e0f202ee')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (50, 31, 1048, CAST(N'2022-04-14T12:00:00.000' AS DateTime), N'53225', NULL, 3, 0, CAST(54.00 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(43.20 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-04-05T13:36:42.870' AS DateTime), 0, 3, CAST(N'2022-04-05T13:34:07.797' AS DateTime), CAST(N'2022-04-05T13:34:07.797' AS DateTime), 31, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'3033aa54-e815-46d1-971a-139d2ca4cc75')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (51, 31, 1049, CAST(N'2022-04-13T10:30:00.000' AS DateTime), N'53225', NULL, 4.5, 0.5, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, 18, CAST(N'2022-04-05T13:36:53.063' AS DateTime), 1, 4, CAST(N'2022-04-05T13:34:50.547' AS DateTime), CAST(N'2022-04-05T13:43:34.550' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'49358b9a-8f83-4f2c-9d0c-aea35aed088a')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (52, 30, 1050, CAST(N'2022-05-19T10:30:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 0, 2, CAST(N'2022-04-18T11:02:02.550' AS DateTime), CAST(N'2022-04-18T14:17:34.827' AS DateTime), 23, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'01c867f6-3f6c-4e0f-af65-1efb59ec4a62')
INSERT [dbo].[ServiceRequest] ([ServiceRequestId], [UserId], [ServiceId], [ServiceStartDate], [ZipCode], [ServiceHourlyRate], [ServiceHours], [ExtraHours], [SubTotal], [Discount], [TotalCost], [Comments], [PaymentTransactionRefNo], [PaymentDue], [ServiceProviderId], [SPAcceptedDate], [HasPets], [Status], [CreatedDate], [ModifiedDate], [ModifiedBy], [RefundedAmount], [Distance], [HasIssue], [PaymentDone], [RecordVersion]) VALUES (53, 30, 1051, CAST(N'2022-04-19T08:00:00.000' AS DateTime), N'53225', NULL, 4, 1, CAST(72.00 AS Decimal(8, 2)), CAST(14.40 AS Decimal(8, 2)), CAST(57.60 AS Decimal(8, 2)), NULL, NULL, 0, NULL, NULL, 0, 2, CAST(N'2022-04-18T14:27:00.883' AS DateTime), CAST(N'2022-04-18T14:27:00.883' AS DateTime), 30, NULL, CAST(0.00 AS Decimal(18, 2)), 0, 1, N'e5095086-591e-48ab-b3ad-692fdab06789')
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] ON 

INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (2, 2, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (3, 3, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (4, 4, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (5, 5, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (6, 6, N'adafsd', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (7, 7, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (8, 8, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (9, 9, N'adafsd', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (10, 10, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (11, 11, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (12, 12, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (13, 13, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (14, 14, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (15, 15, N'abc', N'45', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (16, 16, N'adafsd', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (17, 17, N'abc', N'45', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (18, 18, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (19, 19, N'asdf', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (20, 20, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (21, 21, N'abc', N'45', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (22, 22, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (23, 23, N'asdf', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (24, 24, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (25, 25, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (26, 26, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (27, 27, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (28, 28, N'abc', N'45', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (29, 29, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (30, 30, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (31, 31, N'asdf', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (32, 32, N'adafsd', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (33, 33, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (34, 34, N'dfgdffg', N'45', N'Bonn', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (35, 35, N'abcd', N'45', N'Bonn', NULL, N'53225', N'7985646543', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (36, 36, N'adafsd', N'456', N'vhvhgh', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (37, 37, N'asdfdsf', N'465', N'Bonn', NULL, N'53225', N'6987456987', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (38, 38, N'qwerty', N'456', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (39, 39, N'Somestreet', N'456', N'Bonn', NULL, N'53225', N'6545695456', N'test_cust@yopmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (40, 40, N'abcd', N'45', N'Bonn', NULL, N'53225', N'7985646543', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (41, 41, N'asdf', N'96', N'Bonn', NULL, N'53225', N'6546544569', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (42, 42, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (43, 43, N'qwerty', N'456', N'Bonn', NULL, N'53225', N'7985646542', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (44, 44, N'adafsd', N'456', N'vhvhgh', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (45, 45, N'somestreet', N'123', N'Bonn', NULL, N'53225', N'9898989898', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (46, 46, N'adafsd', N'456', N'vhvhgh', NULL, N'53225', N'6565656565', N'test5@test.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (47, 47, N'newstreet', N'456', N'Bonn', NULL, N'53225', N'6545694565', N'finalcust1@yopmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (48, 48, N'SomeStreet', N'546', N'somecity', NULL, N'53225', N'6545694565', N'finalcust1@yopmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (49, 49, N'Somestreet', N'531', N'Bonn', NULL, N'53225', N'6351443845', N'khatritaukirahmed@gmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (50, 50, N'Somestreet', N'456', N'Bonn', NULL, N'53225', N'6351443845', N'khatritaukirahmed@gmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (51, 51, N'Somestreet', N'456', N'Bonn', NULL, N'53225', N'6351443845', N'khatritaukirahmed@gmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (52, 52, N'newstreet', N'456', N'Bonn', NULL, N'53225', N'6954231535', N'finalcust1@yopmail.com')
INSERT [dbo].[ServiceRequestAddress] ([Id], [ServiceRequestId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Mobile], [Email]) VALUES (53, 53, N'newstreet', N'456', N'Bonn', NULL, N'53225', N'6954231535', N'finalcust1@yopmail.com')
SET IDENTITY_INSERT [dbo].[ServiceRequestAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] ON 

INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (2, 2, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (3, 2, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (4, 3, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (5, 3, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (6, 4, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (7, 4, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (8, 4, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (9, 5, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (10, 5, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (11, 5, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (12, 6, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (13, 6, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (14, 6, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (15, 7, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (16, 7, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (17, 8, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (18, 8, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (19, 9, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (20, 9, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (21, 10, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (22, 10, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (23, 10, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (24, 11, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (25, 11, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (26, 12, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (27, 12, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (28, 13, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (29, 13, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (30, 13, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (31, 14, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (32, 14, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (33, 14, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (34, 15, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (35, 15, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (36, 15, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (37, 16, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (38, 16, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (39, 17, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (40, 17, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (41, 17, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (42, 18, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (43, 18, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (44, 19, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (45, 19, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (46, 19, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (47, 20, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (48, 20, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (49, 20, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (50, 21, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (51, 21, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (52, 21, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (53, 22, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (54, 22, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (55, 22, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (56, 23, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (57, 23, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (58, 23, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (59, 24, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (60, 24, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (61, 25, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (62, 25, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (63, 26, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (64, 26, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (65, 28, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (66, 28, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (67, 29, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (68, 29, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (69, 30, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (70, 30, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (71, 30, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (72, 30, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (73, 31, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (74, 31, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (75, 32, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (76, 32, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (77, 33, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (78, 33, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (79, 33, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (80, 34, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (81, 34, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (82, 34, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (83, 35, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (84, 35, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (85, 35, 5)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (86, 36, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (87, 37, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (88, 37, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (89, 38, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (90, 38, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (91, 39, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (92, 39, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (93, 40, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (94, 41, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (95, 41, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (96, 42, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (97, 43, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (98, 43, 4)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (99, 44, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (100, 45, 1)
GO
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (101, 45, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (102, 47, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (103, 47, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (104, 48, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (105, 48, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (106, 49, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (107, 49, 3)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (108, 51, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (109, 52, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (110, 52, 2)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (111, 53, 1)
INSERT [dbo].[ServiceRequestExtra] ([ServiceRequestExtraId], [ServiceRequestId], [ServiceExtraId]) VALUES (112, 53, 3)
SET IDENTITY_INSERT [dbo].[ServiceRequestExtra] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (2, N'test', N'abc', N'test@abc.com', N'asdf', N'6666666666', 1, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T20:27:08.090' AS DateTime), CAST(N'2022-01-31T20:27:08.090' AS DateTime), 1, 0, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (6, N'Taukir', N'Khatri', N'khatritaukir@gmail.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg2dA20V3G15WS0eHOxJn4aeXJ_-IugqTMMU1bhv5ScCOFkx-YuzZ1tOOnA2GjBcs5iPiCSUyap553iOLE62rR9uNaNFWTSo0LZ-kbfp7mb6zw', N'6351443845', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T21:22:49.423' AS DateTime), CAST(N'2022-01-31T21:22:49.423' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (8, N'test2', N'test2', N'test2@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg3A7zJWso4eqYpdeS1iqmOGsoJte4pj28dTv7Df0Nj0XxLqycWXMPqUOtJrByMF8MK-1wclT7vtiy9jjtHuB5DS5Wn6utRH63QZNrFTt3GMTA', N'6969696969', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T23:24:56.410' AS DateTime), CAST(N'2022-01-31T23:24:56.410' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (9, N'test3', N'test3', N'test3@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg3hvnk3rJD9uf8H9jtN-vaBMdBgMUUDVzngyX5tNg_4PPiQWE-qqziaheSeKQv6WHo2LQ0FpsTVIxNnz6P680tFyelwCBOfuxaYmmLvbgQmiw', N'6969696969', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T23:30:00.570' AS DateTime), CAST(N'2022-01-31T23:30:00.573' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (10, N'test4', N'test4', N'test4@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg27M0ouN02l-Dq9-45Y18jvK9ygmCxJktiMs2bWvl7ADw_gFN759o9VFjvSOWg4hFQb8nbsmU7KfewdrzV_HGptAVBc31kIOVK8LU6gC2I6IA', N'6565656565', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T23:46:14.813' AS DateTime), CAST(N'2022-01-31T23:46:14.817' AS DateTime), 10, 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (11, N'test', N'test5', N'test5@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg1lI1poCGLDCm6USehI2uhuhLyXTqmcw-a-TC9nxpq88c1MGTOsEuSLzgsF7LJKBuQTv5LZ5ZSFQHgrcc1X3OW613hpMEALuxGWqOgyK-3JnQ', N'6565656565', 1, NULL, CAST(N'1995-06-10T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 0, 1, NULL, CAST(N'2022-02-01T10:29:16.950' AS DateTime), CAST(N'2022-03-05T17:52:38.857' AS DateTime), 11, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (12, N'sp1', N'sp1', N'sp1@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg0P9tzhaZ-iXbZxRxXrjd8fxtprc5R4V3u9WSNkldDTqNnUrM_81gmhat219VPk-MqF5uvcWW2bDFK1s2zIJ707R8s9Pg80H2_zXiDdbGwzPA', N'6868686868', 2, NULL, NULL, NULL, 1, NULL, N'53225', 0, NULL, NULL, CAST(N'2022-02-01T19:45:59.613' AS DateTime), CAST(N'2022-02-01T19:45:59.613' AS DateTime), 12, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (13, N'someone', N'someone', N'someone@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg3AM6hKb8BVlTzCKZEYv1l0wQeVs2xThWg4IXWghFfcCrnICxz-m0Oa-qMqhsqlLmm8-WUM90m1Ki6lffehSlUAloyOG3IvQEZhdVyToAfHTg', N'6235456456', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-02-04T11:04:16.780' AS DateTime), CAST(N'2022-02-04T11:04:16.783' AS DateTime), 0, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (14, N'test', N'final 1', N'test@final1.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg3NFdYDLttkYr5xhuxzcDDnQeFNBCBq5neeWfonXk22yAT-gdVqfOZ_wrLzUZgOVLa71BFHFzKVWmLgAsLR0D0tLEktTYipRc7islahQOjoEA', N'6566556665', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-02-04T22:31:01.860' AS DateTime), CAST(N'2022-02-04T22:31:01.860' AS DateTime), 14, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (15, N'test', N'final 1 sp', N'test@final1sp.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg0j7mqHPDOwt3BvdlGBbK9zudi1Ah-HEqR7KRP3qyQUfWDI5NbUUg8WqQCvnQXuotpmQbPcJi6LiKJbELoTXGuy4VFwHh80AzanKvv46R5uNg', N'6969696969', 2, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-02-04T22:35:37.980' AS DateTime), CAST(N'2022-02-04T22:35:37.980' AS DateTime), 15, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (16, N'test6', N'test6', N'test6@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg1jrJh-ncsSl0pO1DvvcDxCoU5ZSxjwyrGZmE5kGecppOTL7ZyzljBzzyJ34HEXvgSs_c0BqDkQdUYDkI9Jff9GDDq9KYEoId-6zX2T0RgOaw', N'6568656865', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-02-14T17:48:43.187' AS DateTime), CAST(N'2022-02-14T17:48:43.187' AS DateTime), 16, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (17, N'Customer', N'Mail', N'tkcust1@yopmail.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg0jRNIodwdNBs7OL7BZ8Wcg1rypWb413CxzEHgVUIK4oVkeVkuQGUpZGYPr8HRrfiEzGNePzwwdCrUJqOFtel-1HrDd09o4-kuWGlCp6AA65A', N'6969696969', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-02-16T15:22:24.723' AS DateTime), CAST(N'2022-02-16T15:22:24.723' AS DateTime), 17, 1, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (18, N'SP', N'1', N'tksp1@yopmail.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg0pLtgIre2Cg1btC20UgZHR0CdUESE7NAfhHUQKIPHyCCWrblIOjr65KKDo5a7TFBtq8ugBz_S_wCTbqZic7gkOKmewL2oWpWcdb3cu8oJTaA', N'6956452366', 2, 2, CAST(N'2001-03-13T00:00:00.000' AS DateTime), N'/assets/avatar-iron.png', 1, NULL, N'53225', 0, NULL, 1, CAST(N'2022-02-16T23:08:53.520' AS DateTime), CAST(N'2022-03-31T16:19:20.610' AS DateTime), 18, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (23, N'TK', N'Admin', N'tkadmin@yopmail.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg1lI1poCGLDCm6USehI2uhuhLyXTqmcw-a-TC9nxpq88c1MGTOsEuSLzgsF7LJKBuQTv5LZ5ZSFQHgrcc1X3OW613hpMEALuxGWqOgyK-3JnQ', N'6584695423', 3, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T23:16:55.823' AS DateTime), CAST(N'2022-01-31T23:16:55.823' AS DateTime), 23, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (24, N'some', N'some', N'someone2@test.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWIcJsSSRDgyFF50fgpOfiXqmPAOuQwmltWRixnDytUkRZHur1ws9k5utGOMqq1lA5g7bvRWQRqiHyL6r9GVtgu3yV3ZiMzRc4ntR7nrTERyhw', N'6598456645', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-30T15:21:41.580' AS DateTime), CAST(N'2022-03-30T15:21:41.583' AS DateTime), 24, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (25, N'Taukir', N'Khatri', N'taukir_cust@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWLHUfiqWq055Ek-wZiqLx2eX4VsCnGLRpnoCD80vefLvgz8nkQQm1b3bqSeuUKbuf3kCINIMyOOo2ewDKrQGxfG2DCg1lEUmcPTOsuoQuYh8g', N'6545695423', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-30T16:36:16.017' AS DateTime), CAST(N'2022-03-30T16:36:16.017' AS DateTime), 25, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (26, N'taukir', N'customer1', N'test_cust@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWJ9rhv172b60G_wBCi_uNnYsTXQjatvq2rEjLwCrfJDrWfWM22IzcxviOvchzGhhX1GL3UlEafbbwGZ_VLIohFxc67iQ5Ypc5JCPbkzM20oig', N'6545236556', 1, NULL, CAST(N'2000-02-09T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 0, 1, NULL, CAST(N'2022-03-31T14:48:19.857' AS DateTime), CAST(N'2022-03-31T15:02:44.387' AS DateTime), 26, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (27, N'Service', N'Provider Test', N'taukir_sptest@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWIwi-iNO2CrQ1bbj2KtntZGYYY-u6wELE_5jO_4PDnV2eCRBfRKnARiTRUXlysEcV2APq0lp1K9MTRN9YUEki9w197MOmmSzGSuQi7AVfiWRg', N'6549853268', 2, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-31T15:19:29.043' AS DateTime), CAST(N'2022-03-31T15:19:29.043' AS DateTime), 27, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (28, N'taukir', N'cust2', N'taukir_cust2@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWI31Pa4mTTlsBjyPbmUs5pIgNeZY-qeTLsuPPCnx3eymSXImFSmUIkjNWb0dDAnhrTyuK-qoKtzeJGRLDZG4c8ZY6CeFTEh6LPa4_1hNIuz_Q', N'8596545654', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-31T15:51:40.497' AS DateTime), CAST(N'2022-03-31T15:51:40.497' AS DateTime), 28, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (29, N'customer', N'test2', N'custtest@test.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWIEXBsDIDiljA0zdcNcoDE68gmfTUg3hnH_IByCLz4Iv2Oowcv8vhQFQuZj8GamW5vRMJVcMuUvLnWZU40V2pDX-K83avFuWYgVfSNMMYaW-Q', N'6545695425', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-31T16:01:58.983' AS DateTime), CAST(N'2022-03-31T16:01:58.983' AS DateTime), 29, 1, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (30, N'Final', N'Customer1', N'finalcust1@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWLAIPF3P_yD3F6YGcBrYYJ581eKOcC3gajhpaM9HqTr_x0ebP2rIF3bLTq9_r5T7T8-H4cexRTVIhJhBCzMlTO6HHTMmp39hIlHZJ_tljOYkw', N'6545694565', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-03-31T17:51:28.510' AS DateTime), CAST(N'2022-03-31T17:51:28.510' AS DateTime), 30, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (31, N'Taukirahmed', N'Khatri', N'khatritaukirahmed@gmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWLYXYPtRPILfyU4m7MRPabN4kiWB0_F56IdhmuGU82uMA5dRkiCm-R3NW-R0x5BSYkequWHqjPfEUnTF7vHakeyHgZ7gIMREUVVSXnHCLXbKA', N'6351443845', 1, NULL, CAST(N'2001-02-07T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 0, 1, NULL, CAST(N'2022-04-05T13:14:28.250' AS DateTime), CAST(N'2022-04-05T13:23:19.653' AS DateTime), 31, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (32, N'Service', N'Provider', N'service_provider@yopmail.com', N'CfDJ8P_8h7yZ6AxPiaCFD5SmVWLwakPi41TOCPq4cn2KZFL-UNrlIhgkVTdPM8vyRJl9B6r2fBXeLoRTnKyC7qD5NSdBYUMRKcLBWhhR89N986SM0-98QNKwhhZBwGBNh5iCpg', N'9564523654', 2, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-04-05T13:29:33.327' AS DateTime), CAST(N'2022-04-05T13:29:33.327' AS DateTime), 32, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Mobile], [UserTypeId], [Gender], [DateOfBirth], [UserProfilePicture], [IsRegisteredUser], [PaymentGatewayUserRef], [ZipCode], [WorksWithPets], [LanguageId], [NationalityId], [CreatedDate], [ModifiedDate], [ModifiedBy], [IsApproved], [IsActive], [IsDeleted], [Status], [BankTokenId], [TaxNo]) VALUES (1004, N'test1', N'test1', N'test1@test.com', N'CfDJ8OfQqCiI05BMiZh5guBIvg2OxW8ex5mc-QepF0ufPFvhTczuuSvcrvLS6CJsfljR_Qk6Mh7CDjtUqZk3e1RxFJgWTxHlOvMv4lEKxPYQOVe3wxv__MYNfmjtygo1Lw3T1w', N'6969696969', 1, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, CAST(N'2022-01-31T23:16:55.823' AS DateTime), CAST(N'2022-01-31T23:16:55.827' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddress] ON 

INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (2, 11, N'def', N'57', N'Minnesota', N'North Rhine-Westphalia', N'55322', 0, 0, N'7985646542', N'test5@test.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (3, 11, N'adafsd', N'45', N'Bonn', NULL, N'53225', 1, 0, N'6565656565', N'test5@test.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (6, 11, N'somestreet', N'123', N'Bonn', NULL, N'53225', 0, 0, N'9898989898', N'test5@test.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (9, 18, N'adafs', N'45', N'Bonn', NULL, N'53225', 1, 0, N'6956452365', N'tksp1@yopmail.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (10, 11, N'asdfdsf', N'465', N'Bonn', NULL, N'53225', 0, 0, N'6987456987', N'test5@test.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (11, 11, N'adafsd', N'456', N'vhvhgh', NULL, N'53225', 0, 0, N'6565656565', N'test5@test.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (12, 26, N'Somestreet', N'457', N'Bonn', NULL, N'53225', 1, 0, N'6545695456', N'test_cust@yopmail.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (14, 26, N'somestreet', N'845', N'Bonn', NULL, N'53225', 0, 0, N'6545956456', N'test_cust@yopmail.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (16, 30, N'SomeStreet', N'546', N'somecity', NULL, N'53225', 1, 0, N'6545694565', N'finalcust1@yopmail.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (31, 30, N'newstreet', N'456', N'Bonn', NULL, N'53225', 0, 0, N'6954231535', N'finalcust1@yopmail.com')
INSERT [dbo].[UserAddress] ([AddressId], [UserId], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [IsDefault], [IsDeleted], [Mobile], [Email]) VALUES (32, 31, N'Somestreet', N'456', N'Bonn', NULL, N'53225', 0, 0, N'6351443845', N'khatritaukirahmed@gmail.com')
SET IDENTITY_INSERT [dbo].[UserAddress] OFF
GO
/****** Object:  Index [indx_serviceid]    Script Date: 4/18/2022 2:38:55 PM ******/
CREATE NONCLUSTERED INDEX [indx_serviceid] ON [dbo].[ServiceRequest]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_OnTimeArrival]  DEFAULT ((0)) FOR [OnTimeArrival]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_Friendly]  DEFAULT ((0)) FOR [Friendly]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_QualityOfService]  DEFAULT ((0)) FOR [QualityOfService]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_PaymentDue]  DEFAULT ((0)) FOR [PaymentDue]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_IsPet]  DEFAULT ((0)) FOR [HasPets]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_Distance]  DEFAULT ((0)) FOR [Distance]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsRegisteredUser]  DEFAULT ((0)) FOR [IsRegisteredUser]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_WorksWithPets]  DEFAULT ((0)) FOR [WorksWithPets]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddresses_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[UserAddress] ADD  CONSTRAINT [DF_UserAddresses_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[FavoriteAndBlocked]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteAndBlocked_FavoriteAndBlocked] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteAndBlocked] CHECK CONSTRAINT [FK_FavoriteAndBlocked_FavoriteAndBlocked]
GO
ALTER TABLE [dbo].[FavoriteAndBlocked]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteAndBlocked_User] FOREIGN KEY([TargetUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteAndBlocked] CHECK CONSTRAINT [FK_FavoriteAndBlocked_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_ServiceRequest]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([RatingFrom])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User1] FOREIGN KEY([RatingTo])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User1]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User1] FOREIGN KEY([ServiceProviderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User1]
GO
ALTER TABLE [dbo].[ServiceRequestAddress]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestAddress_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[ServiceRequestAddress] CHECK CONSTRAINT [FK_ServiceRequestAddress_ServiceRequest]
GO
ALTER TABLE [dbo].[ServiceRequestExtra]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequestExtra_ServiceRequest] FOREIGN KEY([ServiceRequestId])
REFERENCES [dbo].[ServiceRequest] ([ServiceRequestId])
GO
ALTER TABLE [dbo].[ServiceRequestExtra] CHECK CONSTRAINT [FK_ServiceRequestExtra_ServiceRequest]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [FK_UserAddresses_User]
GO
ALTER TABLE [dbo].[Zipcode]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Zipcode] CHECK CONSTRAINT [FK_Zipcode_City]
GO
USE [master]
GO
ALTER DATABASE [HelperlandDB] SET  READ_WRITE 
GO
