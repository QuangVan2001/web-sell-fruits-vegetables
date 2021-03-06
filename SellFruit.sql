USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 3/12/2022 10:12:23 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANGVAN037\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.QUANGVAN037\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](50) NOT NULL,
	[categoryName] [varchar](50) NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[oderID] [varchar](50) NOT NULL,
	[oderDate] [smalldatetime] NULL,
	[total] [float] NULL,
	[userID] [varchar](50) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[oderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [varchar](50) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [varchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](50) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[categoryID] [varchar](50) NOT NULL,
	[importDate] [smalldatetime] NULL,
	[usingDate] [smalldatetime] NULL,
	[status] [varchar](10) NOT NULL,
	[image] [varchar](350) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/12/2022 10:12:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[birthday] [smalldatetime] NULL,
	[phone] [int] NULL,
	[email] [varchar](50) NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (N'01', N'Vegetable', N'A')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (N'02', N'Truit', N'A')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'T01', N'Oranges', 20, N'01', CAST(N'2022-01-03T00:00:00' AS SmallDateTime), CAST(N'2022-03-20T00:00:00' AS SmallDateTime), N'NA', N'https://5.imimg.com/data5/KM/QP/MY-22954806/orange-250x250.jpg', 134455)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'T02', N'Apple', 42, N'02', CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-03-21T00:00:00' AS SmallDateTime), N'A', N'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-250x250.jpg', 9118)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'T03', N'Banana', 9, N'02', CAST(N'2022-03-02T00:00:00' AS SmallDateTime), CAST(N'2022-03-25T00:00:00' AS SmallDateTime), N'A', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBN9tpiPLXn5oTpXhSe5lyF5rn6qpVgP2nA_YczBkrxTUKcGMiVDqsyHwqCzVByBuk9g&usqp=CAU', 4000)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'T04', N'Pear', 15, N'02', CAST(N'2022-02-28T00:00:00' AS SmallDateTime), CAST(N'2022-03-26T00:00:00' AS SmallDateTime), N'A', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJRnSXINHmWPaUFu249fQLm5YrFmwXkGFB5VhgayAEpUhHqgeMSpEX7lT6ZiYSLd2JCsU&usqp=CAU', 6500)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'V01', N'Corn', 17, N'01', CAST(N'2022-02-15T00:00:00' AS SmallDateTime), CAST(N'2022-04-05T00:00:00' AS SmallDateTime), N'A', N'https://5.imimg.com/data5/SELLER/Default/2020/8/MR/EB/HT/12292142/yellow-corn-250x250.jpg', 3000)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'V02', N'Potato', 19, N'01', CAST(N'2022-02-28T00:00:00' AS SmallDateTime), CAST(N'2022-04-01T00:00:00' AS SmallDateTime), N'A', N'https://4.imimg.com/data4/EE/EE/GLADMIN-/wp-content-uploads-potato-250x250.jpg', 11000)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'V03', N'Tomato', 26, N'01', CAST(N'2022-03-02T00:00:00' AS SmallDateTime), CAST(N'2022-04-03T00:00:00' AS SmallDateTime), N'A', N'https://3.imimg.com/data3/MT/JW/MY-2327173/fresh-tomato-250x250.png', 7000)
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [categoryID], [importDate], [usingDate], [status], [image], [price]) VALUES (N'V04', N'Carrot', 30, N'01', CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-04-15T00:00:00' AS SmallDateTime), N'A', N'https://5.imimg.com/data5/VU/QF/MY-30125612/fresh-carrot-250x250.jpg', 10000)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (N'AD', N'Tôi là admin ', N'1         ')
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (N'US', N'Khách mua hàng', N'1         ')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'admin', N'Admin', N'1', N'AD', N'Sài Gòn', CAST(N'2001-02-02T00:00:00' AS SmallDateTime), 935182029, N'admin@gmail.com', N'A')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'nguyen1', N'Lê Đình Linh Nguyên', N'1', N'US', N'Đăk Lăk', CAST(N'2001-07-05T00:00:00' AS SmallDateTime), 954565496, N'nguyen@gmai.com', N'A')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'thu01', N'Huỳnh Anh Thư', N'1', N'US', N'Xóm 7, Bình Dương, Bình Sơn, Quảng Ngãi', CAST(N'2001-09-11T00:00:00' AS SmallDateTime), 98754654, N'thu01@gmail.com', N'A')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'trung123', N'Trần Hiếu Tru', N'1', N'US', N'269 Liên Phường, Phước Long B, Thủ Đức', CAST(N'2001-04-04T00:00:00' AS SmallDateTime), 937445485, N'trung@gmail.com', N'A')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'tung01', N'Phạm Duy Tùng', N'1', N'US', N'Bình Dương', CAST(N'2001-04-03T00:00:00' AS SmallDateTime), 945454873, N'tung@gmail.com', N'A')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'van01', N'Pham Quang Van', N'1', N'AD', N'Bình Dương, Bình sơn, Quảng Ngãi', CAST(N'2001-02-02T00:00:00' AS SmallDateTime), 935182029, N'van@gmail.com', N'A')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([oderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
