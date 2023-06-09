USE [master]
GO
/****** Object:  Database [pr419]    Script Date: 01.04.2023 16:33:55 ******/
CREATE DATABASE [pr419]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pr419', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pr419.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pr419_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pr419_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pr419] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pr419].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pr419] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pr419] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pr419] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pr419] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pr419] SET ARITHABORT OFF 
GO
ALTER DATABASE [pr419] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pr419] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pr419] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pr419] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pr419] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pr419] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pr419] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pr419] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pr419] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pr419] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pr419] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pr419] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pr419] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pr419] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pr419] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pr419] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pr419] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pr419] SET RECOVERY FULL 
GO
ALTER DATABASE [pr419] SET  MULTI_USER 
GO
ALTER DATABASE [pr419] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pr419] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pr419] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pr419] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pr419] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pr419] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pr419', N'ON'
GO
ALTER DATABASE [pr419] SET QUERY_STORE = OFF
GO
USE [pr419]
GO
/****** Object:  Table [dbo].[Склады]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склады](
	[ид] [int] IDENTITY(1,1) NOT NULL,
	[адрес] [nvarchar](50) NOT NULL,
	[название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Склады] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[Артикул] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Единица_измерения] [nvarchar](50) NOT NULL,
	[Стоимость] [smallint] NOT NULL,
	[Размер_максимально_возможной_скидки] [tinyint] NOT NULL,
	[Производитель] [nvarchar](50) NOT NULL,
	[Поставщик] [nvarchar](50) NOT NULL,
	[Категория_товара] [int] NOT NULL,
	[Действующая_скидка] [int] NOT NULL,
	[Описание] [nvarchar](100) NOT NULL,
	[Изображение] [nvarchar](50) NULL,
 CONSTRAINT [PK_Продукция] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КатегорииТоваров]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КатегорииТоваров](
	[ид] [int] IDENTITY(0,1) NOT NULL,
	[название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_КатегорииТоваров] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПродукцияНаСкладе]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПродукцияНаСкладе](
	[ид склада] [int] NOT NULL,
	[артикул продукции] [nvarchar](50) NOT NULL,
	[количество] [int] NOT NULL,
 CONSTRAINT [PK_ПродукцияНаСкладе] PRIMARY KEY CLUSTERED 
(
	[ид склада] ASC,
	[артикул продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ProdutsDetails]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ProdutsDetails]
AS
SELECT        TOP (100) PERCENT dbo.ПродукцияНаСкладе.количество, dbo.Продукция.Артикул, dbo.Продукция.Наименование, dbo.Склады.название, dbo.Продукция.Стоимость, dbo.Продукция.Действующая_скидка, 
                         dbo.Продукция.Размер_максимально_возможной_скидки, dbo.КатегорииТоваров.название AS Категория, dbo.Продукция.Описание
FROM            dbo.Склады INNER JOIN
                         dbo.ПродукцияНаСкладе ON dbo.Склады.ид = dbo.ПродукцияНаСкладе.[ид склада] INNER JOIN
                         dbo.Продукция ON dbo.ПродукцияНаСкладе.[артикул продукции] = dbo.Продукция.Артикул INNER JOIN
                         dbo.КатегорииТоваров ON dbo.Продукция.Категория_товара = dbo.КатегорииТоваров.ид
WHERE        (dbo.ПродукцияНаСкладе.количество >= 3)
ORDER BY dbo.Склады.название, dbo.Продукция.Наименование DESC
GO
/****** Object:  Table [dbo].[ПродукцияЗаказа]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПродукцияЗаказа](
	[ид заказа] [int] NOT NULL,
	[ид продукта] [nvarchar](50) NOT NULL,
	[количество] [int] NOT NULL,
	[ид] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ПродукцияЗаказа] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ид] [int] IDENTITY(1,1) NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Дата_доставки] [date] NOT NULL,
	[Пункт_выдачи] [int] NOT NULL,
	[Клиент] [int] NULL,
	[Код_для_получения] [int] NOT NULL,
	[Статус_заказа] [int] NOT NULL,
	[Терминал] [int] NULL,
	[СтоимостьЗаказа] [int] NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_OrdersDetails]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_OrdersDetails]
AS
SELECT        dbo.Заказы.ид, SUM(dbo.ПродукцияЗаказа.количество * (dbo.Продукция.Стоимость - dbo.Продукция.Стоимость / 100 * dbo.Продукция.Действующая_скидка)) AS Стоимость, dbo.Заказы.Дата_заказа, 
                         dbo.Заказы.Дата_доставки, dbo.Заказы.Пункт_выдачи, dbo.Заказы.Клиент, dbo.Заказы.Статус_заказа, dbo.Заказы.Код_для_получения, dbo.Заказы.Терминал, dbo.Заказы.СтоимостьЗаказа
FROM            dbo.Заказы INNER JOIN
                         dbo.ПродукцияЗаказа ON dbo.Заказы.ид = dbo.ПродукцияЗаказа.[ид заказа] INNER JOIN
                         dbo.Продукция ON dbo.ПродукцияЗаказа.[ид продукта] = dbo.Продукция.Артикул
GROUP BY dbo.Заказы.ид, dbo.Заказы.Дата_заказа, dbo.Заказы.Дата_доставки, dbo.Заказы.Пункт_выдачи, dbo.Заказы.Клиент, dbo.Заказы.Статус_заказа, dbo.Заказы.Код_для_получения, dbo.Заказы.Терминал, 
                         dbo.Заказы.СтоимостьЗаказа
GO
/****** Object:  Table [dbo].[Заявкт]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявкт](
	[ид] [int] NOT NULL,
	[поставщик] [int] NOT NULL,
	[приоритет] [nvarchar](50) NOT NULL,
	[статус] [nvarchar](50) NOT NULL,
	[дата оформления] [date] NOT NULL,
 CONSTRAINT [PK_Заявкт] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[ид] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[отчество] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ид] [int] NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
	[ИНН] [nvarchar](50) NOT NULL,
	[КПП] [nvarchar](50) NOT NULL,
	[ФИО директора] [nvarchar](50) NOT NULL,
	[представитель] [int] NOT NULL,
	[юр адрес] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПредставителиПоставщиков]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПредставителиПоставщиков](
	[ид] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ПредставителиПоставщиков] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПродукцииЗаявки]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПродукцииЗаявки](
	[ид заявки] [int] NOT NULL,
	[артикул продукции] [nvarchar](50) NOT NULL,
	[количество] [int] NOT NULL,
	[партия] [int] NOT NULL,
 CONSTRAINT [PK_ПродукцииЗаявки] PRIMARY KEY CLUSTERED 
(
	[ид заявки] ASC,
	[артикул продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПунктыВыдачи]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПунктыВыдачи](
	[индекс] [int] NOT NULL,
	[адрес] [nvarchar](50) NOT NULL,
	[ид] [int] IDENTITY(37,1) NOT NULL,
 CONSTRAINT [PK_ПунктыВыдачи] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[ид] [int] IDENTITY(0,1) NOT NULL,
	[наименование] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СтатусЗаказа]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СтатусЗаказа](
	[ид] [int] IDENTITY(0,1) NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_СтатусЗаказа] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Терминалы]    Script Date: 01.04.2023 16:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Терминалы](
	[ид] [int] IDENTITY(0,1) NOT NULL,
	[адрес] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Терминалы] PRIMARY KEY CLUSTERED 
(
	[ид] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([ид], [Дата_заказа], [Дата_доставки], [Пункт_выдачи], [Клиент], [Код_для_получения], [Статус_заказа], [Терминал], [СтоимостьЗаказа]) VALUES (1, CAST(N'2023-04-01' AS Date), CAST(N'0001-01-01' AS Date), 2, 1, 983, 0, NULL, NULL)
INSERT [dbo].[Заказы] ([ид], [Дата_заказа], [Дата_доставки], [Пункт_выдачи], [Клиент], [Код_для_получения], [Статус_заказа], [Терминал], [СтоимостьЗаказа]) VALUES (2, CAST(N'2023-04-01' AS Date), CAST(N'0001-01-01' AS Date), 3, 1, 782, 0, NULL, 678)
INSERT [dbo].[Заказы] ([ид], [Дата_заказа], [Дата_доставки], [Пункт_выдачи], [Клиент], [Код_для_получения], [Статус_заказа], [Терминал], [СтоимостьЗаказа]) VALUES (3, CAST(N'2023-04-01' AS Date), CAST(N'2023-04-14' AS Date), 4, 1, 821, 0, NULL, 1836)
INSERT [dbo].[Заказы] ([ид], [Дата_заказа], [Дата_доставки], [Пункт_выдачи], [Клиент], [Код_для_получения], [Статус_заказа], [Терминал], [СтоимостьЗаказа]) VALUES (4, CAST(N'2023-04-01' AS Date), CAST(N'2023-04-15' AS Date), 5, 1, 299, 0, NULL, 678)
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
SET IDENTITY_INSERT [dbo].[КатегорииТоваров] ON 

INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (0, N'Ароматы для дома')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (1, N'Вазы')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (2, N'Горшки и подставки')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (3, N'Интерьерные аксессуары')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (4, N'Картины и фоторамки')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (5, N'Свечи')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (6, N'Часы')
INSERT [dbo].[КатегорииТоваров] ([ид], [название]) VALUES (7, N'Шкатулки и подставки')
SET IDENTITY_INSERT [dbo].[КатегорииТоваров] OFF
GO
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (0, N'Алексеев ', N'Владислав', N'Аркадьевич', N'loginDEbct2018', N'Qg3gff', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (1, N'Савельева ', N'Евфросиния', N'Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (2, N'Никонов ', N'Мэлс', N'Лукьевич', N'loginDEuro2018', N'a1MIcO', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (3, N'Горшкова ', N'Агафья', N'Онисимовна', N'loginDEpst2018', N'0CyGnX', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (4, N'Горбачёв ', N'Пантелеймон', N'Германович', N'loginDEpsu2018', N'Vx9cQ{', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (5, N'Ершова ', N'Иванна', N'Максимовна', N'loginDEzqs2018', N'qM9p7i', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (6, N'Туров ', N'Денис', N'Геласьевич', N'loginDEioe2018', N'yMPu&2', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (7, N'Носова ', N'Наина', N'Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (8, N'Куликов ', N'Андрей', N'Святославович', N'loginDEfsp2018', N'&dtlI+', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (9, N'Нестеров ', N'Агафон', N'Георгьевич', N'loginDExcd2018', N'SZXZNL', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (10, N'Козлов ', N'Геласий', N'Христофорович', N'loginDEvlf2018', N'O5mXc2', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (11, N'Борисова ', N'Анжелика', N'Анатольевна', N'loginDEanv2018', N'Xiq}M3', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (12, N'Суханов ', N'Станислав', N'Фролович', N'loginDEzde2018', N'tlO3x&', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (13, N'Тетерина ', N'Феврония', N'Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (14, N'Муравьёва ', N'Александра', N'Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (15, N'Новикова ', N'Лукия', N'Ярославовна', N'loginDEwjv2018', N'ZfseKA', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (16, N'Агафонова ', N'Лариса', N'Михаиловна', N'loginDEiry2018', N'5zu7+}', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (17, N'Сергеева ', N'Агата', N'Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (18, N'Колобова ', N'Елена', N'Евгеньевна', N'loginDExxv2018', N'+daE|T', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (19, N'Ситников ', N'Николай', N'Филатович', N'loginDEbto2018', N'b1iYMI', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (20, N'Белов ', N'Роман', N'Иринеевич', N'loginDEfbs2018', N'v90Rep', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (21, N'Волкова ', N'Алла', N'Лукьевна', N'loginDEple2018', N'WlW+l8', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (22, N'Кудрявцева ', N'Таисия', N'Игоревна', N'loginDEhhx2018', N'hmCHeQ', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (23, N'Семёнова ', N'Октябрина', N'Христофоровна', N'loginDEayn2018', N'Ka2Fok', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (24, N'Смирнов ', N'Сергей', N'Яковович', N'loginDEwld2018', N'y9HStF', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (25, N'Брагина ', N'Алина', N'Валерьевна', N'loginDEhuu2018', N'X31OEf', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (26, N'Евсеев ', N'Игорь', N'Донатович', N'loginDEmjb2018', N'5mm{ch', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (27, N'Суворов ', N'Илья', N'Евсеевич', N'loginDEdgp2018', N'1WfJjo', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (28, N'Котов ', N'Денис', N'Мартынович', N'loginDEgyi2018', N'|7nYPc', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (29, N'Бобылёва ', N'Юлия', N'Егоровна', N'loginDEmvn2018', N'Mrr9e0', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (30, N'Брагин ', N'Бронислав', N'Георгьевич', N'loginDEfoj2018', N'nhGc+D', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (31, N'Александров ', N'Владимир', N'Дамирович', N'loginDEuuo2018', N'42XmH1', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (32, N'Фокин ', N'Ириней', N'Ростиславович', N'loginDEhsj2018', N's+jrMW', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (33, N'Воронов ', N'Митрофан', N'Антонович', N'loginDEvht2018', N'zMyS8Z', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (34, N'Маслов ', N'Мстислав', N'Антонинович', N'loginDEeqo2018', N'l5CBqA', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (35, N'Щербаков ', N'Георгий', N'Богданович', N'loginDExrf2018', N'mhpRIT', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (36, N'Кириллова ', N'Эмилия', N'Федосеевна', N'loginDEfku2018', N'a1m+8c', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (37, N'Васильев ', N'Серапион', N'Макарович', N'loginDExix2018', N'hzxtnn', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (38, N'Галкина ', N'Олимпиада', N'Владленовна', N'loginDEqrf2018', N'mI8n58', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (39, N'Яковлева ', N'Ксения', N'Онисимовна', N'loginDEhlk2018', N'g0jSed', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (40, N'Калашникова ', N'Александра', N'Владимировна', N'loginDEwoe2018', N'yOtw2F', 2)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (41, N'Медведьева ', N'Таисия', N'Тихоновна', N'loginDExyu2018', N'7Fg}9p', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (42, N'Карпова ', N'Ольга', N'Лукьевна', N'loginDEcor2018', N'2cIrC8', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (43, N'Герасимов ', N'Мстислав', N'Дамирович', N'loginDEqon2018', N'YeFbh6', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (44, N'Тимофеева ', N'Ксения', N'Валерьевна', N'loginDEyfd2018', N'8aKdb0', 0)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (45, N'Горбунов ', N'Вячеслав', N'Станиславович', N'loginDEtto2018', N'qXYDuu', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (46, N'Кошелева ', N'Кира', N'Владиславовна', N'loginDEdal2018', N'cJWXL0', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (47, N'Панфилова ', N'Марина', N'Борисовна', N'loginDEbjs2018', N'Xap2ct', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (48, N'Кудрявцев ', N'Матвей', N'Игоревич', N'loginDEdof2018', N'kD|LRU', 1)
INSERT [dbo].[Пользователи] ([ид], [Фамилия], [Имя], [отчество], [Login], [Password], [Role]) VALUES (49, N'Зуев ', N'Эдуард', N'Пантелеймонович', N'loginDEsnh2018', N'Password', 1)
GO
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'B025Y5', N'Блюдо', N'шт.', 1890, 5, N'Home Philosophy', N'Стокманн', 3, 3, N'Блюдо декоративное flower 35 см Home Philosophy', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'B037T5', N'Блюдо', N'шт.', 690, 5, N'Home Philosophy', N'Стокманн', 3, 2, N'Блюдо декоративное Flower 35 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'D034T5', N'Диффузор', N'шт.', 800, 20, N'Miksdo', N'Hoff', 0, 2, N'Диффузор Mikado intense Апельсин с корицей', N'D034T5.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'D044T5', N'Декор настенный', N'шт.', 1790, 5, N'Home Philosophy', N'Стокманн', 3, 3, N'Декор настенный Фантазия 45х45х1 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'D826T5', N'Диффузор', N'шт.', 600, 5, N'True Scents', N'Hoff', 0, 2, N'Диффузор True Scents 45 мл манго', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'D832R2', N'Растение', N'шт.', 1000, 10, N'Home Philosophy', N'Стокманн', 3, 3, N'Декоративное растение 102 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'D947R5', N'Диффузор', N'шт.', 500, 5, N'Aroma', N'Hoff', 0, 4, N'Диффузор Aroma Harmony Lavender', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'F837T5', N'Фоторамка', N'шт.', 999, 5, N'Gallery', N'Hoff', 4, 2, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'F903T5', N'Фоторамка', N'шт.', 600, 15, N'Gallery', N'Hoff', 4, 2, N'Фоторамка Gallery 20х30 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'F928T5', N'Фоторамка', N'шт.', 1590, 25, N'Umbra', N'Стокманн', 4, 2, N'Фоторамка Prisma 10х10 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'F933T5', N'Кашпо', N'шт.', 1400, 20, N'Cube Color', N'Hoff', 2, 4, N'Настольное кашпо с автополивом Cube Color', N'F933T5.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'F937R4', N'Фоторамка', N'шт.', 359, 15, N'Gallery', N'Hoff', 4, 4, N'Фоторамка 10х15 см Gallery серый с патиной/золотой', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'H023R8', N'Часы', N'шт.', 5600, 15, N'Umbra', N'Стокманн', 6, 2, N'Часы настенные Ribbon 30,5 см', N'H023R8.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'H937R3', N'Часы', N'шт.', 999, 10, N'Umbra', N'Hoff', 6, 3, N'Часы настенные 6500 30,2 см', N'H937R3.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'K083T5', N'Аромат', N'шт.', 2790, 20, N'Esteban', N'Стокманн', 0, 2, N'Сменный аромат Figue noire 250 мл', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'K478R4', N'Аромат', N'шт.', 3500, 30, N'Esteban', N'Стокманн', 0, 4, N'Аромат для декобукета Esteban', N'K478R4.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'K937T4', N'Аромат', N'шт.', 7900, 25, N'Esteban', N'Стокманн', 0, 2, N'Деко-букет Кедр 250 мл', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'P846R4', N'Подставка', N'шт.', 1400, 15, N'Valley', N'Стокманн', 2, 3, N'Подставка для цветочных горшков 55x25x35 см Valley', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'P927R2', N'Подставка', N'шт.', 4000, 15, N'Valley', N'Стокманн', 2, 2, N'Подставка для цветочных горшков Valley', N'P927R2.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'P936E4', N'Подставка', N'шт.', 3590, 15, N'Umbra', N'Стокманн', 2, 4, N'Подставка для газет и журналов Zina', N'P936E4.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'R836R5', N'Шкатулка', N'шт.', 8000, 30, N'Umbra', N'Стокманн', 7, 5, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'R922T5', N'Шкатулка', N'шт.', 690, 10, N'Home Philosophy', N'Стокманн', 7, 2, N'Шкатулка из керамики Lana 6х7 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'S039T5', N'Свеча', N'шт.', 250, 10, N'True Scents', N'Hoff', 5, 2, N'Свеча True Moods Feel happy', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'S563T4', N'Свеча', N'шт.', 1000, 20, N'True Scents', N'Hoff', 5, 3, N'Свеча в стакане True Scents', N'S563T4.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'S936Y5', N'Свеча', N'шт.', 299, 15, N'True Scents', N'Hoff', 0, 3, N'Свеча в стакане True Scents', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'S937T5', N'Подсвечник', N'шт.', 2600, 10, N'Kersten', N'Стокманн', 0, 3, N'Подсвечник 37 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'V432R6', N'Ваза', N'шт.', 1990, 10, N'Kersten', N'Стокманн', 1, 3, N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', NULL)
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'V483R7', N'Ваза', N'шт.', 100, 15, N'Весна', N'Hoff', 1, 3, N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'V483R7.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'V783T5', N'Ваза', N'шт.', 1300, 25, N'Home Philosophy', N'Стокманн', 1, 2, N'Ваза из керамики Betty', N'V783T5.jpg')
INSERT [dbo].[Продукция] ([Артикул], [Наименование], [Единица_измерения], [Стоимость], [Размер_максимально_возможной_скидки], [Производитель], [Поставщик], [Категория_товара], [Действующая_скидка], [Описание], [Изображение]) VALUES (N'V937E4', N'Ваза', N'шт.', 1999, 15, N'Kersten', N'Hoff', 1, 3, N'Ваза 18H2535S 30,5 см', NULL)
GO
SET IDENTITY_INSERT [dbo].[ПродукцияЗаказа] ON 

INSERT [dbo].[ПродукцияЗаказа] ([ид заказа], [ид продукта], [количество], [ид]) VALUES (2, N'B025Y5', 1, 1)
INSERT [dbo].[ПродукцияЗаказа] ([ид заказа], [ид продукта], [количество], [ид]) VALUES (2, N'B037T5', 1, 2)
INSERT [dbo].[ПродукцияЗаказа] ([ид заказа], [ид продукта], [количество], [ид]) VALUES (3, N'B025Y5', 1, 3)
INSERT [dbo].[ПродукцияЗаказа] ([ид заказа], [ид продукта], [количество], [ид]) VALUES (4, N'B025Y5', 1, 4)
INSERT [dbo].[ПродукцияЗаказа] ([ид заказа], [ид продукта], [количество], [ид]) VALUES (4, N'B037T5', 1, 5)
SET IDENTITY_INSERT [dbo].[ПродукцияЗаказа] OFF
GO
INSERT [dbo].[ПродукцияНаСкладе] ([ид склада], [артикул продукции], [количество]) VALUES (1, N'D826T5', 1)
INSERT [dbo].[ПродукцияНаСкладе] ([ид склада], [артикул продукции], [количество]) VALUES (2, N'D826T5', 10)
INSERT [dbo].[ПродукцияНаСкладе] ([ид склада], [артикул продукции], [количество]) VALUES (2, N'F928T5', 3)
GO
SET IDENTITY_INSERT [dbo].[ПунктыВыдачи] ON 

INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (125061, N'г. Ковров  ул. Подгорная  8', 0)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (125703, N'г. Ковров  ул. Партизанская  49', 1)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (125837, N'г. Ковров  ул. Шоссейная  40', 2)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (190949, N'г. Ковров  ул. Мичурина  26', 3)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (344288, N'г. Ковров  ул. Чехова  1', 4)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (394060, N'г. Ковров  ул. Фрунзе  43', 5)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (394242, N'г. Ковров  ул. Коммунистическая  43', 6)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (394782, N'г. Ковров  ул. Чехова  3', 7)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (400562, N'г. Ковров  ул. Зеленая  32', 8)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (410172, N'г. Ковров  ул. Северная  13', 9)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (410542, N'г. Ковров  ул. Светлая  46', 10)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (410661, N'г. Ковров  ул. Школьная  50', 11)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (420151, N'г. Ковров  ул. Вишневая  32', 12)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (426030, N'г. Ковров  ул. Маяковского  44', 13)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (443890, N'г. Ковров  ул. Коммунистическая  1', 14)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (450375, N'г. Ковров ул. Клубная  44', 15)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (450558, N'г. Ковров  ул. Набережная  30', 16)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (450983, N'г. Ковров  ул. Комсомольская  26', 17)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (454311, N'г. Ковров  ул. Новая  19', 18)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (603002, N'г. Ковров  ул. Дзержинского  28', 19)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (603036, N'г. Ковров  ул. Садовая  4', 20)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (603379, N'г. Ковров  ул. Спортивная  46', 21)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (603721, N'г. Ковров  ул. Гоголя  41', 22)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (614164, N'г. Ковров   ул. Степная  30', 23)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (614510, N'г. Ковров  ул. Маяковского  47', 24)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (614611, N'г. Ковров  ул. Молодежная  50', 25)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (614753, N'г. Ковров  ул. Полевая  35', 26)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (620839, N'г. Ковров  ул. Цветочная  8', 27)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (625283, N'г. Ковров  ул. Победы  46', 28)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (625560, N'г. Ковров  ул. Некрасова  12', 29)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (625590, N'г. Ковров  ул. Коммунистическая  20', 30)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (625683, N'г. Ковров  ул. 8 Марта', 31)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (630201, N'г. Ковров  ул. Комсомольская  17', 32)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (630370, N'г. Ковров  ул. Шоссейная  24', 33)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (660007, N'г. Ковров  ул. Октябрьская  19', 34)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (660540, N'г. Ковров  ул. Солнечная  25', 35)
INSERT [dbo].[ПунктыВыдачи] ([индекс], [адрес], [ид]) VALUES (660540, N'г. Ковров  ул. Солнечная  25', 38)
SET IDENTITY_INSERT [dbo].[ПунктыВыдачи] OFF
GO
SET IDENTITY_INSERT [dbo].[Роли] ON 

INSERT [dbo].[Роли] ([ид], [наименование]) VALUES (0, N'Клиент')
INSERT [dbo].[Роли] ([ид], [наименование]) VALUES (1, N'Менеджер')
INSERT [dbo].[Роли] ([ид], [наименование]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Роли] OFF
GO
SET IDENTITY_INSERT [dbo].[Склады] ON 

INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (1, N'адрес', N'Название1')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (2, N'адрес', N'Название12')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (3, N'адрес', N'Название13')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (4, N'адрес', N'Название14')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (5, N'адрес', N'Название15')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (6, N'адрес', N'Название16')
INSERT [dbo].[Склады] ([ид], [адрес], [название]) VALUES (7, N'адрес', N'Название17')
SET IDENTITY_INSERT [dbo].[Склады] OFF
GO
SET IDENTITY_INSERT [dbo].[СтатусЗаказа] ON 

INSERT [dbo].[СтатусЗаказа] ([ид], [наименование]) VALUES (0, N'Новый')
INSERT [dbo].[СтатусЗаказа] ([ид], [наименование]) VALUES (1, N'Завершен')
SET IDENTITY_INSERT [dbo].[СтатусЗаказа] OFF
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Пользователи1] FOREIGN KEY([Клиент])
REFERENCES [dbo].[Пользователи] ([ид])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Пользователи1]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_ПунктыВыдачи] FOREIGN KEY([Пункт_выдачи])
REFERENCES [dbo].[ПунктыВыдачи] ([ид])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_ПунктыВыдачи]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_СтатусЗаказа] FOREIGN KEY([Статус_заказа])
REFERENCES [dbo].[СтатусЗаказа] ([ид])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_СтатусЗаказа]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Терминалы] FOREIGN KEY([Терминал])
REFERENCES [dbo].[Терминалы] ([ид])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Терминалы]
GO
ALTER TABLE [dbo].[Заявкт]  WITH CHECK ADD  CONSTRAINT [FK_Заявкт_Поставщики] FOREIGN KEY([поставщик])
REFERENCES [dbo].[Поставщики] ([ид])
GO
ALTER TABLE [dbo].[Заявкт] CHECK CONSTRAINT [FK_Заявкт_Поставщики]
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Роли] FOREIGN KEY([Role])
REFERENCES [dbo].[Роли] ([ид])
GO
ALTER TABLE [dbo].[Пользователи] CHECK CONSTRAINT [FK_Пользователи_Роли]
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [FK_Поставщики_ПредставителиПоставщиков] FOREIGN KEY([представитель])
REFERENCES [dbo].[ПредставителиПоставщиков] ([ид])
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [FK_Поставщики_ПредставителиПоставщиков]
GO
ALTER TABLE [dbo].[ПродукцииЗаявки]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцииЗаявки_Заявкт] FOREIGN KEY([ид заявки])
REFERENCES [dbo].[Заявкт] ([ид])
GO
ALTER TABLE [dbo].[ПродукцииЗаявки] CHECK CONSTRAINT [FK_ПродукцииЗаявки_Заявкт]
GO
ALTER TABLE [dbo].[ПродукцииЗаявки]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцииЗаявки_Продукция] FOREIGN KEY([артикул продукции])
REFERENCES [dbo].[Продукция] ([Артикул])
GO
ALTER TABLE [dbo].[ПродукцииЗаявки] CHECK CONSTRAINT [FK_ПродукцииЗаявки_Продукция]
GO
ALTER TABLE [dbo].[Продукция]  WITH CHECK ADD  CONSTRAINT [FK_Продукция_КатегорииТоваров] FOREIGN KEY([Категория_товара])
REFERENCES [dbo].[КатегорииТоваров] ([ид])
GO
ALTER TABLE [dbo].[Продукция] CHECK CONSTRAINT [FK_Продукция_КатегорииТоваров]
GO
ALTER TABLE [dbo].[ПродукцияЗаказа]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцияЗаказа_Заказы] FOREIGN KEY([ид заказа])
REFERENCES [dbo].[Заказы] ([ид])
GO
ALTER TABLE [dbo].[ПродукцияЗаказа] CHECK CONSTRAINT [FK_ПродукцияЗаказа_Заказы]
GO
ALTER TABLE [dbo].[ПродукцияЗаказа]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцияЗаказа_Продукция] FOREIGN KEY([ид продукта])
REFERENCES [dbo].[Продукция] ([Артикул])
GO
ALTER TABLE [dbo].[ПродукцияЗаказа] CHECK CONSTRAINT [FK_ПродукцияЗаказа_Продукция]
GO
ALTER TABLE [dbo].[ПродукцияНаСкладе]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцияНаСкладе_Продукция] FOREIGN KEY([артикул продукции])
REFERENCES [dbo].[Продукция] ([Артикул])
GO
ALTER TABLE [dbo].[ПродукцияНаСкладе] CHECK CONSTRAINT [FK_ПродукцияНаСкладе_Продукция]
GO
ALTER TABLE [dbo].[ПродукцияНаСкладе]  WITH CHECK ADD  CONSTRAINT [FK_ПродукцияНаСкладе_Склады] FOREIGN KEY([ид склада])
REFERENCES [dbo].[Склады] ([ид])
GO
ALTER TABLE [dbo].[ПродукцияНаСкладе] CHECK CONSTRAINT [FK_ПродукцияНаСкладе_Склады]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Заказы"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "ПродукцияЗаказа"
            Begin Extent = 
               Top = 149
               Left = 254
               Bottom = 279
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Продукция"
            Begin Extent = 
               Top = 6
               Left = 482
               Bottom = 136
               Right = 804
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_OrdersDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_OrdersDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Продукция"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 568
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "КатегорииТоваров"
            Begin Extent = 
               Top = 138
               Left = 380
               Bottom = 234
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Склады"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ПродукцияНаСкладе"
            Begin Extent = 
               Top = 189
               Left = 146
               Bottom = 302
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ProdutsDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ProdutsDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ProdutsDetails'
GO
USE [master]
GO
ALTER DATABASE [pr419] SET  READ_WRITE 
GO
