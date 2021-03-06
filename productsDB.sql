USE [master]
GO
/****** Object:  Database [productsDB]    Script Date: 4/1/2022 11:00:22 AM ******/
CREATE DATABASE [productsDB]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [productsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [productsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [productsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [productsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [productsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [productsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [productsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [productsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [productsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [productsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [productsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [productsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [productsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [productsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [productsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [productsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [productsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [productsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [productsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [productsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [productsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [productsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [productsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [productsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [productsDB] SET  MULTI_USER 
GO
ALTER DATABASE [productsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [productsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [productsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [productsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [productsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'productsDB', N'ON'
GO
USE [productsDB]
GO
/****** Object:  Table [dbo].[order]    Script Date: 4/1/2022 11:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderLine]    Script Date: 4/1/2022 11:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderLine](
	[orderLineId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_orderLine] PRIMARY KEY CLUSTERED 
(
	[orderLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 4/1/2022 11:00:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](150) NOT NULL,
	[productDescription] [varchar](300) NOT NULL,
	[productPrice] [float] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

GO
INSERT [dbo].[product] ([productId], [productName], [productDescription], [productPrice]) VALUES (1, N'Americano', N'Double shot of espresso with hot water.', 32.99)
GO
INSERT [dbo].[product] ([productId], [productName], [productDescription], [productPrice]) VALUES (2, N'Flat White', N'Single shot of espresso with milk.', 35.99)
GO
INSERT [dbo].[product] ([productId], [productName], [productDescription], [productPrice]) VALUES (3, N'Classic Latte', N'Single shot of espresso with texturised milk.', 40.99)
GO
INSERT [dbo].[product] ([productId], [productName], [productDescription], [productPrice]) VALUES (4, N'Cappuccino', N'Double shot of espresso with texturised milk.', 46.99)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[orderLine]  WITH CHECK ADD  CONSTRAINT [FK_orderLine_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[order] ([orderId])
GO
ALTER TABLE [dbo].[orderLine] CHECK CONSTRAINT [FK_orderLine_order]
GO
ALTER TABLE [dbo].[orderLine]  WITH CHECK ADD  CONSTRAINT [FK_orderLine_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[orderLine] CHECK CONSTRAINT [FK_orderLine_product]
GO
USE [master]
GO
ALTER DATABASE [productsDB] SET  READ_WRITE 
GO
