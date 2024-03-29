USE [master]
GO
/****** Object:  Database [CountryCityInfoManagementDB]    Script Date: 9/2/2015 3:14:22 AM ******/
CREATE DATABASE [CountryCityInfoManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityInfoManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryCityInfoManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityInfoManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryCityInfoManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityInfoManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityInfoManagementDB]
GO
/****** Object:  Table [dbo].[CityTable]    Script Date: 9/2/2015 3:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityTable](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CityAbout] [varchar](500) NULL,
	[No_Of_Dwellers] [bigint] NULL,
	[Location] [varchar](500) NULL,
	[Weather] [varchar](100) NULL,
	[ID] [int] NULL,
 CONSTRAINT [PK_CityTable] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryTable]    Script Date: 9/2/2015 3:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryTable](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryAbout] [varchar](500) NULL,
 CONSTRAINT [PK_CountryTable] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetCityCountry]    Script Date: 9/2/2015 3:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCityCountry]
AS
SELECT ct.CityID,ct.CityName,ct.CityAbout,ct.No_Of_Dwellers,ct.Location,ct.Weather,con.CountryID,con.CountryName,con.CountryAbout FROM CityTable AS ct INNER JOIN CountryTable AS con
ON ct.CountryID=con.CountryID
GO
/****** Object:  View [dbo].[GetCountryCity]    Script Date: 9/2/2015 3:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCountryCity]
AS
SELECT * FROM CountryTable AS con INNER JOIN CityTable AS ct 
ON ct.ID=con.CountryID
GO
SET IDENTITY_INSERT [dbo].[CityTable] ON 

INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (1, N'Dhaka     ', N'big city  ', 12234, N'jani na', N'Hot', 1)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (2, N'rajosthan', N'gfdsg', 234, N'jani na', N'hot', 2)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (3, N'kashmir', N'njidfg', 45646, N'jani na', N'valo', 3)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (4, N'COMILLAH', N'THIS IS POOR', 33546, N'JANI NA', N'WEATHER', 5)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (5, N'bristi', N'dhaka is big city', 2346, N'gfdgfcghc', N'hgfhfgh', 4)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (7, N'Bangladesh', N'this is a green city', 2346, N'ythfgh', N'hfhfgh', 5)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (10, N'borishal', N'this kharap desh', 23434, N'jani na', N'kharap', 1)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (12, N'rongpur', N'rongpur', 3445, N'jani na', N'valo', 4)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (13, N'gaibanda', N'dolipara', 345, N'valo na', N'valo', 2)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (28, N'jakarta', N'<p>valo</p>', 354465, N'fgfdgfdg', N'gbfhgfhgfhfhf', 7)
INSERT [dbo].[CityTable] ([CityID], [CityName], [CityAbout], [No_Of_Dwellers], [Location], [Weather], [ID]) VALUES (1027, N'darda', N'<p>Islami country</p>', 3454, N'kdfji', N'fdgf', 1032)
SET IDENTITY_INSERT [dbo].[CityTable] OFF
SET IDENTITY_INSERT [dbo].[CountryTable] ON 

INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1, N'Bangledesh', N'this is a Green Nation')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (2, N'India', N'poor country')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (3, N'Indoneshia', N'Muslim Country')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (4, N'Pakistan', N'Majar Pagol Country')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (5, N'Bangladesh', N'this is a green city')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (7, N'lkjljk', N'l;k;kl'';')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1027, N'Srilanka', N'valo desh')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1031, N'USA', N'<p>English Country</p>')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1032, N'Irac', N'Islami Country')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1033, N'Zimbabua', N'gorib')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1034, N'Uk', N'Smart')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1035, N'germany', N'vaalo')
INSERT [dbo].[CountryTable] ([CountryID], [CountryName], [CountryAbout]) VALUES (1036, N'Kuet', N'takar dam beshi')
SET IDENTITY_INSERT [dbo].[CountryTable] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CityTable]    Script Date: 9/2/2015 3:14:23 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CityTable] ON [dbo].[CityTable]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CountryTable]    Script Date: 9/2/2015 3:14:23 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CountryTable] ON [dbo].[CountryTable]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CityTable]  WITH CHECK ADD  CONSTRAINT [FK_CityTable_CountryTable] FOREIGN KEY([ID])
REFERENCES [dbo].[CountryTable] ([CountryID])
GO
ALTER TABLE [dbo].[CityTable] CHECK CONSTRAINT [FK_CityTable_CountryTable]
GO
USE [master]
GO
ALTER DATABASE [CountryCityInfoManagementDB] SET  READ_WRITE 
GO
