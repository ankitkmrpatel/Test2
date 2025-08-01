USE [master]
GO
/****** Object:  Database [CarbonEmissionExt]    Script Date: 14-07-2025 08:52:27 ******/
CREATE DATABASE [CarbonEmissionExt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarbonEmissionExt', FILENAME = N'/var/opt/mssql/data/CarbonEmissionExt.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarbonEmissionExt_log', FILENAME = N'/var/opt/mssql/data/CarbonEmissionExt_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CarbonEmissionExt] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarbonEmissionExt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarbonEmissionExt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarbonEmissionExt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarbonEmissionExt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarbonEmissionExt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarbonEmissionExt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET RECOVERY FULL 
GO
ALTER DATABASE [CarbonEmissionExt] SET  MULTI_USER 
GO
ALTER DATABASE [CarbonEmissionExt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarbonEmissionExt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarbonEmissionExt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarbonEmissionExt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarbonEmissionExt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarbonEmissionExt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarbonEmissionExt', N'ON'
GO
ALTER DATABASE [CarbonEmissionExt] SET QUERY_STORE = ON
GO
ALTER DATABASE [CarbonEmissionExt] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CarbonEmissionExt]
GO
/****** Object:  Schema [world]    Script Date: 14-07-2025 08:52:27 ******/
CREATE SCHEMA [world]
GO
/****** Object:  Table [world].[cities]    Script Date: 14-07-2025 08:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [world].[cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[state_id] [int] NOT NULL,
	[state_code] [nvarchar](5) NOT NULL,
	[state_name] [nvarchar](255) NOT NULL,
	[country_id] [int] NOT NULL,
	[country_code] [nchar](2) NOT NULL,
	[country_name] [nvarchar](255) NOT NULL,
	[latitude] [decimal](10, 8) NOT NULL,
	[longitude] [decimal](11, 8) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[flag] [bit] NOT NULL,
	[wikiDataId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [world].[countries]    Script Date: 14-07-2025 08:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [world].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[iso3] [nchar](3) NULL,
	[numeric_code] [nchar](3) NULL,
	[iso2] [nchar](2) NULL,
	[phonecode] [nvarchar](255) NULL,
	[capital] [nvarchar](255) NULL,
	[currency] [nvarchar](255) NULL,
	[currency_name] [nvarchar](255) NULL,
	[currency_symbol] [nvarchar](255) NULL,
	[tld] [nvarchar](255) NULL,
	[native] [nvarchar](255) NULL,
	[region] [nvarchar](255) NULL,
	[region_id] [int] NULL,
	[subregion] [nvarchar](255) NULL,
	[subregion_id] [int] NULL,
	[nationality] [nvarchar](255) NULL,
	[timezones] [nvarchar](max) NULL,
	[translations] [nvarchar](max) NULL,
	[latitude] [decimal](10, 8) NULL,
	[longitude] [decimal](11, 8) NULL,
	[emoji] [nvarchar](191) NULL,
	[emojiU] [nvarchar](191) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[flag] [bit] NOT NULL,
	[wikiDataId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [world].[regions]    Script Date: 14-07-2025 08:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [world].[regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[translations] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[flag] [bit] NOT NULL,
	[wikiDataId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [world].[states]    Script Date: 14-07-2025 08:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [world].[states](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[country_id] [int] NOT NULL,
	[country_code] [nchar](2) NOT NULL,
	[country_name] [nvarchar](255) NOT NULL,
	[state_code] [nvarchar](5) NULL,
	[fips_code] [nvarchar](255) NULL,
	[iso2] [nvarchar](255) NULL,
	[type] [nvarchar](191) NULL,
	[latitude] [decimal](10, 8) NULL,
	[longitude] [decimal](11, 8) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[flag] [bit] NOT NULL,
	[wikiDataId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [world].[subregions]    Script Date: 14-07-2025 08:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [world].[subregions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[translations] [nvarchar](max) NULL,
	[region_id] [int] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[flag] [bit] NOT NULL,
	[wikiDataId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [world].[cities] ADD  DEFAULT ('2014-01-01 12:01:01') FOR [created_at]
GO
ALTER TABLE [world].[cities] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [world].[cities] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [world].[countries] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [world].[countries] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [world].[regions] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [world].[regions] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [world].[states] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [world].[states] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [world].[subregions] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [world].[subregions] ADD  DEFAULT ((1)) FOR [flag]
GO
ALTER TABLE [world].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countries] FOREIGN KEY([country_id])
REFERENCES [world].[countries] ([id])
GO
ALTER TABLE [world].[cities] CHECK CONSTRAINT [FK_cities_countries]
GO
ALTER TABLE [world].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_states] FOREIGN KEY([state_id])
REFERENCES [world].[states] ([id])
GO
ALTER TABLE [world].[cities] CHECK CONSTRAINT [FK_cities_states]
GO
ALTER TABLE [world].[countries]  WITH CHECK ADD  CONSTRAINT [FK_countries_regions] FOREIGN KEY([region_id])
REFERENCES [world].[regions] ([id])
GO
ALTER TABLE [world].[countries] CHECK CONSTRAINT [FK_countries_regions]
GO
ALTER TABLE [world].[countries]  WITH CHECK ADD  CONSTRAINT [FK_countries_subregions] FOREIGN KEY([subregion_id])
REFERENCES [world].[subregions] ([id])
GO
ALTER TABLE [world].[countries] CHECK CONSTRAINT [FK_countries_subregions]
GO
ALTER TABLE [world].[states]  WITH CHECK ADD  CONSTRAINT [FK_states_countries] FOREIGN KEY([country_id])
REFERENCES [world].[countries] ([id])
GO
ALTER TABLE [world].[states] CHECK CONSTRAINT [FK_states_countries]
GO
ALTER TABLE [world].[subregions]  WITH CHECK ADD  CONSTRAINT [FK_subregions_regions] FOREIGN KEY([region_id])
REFERENCES [world].[regions] ([id])
GO
ALTER TABLE [world].[subregions] CHECK CONSTRAINT [FK_subregions_regions]
GO
USE [master]
GO
ALTER DATABASE [CarbonEmissionExt] SET  READ_WRITE 
GO
