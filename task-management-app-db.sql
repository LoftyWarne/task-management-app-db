USE [master]
GO
/****** Object:  Database [task-management-db]    Script Date: 23/01/2023 22:37:28 ******/
CREATE DATABASE [task-management-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'task-management-db', FILENAME = N'D:\rdsdbdata\DATA\task-management-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'task-management-db_log', FILENAME = N'D:\rdsdbdata\DATA\task-management-db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [task-management-db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [task-management-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [task-management-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [task-management-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [task-management-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [task-management-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [task-management-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [task-management-db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [task-management-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [task-management-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [task-management-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [task-management-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [task-management-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [task-management-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [task-management-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [task-management-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [task-management-db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [task-management-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [task-management-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [task-management-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [task-management-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [task-management-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [task-management-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [task-management-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [task-management-db] SET RECOVERY FULL 
GO
ALTER DATABASE [task-management-db] SET  MULTI_USER 
GO
ALTER DATABASE [task-management-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [task-management-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [task-management-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [task-management-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [task-management-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [task-management-db] SET QUERY_STORE = OFF
GO
USE [task-management-db]
GO
/****** Object:  User [admin]    Script Date: 23/01/2023 22:37:29 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[tbl_List]    Script Date: 23/01/2023 22:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_List](
	[tbl_PK_List] [int] IDENTITY(1,1) NOT NULL,
	[tbl_ListName] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[tbl_PK_List] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Task]    Script Date: 23/01/2023 22:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Task](
	[tbl_PK_Task] [int] IDENTITY(1,1) NOT NULL,
	[tbl_FK_List] [int] NOT NULL,
	[tbl_TaskName] [varchar](500) NULL,
	[tbl_TaskDescription] [varchar](max) NULL,
	[tbl_TaskDeadline] [date] NULL,
	[tbl_TaskComplete] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Task] ADD  CONSTRAINT [DF_tbl_Task_tbl_TaskComplete]  DEFAULT ((0)) FOR [tbl_TaskComplete]
GO
ALTER TABLE [dbo].[tbl_Task]  WITH CHECK ADD FOREIGN KEY([tbl_FK_List])
REFERENCES [dbo].[tbl_List] ([tbl_PK_List])
GO
USE [master]
GO
ALTER DATABASE [task-management-db] SET  READ_WRITE 
GO
