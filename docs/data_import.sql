USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 23.10.2024 13:31:07 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufacturerProduct]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturerProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ManufacturerProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameProduct]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[OrderDateCreate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[IdPickPoint] [int] NOT NULL,
	[IdUser] [int] NULL,
	[Code] [int] NOT NULL,
	[IdOrderStatus] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFC3E8308E] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A26624CE02D84] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumPoint] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[NumHome] [int] NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[IdNameProduct] [int] NOT NULL,
	[IdUnit] [int] NOT NULL,
	[ProductCost] [decimal](18, 2) NOT NULL,
	[MaxDiscount] [decimal](18, 2) NOT NULL,
	[IdManufacturer] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[DiscountNow] [decimal](18, 2) NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[NamePhoto] [nvarchar](50) NULL,
	[ProductPhoto] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierProduct]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProduct](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SupplierProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Izmerenie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.10.2024 13:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](150) NOT NULL,
	[UserPassword] [nvarchar](150) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACFDC7DB89] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryProduct] ON 

INSERT [dbo].[CategoryProduct] ([Id], [Name]) VALUES (1, N'Для животных')
INSERT [dbo].[CategoryProduct] ([Id], [Name]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[CategoryProduct] ([Id], [Name]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[CategoryProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Нефтеюганск')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[ManufacturerProduct] ON 

INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[ManufacturerProduct] ([Id], [Name]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[ManufacturerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[NameProduct] ON 

INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[NameProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, NULL, 601, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, NULL, 602, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 8, 603, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, NULL, 604, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (5, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, NULL, 605, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 7, 606, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (7, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, NULL, 607, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (8, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, NULL, 608, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (9, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 10, 609, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderDateCreate], [OrderDeliveryDate], [IdPickPoint], [IdUser], [Code], [IdOrderStatus]) VALUES (10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 9, 610, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (1, 1, 30, 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (2, 2, 10, 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (3, 3, 9, 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (4, 4, 11, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (5, 5, 23, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (6, 6, 16, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (7, 7, 14, 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (8, 8, 19, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (9, 9, 27, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (10, 10, 21, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (11, 1, 12, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (12, 2, 29, 15)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (13, 3, 25, 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (14, 4, 5, 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (15, 5, 6, 10)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (16, 6, 4, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (17, 7, 22, 2)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (18, 8, 27, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (19, 9, 20, 1)
INSERT [dbo].[OrderProduct] ([Id], [IdOrder], [IdProduct], [Count]) VALUES (20, 10, 28, 1)
GO
SET IDENTITY_INSERT [dbo].[PickPoint] ON 

INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (1, 344288, 1, N'Чехова', 1)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (2, 614164, 1, N'Степная', 30)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (3, 394242, 1, N'Коммунистическая', 43)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (4, 660540, 1, N'Солнечная', 25)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (5, 125837, 1, N'Шоссейная', 40)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (6, 125703, 1, N'Партизанская', 49)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (7, 625283, 1, N'Победы', 46)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (8, 614611, 1, N'Молодежная', 50)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (9, 454311, 1, N'Новая', 19)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (10, 660007, 1, N'Октябрьская', 19)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (11, 603036, 1, N'Садовая', 4)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (12, 450983, 1, N'Комсомольская', 26)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (13, 394782, 1, N'Чехова', 3)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (14, 603002, 1, N'Дзержинского', 28)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (15, 450558, 1, N'Набережная', 30)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (16, 394060, 1, N'Фрунзе', 43)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (17, 410661, 1, N'Школьная', 50)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (18, 625590, 1, N'Коммунистическая', 20)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (19, 625683, 1, N'8 Марта', NULL)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (20, 400562, 1, N'Зеленая', 32)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (21, 614510, 1, N'Маяковского', 47)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (22, 410542, 1, N'Светлая', 46)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (23, 620839, 1, N'Цветочная', 8)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (24, 443890, 1, N'Коммунистическая', 1)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (25, 603379, 1, N'Спортивная', 46)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (26, 603721, 1, N'Гоголя', 41)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (27, 410172, 1, N'Северная', 13)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (28, 420151, 1, N'Вишневая', 32)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (29, 125061, 1, N'Подгорная', 8)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (30, 630370, 1, N'Шоссейная', 24)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (31, 614753, 1, N'Полевая', 35)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (32, 426030, 1, N'Маяковского', 44)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (33, 450375, 1, N'Клубная', 44)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (34, 625560, 1, N'Некрасова', 12)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (35, 630201, 1, N'Комсомольская', 17)
INSERT [dbo].[PickPoint] ([Id], [NumPoint], [IdCity], [Street], [NumHome]) VALUES (36, 190949, 1, N'Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PickPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (1, N'B427R5', 5, 1, CAST(400.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, 2, 1, CAST(4.00 AS Decimal(18, 2)), 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (2, N'D356R4', 6, 1, CAST(600.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 11, 1, 3, CAST(2.00 AS Decimal(18, 2)), 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (3, N'D563F4', 1, 1, CAST(600.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 10, 1, 3, CAST(5.00 AS Decimal(18, 2)), 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (4, N'D643B5', 7, 1, CAST(4100.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 1, 1, 2, CAST(4.00 AS Decimal(18, 2)), 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (5, N'E345R4', 1, 1, CAST(199.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 5, 2, 2, CAST(5.00 AS Decimal(18, 2)), 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (6, N'E431R5', 3, 1, CAST(170.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 10, 2, 3, CAST(5.00 AS Decimal(18, 2)), 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'E431R5.png', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (7, N'E434U6', 3, 1, CAST(140.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 9, 2, 3, CAST(3.00 AS Decimal(18, 2)), 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (8, N'E466T6', 2, 1, CAST(3500.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 10, 2, 3, CAST(5.00 AS Decimal(18, 2)), 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (9, N'E532Q5', 3, 1, CAST(166.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 9, 1, 3, CAST(5.00 AS Decimal(18, 2)), 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (10, N'F432F4', 7, 1, CAST(1200.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 8, 2, 2, CAST(3.00 AS Decimal(18, 2)), 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (11, N'G345E4', 6, 1, CAST(300.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 6, 2, 3, CAST(3.00 AS Decimal(18, 2)), 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (12, N'G453T5', 8, 1, CAST(149.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 12, 2, 1, CAST(2.00 AS Decimal(18, 2)), 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (13, N'G542F5', 7, 1, CAST(2190.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 8, 1, 3, CAST(4.00 AS Decimal(18, 2)), 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (14, N'H342F5', 1, 1, CAST(510.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 10, 2, 3, CAST(2.00 AS Decimal(18, 2)), 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (15, N'H432F4', 5, 1, CAST(385.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 10, 2, 1, CAST(2.00 AS Decimal(18, 2)), 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (16, N'H436R4', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, 1, 3, CAST(2.00 AS Decimal(18, 2)), 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (17, N'H542R6', 3, 1, CAST(177.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 10, 2, 3, CAST(3.00 AS Decimal(18, 2)), 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (18, N'H643W2', 5, 1, CAST(292.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 10, 1, 1, CAST(3.00 AS Decimal(18, 2)), 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (19, N'K436T5', 6, 1, CAST(100.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 10, 2, 3, CAST(4.00 AS Decimal(18, 2)), 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (20, N'K452T5', 4, 1, CAST(800.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 13, 2, 3, CAST(2.00 AS Decimal(18, 2)), 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (21, N'M356R4', 3, 1, CAST(50.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 9, 2, 3, CAST(4.00 AS Decimal(18, 2)), 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (22, N'Q245F5', 1, 1, CAST(510.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 10, 2, 3, CAST(2.00 AS Decimal(18, 2)), 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (23, N'R356F4', 5, 1, CAST(234.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 7, 1, 3, CAST(3.00 AS Decimal(18, 2)), 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (24, N'S245R4', 7, 1, CAST(280.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 1, 2, 2, CAST(3.00 AS Decimal(18, 2)), 8, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (25, N'T432F4', 7, 1, CAST(1700.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 2, 2, 3, CAST(2.00 AS Decimal(18, 2)), 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (26, N'V352R4', 7, 1, CAST(1700.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 2, 1, 3, CAST(4.00 AS Decimal(18, 2)), 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (27, N'V527T5', 1, 1, CAST(640.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 10, 1, 3, CAST(5.00 AS Decimal(18, 2)), 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (28, N'W548O7', 7, 1, CAST(600.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 3, 1, 3, CAST(5.00 AS Decimal(18, 2)), 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (29, N'Y324F4', 3, 1, CAST(86.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 9, 1, 3, CAST(4.00 AS Decimal(18, 2)), 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [IdNameProduct], [IdUnit], [ProductCost], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdCategory], [DiscountNow], [ProductQuantityInStock], [ProductDescription], [NamePhoto], [ProductPhoto]) VALUES (30, N'А112Т4', 3, 1, CAST(123.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 4, 1, 2, CAST(3.00 AS Decimal(18, 2)), 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'А112Т4.png', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[SupplierProduct] ([Id], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[SupplierProduct] ([Id], [Name]) VALUES (2, N'ZooMir')
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickPoint] FOREIGN KEY([IdPickPoint])
REFERENCES [dbo].[PickPoint] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([IdOrderStatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_City] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_City]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryProduct] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoryProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Izmerenie] FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Izmerenie]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ManufacturerProduct] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[ManufacturerProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ManufacturerProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_NameProduct] FOREIGN KEY([IdNameProduct])
REFERENCES [dbo].[NameProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_NameProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SupplierProduct] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[SupplierProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SupplierProduct]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__4316F928] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__4316F928]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
