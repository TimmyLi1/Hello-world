USE [master]
GO
/****** Object:  Database [ECA]    Script Date: 2016-04-14 11:32:43 ******/
CREATE DATABASE [ECA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECA] SET  MULTI_USER 
GO
ALTER DATABASE [ECA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ECA]
GO
/****** Object:  Table [dbo].[tbl_attendance]    Script Date: 2016-04-14 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_attendance](
	[attd_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[club_id] [int] NULL,
	[attd_date] [date] NULL,
	[attd_state] [nchar](1) NULL,
	[attd_detail] [nchar](100) NULL,
 CONSTRAINT [PK_tbl_attendance_1] PRIMARY KEY CLUSTERED 
(
	[attd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_clubs]    Script Date: 2016-04-14 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clubs](
	[club_id] [int] IDENTITY(1001,1) NOT NULL,
	[club_name] [nchar](50) NULL,
	[club_type] [bit] NULL,
	[number] [int] NOT NULL CONSTRAINT [DF_tbl_clubs_number]  DEFAULT ((0)),
	[max_number] [int] NULL,
 CONSTRAINT [PK_tbl_clubs] PRIMARY KEY CLUSTERED 
(
	[club_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_students]    Script Date: 2016-04-14 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_students](
	[student_id] [int] IDENTITY(1001,1) NOT NULL,
	[student_firname] [nchar](15) NULL,
	[student_famname] [nchar](15) NULL,
	[student_tutorgroup] [nchar](4) NULL,
	[student_email] [nchar](50) NULL,
	[student_password] [nchar](50) NULL,
	[sport_club_id] [int] NULL CONSTRAINT [DF_tbl_students_sport_club_id]  DEFAULT ((10000)),
	[aca_club_id] [int] NULL CONSTRAINT [DF_tbl_students_aca_club_id]  DEFAULT ((10000)),
 CONSTRAINT [PK_tbl_students] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_teachers]    Script Date: 2016-04-14 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_teachers](
	[teacher_id] [int] IDENTITY(1000,1) NOT NULL,
	[teacher_firname] [nchar](20) NULL,
	[teacher_famname] [nchar](20) NULL,
	[teacher_email] [nchar](50) NULL,
	[teacher_password] [nchar](50) NULL CONSTRAINT [DF_tbl_teachers_teacher_password]  DEFAULT (N'Password'),
	[sport_club_id] [int] NULL CONSTRAINT [DF_tbl_teachers_sport_club_id]  DEFAULT ((10000)),
	[aca_club_id] [int] NULL CONSTRAINT [DF_tbl_teachers_aca_club_id]  DEFAULT ((10000)),
 CONSTRAINT [PK_tbl_teachers] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_tripbooking]    Script Date: 2016-04-14 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tripbooking](
	[trip_id] [int] IDENTITY(1001,1) NOT NULL,
	[club_id] [int] NULL,
	[teacher_id] [int] NULL,
	[trip_title] [nchar](20) NULL,
	[trip_date] [date] NULL,
	[outward_time] [nchar](10) NULL,
	[backward_time] [nchar](10) NULL,
	[description] [nchar](200) NULL,
	[accept] [int] NOT NULL CONSTRAINT [DF_tbl_tripbooking_accept]  DEFAULT ((2)),
 CONSTRAINT [PK_tbl_tripbooking] PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [ECA] SET  READ_WRITE 
GO
