USE [master]
GO
/****** Object:  Database [CurrencyConvertorDB]    Script Date: 4/25/2022 5:13:41 PM ******/
CREATE DATABASE [CurrencyConvertorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CurrencyConvertorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CurrencyConvertorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CurrencyConvertorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CurrencyConvertorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CurrencyConvertorDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CurrencyConvertorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CurrencyConvertorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CurrencyConvertorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CurrencyConvertorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CurrencyConvertorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CurrencyConvertorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CurrencyConvertorDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CurrencyConvertorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CurrencyConvertorDB] SET  MULTI_USER 
GO
ALTER DATABASE [CurrencyConvertorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CurrencyConvertorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CurrencyConvertorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CurrencyConvertorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CurrencyConvertorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CurrencyConvertorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CurrencyConvertorDB] SET QUERY_STORE = OFF
GO
USE [CurrencyConvertorDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2022 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Sign] [nvarchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExchangeHistory]    Script Date: 4/25/2022 5:13:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurId] [int] NOT NULL,
	[ExchangeDate] [datetime2](7) NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_ExchangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220422215025_intial', N'5.0.16')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'ADMIN', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7b86bae9-8f7e-45c4-a597-a268eecbb365', N'aya', N'AYA', N'aya@gmail.com', N'AYA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOiZDjMLQ9KU9IveZKi2qX0QfWRB85LG4OhNZZKxr/DQzee2J2iTiuMArHrrPGHBBQ==', N'7AHWHYBALBLUIAVXGUVMWEB3BHQ4VYK3', N'48939d83-1aa8-42dc-be97-10521cb0841b', N'01119854789', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ea0216d8-8a9b-44df-9180-2ea54489463e', N'a', N'A', N'a@gmail.com', N'A@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAwxMPC1lgD7x6tpKb4NmM7FjpAqemISSCH/MMiAxCYShs6LZNCt9BhJterZ1IF6ag==', N'MSB7BFDISYK5QUJEOBPM4RMITYYRNUXC', N'5428357b-e6bd-473e-9d37-543dd60870c6', N'01119854789', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (1, N'usd Doller', N'$', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (2, N'pound', N'le', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (3, N'Euro', N'Eur', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (4, N'Algerian Dinar	', N'DZD', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (5, N'Lek', N'All', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (6, N'SAR', N'SAR', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (7, N'kuwite Dinars', N'KWD', 1)
INSERT [dbo].[Currency] ([Id], [Name], [Sign], [IsActive]) VALUES (8, N'SYP', N'SYP', 1)
SET IDENTITY_INSERT [dbo].[Currency] OFF
GO
SET IDENTITY_INSERT [dbo].[ExchangeHistory] ON 

INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (1, 1, CAST(N'2011-04-22T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (2, 2, CAST(N'2022-04-22T00:00:00.0000000' AS DateTime2), 0.054)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (3, 3, CAST(N'2022-04-22T00:00:00.0000000' AS DateTime2), 1.113)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (4, 4, CAST(N'2022-04-22T00:00:00.0000000' AS DateTime2), 3.27)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (5, 5, CAST(N'2022-04-22T00:00:00.0000000' AS DateTime2), 0.009)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (10, 2, CAST(N'2015-04-02T00:00:00.0000000' AS DateTime2), 0.59)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (11, 2, CAST(N'2019-04-02T00:00:00.0000000' AS DateTime2), 0.86)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (12, 2, CAST(N'2022-04-24T01:53:28.7677916' AS DateTime2), 0.054)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (13, 2, CAST(N'2021-05-20T00:00:00.0000000' AS DateTime2), 0.91)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (14, 6, CAST(N'2011-04-22T00:00:00.0000000' AS DateTime2), 0.72)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (15, 6, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), 0.27)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (16, 2, CAST(N'2010-02-10T00:00:00.0000000' AS DateTime2), 0.65)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (18, 6, CAST(N'2016-03-03T00:00:00.0000000' AS DateTime2), 0.67)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (19, 3, CAST(N'2016-05-05T00:00:00.0000000' AS DateTime2), 1.111)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (20, 3, CAST(N'2012-02-02T00:00:00.0000000' AS DateTime2), 1.09)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (21, 3, CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), 1.02)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (22, 7, CAST(N'2022-03-03T00:00:00.0000000' AS DateTime2), 3.27)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (23, 7, CAST(N'2018-03-03T00:00:00.0000000' AS DateTime2), 3.1)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (24, 7, CAST(N'2015-07-07T00:00:00.0000000' AS DateTime2), 2.9)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (25, 7, CAST(N'2013-03-03T00:00:00.0000000' AS DateTime2), 2.6)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (26, 7, CAST(N'2011-02-02T00:00:00.0000000' AS DateTime2), 2.4)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (27, 7, CAST(N'2009-09-09T00:00:00.0000000' AS DateTime2), 2.1)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (28, 8, CAST(N'2022-04-24T02:45:18.3770635' AS DateTime2), 3.8)
INSERT [dbo].[ExchangeHistory] ([Id], [CurId], [ExchangeDate], [Rate]) VALUES (29, 4, CAST(N'2022-04-25T08:49:27.5038596' AS DateTime2), 3.29)
SET IDENTITY_INSERT [dbo].[ExchangeHistory] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExchangeHistory_CurId]    Script Date: 4/25/2022 5:13:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExchangeHistory_CurId] ON [dbo].[ExchangeHistory]
(
	[CurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ExchangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_ExchangeHistory_Currency_CurId] FOREIGN KEY([CurId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[ExchangeHistory] CHECK CONSTRAINT [FK_ExchangeHistory_Currency_CurId]
GO
USE [master]
GO
ALTER DATABASE [CurrencyConvertorDB] SET  READ_WRITE 
GO
