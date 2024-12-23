use master
go
create database [SWP391]
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[logo] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Addresses]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Addresses](
	[customer_addresses_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](2000) NULL,
	[province_id] [int] NOT NULL,
	[province_name] [nvarchar](255) NULL,
	[district_id] [int] NOT NULL,
	[district_name] [nvarchar](255) NULL,
	[ward_code] [nvarchar](255) NOT NULL,
	[ward_name] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[receiver_name] [nvarchar](255) NULL,
	[is_default] [bit] NOT NULL,
	[customer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_addresses_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[review] [ntext] NOT NULL,
	[thumbnail] [nvarchar](255) NULL,
	[rating] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[size_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC,
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[order_status_id] [int] IDENTITY(1,1) NOT NULL,
	[order_status_name] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[ordered_date] [datetime] NULL,
	[receive_date] [datetime] NULL,
	[receiver_name] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[address] [nvarchar](2000) NOT NULL,
	[ward_code] [nvarchar](255) NOT NULL,
	[ward_name] [nvarchar](255) NULL,
	[district_id] [int] NOT NULL,
	[district_name] [nvarchar](255) NULL,
	[province_id] [int] NOT NULL,
	[province_name] [nvarchar](255) NULL,
	[total_price] [int] NOT NULL,
	[shipping_fee] [int] NOT NULL,
	[voucher_id] [int] NULL,
	[voucher_percent] [decimal](10, 2) NULL,
	[total_amount] [int] NOT NULL,
	[total_gram] [int] NOT NULL,
	[payment_method_id] [int] NOT NULL,
	[vnp_TxnRef] [nvarchar](255) NULL,
	[vnp_CreateDate] [nvarchar](20) NULL,
	[payment_status_id] [int] NOT NULL,
	[order_status_id] [int] NOT NULL,
	[shipping_code] [nvarchar](255) NULL,
	[salerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Methods]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Methods](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method_name] [nvarchar](255) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Status]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Status](
	[payment_status_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_status_name] [nvarchar](255) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Categories]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Categories](
	[post_category_id] [int] IDENTITY(1,1) NOT NULL,
	[post_category_name] [nvarchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Feedbacks]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Feedbacks](
	[post_feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[post_id] [int] NOT NULL,
	[review] [ntext] NOT NULL,
	[is_active] [bit] NOT NULL,
	[create_at] [date] NULL,
	[modified_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [ntext] NULL,
	[content] [ntext] NULL,
	[thumbnail] [nvarchar](255) NULL,
	[author_id] [int] NULL,
	[is_active] [bit] NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[post_category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[price_id] [int] IDENTITY(1,1) NOT NULL,
	[from] [int] NULL,
	[to] [int] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Categories]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Categories](
	[product_category_id] [int] IDENTITY(1,1) NOT NULL,
	[product_category_name] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Images]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Images](
	[product_image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[image_url] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[size_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[weight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[size_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[price] [int] NOT NULL,
	[total_quantity] [int] NOT NULL,
	[discount] [decimal](10, 2) NULL,
	[description] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[is_active] [bit] NULL,
	[rated_star] [int] NULL,
	[brand_id] [int] NULL,
	[product_category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[size_name] [nvarchar](20) NOT NULL,
	[description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[slider_id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](255) NULL,
	[description] [ntext] NULL,
	[image_url] [nvarchar](255) NULL,
	[is_active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[verification_code] [nvarchar](6) NULL,
	[reset_password_code] [nvarchar](6) NULL,
	[google_id] [nvarchar](255) NULL,
	[profile_picture_url] [nvarchar](255) NULL,
	[is_active] [bit] NOT NULL,
	[is_banned] [bit] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/9/2024 11:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[voucher_name] [nvarchar](255) NOT NULL,
	[description] [ntext] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[quantity] [int] NULL,
	[percent] [decimal](10, 2) NULL,
	[is_active] [bit] NOT NULL,
	[voucher_code] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([brand_id], [brand_name], [description], [logo], [is_active]) VALUES (1, N'Nike', N'Thương hiệu thời trang thể thao toàn cầu', N'brand_img/4man.jpg', 1)
INSERT [dbo].[Brands] ([brand_id], [brand_name], [description], [logo], [is_active]) VALUES (2, N'Adidas', N'Nhà sản xuất giày dép thể thao hàng đầu', N'brand_img/Coolmate.png', 1)
INSERT [dbo].[Brands] ([brand_id], [brand_name], [description], [logo], [is_active]) VALUES (3, N'Puma', N'Công ty thời trang thể thao nổi tiếng với giày dép và quần áo', N'brand_img/uniqlo.png', 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_Addresses] ON 

INSERT [dbo].[Customer_Addresses] ([customer_addresses_id], [address], [province_id], [province_name], [district_id], [district_name], [ward_code], [ward_name], [phone], [receiver_name], [is_default], [customer_id]) VALUES (1, N'Số nhà 43', 202, N'Hồ Chí Minh', 1455, N'Quận Tân Bình', N'21408', N'Phường 8', N'0347818511', N'Ha Huy Vu', 1, 13)
INSERT [dbo].[Customer_Addresses] ([customer_addresses_id], [address], [province_id], [province_name], [district_id], [district_name], [ward_code], [ward_name], [phone], [receiver_name], [is_default], [customer_id]) VALUES (2, N'so nha 43', 202, N'Hồ Chí Minh', 1456, N'Quận Tân Phú', N'21507', N'Phường Tân Quý', N'0968356204', N'Nguyen Truong Quan', 1, 14)
SET IDENTITY_INSERT [dbo].[Customer_Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([feedback_id], [customer_id], [order_id], [product_id], [review], [thumbnail], [rating], [is_active], [create_at], [modified_at]) VALUES (1, 13, 2, 5, N'Sản phẩm đúng như mô tả', N'product_img/ak26.1.jpg', 4, 1, CAST(N'2024-11-08' AS Date), CAST(N'2024-11-08' AS Date))
INSERT [dbo].[Feedbacks] ([feedback_id], [customer_id], [order_id], [product_id], [review], [thumbnail], [rating], [is_active], [create_at], [modified_at]) VALUES (2, 13, 2, 18, N'Giao hàng nhanh chóng', N'product_img/ak26.2.jpg', 5, 1, CAST(N'2024-11-08' AS Date), CAST(N'2024-11-08' AS Date))
INSERT [dbo].[Feedbacks] ([feedback_id], [customer_id], [order_id], [product_id], [review], [thumbnail], [rating], [is_active], [create_at], [modified_at]) VALUES (3, 13, 3, 16, N'Giao hàng nhanh', N'product_img/ak22.2.jpg', 3, 1, CAST(N'2024-11-08' AS Date), CAST(N'2024-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
GO
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (1, 3, N'Áo Polo In Full Họa Tiết 4TC Form Regular PO132 Màu Trắng', N'product_img/ap13.1.png', 1, 1, 356250, 356250)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (1, 8, N'Quần Short Kaki Lưng Thun Cài Nút ', N'product_img/qs33.1.jpg', 1, 1, 229000, 229000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (2, 5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 1, 1, 612750, 612750)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (2, 18, N'Quần shorts ECC Ripstop ', N'product_img/qs29.1.jpg', 1, 1, 239000, 239000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (3, 16, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 2, 4, 612750, 2451000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (4, 18, N'Quần shorts ECC Ripstop ', N'product_img/qs29.1.jpg', 2, 14, 239000, 3346000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (5, 6, N'DRY-EX Áo Khoác Siêu Co Giãn ', N'product_img/ak24.1.jpg', 1, 9, 686000, 6174000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (6, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 1, 5, 190000, 950000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (7, 5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 4, 10, 612750, 6127500)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (8, 18, N'Quần shorts ECC Ripstop ', N'product_img/qs29.1.jpg', 1, 1, 239000, 239000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (8, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 5, 4, 190000, 760000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (9, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 5, 3, 190000, 570000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (10, 13, N'Mũ lưỡi chai   ', N'product_img/m1.1.jpg', 3, 10, 175000, 1750000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (11, 5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 1, 1, 612750, 612750)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (11, 13, N'Mũ lưỡi chai   ', N'product_img/m1.1.jpg', 3, 5, 175000, 875000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (12, 5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 5, 5, 612750, 3063750)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (13, 5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', N'product_img/ak22.1.jpg', 1, 3, 612750, 1838250)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (14, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 4, 2, 190000, 380000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (15, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 3, 9, 251100, 2259900)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (16, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 1, 9, 251100, 2259900)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (17, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 1, 1, 251100, 251100)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (17, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 3, 1, 251100, 251100)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (18, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 1, 9, 251100, 2259900)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (19, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 1, 1, 251100, 251100)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (20, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 2, 1, 251100, 251100)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (21, 1, N'Áo thun Training Comfort', N'product_img/at1.1.jpg', 3, 1, 251100, 251100)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (22, 3, N'Áo Polo In Full Họa Tiết 4TC Form Regular PO132 Màu Trắng', N'product_img/ap13.1.png', 2, 1, 356250, 356250)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (23, 7, N'Quần shorts ECC Ripstop ', N'product_img/qs29.1.jpg', 1, 8, 239000, 1912000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (24, 3, N'Áo Polo In Full Họa Tiết 4TC Form Regular PO132 Màu Trắng', N'product_img/ap13.1.png', 1, 1, 356250, 356250)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (25, 7, N'Quần shorts ECC Ripstop ', N'product_img/qs29.1.jpg', 5, 1, 239000, 239000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (26, 4, N'Áo Polo Nam Ice Cooling ', N'product_img/ap15.1.jpg', 3, 1, 244300, 244300)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (27, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 3, 5, 190000, 950000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (28, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 3, 5, 190000, 950000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (29, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 3, 5, 190000, 950000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (30, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 3, 5, 190000, 950000)
INSERT [dbo].[Order_Details] ([order_id], [product_id], [product_name], [thumbnail], [size_id], [quantity], [UnitPrice], [TotalPrice]) VALUES (31, 20, N'Áo thun siêu mát', N'product_img/ak25.1.jpg', 3, 10, 190000, 1900000)
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (1, N'Chờ xử lý', N'Đơn hàng đã được đặt nhưng chưa xử lý.', 1)
INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (2, N'Đang xử lý', N'Đơn hàng đang được xử lý.', 1)
INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (3, N'Đã giao hàng', N'Đơn hàng đã được gửi đến khách hàng.', 1)
INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (4, N'Đã nhận hàng', N'Đơn hàng đã được giao cho khách hàng.', 1)
INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (5, N'Đã hủy', N'Đơn hàng đã bị hủy.', 1)
INSERT [dbo].[Order_Status] ([order_status_id], [order_status_name], [description], [is_active]) VALUES (6, N'Đóng gói thành công', N'Đơn hàng đã được đóng gói.', 1)
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (1, 13, CAST(N'2024-11-08T14:52:08.000' AS DateTime), NULL, N'Ha Huy Vu', N'0123456729', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 585250, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 605750, 400, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (2, 13, CAST(N'2024-11-08T14:57:07.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 851750, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 872250, 400, 1, NULL, NULL, 2, 4, N'LDTGTY', 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (3, 13, CAST(N'2024-11-08T15:13:32.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 2451000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 2471500, 1200, 1, NULL, NULL, 2, 4, N'LDTGXU', 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (4, 14, CAST(N'2024-11-08T21:22:26.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0123456719', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 3346000, 47500, 7, CAST(30.00 AS Decimal(10, 2)), 2389700, 4200, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (5, 14, CAST(N'2024-11-08T21:28:59.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0123456719', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 6174000, 20500, 7, CAST(30.00 AS Decimal(10, 2)), 4342300, 1800, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (6, 14, CAST(N'2024-11-08T21:44:11.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0123456719', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 950000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 970500, 1000, 1, NULL, NULL, 1, 6, NULL, 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (7, 13, CAST(N'2024-11-08T21:47:31.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 6127500, 54501, 1, CAST(0.00 AS Decimal(10, 2)), 6182001, 5000, 2, N'91f2a0a3-1357-48ef-a6ad-15aa0236d968', N'20241108214731', 5, 5, NULL, 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (8, 13, CAST(N'2024-11-08T21:56:05.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 999000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 1019500, 1000, 1, NULL, NULL, 1, 5, NULL, 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (9, 14, CAST(N'2024-11-08T21:56:52.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0123456719', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 570000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 590500, 600, 1, NULL, NULL, 1, 5, NULL, 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (10, 14, CAST(N'2024-11-08T22:06:39.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 1750000, 40500, 1, CAST(0.00 AS Decimal(10, 2)), 1790500, 4000, 1, NULL, NULL, 2, 4, N'LDTCEQ', 7)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (11, 13, CAST(N'2024-11-08T23:28:22.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 1487750, 25500, 1, CAST(0.00 AS Decimal(10, 2)), 1513250, 2200, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (12, 14, CAST(N'2024-11-08T23:35:37.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 3063750, 30500, 1, CAST(0.00 AS Decimal(10, 2)), 3094250, 3000, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (13, 13, CAST(N'2024-11-08T23:36:58.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 1838250, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 1858750, 600, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (14, 14, CAST(N'2024-11-08T23:40:52.000' AS DateTime), CAST(N'2024-11-10T23:59:59.000' AS DateTime), N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 380000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 400500, 400, 1, NULL, NULL, 2, 4, N'LDT9QF', 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (15, 14, CAST(N'2024-11-08T23:55:15.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 2259900, 40500, 1, CAST(0.00 AS Decimal(10, 2)), 2300400, 3600, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (16, 14, CAST(N'2024-11-08T23:58:05.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 2259900, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 2280400, 1800, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (17, 13, CAST(N'2024-11-08T23:59:06.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 502200, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 522700, 600, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (18, 14, CAST(N'2024-11-09T00:04:26.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 2259900, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 2280400, 1800, 1, NULL, NULL, 1, 2, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (19, 13, CAST(N'2024-11-09T00:05:06.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 251100, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 271600, 200, 1, NULL, NULL, 1, 6, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (20, 13, CAST(N'2024-11-09T12:26:08.000' AS DateTime), CAST(N'2024-11-11T23:59:59.000' AS DateTime), N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 251100, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 271600, 300, 1, NULL, NULL, 2, 4, N'LDT9LA', 8)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (21, 13, CAST(N'2024-11-09T17:26:26.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 251100, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 271600, 400, 1, NULL, NULL, 1, 2, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (22, 13, CAST(N'2024-11-09T17:26:41.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 356250, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 376750, 300, 1, NULL, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (23, 13, CAST(N'2024-11-09T20:32:09.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 1912000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 1932500, 1600, 1, NULL, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (24, 13, CAST(N'2024-11-09T21:27:30.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 356250, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 376750, 200, 1, NULL, NULL, 1, 2, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (25, 13, CAST(N'2024-11-09T21:56:50.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 239000, 20500, 7, CAST(30.00 AS Decimal(10, 2)), 187800, 600, 1, NULL, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (26, 13, CAST(N'2024-11-09T21:58:06.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 244300, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 264800, 400, 2, N'5a8c61b8-8172-443c-be66-bdc70fcd5aa5', N'20241109215806', 3, 5, NULL, NULL)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (27, 13, CAST(N'2024-11-09T22:02:35.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 950000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 970500, 1000, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (28, 13, CAST(N'2024-11-09T22:05:40.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 950000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 970500, 1000, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (29, 13, CAST(N'2024-11-09T22:07:15.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 950000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 970500, 1000, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (30, 14, CAST(N'2024-11-09T22:07:48.000' AS DateTime), NULL, N'Nguyen Truong Quan', N'0968356204', N'user2@gmail.com', N'so nha 43', N'21507', N'Phường Tân Quý', 1456, N'Quận Tân Phú', 202, N'Hồ Chí Minh', 950000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 970500, 1000, 1, NULL, NULL, 1, 5, NULL, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [ordered_date], [receive_date], [receiver_name], [phone], [email], [address], [ward_code], [ward_name], [district_id], [district_name], [province_id], [province_name], [total_price], [shipping_fee], [voucher_id], [voucher_percent], [total_amount], [total_gram], [payment_method_id], [vnp_TxnRef], [vnp_CreateDate], [payment_status_id], [order_status_id], [shipping_code], [salerId]) VALUES (31, 13, CAST(N'2024-11-09T22:11:25.000' AS DateTime), NULL, N'Ha Huy Vu', N'0347818511', N'user1@gmail.com', N'Số nhà 43', N'21408', N'Phường 8', 1455, N'Quận Tân Bình', 202, N'Hồ Chí Minh', 1900000, 20500, 1, CAST(0.00 AS Decimal(10, 2)), 1920500, 2000, 1, NULL, NULL, 1, 5, NULL, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Methods] ON 

INSERT [dbo].[Payment_Methods] ([payment_method_id], [payment_method_name], [description]) VALUES (1, N'Thanh toán khi nhận hàng', N'Thanh toán bằng tiền mặt khi giao hàng.')
INSERT [dbo].[Payment_Methods] ([payment_method_id], [payment_method_name], [description]) VALUES (2, N'Thanh toán qua VNPAY', N'Thanh toán trực tuyến bằng VNPAY.')
SET IDENTITY_INSERT [dbo].[Payment_Methods] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Status] ON 

INSERT [dbo].[Payment_Status] ([payment_status_id], [payment_status_name], [description]) VALUES (1, N'Chờ thanh toán', N'Đang chờ thanh toán từ khách hàng.')
INSERT [dbo].[Payment_Status] ([payment_status_id], [payment_status_name], [description]) VALUES (2, N'Đã thanh toán', N'Thanh toán đã được xử lý thành công.')
INSERT [dbo].[Payment_Status] ([payment_status_id], [payment_status_name], [description]) VALUES (3, N'Thanh toán thất bại', N'Thanh toán thất bại hoặc bị từ chối.')
INSERT [dbo].[Payment_Status] ([payment_status_id], [payment_status_name], [description]) VALUES (4, N'Chờ hoàn tiền', N'Đang chờ hoàn tiền cho khách hàng.')
INSERT [dbo].[Payment_Status] ([payment_status_id], [payment_status_name], [description]) VALUES (5, N'Đã hoàn tiền', N'Thanh toán đã được hoàn lại cho khách hàng.')
SET IDENTITY_INSERT [dbo].[Payment_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Categories] ON 

INSERT [dbo].[Post_Categories] ([post_category_id], [post_category_name], [is_active]) VALUES (1, N'Phong cách và Thời trang', 1)
INSERT [dbo].[Post_Categories] ([post_category_id], [post_category_name], [is_active]) VALUES (2, N'Làm đẹp', 1)
INSERT [dbo].[Post_Categories] ([post_category_id], [post_category_name], [is_active]) VALUES (3, N'Tin tức', 1)
SET IDENTITY_INSERT [dbo].[Post_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Feedbacks] ON 

INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (1, 11, 3, N'Bài viết hay! Rất thông tin.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (2, 12, 1, N'Tôi đã học được nhiều từ bài viết này.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (3, 11, 4, N'Không như mong đợi, nhưng vẫn tốt.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (4, 12, 7, N'Bài viết có thể thêm nhiều ví dụ hơn.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (5, 11, 2, N'Bài viết này giúp tôi rất nhiều, cảm ơn!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (6, 12, 5, N'Quan điểm thú vị.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (7, 11, 8, N'Tôi không đồng ý với một số điểm.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (8, 12, 6, N'Bài viết viết rất hay và cuốn hút.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (9, 11, 3, N'Tôi muốn xem thêm nội dung như thế này.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (10, 12, 1, N'Những mẹo rất hữu ích, cảm ơn!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (11, 11, 2, N'Tôi thấy bài viết này hơi khó hiểu.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (12, 12, 4, N'Thông tin xuất sắc!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (13, 11, 7, N'Những ý kiến hay, cảm ơn!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (14, 12, 5, N'Không hữu ích lắm đối với tôi.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (15, 11, 8, N'Tôi đánh giá cao nỗ lực này.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (16, 12, 6, N'Bài viết có thể tốt hơn.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (17, 11, 3, N'Tôi rất thích! Sẽ chia sẻ.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (18, 12, 1, N'Bài viết thú vị.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (19, 11, 2, N'Tôi đã học được điều mới.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (20, 12, 4, N'Ví dụ rất hay!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (21, 11, 7, N'Tôi thấy bài viết ổn.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (22, 12, 5, N'Rất chi tiết và tỉ mỉ.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (23, 11, 8, N'Tôi không thích lắm.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (24, 12, 6, N'Thông tin rất tốt.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (25, 11, 3, N'Tôi rất thích bài viết này.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (26, 12, 1, N'Cảm ơn vì đã chia sẻ!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (27, 11, 4, N'Tôi có cảm xúc lẫn lộn về bài viết.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (28, 12, 2, N'Rất sáng tỏ!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (29, 11, 8, N'Bài viết này rất hay.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (30, 12, 5, N'Tôi muốn thấy nhiều bài như thế này hơn.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (31, 11, 6, N'Bài viết có thể cải thiện.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (32, 12, 3, N'Rất hữu ích!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (33, 11, 1, N'Tôi không thích bài này lắm.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (34, 12, 2, N'Những nhận định rất hay.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (35, 11, 4, N'Tôi đã học được rất nhiều!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (36, 12, 7, N'Tôi rất thích những ví dụ.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (37, 11, 5, N'Bài viết rất hữu ích.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (38, 12, 8, N'Những nhận định tuyệt vời!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (39, 11, 6, N'Cấu trúc bài viết rất tốt.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (40, 12, 3, N'Cảm ơn vì những mẹo hữu ích!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (41, 11, 1, N'Chủ đề rất thú vị.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (42, 12, 4, N'Tôi thấy bài viết rất thông tin.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (43, 11, 2, N'Làm tốt lắm với bài viết này!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (44, 12, 8, N'Tôi đánh giá cao những nỗ lực của bạn.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (45, 11, 5, N'Nội dung tuyệt vời!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (46, 12, 6, N'Bài viết rất thu hút!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (47, 11, 3, N'Tôi rất thích bài viết này!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (48, 12, 1, N'Quan điểm xuất sắc!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (49, 11, 2, N'Tôi thấy bài viết khá hữu ích.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (50, 12, 4, N'Tôi thực sự đánh giá cao bài viết này!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (51, 11, 7, N'Những ý kiến rất hay!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (52, 12, 5, N'Bài viết rất hữu ích và thông tin.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (53, 11, 8, N'Tôi thấy rất thú vị.', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (54, 12, 6, N'Những điểm hay đáng chú ý!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Post_Feedbacks] ([post_feedback_id], [customer_id], [post_id], [review], [is_active], [create_at], [modified_at]) VALUES (55, 11, 3, N'Cảm ơn vì thông tin hữu ích!', 1, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Post_Feedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (1, N'10 Món Đồ Thời Trang Cần Thiết Mọi Phụ Nữ Nên Có', N'Đây là nội dung của bài viết đầu tiên. Nó cung cấp một cái nhìn sâu sắc về chủ đề, khám phá nhiều khía cạnh và đưa ra những hiểu biết vừa thông tin vừa thú vị. Người đọc sẽ thấy giá trị trong các chi tiết được trình bày, bao gồm nhiều chủ đề liên quan đến chủ đề chính.', N'post_img/post1.jpg', 7, 1, CAST(N'2024-09-22T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 1)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (2, N'Cách Phối Đồ Cho Mọi Mùa', N'Nội dung của bài viết thứ hai nằm ở đây. Bài viết này đi sâu vào các chi tiết của chủ đề, đưa ra một phân tích kỹ lưỡng với sự hỗ trợ của các ví dụ và câu chuyện thực tế. Nó nhằm mục đích làm sáng tỏ cho khán giả, khơi dậy các cuộc thảo luận và khuyến khích việc khám phá sâu hơn về chủ đề.', N'post_img/post2.jpg', 7, 1, CAST(N'2024-10-02T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 2)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (3, N'Sự Phát Triển Của Thời Trang Bền Vững: Những Điều Bạn Cần Biết', N'Đây là một số nội dung thú vị cho bài viết thứ ba. Bài viết này nhằm thu hút người đọc với những câu chuyện hấp dẫn và các hiểu biết thách thức sự khôn ngoan thông thường. Cuộc thảo luận bao gồm nhiều quan điểm, đảm bảo một cái nhìn toàn diện về các vấn đề đang được đề cập.', N'post_img/post3.jpg', 7, 1, CAST(N'2024-09-21T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 1)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (4, N'Cách Phối Phụ Kiện Như Chuyên Gia: Mẹo Cho Mọi Dịp', N'Bài viết này nói về nhiều chủ đề liên quan trong xã hội ngày nay. Bằng cách giải quyết các xu hướng và thách thức hiện tại, nó hướng đến việc kết nối với khán giả. Nội dung được làm phong phú thêm với các sự kiện, số liệu thống kê và ví dụ thực tế để nâng cao sự hiểu biết và thúc đẩy sự tham gia.', N'post_img/post4.jpg', 8, 1, CAST(N'2024-08-22T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 3)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (5, N'Cân Bằng Giữa Sự Thoải Mái Và Phong Cách Trong Trang Phục Hàng Ngày', N'Nội dung của bài viết thứ năm rất hấp dẫn và đi sâu vào trọng tâm của chủ đề. Thông qua sự kết hợp giữa nghiên cứu và câu chuyện cá nhân, bài viết mang đến một góc nhìn độc đáo chắc chắn sẽ thu hút sự quan tâm của người đọc. Cấu trúc của bài viết được thiết kế rõ ràng và dễ theo dõi.', N'post_img/post5.jpg', 8, 1, CAST(N'2024-09-30T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 2)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (6, N'Xu Hướng Thời Trang Nên Thử Trong Năm Nay', N'Khám phá nhiều chủ đề khác nhau trong bài viết thứ sáu này cung cấp một nền tảng cho các ý kiến và ý tưởng đa dạng. Nó khuyến khích người đọc suy nghĩ thấu đáo về thông tin được trình bày, cân nhắc các lập luận trong khi đưa ra cái nhìn cân bằng về các khía cạnh được thảo luận.', N'post_img/post6.jpg', 9, 1, CAST(N'2024-10-01T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 1)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (7, N'Đơn Giản Hóa Phong Cách Của Bạn', N'Bài viết thứ bảy mang lại những hiểu biết mới mẻ thách thức hiện trạng. Thông qua việc kiểm tra nghiêm ngặt các sự kiện và lý thuyết, nội dung khuyến khích người đọc xem xét lại quan điểm của mình. Bài viết này không chỉ là thông tin mà còn là lời kêu gọi hành động để nâng cao nhận thức.', N'post_img/post7.jpg', 9, 1, CAST(N'2024-09-25T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 3)
INSERT [dbo].[Posts] ([post_id], [title], [content], [thumbnail], [author_id], [is_active], [created_at], [modified_at], [post_category_id]) VALUES (8, N'Nghệ Thuật Săn Đồ Cũ: Cách Tìm Kiếm Những Món Hàng Độc Đáo', N'Bài viết cuối cùng trong loạt bài tám bài này kết thúc với một cái nhìn tổng quát. Nó kết nối các chủ đề chính từ các bài viết trước trong khi cung cấp thêm các thông tin mới. Mục đích là để cung cấp sự kết thúc trong khi vẫn khuyến khích người đọc tiếp tục khám phá các chủ đề thêm.', N'post_img/post8.jpg', 10, 1, CAST(N'2024-09-21T22:41:26.113' AS DateTime), CAST(N'2024-11-08T14:00:57.753' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([price_id], [from], [to], [is_active]) VALUES (1, 0, 100, 1)
INSERT [dbo].[Prices] ([price_id], [from], [to], [is_active]) VALUES (2, 100, 200, 1)
SET IDENTITY_INSERT [dbo].[Prices] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Categories] ON 

INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (1, N'Áo sơ mi', 1)
INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (2, N'Áo thun', 1)
INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (3, N'Quần jean', 1)
INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (4, N'Váy đầm', 0)
INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (5, N'Phụ kiện', 1)
INSERT [dbo].[Product_Categories] ([product_category_id], [product_category_name], [is_active]) VALUES (6, N'Quần dài', 0)
SET IDENTITY_INSERT [dbo].[Product_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Images] ON 

INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (1, 1, N'product_img/at1.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (2, 1, N'product_img/at1.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (3, 1, N'product_img/at1.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (4, 1, N'product_img/at1.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (5, 2, N'product_img/at2.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (6, 2, N'product_img/at2.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (7, 2, N'product_img/at2.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (8, 2, N'product_img/at2.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (9, 3, N'product_img/ap13.1.png', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (10, 3, N'product_img/ap13.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (11, 3, N'product_img/ap13.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (12, 3, N'product_img/ap13.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (13, 4, N'product_img/ap15.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (14, 4, N'product_img/ap15.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (15, 4, N'product_img/ap15.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (16, 4, N'product_img/ap15.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (17, 5, N'product_img/ak22.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (18, 5, N'product_img/ak22.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (19, 5, N'product_img/ak22.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (20, 5, N'product_img/ak22.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (21, 6, N'product_img/ak24.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (22, 6, N'product_img/ak24.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (23, 6, N'product_img/ak24.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (24, 6, N'product_img/ak24.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (25, 7, N'product_img/qs29.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (26, 7, N'product_img/qs29.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (27, 7, N'product_img/qs29.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (28, 7, N'product_img/qs29.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (29, 8, N'product_img/qs33.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (30, 8, N'product_img/qs33.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (31, 8, N'product_img/qs33.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (32, 8, N'product_img/qs33.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (33, 9, N'product_img/qj41.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (34, 9, N'product_img/qj41.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (35, 9, N'product_img/qj41.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (36, 9, N'product_img/qj41.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (37, 10, N'product_img/qj45.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (38, 10, N'product_img/qj45.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (39, 10, N'product_img/qj45.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (40, 10, N'product_img/qj45.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (41, 11, N'product_img/tl1.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (42, 11, N'product_img/tl1.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (43, 11, N'product_img/tl1.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (44, 11, N'product_img/tl1.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (45, 12, N'product_img/tl2.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (46, 12, N'product_img/tl2.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (47, 12, N'product_img/tl2.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (48, 12, N'product_img/tl2.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (49, 13, N'product_img/m1.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (50, 13, N'product_img/m1.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (51, 13, N'product_img/m1.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (52, 13, N'product_img/m1.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (53, 14, N'product_img/m2.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (54, 14, N'product_img/m2.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (55, 14, N'product_img/m2.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (56, 14, N'product_img/m2.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (57, 15, N'product_img/ap15.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (58, 15, N'product_img/ap15.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (59, 15, N'product_img/ap15.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (60, 15, N'product_img/ap15.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (61, 16, N'product_img/ak22.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (62, 16, N'product_img/ak22.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (63, 16, N'product_img/ak22.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (64, 16, N'product_img/ak22.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (65, 17, N'product_img/ak24.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (66, 17, N'product_img/ak24.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (67, 17, N'product_img/ak24.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (68, 17, N'product_img/ak24.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (69, 18, N'product_img/qs29.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (70, 18, N'product_img/qs29.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (71, 18, N'product_img/qs29.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (72, 18, N'product_img/qs29.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (73, 19, N'product_img/qs33.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (74, 19, N'product_img/qs33.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (75, 19, N'product_img/qs33.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (76, 19, N'product_img/qs33.4.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (77, 20, N'product_img/ak25.1.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (78, 20, N'product_img/ak25.2.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (79, 20, N'product_img/ak25.3.jpg', 1)
INSERT [dbo].[Product_Images] ([product_image_id], [product_id], [image_url], [is_active]) VALUES (80, 20, N'product_img/ak25.4.jpg', 1)
SET IDENTITY_INSERT [dbo].[Product_Images] OFF
GO
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 1, 0, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 2, 20, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 3, 9, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 4, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 5, 14, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 6, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 7, 2, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 8, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 9, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 10, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 11, 20, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 12, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 18, 34, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 19, 30, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (1, 20, 0, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 1, 29, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 2, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 3, 19, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 4, 15, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 5, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 6, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 7, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 14, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 15, 40, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 16, 21, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 17, 30, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 18, 14, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 19, 20, 300)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (2, 20, 10, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 1, 9, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 2, 10, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 3, 20, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 4, 20, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 13, 15, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 14, 10, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 15, 10, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 16, 25, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 17, 20, 400)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (3, 20, 25, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 4, 5, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 5, 10, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 8, 20, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 9, 20, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 10, 20, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 11, 30, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 12, 20, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 13, 25, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 14, 20, 500)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (4, 20, 0, 200)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 5, 5, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 6, 20, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 7, 19, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 8, 20, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 9, 20, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 10, 20, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 19, 20, 600)
INSERT [dbo].[Product_Size] ([size_id], [product_id], [quantity], [weight]) VALUES (5, 20, 5, 200)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (1, N'Áo thun Training Comfort', 279000, 38, CAST(10.00 AS Decimal(10, 2)), N'Polyester pha Spandex bền, co giãn. Công nghệ Exdry, thấm hút và nhanh khô. Thoải mái và co giãn tự nhiên. Kiểu dệt Mesh thoáng khí.', N'product_img/at1.1.jpg', 1, 0, 1, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (2, N'Áo Thun Dáng Rộng Kẻ Sọc', 195000, 50, CAST(20.00 AS Decimal(10, 2)), N'Polyester pha Spandex bền, co giãn. Công nghệ Exdry, thấm hút và nhanh khô. Thoải mái và co giãn tự nhiên. Kiểu dệt Mesh thoáng khí.', N'product_img/at2.1.jpg', 1, 0, 2, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (3, N'Áo Polo In Full Họa Tiết 4TC Form Regular PO132 Màu Trắng', 375000, 48, CAST(5.00 AS Decimal(10, 2)), N'Áo polo in full họa tiếc 4TC được sử dụng kĩ thuật dệt trên sợi CVC cao cấp nên vải có cấu trúc co giãn 4 chiều mang lại sự thoải mái tối ưu. Thiết kế với họa tiết monogram logo đặc trưng của bộ sưu tập được in trên toàn thân áo đem lại sự cổ điển thanh lịch và vẻ hiện đại trẻ trung. ', N'product_img/ap13.1.png', 1, 0, 3, 2)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (4, N'Áo Polo Nam Ice Cooling ', 349000, 50, CAST(30.00 AS Decimal(10, 2)), N'Áo polo in full họa tiếc 4TC được sử dụng kĩ thuật dệt trên sợi CVC cao cấp nên vải có cấu trúc co giãn 4 chiều mang lại sự thoải mái tối ưu. Thiết kế với họa tiết monogram logo đặc trưng của bộ sưu tập được in trên toàn thân áo đem lại sự cổ điển thanh lịch và vẻ hiện đại trẻ trung.', N'product_img/ap15.1.jpg', 1, 0, 1, 2)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (5, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', 645000, 41, CAST(5.00 AS Decimal(10, 2)), N'Loại áo mặc bên ngoài, được sử dụng bởi cả nam và nữ, nhằm mục đích giữ ấm hoặc tạo tính thời trang.', N'product_img/ak22.1.jpg', 1, 4, 3, 2)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (6, N'DRY-EX Áo Khoác Siêu Co Giãn ', 686000, 50, CAST(0.00 AS Decimal(10, 2)), N'Loại áo mặc bên ngoài, được sử dụng bởi cả nam và nữ, nhằm mục đích giữ ấm hoặc tạo tính thời trang.', N'product_img/ak24.1.jpg', 1, 0, 2, 4)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (7, N'Quần shorts ECC Ripstop ', 239000, 41, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qs29.1.jpg', 1, 0, 1, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (8, N'Quần Short Kaki Lưng Thun Cài Nút ', 229000, 50, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qs33.1.jpg', 1, 0, 3, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (9, N'Quần Jogger Vải Washed Jersey ', 588000, 50, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qj41.1.jpg', 1, 0, 2, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (10, N'Quần Jeans Nam siêu nhẹ ', 499000, 50, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qj45.1.jpg', 1, 0, 1, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (11, N'Thắt lưng da Ý  ', 325000, 50, CAST(0.00 AS Decimal(10, 2)), N'Vượt trội về cả ngoại hình và chất lượng. Món đồ này hứa hẹn sẽ trở thành người đồng hành tin cậy của quý ông trên mọi phương diện. ', N'product_img/tl1.1.jpg', 1, 0, 1, 5)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (12, N'Thăt lưng khóa tự động   ', 275000, 50, CAST(0.00 AS Decimal(10, 2)), N'Vượt trội về cả ngoại hình và chất lượng. Món đồ này hứa hẹn sẽ trở thành người đồng hành tin cậy của quý ông trên mọi phương diện. ', N'product_img/tl2.1.jpg', 1, 0, 3, 5)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (13, N'Mũ lưỡi chai   ', 175000, 35, CAST(0.00 AS Decimal(10, 2)), N'Mũ lưỡi trai đen trơn thể hiện lối sống của đa số người trẻ đương đại – TỐI GIẢN. Chiếc nón kết đen trơn là một trong những xu hướng thời trang năm 2024 được nhiều người theo đuổi. ', N'product_img/m1.1.jpg', 1, 0, 3, 5)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (14, N'Nón Lưỡi Trai Thêu ', 169000, 50, CAST(0.00 AS Decimal(10, 2)), N'Mũ lưỡi trai đen trơn thể hiện lối sống của đa số người trẻ đương đại – TỐI GIẢN. Chiếc nón kết đen trơn là một trong những xu hướng thời trang năm 2024 được nhiều người theo đuổi. ', N'product_img/m2.1.jpg', 1, 0, 1, 5)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (15, N'Áo Polo Nam Ice Cooling ', 349000, 50, CAST(30.00 AS Decimal(10, 2)), N'Áo polo in full họa tiếc 4TC được sử dụng kĩ thuật dệt trên sợi CVC cao cấp nên vải có cấu trúc co giãn 4 chiều mang lại sự thoải mái tối ưu. Thiết kế với họa tiết monogram logo đặc trưng của bộ sưu tập được in trên toàn thân áo đem lại sự cổ điển thanh lịch và vẻ hiện đại trẻ trung.', N'product_img/ap15.1.jpg', 1, 0, 1, 2)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (16, N'Áo Khoác Kaki Có Nón Form Loose AK058 Màu Đen ', 645000, 50, CAST(5.00 AS Decimal(10, 2)), N'Loại áo mặc bên ngoài, được sử dụng bởi cả nam và nữ, nhằm mục đích giữ ấm hoặc tạo tính thời trang.', N'product_img/ak22.1.jpg', 1, 3, 3, 1)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (17, N'DRY-EX Áo Khoác Siêu Co Giãn ', 686000, 50, CAST(0.00 AS Decimal(10, 2)), N'Loại áo mặc bên ngoài, được sử dụng bởi cả nam và nữ, nhằm mục đích giữ ấm hoặc tạo tính thời trang.', N'product_img/ak24.1.jpg', 1, 0, 2, 2)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (18, N'Quần shorts ECC Ripstop ', 239000, 50, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qs29.1.jpg', 1, 5, 1, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (19, N'Quần Short Kaki Lưng Thun Cài Nút ', 229000, 50, CAST(0.00 AS Decimal(10, 2)), N'Độ bền và khả năng chịu lực cao. Trượt nước và chống bám bụi. Nhẹ và thoáng khí, thoải mái khi mặc. ', N'product_img/qs33.1.jpg', 1, 0, 3, 3)
INSERT [dbo].[Products] ([product_id], [product_name], [price], [total_quantity], [discount], [description], [thumbnail], [is_active], [rated_star], [brand_id], [product_category_id]) VALUES (20, N'Áo thun siêu mát', 200000, 40, CAST(5.00 AS Decimal(10, 2)), N'Mặc vào thì mát', N'product_img/ak25.1.jpg', 1, 0, 1, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [rolename]) VALUES (1, N'quản trị viên')
INSERT [dbo].[Roles] ([role_id], [rolename]) VALUES (2, N'quản lý bán hàng')
INSERT [dbo].[Roles] ([role_id], [rolename]) VALUES (3, N'nhân viên bán hàng')
INSERT [dbo].[Roles] ([role_id], [rolename]) VALUES (4, N'nhân viên marketing')
INSERT [dbo].[Roles] ([role_id], [rolename]) VALUES (5, N'người dùng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([size_id], [size_name], [description]) VALUES (1, N'S', N'Kích thước nhỏ')
INSERT [dbo].[Sizes] ([size_id], [size_name], [description]) VALUES (2, N'M', N'Kích thước trung bình')
INSERT [dbo].[Sizes] ([size_id], [size_name], [description]) VALUES (3, N'L', N'Kích thước lớn')
INSERT [dbo].[Sizes] ([size_id], [size_name], [description]) VALUES (4, N'XL', N'Kích thước rất lớn')
INSERT [dbo].[Sizes] ([size_id], [size_name], [description]) VALUES (5, N'Freesize', N'Kích thước tự do')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (1, N'Giảm giá mùa hè - Giảm tới 50%', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider1.jpg', 1)
INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (2, N'Hàng mới về - Khám phá bộ sưu tập mới nhất', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider2.jpg', 1)
INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (3, N'Ưu đãi độc quyền - Mua 1 tặng 1', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider3.jpg', 1)
INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (4, N'Phiên bản giới hạn - Có sẵn ngay bây giờ', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider4.jpg', 1)
INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (5, N'Giảm giá mùa hè - Giảm tới 50%', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider5.jpg', 1)
INSERT [dbo].[Sliders] ([slider_id], [tittle], [description], [image_url], [is_active]) VALUES (6, N'Hàng mới về - Khám phá bộ sưu tập mới nhất', N'Nhãn hiệu chuyên sản xuất các sản phẩm sang trọng. Được sản xuất một cách có đạo đức với cam kết không ngừng về chất lượng tuyệt vời.', N'slider_img/slider6.jpg', 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (3, N'admin', N'123', N'Khuat Dinh', N'Truong', NULL, NULL, 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 1)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (4, N'saleManager', N'123', N'Do Minh', N'Duc', N'0123456789', N'salemanager@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 2)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (5, N'sale1', N'123', N'Nguyen Truong', N'Quan', N'0123456788', N'saler1@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 3)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (6, N'sale2', N'123', N'Phan Thanh', N'Tan', N'0123456799', N'saler2@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 3)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (7, N'sale3', N'123', N'Ha Huy', N'Vu', N'0123456888', N'saler3@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 3)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (8, N'sale4', N'123', N'Khuat Dinh', N'Truong', N'0123456999', N'saler4@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 3)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (9, N'marketer1', N'123', N'Do Minh', N'Duc', N'0123456879', N'marketer1@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 4)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (10, N'marketer2', N'123', N'Phan Thanh', N'Tan', N'0123456599', N'marketer2@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 4)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (11, N'marketer3', N'123', N'Nguyen Truong', N'Quan', N'0123456499', N'marketer3@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 4)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (12, N'marketer4', N'123', N'Ha Huy', N'Vu', N'0123456749', N'marketer4@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 4)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (13, N'user1', N'123', N'Ha Huy', N'Vu', N'0123456729', N'user1@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/phuong.jpg', 1, 0, 5)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (14, N'user2', N'123', N'Nguyen Truong', N'Quan', N'0123456719', N'user2@gmail.com', 1, CAST(N'2004-05-19' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 5)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (22, N'user3', N'123', N'Khuất Đình ', N'Trường', N'0223456789', N'vuhh123@gmail.com', 1, CAST(N'2024-11-08' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 5)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (23, N'user4', N'123', N'Nguyen Truong', N'Quan', N'0347818511', N'khuditru123@gmail.com', 1, CAST(N'2024-11-21' AS Date), N'255054', NULL, NULL, N'profile_img/default.jpg', 0, 0, 5)
INSERT [dbo].[Users] ([user_id], [username], [password], [first_name], [last_name], [phone], [email], [gender], [dob], [verification_code], [reset_password_code], [google_id], [profile_picture_url], [is_active], [is_banned], [role_id]) VALUES (24, N'user5', N'123', N'Khuất Đình', N'Trường', N'0222456719', N'khuditru1520@gmail.com', 1, CAST(N'2024-11-15' AS Date), NULL, NULL, NULL, N'profile_img/default.jpg', 1, 0, 5)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (1, N'Mặc định', N'Không có giảm giá', CAST(N'2024-03-01' AS Date), CAST(N'2024-03-31' AS Date), 100, CAST(0.00 AS Decimal(10, 2)), 0, N'vouchercode1')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (2, N'Giảm giá mùa xuân', N'Giảm giá cho tất cả các mặt hàng mùa xuân.', CAST(N'2024-03-01' AS Date), CAST(N'2024-03-31' AS Date), 100, CAST(15.00 AS Decimal(10, 2)), 0, N'vouchercode2')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (3, N'Khuyến mãi mùa hè', N'Ưu đãi đặc biệt cho quần áo mùa hè.', CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date), 200, CAST(10.00 AS Decimal(10, 2)), 0, N'vouchercode3')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (4, N'Trở lại trường học', N'Giảm giá cho đồ dùng học tập.', CAST(N'2024-08-01' AS Date), CAST(N'2024-08-31' AS Date), 150, CAST(20.00 AS Decimal(10, 2)), 0, N'vouchercode4')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (5, N'Giảm giá kỳ nghỉ lễ', N'Giảm giá cuối năm cho các kỳ nghỉ lễ.', CAST(N'2024-12-01' AS Date), CAST(N'2024-12-31' AS Date), 300, CAST(25.00 AS Decimal(10, 2)), 0, N'vouchercode5')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (6, N'Ưu đãi đặc biệt năm mới', N'Giảm giá đặc biệt cho dịp năm mới.', CAST(N'2024-12-30' AS Date), CAST(N'2025-01-15' AS Date), 50, CAST(30.00 AS Decimal(10, 2)), 0, N'vouchercode6')
INSERT [dbo].[Voucher] ([voucher_id], [voucher_name], [description], [start_date], [end_date], [quantity], [percent], [is_active], [voucher_code]) VALUES (7, N'Ưu đãi đặc biệt năm mới', N'Giảm giá đặc biệt cho dịp năm mới.', CAST(N'2024-11-08' AS Date), CAST(N'2025-01-15' AS Date), 49, CAST(30.00 AS Decimal(10, 2)), 1, N'vouchercode7')
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61642A7A27BF]    Script Date: 11/9/2024 11:42:14 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__B43B145F2AD998ED]    Script Date: 11/9/2024 11:42:14 PM ******/
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Voucher__217310693023BC10]    Script Date: 11/9/2024 11:42:14 PM ******/
ALTER TABLE [dbo].[Voucher] ADD UNIQUE NONCLUSTERED 
(
	[voucher_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer_Addresses]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([size_id])
REFERENCES [dbo].[Sizes] ([size_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([order_status_id])
REFERENCES [dbo].[Order_Status] ([order_status_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[Payment_Methods] ([payment_method_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([payment_status_id])
REFERENCES [dbo].[Payment_Status] ([payment_status_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([salerId])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([voucher_id])
REFERENCES [dbo].[Voucher] ([voucher_id])
GO
ALTER TABLE [dbo].[Post_Feedbacks]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Post_Feedbacks]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([post_id])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([post_category_id])
REFERENCES [dbo].[Post_Categories] ([post_category_id])
GO
ALTER TABLE [dbo].[Product_Images]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD FOREIGN KEY([size_id])
REFERENCES [dbo].[Sizes] ([size_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([brand_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([product_category_id])
REFERENCES [dbo].[Product_Categories] ([product_category_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
