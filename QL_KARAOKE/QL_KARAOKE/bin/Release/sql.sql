USE [master]
GO
/****** Object:  Database [Karaoke]    Script Date: 08/21/2021 9:49:18 AM ******/
CREATE DATABASE [Karaoke] ON  PRIMARY 
( NAME = N'Karaoke', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Karaoke.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Karaoke_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Karaoke_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Karaoke] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Karaoke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Karaoke] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Karaoke] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Karaoke] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Karaoke] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Karaoke] SET ARITHABORT OFF 
GO
ALTER DATABASE [Karaoke] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Karaoke] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Karaoke] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Karaoke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Karaoke] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Karaoke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Karaoke] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Karaoke] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Karaoke] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Karaoke] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Karaoke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Karaoke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Karaoke] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Karaoke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Karaoke] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Karaoke] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Karaoke] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Karaoke] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Karaoke] SET  MULTI_USER 
GO
ALTER DATABASE [Karaoke] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Karaoke] SET DB_CHAINING OFF 
GO
USE [Karaoke]
GO
/****** Object:  Table [dbo].[CauHinhs]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHinhs](
	[tukhoa] [nvarchar](50) NOT NULL,
	[giatri] [nvarchar](50) NULL,
 CONSTRAINT [PK_CauHinhs] PRIMARY KEY CLUSTERED 
(
	[tukhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[IDHoaDon] [bigint] NOT NULL,
	[IDMatHang] [int] NOT NULL,
	[SL] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC,
	[IDMatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[IDHoaDon] [bigint] NOT NULL,
	[IDMatHang] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC,
	[IDMatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDVT] [nvarchar](20) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](30) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](30) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBanHang]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBanHang](
	[IDHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[IDPhong] [int] NULL,
	[ThoiGianBDau] [datetime] NULL,
	[ThoiGianKThuc] [datetime] NULL,
	[DonGiaPhong] [int] NULL,
	[NguoiBan] [varchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](30) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](50) NULL,
 CONSTRAINT [PK_HoaDonBanHang] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhaps]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhaps](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NhanVienNhap] [varchar](30) NOT NULL,
	[IDNhaCC] [int] NULL,
	[DaNhap] [tinyint] NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TienThanhToan] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](30) NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](30) NULL,
 CONSTRAINT [PK_HoaDonnhap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhong] [nvarchar](50) NOT NULL,
	[DonGia] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](30) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](10) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatHang]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMatHang] [nvarchar](50) NOT NULL,
	[IDDVT] [int] NULL,
	[IdCha] [int] NULL,
	[isDichVu] [tinyint] NULL,
	[Tile] [int] NULL,
	[DonGiaBan] [int] NOT NULL,
	[NguoiTao] [varchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiCapNhat] [varchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_MatHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[Email] [varchar](150) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[HoVaTen] [nvarchar](30) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[DiaChi] [varchar](150) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 08/21/2021 9:49:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NOT NULL,
	[TrangThai] [tinyint] NULL,
	[IDLoaiPhong] [int] NULL,
	[SucChua] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [varchar](30) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [varchar](30) NULL,
 CONSTRAINT [PK_tay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CauHinhs] ([tukhoa], [giatri]) VALUES (N'diachi', N'72 Nguyễn Đình Chiểu TP Nha Trang')
INSERT [dbo].[CauHinhs] ([tukhoa], [giatri]) VALUES (N'ganhet', N'10')
INSERT [dbo].[CauHinhs] ([tukhoa], [giatri]) VALUES (N'phone', N'0987654321')
INSERT [dbo].[CauHinhs] ([tukhoa], [giatri]) VALUES (N'tencuahang', N'Karaoke Khánh Dương')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (44, 23, 1, 1)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (49, 28, 1, 12)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (51, 23, 1, 111)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (55, 40, 101, 10000)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (56, 26, 100, 1300000)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (56, 37, 1, 70000)
INSERT [dbo].[ChiTietHoaDonBan] ([IDHoaDon], [IDMatHang], [SL], [DonGia]) VALUES (57, 23, 1, 111)
GO
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (1, 23, 1111, 11)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (7, 26, 1111, 11)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (25, 28, 111, 12)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (27, 26, 10, 12000)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (28, 38, 12, 10000)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (30, 40, 100, 5000)
INSERT [dbo].[ChiTietHoaDonNhap] ([IDHoaDon], [IDMatHang], [SoLuong], [DonGiaNhap]) VALUES (31, 40, 100, 5000)
GO
SET IDENTITY_INSERT [dbo].[DonViTinh] ON 

INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (7, N'túi', CAST(N'2021-06-26T16:52:29.113' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (9, N'chai', CAST(N'2021-06-26T16:53:37.160' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (16, N'lọ', CAST(N'2021-06-30T10:50:41.287' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (17, N'lon', CAST(N'2021-07-14T14:28:29.243' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (18, N'cốc', CAST(N'2021-07-16T20:22:46.037' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (22, N'Thùng', CAST(N'2021-07-17T20:31:19.797' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (25, N'nv', CAST(N'2021-07-26T17:19:46.297' AS DateTime), N'admin', CAST(N'2021-07-30T20:12:45.407' AS DateTime), N'admin')
INSERT [dbo].[DonViTinh] ([ID], [TenDVT], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (26, N'gói', CAST(N'2021-08-11T20:41:11.187' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DonViTinh] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonBanHang] ON 

INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (44, 9, CAST(N'2020-12-11T12:11:00.000' AS DateTime), CAST(N'2021-07-21T12:30:00.000' AS DateTime), 70000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (45, 8, CAST(N'2020-12-11T12:11:00.000' AS DateTime), NULL, 700000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (46, 9, CAST(N'2021-07-21T12:30:00.000' AS DateTime), NULL, NULL, N'admin', CAST(N'2021-07-21T12:30:32.210' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (47, 7, CAST(N'2021-07-21T12:30:00.000' AS DateTime), NULL, NULL, N'admin', CAST(N'2021-07-21T12:30:53.560' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (48, 9, CAST(N'2021-07-21T12:31:00.000' AS DateTime), NULL, NULL, N'admin', CAST(N'2021-07-21T12:31:14.353' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (49, 7, CAST(N'2021-07-26T08:41:00.000' AS DateTime), CAST(N'2021-07-26T17:57:00.000' AS DateTime), NULL, N'admin', CAST(N'2021-07-26T08:41:21.800' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (50, 7, CAST(N'2021-07-31T20:55:00.000' AS DateTime), CAST(N'2021-07-31T20:56:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-07-31T20:55:38.620' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (51, 7, CAST(N'2021-07-31T21:00:00.000' AS DateTime), CAST(N'2021-07-31T21:00:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-07-31T21:00:06.603' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (52, 7, CAST(N'2021-07-31T21:06:00.000' AS DateTime), CAST(N'2021-07-31T21:16:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-07-31T21:06:02.387' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (53, 8, CAST(N'2021-08-04T20:20:00.000' AS DateTime), CAST(N'2021-08-11T10:24:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-04T20:20:37.877' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (54, 7, CAST(N'2021-08-11T10:24:00.000' AS DateTime), NULL, 50000, N'admin', CAST(N'2021-08-11T10:24:48.777' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (55, 8, CAST(N'2021-08-11T20:44:00.000' AS DateTime), CAST(N'2021-08-11T21:46:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T20:44:46.133' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (56, 7, CAST(N'2021-08-11T21:48:00.000' AS DateTime), CAST(N'2021-08-11T21:49:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T21:48:12.930' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (57, 7, CAST(N'2021-08-11T21:50:00.000' AS DateTime), CAST(N'2021-08-11T21:52:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T21:50:44.467' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (58, 7, CAST(N'2021-08-11T21:53:00.000' AS DateTime), CAST(N'2021-08-11T21:54:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T21:53:55.963' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (59, 7, CAST(N'2021-08-11T21:55:00.000' AS DateTime), CAST(N'2021-08-12T13:44:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T21:55:31.890' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (60, 8, CAST(N'2021-08-11T21:55:00.000' AS DateTime), CAST(N'2021-08-11T22:04:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-11T21:55:36.073' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (61, 8, CAST(N'2021-08-12T13:44:00.000' AS DateTime), CAST(N'2021-08-12T15:37:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-12T13:44:41.687' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (62, 7, CAST(N'2021-08-12T14:36:00.000' AS DateTime), CAST(N'2021-08-12T14:37:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-12T14:36:52.600' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (63, 7, CAST(N'2021-08-13T21:52:00.000' AS DateTime), CAST(N'2021-08-13T21:52:00.000' AS DateTime), 50000, N'admin', CAST(N'2021-08-13T21:52:21.950' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonBanHang] ([IDHoaDon], [IDPhong], [ThoiGianBDau], [ThoiGianKThuc], [DonGiaPhong], [NguoiBan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (64, 7, CAST(N'2021-08-13T21:59:00.000' AS DateTime), NULL, 50000, N'admin', CAST(N'2021-08-13T21:59:44.723' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDonBanHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhaps] ON 

INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (1, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-16T21:42:10.140' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (7, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 6000246, CAST(N'2021-07-16T22:18:22.107' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (8, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 121, CAST(N'2021-07-16T22:27:48.917' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (10, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-16T22:49:59.233' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (11, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-16T23:07:30.943' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (24, N'Ql_karaoke.DB.NhanVien', 3, 1, CAST(N'2021-07-17T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-17T22:47:24.043' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (25, N'tayto', 3, 1, CAST(N'2021-07-21T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-21T12:51:21.880' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (26, N'nvkho', 3, NULL, CAST(N'2021-08-07T00:00:00.000' AS DateTime), NULL, CAST(N'2021-08-07T20:17:59.093' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (27, N'admin', 4, 1, CAST(N'2021-08-11T00:00:00.000' AS DateTime), 1000, CAST(N'2021-08-11T10:17:23.647' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (28, N'admin', 4, 1, CAST(N'2021-08-11T00:00:00.000' AS DateTime), 120000, CAST(N'2021-08-11T10:20:32.213' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (29, N'nvketoan', 5, NULL, CAST(N'2021-08-11T00:00:00.000' AS DateTime), NULL, CAST(N'2021-08-11T20:40:13.620' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (30, N'admin', 5, 1, CAST(N'2021-08-11T00:00:00.000' AS DateTime), 45000, CAST(N'2021-08-11T20:42:37.913' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[HoaDonNhaps] ([ID], [NhanVienNhap], [IDNhaCC], [DaNhap], [NgayNhap], [TienThanhToan], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (31, N'nvkho', 5, 1, CAST(N'2021-08-11T00:00:00.000' AS DateTime), 1000, CAST(N'2021-08-11T21:32:53.923' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDonNhaps] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([ID], [TenLoaiPhong], [DonGia], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (3, N'Phòng VIP', 50000, CAST(N'2021-07-06T10:50:56.087' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[LoaiPhong] ([ID], [TenLoaiPhong], [DonGia], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (4, N'Phòng Thường', 25000, CAST(N'2021-07-06T10:51:24.373' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[LoaiPhong] ([ID], [TenLoaiPhong], [DonGia], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (6, N'Phòng Thượng đế', 300000, CAST(N'2021-07-21T13:02:18.680' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[MatHang] ON 

INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (23, N'cacao', 18, NULL, 0, 10, 111, N'admin', CAST(N'2021-07-19T10:48:32.597' AS DateTime), N'admin', CAST(N'2021-07-20T13:02:30.143' AS DateTime))
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (26, N'Tôm Hùng', 7, NULL, 0, 10, 1300000, N'admin', CAST(N'2021-07-20T13:00:49.433' AS DateTime), N'admin', CAST(N'2021-07-20T13:02:20.617' AS DateTime))
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (28, N'trà sữa', 18, NULL, 0, 0, 12, N'admin', CAST(N'2021-07-20T13:05:38.820' AS DateTime), NULL, NULL)
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (37, N'nv hát cùng', 25, -1, 1, 0, 70000, N'admin', CAST(N'2021-07-26T17:40:28.653' AS DateTime), N'admin', CAST(N'2021-07-30T20:13:04.613' AS DateTime))
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (38, N'bia tiger', 22, -1, 0, 0, 350000, N'admin', CAST(N'2021-08-11T09:13:50.013' AS DateTime), N'admin', CAST(N'2021-08-11T20:35:55.973' AS DateTime))
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (39, N'bia tiger', 17, -1, 0, 0, 35000, N'admin', CAST(N'2021-08-11T20:36:18.843' AS DateTime), NULL, NULL)
INSERT [dbo].[MatHang] ([ID], [TenMatHang], [IDDVT], [IdCha], [isDichVu], [Tile], [DonGiaBan], [NguoiTao], [NgayTao], [NguoiCapNhat], [NgayCapNhat]) VALUES (40, N'Bim Bim', 26, -1, 0, 0, 10000, N'admin', CAST(N'2021-08-11T20:41:44.323' AS DateTime), N'admin', CAST(N'2021-08-11T20:41:52.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[MatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([ID], [TenNCC], [DienThoai], [DiaChi], [Email], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (3, N'Công TY Nước GIải Khát', N'019399472', N'125-Quang Trung', N'QuangTrung@gmail.com', CAST(N'2021-07-11T15:55:09.580' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[NhaCungCap] ([ID], [TenNCC], [DienThoai], [DiaChi], [Email], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (4, N'công ty bia tiger', N'01231245', N'55 hùng vương', N'hungvuong@gmail.com', CAST(N'2021-07-14T14:35:08.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[NhaCungCap] ([ID], [TenNCC], [DienThoai], [DiaChi], [Email], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (5, N'công ty bảo phát', N'09876543', N'125-Quang Trung', N'QuangTrung@gmail.com', CAST(N'2021-08-11T20:39:08.827' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[NhanVien] ([Username], [Password], [HoVaTen], [DienThoai], [DiaChi]) VALUES (N'admin', N'123', N'tay', N'123445', N'124 pham chu dinh')
INSERT [dbo].[NhanVien] ([Username], [Password], [HoVaTen], [DienThoai], [DiaChi]) VALUES (N'nvketoan', N'123', N'quỳnh', N'32141', N'45 pham thu hien')
INSERT [dbo].[NhanVien] ([Username], [Password], [HoVaTen], [DienThoai], [DiaChi]) VALUES (N'nvkho', N'123', N'tèo', N'12341231', N'123 Phan Chu Tring')
INSERT [dbo].[NhanVien] ([Username], [Password], [HoVaTen], [DienThoai], [DiaChi]) VALUES (N'nvthungan', N'123', N'tý', N'098765', N'123 pham dinh hai')
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (7, N'Phòng V.I.P 01', 1, 3, 10, CAST(N'2021-07-19T18:45:52.993' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (8, N'Phòng V.I.P 02', 0, 3, 10, CAST(N'2021-07-19T18:46:18.833' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (9, N'Phòng 01', 0, 4, 12, CAST(N'2021-07-19T18:47:05.460' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (10, N'phòng 02', NULL, 4, 12, CAST(N'2021-07-19T18:47:19.193' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (11, N'Phòng VIP 03', NULL, 3, 12, CAST(N'2021-07-19T20:28:45.027' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Phong] ([ID], [TenPhong], [TrangThai], [IDLoaiPhong], [SucChua], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat]) VALUES (16, N'K.I.N.G 01', NULL, 6, 10, CAST(N'2021-08-11T21:51:21.040' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
ALTER TABLE [dbo].[DonViTinh] ADD  CONSTRAINT [DF_DonViTinh_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DonViTinh] ADD  CONSTRAINT [DF_DonViTinh_NguoiTao]  DEFAULT ('admin') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[DonViTinh] ADD  CONSTRAINT [DF_DonViTinh_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[DonViTinh] ADD  CONSTRAINT [DF_DonViTinh_NguoiCApNhat]  DEFAULT ('admin') FOR [NguoiCapNhat]
GO
ALTER TABLE [dbo].[HoaDonNhaps] ADD  CONSTRAINT [DF_HoaDonnhap_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HoaDonNhaps] ADD  CONSTRAINT [DF_HoaDonnhap_NguoiTao]  DEFAULT ('admin') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[HoaDonNhaps] ADD  CONSTRAINT [DF_HoaDonnhap_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[HoaDonNhaps] ADD  CONSTRAINT [DF_HoaDonnhap_NguoiCapNhat]  DEFAULT ('admin') FOR [NguoiCapNhat]
GO
ALTER TABLE [dbo].[MatHang] ADD  CONSTRAINT [DF_MatHang_isDichVu]  DEFAULT ((0)) FOR [isDichVu]
GO
ALTER TABLE [dbo].[MatHang] ADD  CONSTRAINT [DF_MatHang_NguoiTao]  DEFAULT ('admin') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[MatHang] ADD  CONSTRAINT [DF_MatHang_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[MatHang] ADD  CONSTRAINT [DF_MatHang_NguoiCapNhat]  DEFAULT ('admin') FOR [NguoiCapNhat]
GO
ALTER TABLE [dbo].[MatHang] ADD  CONSTRAINT [DF_MatHang_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_NhaCungCap_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_NhaCungCap_NguoiTao]  DEFAULT ('admin') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_NhaCungCap_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_NhaCungCap_NguoiCapNhat]  DEFAULT ('admin') FOR [NguoiCapNhat]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_tay_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_tay_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_tay_NguoiTao]  DEFAULT ('admin') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_tay_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_tay_NguoiCapNhat]  DEFAULT ('admin') FOR [NguoiCapNhat]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonBan_HoaDonBanHang] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[HoaDonBanHang] ([IDHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [FK_ChiTietHoaDonBan_HoaDonBanHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonBan_MatHang] FOREIGN KEY([IDMatHang])
REFERENCES [dbo].[MatHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [FK_ChiTietHoaDonBan_MatHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonnhap] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[HoaDonNhaps] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonnhap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_MatHang] FOREIGN KEY([IDMatHang])
REFERENCES [dbo].[MatHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_MatHang]
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHang_phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([ID])
GO
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_HoaDonBanHang_phong]
GO
ALTER TABLE [dbo].[HoaDonNhaps]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonnhap_NhaCungCap] FOREIGN KEY([IDNhaCC])
REFERENCES [dbo].[NhaCungCap] ([ID])
GO
ALTER TABLE [dbo].[HoaDonNhaps] CHECK CONSTRAINT [FK_HoaDonnhap_NhaCungCap]
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD  CONSTRAINT [FK_MatHang_DonViTinh] FOREIGN KEY([IDDVT])
REFERENCES [dbo].[DonViTinh] ([ID])
GO
ALTER TABLE [dbo].[MatHang] CHECK CONSTRAINT [FK_MatHang_DonViTinh]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_phong_LoaiPhong] FOREIGN KEY([IDLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([ID])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_phong_LoaiPhong]
GO
USE [master]
GO
ALTER DATABASE [Karaoke] SET  READ_WRITE 
GO
