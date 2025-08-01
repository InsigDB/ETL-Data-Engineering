USE [master]
GO
/****** Object:  Database [BQ_Snowflake_Modele]    Script Date: 7/22/2025 2:24:16 AM ******/
CREATE DATABASE [BQ_Snowflake_Modele]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BQ_Star_Modele', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BQ_Star_Modele.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BQ_Star_Modele_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BQ_Star_Modele_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BQ_Snowflake_Modele].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ARITHABORT OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET RECOVERY FULL 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET  MULTI_USER 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BQ_Snowflake_Modele', N'ON'
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET QUERY_STORE = ON
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BQ_Snowflake_Modele]
GO
/****** Object:  Table [dbo].[Dimension_Client]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Client](
	[client_id] [int] NOT NULL,
	[last_name] [varchar](30) NULL,
	[first_name] [varchar](30) NULL,
	[city_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_Comptes_BQ]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Comptes_BQ](
	[account_id] [int] NOT NULL,
	[account_type] [varchar](30) NULL,
	[opening_date] [date] NULL,
	[client_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_date]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_date](
	[date_id] [int] NOT NULL,
	[day] [tinyint] NULL,
	[month] [tinyint] NULL,
	[quarter] [tinyint] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_Dimension_date] PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_pays]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_pays](
	[country_id] [int] NOT NULL,
	[country_name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_transaction]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_transaction](
	[transaction_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[date_id] [int] NULL,
	[transaction_type] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_villes]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_villes](
	[city_id] [int] NOT NULL,
	[city_name] [varchar](40) NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fait_transaction]    Script Date: 7/22/2025 2:24:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fait_transaction](
	[client_id] [int] NULL,
	[transaction_id] [int] NULL,
	[date_id] [int] NULL,
	[account_id] [int] NULL,
	[amount] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dimension_Client]  WITH CHECK ADD  CONSTRAINT [FK_ville_id_client] FOREIGN KEY([city_id])
REFERENCES [dbo].[Dimension_villes] ([city_id])
GO
ALTER TABLE [dbo].[Dimension_Client] CHECK CONSTRAINT [FK_ville_id_client]
GO
ALTER TABLE [dbo].[Dimension_Comptes_BQ]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Dimension_Client] ([client_id])
GO
ALTER TABLE [dbo].[Dimension_transaction]  WITH CHECK ADD  CONSTRAINT [FK_compte_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[Dimension_Comptes_BQ] ([account_id])
GO
ALTER TABLE [dbo].[Dimension_transaction] CHECK CONSTRAINT [FK_compte_id]
GO
ALTER TABLE [dbo].[Dimension_transaction]  WITH CHECK ADD  CONSTRAINT [FK_date_id] FOREIGN KEY([date_id])
REFERENCES [dbo].[Dimension_date] ([date_id])
GO
ALTER TABLE [dbo].[Dimension_transaction] CHECK CONSTRAINT [FK_date_id]
GO
ALTER TABLE [dbo].[Dimension_villes]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[Dimension_pays] ([country_id])
GO
ALTER TABLE [dbo].[fait_transaction]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Dimension_Client] ([client_id])
GO
ALTER TABLE [dbo].[fait_transaction]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Dimension_Comptes_BQ] ([account_id])
GO
ALTER TABLE [dbo].[fait_transaction]  WITH CHECK ADD  CONSTRAINT [FK__fait_tran__date___6383C8BA] FOREIGN KEY([date_id])
REFERENCES [dbo].[Dimension_date] ([date_id])
GO
ALTER TABLE [dbo].[fait_transaction] CHECK CONSTRAINT [FK__fait_tran__date___6383C8BA]
GO
ALTER TABLE [dbo].[fait_transaction]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[Dimension_transaction] ([transaction_id])
GO
USE [master]
GO
ALTER DATABASE [BQ_Snowflake_Modele] SET  READ_WRITE 
GO
