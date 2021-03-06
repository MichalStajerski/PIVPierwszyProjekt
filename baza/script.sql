USE [master]
GO
/****** Object:  Database [Parking]    Script Date: 27.04.2020 22:07:10 ******/
CREATE DATABASE [Parking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL\MSSQL\DATA\Parking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Parking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL\MSSQL\DATA\Parking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Parking] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Parking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parking] SET RECOVERY FULL 
GO
ALTER DATABASE [Parking] SET  MULTI_USER 
GO
ALTER DATABASE [Parking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Parking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Parking', N'ON'
GO
ALTER DATABASE [Parking] SET QUERY_STORE = OFF
GO
USE [Parking]
GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 27.04.2020 22:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[IDBiletu] [int] IDENTITY(1,1) NOT NULL,
	[BDataPobrania] [datetime] NULL,
	[BDataZaplacenia] [datetime] NULL,
	[BCena] [money] NULL,
	[BIlosc] [int] NULL,
	[BRodzajBiletu] [varchar](50) NULL,
	[IDkierowcy] [int] NULL,
 CONSTRAINT [PK_Bilet] PRIMARY KEY CLUSTERED 
(
	[IDBiletu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kierowca]    Script Date: 27.04.2020 22:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kierowca](
	[IDKierowcy] [int] IDENTITY(1,1) NOT NULL,
	[KImie] [varchar](50) NULL,
	[KNazwisko] [varchar](50) NULL,
	[KTelefon] [int] NULL,
 CONSTRAINT [PK_Kierowca] PRIMARY KEY CLUSTERED 
(
	[IDKierowcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiejsceParkingowe]    Script Date: 27.04.2020 22:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiejsceParkingowe](
	[IDMiejscaParkingowego] [int] IDENTITY(1,1) NOT NULL,
	[IDKierowcy] [int] NOT NULL,
 CONSTRAINT [PK_MiejsceParkingowe] PRIMARY KEY CLUSTERED 
(
	[IDKierowcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Samochod]    Script Date: 27.04.2020 22:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Samochod](
	[IDSamochodu] [int] IDENTITY(1,1) NOT NULL,
	[SMolor] [varchar](50) NULL,
	[SMarka] [varchar](50) NULL,
	[IDKierowcy] [int] NULL,
	[SModel] [varchar](50) NULL,
	[STablicaRejestracyjna] [varchar](50) NULL,
 CONSTRAINT [PK_Samochod] PRIMARY KEY CLUSTERED 
(
	[IDSamochodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bilet] ON 

INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (3, NULL, NULL, NULL, NULL, N'całodobowy', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (4, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (5, NULL, NULL, NULL, NULL, N'całodobowy', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (6, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (7, NULL, NULL, 20.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (8, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (9, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (10, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (11, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (12, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (13, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (14, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (15, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (16, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (17, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (18, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (19, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1003, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1004, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1005, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1006, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1007, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1008, NULL, NULL, 5.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1009, NULL, NULL, NULL, NULL, N'całodobowy', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1010, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1011, NULL, NULL, 20.0000, NULL, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1012, NULL, NULL, NULL, NULL, N'godzinny', NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1013, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Bilet] ([IDBiletu], [BDataPobrania], [BDataZaplacenia], [BCena], [BIlosc], [BRodzajBiletu], [IDkierowcy]) VALUES (1014, NULL, NULL, 5.0000, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bilet] OFF
SET IDENTITY_INSERT [dbo].[Kierowca] ON 

INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1, N'Vader', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (2, N'kubus', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (3, NULL, N'puchatek', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (4, N'kubu', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (5, NULL, N'Puchatek', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (6, N'Jan', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (7, NULL, N'Kowalski', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (8, N'anakin', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (9, NULL, N'skywalker', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (10, N'jar-jar', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (11, NULL, N'binks', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (12, N'Fiona', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (13, NULL, N'Królewna', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (14, N'waldemar', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (15, NULL, N'kiepski', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (16, N'geralt', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (17, NULL, N'wiedzmin', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (18, N'ostatni', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (19, NULL, N'test', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1002, N'natalie', NULL, NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1003, NULL, N'portman', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1004, N'jan', N'wojcik', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1005, NULL, N'wojcik', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1006, N'george', N'smith', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1007, NULL, N'smith', NULL)
INSERT [dbo].[Kierowca] ([IDKierowcy], [KImie], [KNazwisko], [KTelefon]) VALUES (1008, N'wreszcie', N'działa', NULL)
SET IDENTITY_INSERT [dbo].[Kierowca] OFF
USE [master]
GO
ALTER DATABASE [Parking] SET  READ_WRITE 
GO
