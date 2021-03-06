USE [master]
GO
/****** Object:  Database [KazerBariDB]    Script Date: 3/16/2021 5:39:10 PM ******/
CREATE DATABASE [KazerBariDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KazerBariDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KazerBariDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KazerBariDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KazerBariDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KazerBariDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KazerBariDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KazerBariDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KazerBariDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KazerBariDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KazerBariDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KazerBariDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KazerBariDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KazerBariDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KazerBariDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KazerBariDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KazerBariDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KazerBariDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KazerBariDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KazerBariDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KazerBariDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KazerBariDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KazerBariDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KazerBariDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KazerBariDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KazerBariDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KazerBariDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KazerBariDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KazerBariDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KazerBariDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KazerBariDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KazerBariDB] SET  MULTI_USER 
GO
ALTER DATABASE [KazerBariDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KazerBariDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KazerBariDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KazerBariDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KazerBariDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Icon] [varchar](200) NOT NULL,
	[Banner] [varchar](200) NOT NULL,
	[WhatIncluded] [varchar](max) NULL,
	[WhatExcluded] [varchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Value%] [int] NOT NULL,
	[ValidationDate] [date] NOT NULL,
	[UsedTime] [int] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Area] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderedServices]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OderId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderedServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Package]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Package](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BannerId] [int] NOT NULL,
	[ImageName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/16/2021 5:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (14, N'Mobile', N'f4766ac7-3aee-4afc-88ef-4dd5ad7c7350_cf.jpg', N'50098472-269a-4474-ad58-a65ac3350253_Facee.png', N'i am good boy #i am good boy #i am good boy', N'i am good boy #i am good boy #i am good boy')
INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (17, N'break law', N'6dcc274a-6953-441a-8858-ece2943befe4_01.png', N'a160d764-7729-4185-90e2-aa6317b14a4e_5aee6d3b-73e9-437d-bf89-2a1fadbc13ee_cf.jpg', N'i am good boy #i am good boy #i am good boy', N'i am good boy #i am good boy #i am good boy')
INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (18, N'TOWHIDUL ISLAM', N'ac9285ec-fe79-4030-88fa-544521069629_02.png', N'602723bf-61fd-4c35-a86b-8d07dabe4e20_5aee6d3b-73e9-437d-bf89-2a1fadbc13ee_cf.jpg', N'i am good boy #i am good boy #i am good boy', N'i am good boy #i am good boy #i am good boy')
INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (1014, N'MogoBari_Db', N'f102258c-090b-48bc-b8c1-888d8e100568_EmonFace.png', N'aa0c6224-1b6f-4681-aad5-21551ffbd925_3.png', N'Bakikka, adfa, adfasd, adsfasf', N'asdfasdfas,afasfafasd`adfad`adfad')
INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (1015, N'MogoBari_Db', N'efbdc411-dd5c-45c0-a997-36a734017890_3.png', N'd60293e4-7673-440e-8387-307c01c924a8_3.png', N'i am good boy #i am good boy #i am good boy', N'i am good boy #i am good boy #i am good boy')
INSERT [dbo].[Category] ([Id], [Name], [Icon], [Banner], [WhatIncluded], [WhatExcluded]) VALUES (1018, N'habijabi', N'9d7571f2-1af8-401a-8900-257b0eab3a2b_Hand.png', N'abc3d26e-2b55-4744-b1db-2613165271ee_Hand.png', N'i am good boy #i am good boy #i am good boy', N'i am good boy #i am good boy #i am good boy')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1, N'asdfas', N'asdfas', N'asdfasdf', N'Bakoliya', CAST(0x3E420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (2, N'police', N'asdfas', N'55/1, DM Ramij Uddin Road, BARUA, RAJPARA', N'Karnaphuli Upazila', CAST(0x52420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (3, N'police', N'asdfas', N'GEC, Ctg', N'Khulshi', CAST(0x58420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (4, N'Computer', N'asdfas', N'55/1, DM Ramij Uddin Road, BARUA, RAJPARA', N'Karnaphuli Upazila', CAST(0x52420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (5, N'vendor', N'adfadf', N'GEC, Ctg', N'Bhujpur', CAST(0x52420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (6, N'TOWHIDUL ISLAM', N'adfadf', N'fadsfasdf', N'Karnaphuli Upazila', CAST(0x4C420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (7, N'EliasHridoy', N'asdfadsf', N'fadsfasdf', N'Bhujpur', CAST(0x3C420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (8, N'habijabi', N'1234567890', N'fadsfasdf', N'Double Mooring', CAST(0x4C420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1002, N'habijabi', N'1234567890', N'fadsfasdf', N'EPZ', CAST(0x4C420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1003, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x4B420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1004, N'habijabi', N'1234567890', N'fadsfasdf', N'Panchlaish', CAST(0x43420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1005, N'habijabi', N'1234567890', N'fadsfasdf', N'Pahartali', CAST(0x44420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1006, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x5F420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1007, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x56420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1008, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x56420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (1009, N'habijabi', N'1234567890', N'fadsfasdf', N'EPZ', CAST(0x4A420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (2002, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x4A420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (2003, N'habijabi', N'1234567890', N'fadsfasdf', N'Akbarshah', CAST(0x4A420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Order] ([Id], [Name], [MobileNo], [Address], [Area], [Date], [Subtotal], [Comment]) VALUES (2004, N'habijabi', N'1234567890', N'fadsfasdf', N'Bhujpur', CAST(0x4B420B00 AS Date), CAST(0.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderedServices] ON 

INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1, 1, 9, 3)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2, 2, 9, 3)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (3, 3, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (4, 3, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (5, 4, 9, 5)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (6, 5, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (7, 5, 9, 5)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (8, 6, 9, 3)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (9, 6, 9, 5)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (10, 6, 9, 6)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (11, 7, 11, 6)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (12, 8, 11, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1002, 1002, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1003, 1002, 10, 3)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1004, 1003, 11, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1005, 1004, 11, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1006, 1005, 11, 4)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1007, 1006, 11, 3)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1008, 1007, 11, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1009, 1008, 11, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (1010, 1009, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2002, 2002, 9, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2003, 2002, 10, 2)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2004, 2003, 9, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2005, 2003, 10, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2006, 2004, 9, 1)
INSERT [dbo].[OrderedServices] ([Id], [OderId], [PackageId], [Quantity]) VALUES (2007, 2004, 10, 1)
SET IDENTITY_INSERT [dbo].[OrderedServices] OFF
SET IDENTITY_INSERT [dbo].[Package] ON 

INSERT [dbo].[Package] ([Id], [ServiceId], [Name], [Price], [DiscountId]) VALUES (9, 9, N'police', CAST(5000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Package] ([Id], [ServiceId], [Name], [Price], [DiscountId]) VALUES (10, 9, N'break law', CAST(32333.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Package] ([Id], [ServiceId], [Name], [Price], [DiscountId]) VALUES (11, 10, N'Software Develop', CAST(10000.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Package] OFF
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([Id], [BannerId], [ImageName]) VALUES (9, 1, N'63eeeea6-719c-404a-842e-987e4734a365_jn.jpg')
INSERT [dbo].[Picture] ([Id], [BannerId], [ImageName]) VALUES (11, 1, N'9970a946-357b-4116-8d9e-1202382592d8_23bce838-378f-443a-95ee-c84f483828e1_cf.jpg')
INSERT [dbo].[Picture] ([Id], [BannerId], [ImageName]) VALUES (1010, 2, N'53794325-9afc-4fc7-8d1b-5451fbf7d4b2_cf.jpg')
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [CategoryId], [Name], [Image]) VALUES (9, 14, N'adfa', N'23bce838-378f-443a-95ee-c84f483828e1_cf.jpg')
INSERT [dbo].[Service] ([Id], [CategoryId], [Name], [Image]) VALUES (10, 17, N'habijabi', N'2718aa7f-6d99-4e3b-8148-f3be7645aa9a_357996a1-ab4b-4d48-a7b3-dd6213edb75e_3.png')
INSERT [dbo].[Service] ([Id], [CategoryId], [Name], [Image]) VALUES (1009, 14, N'habijabi', N'75cb76f4-07b4-40aa-a6d9-7ed94ab97efe_3.png')
SET IDENTITY_INSERT [dbo].[Service] OFF
ALTER TABLE [dbo].[OrderedServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderedServices_Order] FOREIGN KEY([OderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderedServices] CHECK CONSTRAINT [FK_OrderedServices_Order]
GO
ALTER TABLE [dbo].[OrderedServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderedServices_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO
ALTER TABLE [dbo].[OrderedServices] CHECK CONSTRAINT [FK_OrderedServices_Package]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Discount]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Service]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
USE [master]
GO
ALTER DATABASE [KazerBariDB] SET  READ_WRITE 
GO
