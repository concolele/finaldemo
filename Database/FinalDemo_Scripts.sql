USE [FinalDemo]
GO
/****** Object:  StoredProcedure [dbo].[addPhanBo]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[addPhanBo]  @ViDo nvarchar(40), @KinhDo nvarchar(40), @MaLoai int,
						@TiLePhanBo int, @MatDo int, @SoLuongCaThe int
as
begin
	declare @MaVung int;

	if not exists (select ViDo, KinhDo from MoiTruongSong where ViDo=@ViDo and KinhDo=@KinhDo)
		begin
			insert into MoiTruongSong(ViDo, KinhDo) values(@ViDo, @KinhDo);
	
			select @MaVung = (select top 1 MaVung from MoiTruongSong order by MaVung desc);
			
			insert into PhanBo(MaLoai, VungPhanBo, TiLePhanBo, MatDo, SoLuongCaThe) values(@MaLoai, @MaVung, @TiLePhanBo, @MatDo, @SoLuongCaThe);
		end
	else
		begin
			select @MaVung = (select top 1 PhanBo.VungPhanBo from PhanBo inner join MoiTruongSong on PhanBo.VungPhanBo = MoiTruongSong.MaVung where ViDo=@ViDo and KinhDo=@KinhDo);
			
			insert into PhanBo(MaLoai, VungPhanBo, TiLePhanBo, MatDo, SoLuongCaThe) values(@MaLoai, @MaVung, @TiLePhanBo, @MatDo, @SoLuongCaThe);
		end
end
GO
/****** Object:  Table [dbo].[Bo]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bo](
	[MaBo] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Lop] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [int] NULL,
	[TenNguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bo_MaBo] PRIMARY KEY CLUSTERED 
(
	[MaBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chi]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chi](
	[MaChi] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Ho] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [int] NULL,
	[TenNguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Chi_MaChi] PRIMARY KEY CLUSTERED 
(
	[MaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[IdChucNang] [int] IDENTITY(1,1) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
	[DieuKhien] [nvarchar](50) NULL,
	[PhuongThuc] [nvarchar](50) NULL,
	[Xoa] [bit] NULL,
	[NgayXoa] [datetime] NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[IdChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gioi]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gioi](
	[MaGioi] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [nchar](10) NULL,
	[TenNguoiTao] [nchar](10) NULL,
 CONSTRAINT [PK_Gioi] PRIMARY KEY CLUSTERED 
(
	[MaGioi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[IdGroup] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](50) NULL,
	[Khoa] [bit] NULL,
	[Xoa] [bit] NULL,
	[NgayXoa] [datetime] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[IdGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ho]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ho](
	[MaHo] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Bo] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [int] NULL,
	[TenNguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ho_MaHo] PRIMARY KEY CLUSTERED 
(
	[MaHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Chi] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](max) NULL,
	[TenThuongGoi] [nvarchar](max) NULL,
	[TenKhac] [nvarchar](max) NULL,
	[SoLuongCaThe] [int] NULL,
	[DacDiemSinhSan] [nvarchar](max) NULL,
	[DacDiemGioiTinh] [nvarchar](max) NULL,
	[DacDiemKhac] [nvarchar](max) NULL,
	[MucDoBaoDong] [nvarchar](max) NULL,
	[NguoiPhatHien] [nvarchar](max) NULL,
	[NamPhatHien] [int] NULL,
	[TapTinhSinhHoc] [nvarchar](max) NULL,
	[KichCoTrungBinh] [float] NULL,
	[ThucAn] [nvarchar](max) NULL,
	[XuatXu] [int] NULL,
	[Image] [nchar](10) NULL,
	[TenNguoiTao] [nvarchar](max) NULL,
 CONSTRAINT [PK_Loai_MaLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Nganh] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [nchar](10) NULL,
	[TenNguoiTao] [int] NULL,
 CONSTRAINT [PK_Lop_MaLop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MoiTruongSong]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoiTruongSong](
	[MaVung] [int] IDENTITY(1,1) NOT NULL,
	[TenViTri] [nvarchar](40) NULL,
	[ViDo] [nvarchar](40) NULL,
	[KinhDo] [nvarchar](40) NULL,
 CONSTRAINT [PK_MoiTruongSong_MaVung] PRIMARY KEY CLUSTERED 
(
	[MaVung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nganh](
	[MaNganh] [int] IDENTITY(1,1) NOT NULL,
	[KiHieu] [char](5) NULL,
	[Gioi] [int] NULL,
	[DanhPhapKhoaHoc] [nvarchar](40) NULL,
	[TenTiengViet] [nvarchar](40) NULL,
	[NguoiPhatHien] [nvarchar](40) NULL,
	[NamPhatHien] [nchar](10) NULL,
	[TenNguoiTao] [int] NULL,
 CONSTRAINT [PK_Nganh_MaNganh] PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanBo]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanBo](
	[MaLoai] [int] NOT NULL,
	[VungPhanBo] [int] NOT NULL,
	[TiLePhanBo] [int] NULL,
	[MatDo] [int] NULL,
	[SoLuongCaThe] [int] NULL,
 CONSTRAINT [PK_PhanBo_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC,
	[VungPhanBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjId] [int] NULL,
	[ObjType] [nvarchar](50) NULL,
	[Xoa] [bit] NULL,
	[NgayXoa] [datetime] NULL,
	[IdChucNang] [int] NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoLot] [nvarchar](max) NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[Khoa] [bit] NULL,
	[MaKichHoat] [nvarchar](50) NULL,
	[NgayKichHoat] [date] NULL,
	[NgayTao] [datetime] NULL,
	[NgaySua] [datetime] NULL,
	[Xoa] [bit] NULL,
	[NgayXoa] [datetime] NULL,
 CONSTRAINT [PK_TaiKhoan_MaTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/13/2015 10:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_UserGroup_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bo] ON 

GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', 1, N'Coraciiformes', N'Bộ Sả', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (3, N'0    ', 1, N'Falconiformes', N'Bộ Cắt', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (4, N'0    ', 1, N'Galliformes', N'Bộ Gà', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (5, N'0    ', 1, N'Psittaciformes', N'Bộ Vẹt', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (6, N'0    ', 1, N'Passeriformes', N'Bộ Sẻ', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (7, N'0    ', 1, N'Strigiformes', N'Bộ Cú', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (8, N'0    ', 2, N'Artiodactyla', N'Bộ Guốc chẵn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (9, N'0    ', 2, N'Carnivora', N'Bộ thú ăn thịt', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (10, N'0    ', 2, N'Dermoptera', N'Bộ Cánh da', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (11, N'0    ', 2, N'Primate', N'Bộ Linh trưởng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (12, N'0    ', 2, N'Rodentia', N'Bộ Gặm nhấm', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (13, N'0    ', 2, N'Pholidota', N'Bộ Tê tê', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (14, N'0    ', 3, N'Coleoptera', N'Bộ Cánh cứng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (15, N'0    ', 3, N'Lepidoptera  ', N'Bộ Cánh vẩy', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (16, N'0    ', 3, N'Phasmatoidea', N'Bộ Bọ que', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (17, N'0    ', 3, N'Squamata', N'Bộ có vảy', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (18, N'0    ', 3, N'Testudines', N'Bộ Rùa', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (19, N'0    ', 4, N'Pinales', N'Bộ Thông', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (20, N'0    ', 5, N'Aquifoliales', N'Bộ Nhựa ruồi', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (21, N'0    ', 5, N'Apiales', N'Bộ Hoa tán', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (22, N'0    ', 5, N'Austrobaileyales', N'chưa có', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (23, N'0    ', 5, N'Crossosomatales', N'Bộ Toại thể mộc', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (24, N'0    ', 5, N'Dilleniales', N'Bộ Sổ', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (25, N'0    ', 5, N'Dipsacales', N'Bộ Tục đoạn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (26, N'0    ', 5, N'Ericales', N'Bộ Đỗ quyên', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (27, N'0    ', 5, N'Fabales', N'Bộ Đậu', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (28, N'0    ', 5, N'Fagales', N'Bộ Dẻ', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (29, N'0    ', 5, N'Garryales', N'Bộ Giảo mộc', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (30, N'0    ', 5, N'Gentianales ', N'Bộ Long đởm', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (32, N'0    ', 5, N'Lamiales', N'Bộ Hoa môi', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (33, N'0    ', 5, N'Laurales', N'Bộ Long não', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (34, N'0    ', 5, N'Magnoliales', N'Bộ Mộc lan', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (35, N'0    ', 5, N'Malpighiales', N'Bộ Sơ ri', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (36, N'0    ', 5, N'Malvales', N'Bộ Cẩm quỳ', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (37, N'0    ', 5, N'Myrtales', N'Bộ Sim', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (38, N'0    ', 5, N'Oxalidales', N'Bộ Chua me đất', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (39, N'0    ', 5, N'Rosales', N'Bộ Hoa hồng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (40, N'0    ', 5, N'Proteales', N'Bộ Quắn hoa', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (41, N'0    ', 5, N'Sabiales', N'Bộ Thanh phong', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (42, N'0    ', 5, N'Santalales', N'Bộ Đàn hương', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (43, N'0    ', 5, N'Sapindales', N'Bộ Bồ hòn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (44, N'0    ', 5, N'Saxifragales', N'Bộ Tai hùm', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (45, N'0    ', 6, N'Cycadales', N'chưa có', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (46, N'0    ', 7, N'Assparagales', N'Bộ Măng tây', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (47, N'0    ', 5, N'Ericales ', N'Bộ thạch nam, Bộ đỗ quyên', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (48, N'0    ', 5, N'Laurales ', N'Bộ nguyệt quế', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (49, N'0    ', 5, N'Ranunculales', N'Bộ mao lương', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (50, N'0    ', 5, N'Myrtales ', N'Bộ Sim, Bộ Đào kim nương', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (51, N'0    ', 5, N'Rosales ', N'Bộ Hoa hồng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (52, N'0    ', 8, N'Gnetales', N'Bộ Dây gắm', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (53, N'0    ', 9, N'Polypodiales', N'Bộ Dương xỉ', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (54, N'0    ', 9, N'Salviniales', N'Bộ Bèo ong', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (55, N'0    ', 5, N'Alismatales', N'Bộ Trạch tả', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (56, N'0    ', 4, N'Asparagales', N'Bộ Thiên môn đông, Bộ Măng tây', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (57, N'0    ', 4, N'Liliales', N'Bộ Loa kèn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (58, N'0    ', 5, N'Pandanales', N'Bộ Dứa dại', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (59, N'0    ', 10, N'Anura', N'Bộ không đuôi', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (60, N'0    ', 11, N'Clupeiformes', N'Bộ Cá Trích', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (61, N'0    ', 11, N'Anguilliformes', N'Bộ Cá Chình', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (62, N'0    ', 11, N'Siluriformes', N'Bộ Cá da trơn, Bộ Cá nheo', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (63, N'0    ', 11, N'Mugiliformes', N'Bộ Cá đối', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (64, N'0    ', 11, N'Perciformes', N'Bộ Cá vược', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (65, N'0    ', 11, N'Pleuronectiformes', N'Bộ Cá thân bẹt', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (66, N'0    ', 11, N'Tetraodontiformes', N'Bộ Cá nóc', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (67, N'0    ', 11, N'Cypriniformes', N'Bộ Cá chép', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (68, N'0    ', 11, N'Elopiformes', N'Bộ Cá cháo biển', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (69, N'0    ', 11, N'Synbranchiformes', N'Bộ Lươn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (70, N'0    ', 12, N'Myliobatiformes', N'Bộ Cá đuối ó', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (71, N'0    ', 13, N'Atheriniformes', N'Bộ Cá suốt', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (72, N'0    ', 13, N'Aulopiformes', N'Bộ Cá răng kiếm', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (73, N'0    ', 13, N'Beloniformes', N'Bộ Cá nhái', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (74, N'0    ', 13, N'Beryciformes', N'Bộ Cá tráp mắt vàng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (75, N'0    ', 13, N'Gonorynchiformes', N'Bộ Cá Măng', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (76, N'0    ', 13, N'Scorpaeniformes', N'Bộ Cá mù làn', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (77, N'0    ', 13, N'Syngnathiformes', N'Bộ Cá chìa vôi', N'chưa có', 0, NULL)
GO
INSERT [dbo].[Bo] ([MaBo], [KiHieu], [Lop], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (97, N'0    ', 2, N'HelloWorld', N'Vinh', N'Vinh', 1993, N'minh')
GO
SET IDENTITY_INSERT [dbo].[Bo] OFF
GO
SET IDENTITY_INSERT [dbo].[Chi] ON 

GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', 2, N'Buceros ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (3, N'0    ', 2, N'Anorrhinus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (4, N'0    ', 3, N'Spilornis', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (5, N'0    ', 4, N'Polihierax', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (6, N'0    ', 5, N'Polyplectron ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (7, N'0    ', 5, N'Rheinardia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (8, N'0    ', 5, N'Pavo ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (9, N'0    ', 5, N'Lophura', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (10, N'0    ', 6, N'Psittacula ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (11, N'0    ', 7, N'Copsychus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (12, N'0    ', 8, N'Garrulax ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (13, N'0    ', 9, N'Gracula ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (14, N'0    ', 10, N'Tyto ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (15, N'0    ', 11, N'Axis ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (16, N'0    ', 11, N'Muntiacus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (17, N'0    ', 12, N'Naemorhedus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (18, N'0    ', 13, N'Tragulus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (19, N'0    ', 14, N'Ursus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (20, N'0    ', 15, N'Lutra', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (21, N'0    ', 15, N'Lutrogale ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (22, N'0    ', 15, N'Aonyx', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (23, N'0    ', 16, N'Arctictis', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (24, N'0    ', 16, N'Viverra ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (25, N'0    ', 16, N'Viverricula ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (26, N'0    ', 17, N'Pardofelis', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (27, N'0    ', 17, N'Prionailurus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (28, N'0    ', 17, N'Panthera', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (29, N'0    ', 18, N'Cynocephalus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (30, N'0    ', 19, N'Nycticebus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (31, N'0    ', 20, N'Nomascus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (32, N'0    ', 21, N'Pygathrix', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (33, N'0    ', 21, N'Macaca ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (34, N'0    ', 22, N' Hylopetes', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (35, N'0    ', 22, N'Petaurista', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (36, N'0    ', 23, N'Manis ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (37, N'0    ', 24, N'Dorcus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (38, N'0    ', 24, N'Eurytrachelteulus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (39, N'0    ', 25, N'Teinopalpus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (40, N'0    ', 25, N'Troides', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (41, N'0    ', 26, N'Zeuxidia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (42, N'0    ', 27, N'Phyllium', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (43, N'0    ', 28, N'Ophiophagus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (44, N'0    ', 28, N'Bungarus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (45, N'0    ', 28, N'Bungarus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (46, N'0    ', 28, N'Naja ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (47, N'0    ', 29, N'Varanus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (48, N'0    ', 30, N'Python', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (49, N'0    ', 31, N'Elaphe ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (50, N'0    ', 31, N'Ptyas', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (51, N'0    ', 32, N'Cuora', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (52, N'0    ', 32, N'Heosemys', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (53, N'0    ', 32, N'Mauremys ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (54, N'0    ', 33, N'Indotestudo', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (55, N'0    ', 33, N'Manouria ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (56, N'0    ', 5, N'Gallus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (57, N'0    ', 11, N'Cervus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (58, N'0    ', 34, N'Sus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (59, N'0    ', 16, N'Paguma', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (60, N'0    ', 16, N'Paradoxurus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (61, N'0    ', 15, N'Martes', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (62, N'0    ', 15, N'Melogale', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (63, N'0    ', 35, N'Cannomys ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (64, N'0    ', 35, N'Rhizomys ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (65, N'0    ', 36, N'Atherurus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (66, N'0    ', 36, N'Hystrix ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (67, N'0    ', 37, N'Leiolepis', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (68, N'0    ', 37, N'Physignathus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (69, N'0    ', 38, N'Gekko', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (70, N'0    ', 39, N'Physignatus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (71, N'0    ', 40, N'Cyclemys', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (72, N'0    ', 41, N'Cupressus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (73, N'0    ', 42, N'Pinus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (74, N'0    ', 43, N'Dacrycarpus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (75, N'0    ', 43, N'Nageia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (76, N'0    ', 44, N'Ilex', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (77, N'0    ', 45, N'Gomphandra ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (78, N'0    ', 45, N'Gonocaryum ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (79, N'0    ', 45, N'Stemonurus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (80, N'0    ', 46, N'Dendropanax', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (81, N'0    ', 46, N'Schefflera', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (82, N'0    ', 47, N'Pittosporum', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (83, N'0    ', 48, N'Illicium ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (84, N'0    ', 49, N'Turpinia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (85, N'0    ', 50, N'Dillenia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (86, N'0    ', 51, N'Viburnum', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (87, N'0    ', 52, N'Saurauia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (88, N'0    ', 53, N'Enkianthus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (89, N'0    ', 53, N'Rhododendron ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (90, N'0    ', 53, N'Vaccinium', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (91, N'0    ', 54, N'Diospyros', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (92, N'0    ', 55, N'Ardisia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (93, N'0    ', 56, N'Eberhardtia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (94, N'0    ', 56, N'Madhuca ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (95, N'0    ', 56, N'Palaquium ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (96, N'0    ', 56, N'Planchonella ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (97, N'0    ', 56, N'Sarcosperma ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (98, N'0    ', 57, N'Rehderodendron ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (99, N'0    ', 57, N'Styrax ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (100, N'0    ', 58, N'Symplocos ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (101, N'0    ', 58, N'Symplocos', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (102, N'0    ', 59, N'Adinandra ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (103, N'0    ', 59, N'Camellia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (104, N'0    ', 59, N'Eurya ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (105, N'0    ', 59, N'Gordonia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (106, N'0    ', 59, N'Schima ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (107, N'0    ', 59, N'Ternstroemia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (108, N'0    ', 60, N'Cassia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (109, N'0    ', 60, N'Dialium ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (110, N'0    ', 60, N'Peltophorum ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (111, N'0    ', 60, N'Sindora ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (112, N'0    ', 60, N'Cynometra ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (113, N'0    ', 60, N'Dalbergia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (114, N'0    ', 60, N'Millettia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (115, N'0    ', 60, N'Ormosia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (116, N'0    ', 60, N'Saraca ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (117, N'0    ', 60, N'Albizia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (118, N'0    ', 60, N'Archidendron ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (119, N'0    ', 60, N'Castanopsis', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (120, N'0    ', 60, N'Castanopsis ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (121, N'0    ', 60, N'Lithocarpus', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (122, N'0    ', 60, N'Lithocarpus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (123, N'0    ', 60, N'Quercus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (124, N'0    ', 61, N'Engelhardtia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (125, N'0    ', 62, N'Aucuba ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (126, N'0    ', 63, N'Wrightia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (127, N'0    ', 64, N'Fagraea ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (128, N'0    ', 65, N'Adina ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (129, N'0    ', 65, N'Adia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (130, N'0    ', 65, N'Lasianthus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (131, N'0    ', 65, N'Morinda ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (132, N'0    ', 65, N'Nauclea ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (133, N'0    ', 65, N'Psychotria ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (134, N'0    ', 65, N'Urophyllum ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (135, N'0    ', 65, N'Wendlandia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (136, N'0    ', 66, N'Stereospermum ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (227, N'0    ', 41, N'Cunninghamia', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (233, N'0    ', 54, N'Dispyros ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (234, N'0    ', 60, N'Pterocarpus ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (235, N'0    ', 60, N'Sindora', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (239, N'0    ', 56, N'Madhuca', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (240, N'0    ', 60, N'Dialium', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (241, N'0    ', 60, N'Peltophorum', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (242, N'0    ', 60, N'Dalbergia ', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (251, N'0    ', 43, N'Dacrydium', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (257, N'0    ', 51, N'Lonicera', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (259, N'0    ', 63, N'Streptocaulon', N'chưa có', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (438, N'1    ', 2, N'111', N'111', N'1', 1, N'minh')
GO
INSERT [dbo].[Chi] ([MaChi], [KiHieu], [Ho], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (439, N'0    ', 4, N'2', N'2', N'2', 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Chi] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucNang] ON 

GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (1, N'Index Quản trị', N'QuanTri', N'Index', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (2, N'Thêm phân bố', N'Home', N'AddPhanBo', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (3, N'Xem phân bố', N'Home', N'Index', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (6, N'Thêm Loài', N'Loai', N'CreateNewLoai', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (24, N'Sửa Loài', N'Loai', N'Edit', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (25, N'Xóa', N'Loai', N'Delete', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (26, N'Thêm Bộ', N'Bo', N'CreateNewBo', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (27, N'Sửa Bộ', N'Bo', N'EditEmpty', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (28, N'Xóa', N'Bo', N'Delete', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (29, N'Thêm Họ', N'Ho', N'CreateNewHo', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (30, N'Sửa Họ', N'Ho', N'EditEmpty', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (31, N'Xóa', N'Ho', N'Delete', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (32, N'Thêm Chi', N'Chi', N'CreateNewChi', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (33, N'Sửa Chi', N'Chi', N'EditEmpty', NULL, NULL)
GO
INSERT [dbo].[ChucNang] ([IdChucNang], [TenChucNang], [DieuKhien], [PhuongThuc], [Xoa], [NgayXoa]) VALUES (34, N'Xóa', N'Chi', N'Delete', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ChucNang] OFF
GO
SET IDENTITY_INSERT [dbo].[Gioi] ON 

GO
INSERT [dbo].[Gioi] ([MaGioi], [KiHieu], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (1, N'0    ', N' Animalia', N'Giới Động vật', N'Linnaeus', N'0         ', N'admin     ')
GO
INSERT [dbo].[Gioi] ([MaGioi], [KiHieu], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', N'Plantae ', N'Giới Thực vật', N'Linnaeus', N'0         ', N'admin     ')
GO
SET IDENTITY_INSERT [dbo].[Gioi] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

GO
INSERT [dbo].[Group] ([IdGroup], [TenNhom], [Khoa], [Xoa], [NgayXoa]) VALUES (1, N'Administrator', NULL, NULL, NULL)
GO
INSERT [dbo].[Group] ([IdGroup], [TenNhom], [Khoa], [Xoa], [NgayXoa]) VALUES (2, N'Người dùng', NULL, NULL, NULL)
GO
INSERT [dbo].[Group] ([IdGroup], [TenNhom], [Khoa], [Xoa], [NgayXoa]) VALUES (3, N'Khách vãng lai', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Ho] ON 

GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', 2, N'Bucerotidae', N'Họ Hồng hoàng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (3, N'0    ', 3, N'Accipitridae', N'Họ Ưng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (4, N'0    ', 3, N'Falconidae', N'Họ Cắt', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (5, N'0    ', 4, N'Phasianidae', N'Họ Trĩ', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (6, N'0    ', 5, N'Psittacidae', N'Họ Vẹt', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (7, N'0    ', 6, N'Muscicapidae', N'Họ Đớp ruồi', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (8, N'0    ', 6, N'Leiothrichidae', N'Họ Kim oanh', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (9, N'0    ', 6, N'Sturnidae', N'Họ Sáo', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (10, N'0    ', 7, N'Tytonidae', N'Họ Cú lợn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (11, N'0    ', 8, N'Cervidae', N'Họ Hươu nai', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (12, N'0    ', 8, N'Bovidae', N'Họ Trâu bò', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (13, N'0    ', 8, N'Tragulidae', N'Họ Cheo cheo', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (14, N'0    ', 9, N'Ursidae', N'Họ Gấu', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (15, N'0    ', 9, N'Mustelidae', N'Họ Chồn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (16, N'0    ', 9, N'Viverridae', N'Họ Cầy', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (17, N'0    ', 9, N'Felidae', N'Họ Mèo', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (18, N'0    ', 10, N'Cynocephalidae', N'Họ Chồn bay', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (19, N'0    ', 11, N'Lorisidae', N'Họ Cu li', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (20, N'0    ', 11, N'Hylobatidae', N'Họ Vượn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (21, N'0    ', 11, N'Cercopithecidae', N'Họ Khỉ đuôi dài', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (22, N'0    ', 12, N'Sciuridae', N'Họ Sóc', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (23, N'0    ', 13, N'Manidae', N'Họ Tê tê', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (24, N'0    ', 14, N'Lucanidae', N'Họ Kẹp kìm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (25, N'0    ', 15, N'Papilionidae', N'Họ Bướm phượng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (26, N'0    ', 15, N'Amathusiidae', N'Họ Bướm rừng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (27, N'0    ', 16, N'Phylliidae', N'Họ Bọ lá', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (28, N'0    ', 17, N'Elapidae', N'Họ Rắn hổ', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (29, N'0    ', 17, N'Varanidae', N'Họ Kỳ đà', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (30, N'0    ', 17, N'Pythonidae', N'Họ Trăn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (31, N'0    ', 17, N'Colubridae', N'Họ Rắn nước', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (32, N'0    ', 18, N'Geoemydidae', N'Họ Rùa đầm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (33, N'0    ', 18, N'Testudinidae', N'Họ Rùa cạn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (34, N'0    ', 8, N'Suidae', N'Họ Lợn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (35, N'0    ', 12, N'Spalacidae', N'Họ Dúi', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (36, N'0    ', 12, N'Hystricidae', N'Họ Nhím', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (37, N'0    ', 17, N'Agamidae', N'Họ Nhông', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (38, N'0    ', 17, N'Gekkonidae', N'Họ Tắc kè', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (39, N'0    ', 17, N'Lacertidae', N'Họ Thằn lằn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (40, N'0    ', 18, N'Emydidae', N'Họ Rùa đầm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (41, N'0    ', 19, N'Cupressaceae', N'Họ Hoàng đàn', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (42, N'0    ', 19, N'Pinaceae', N'Họ Thông', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (43, N'0    ', 19, N'Podocarpaceae', N'Họ Kim giao', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (44, N'0    ', 20, N'Aquifoliaceae', N'Họ Trâm bùi', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (45, N'0    ', 20, N'Stemonuraceae', N'Họ Vĩ hùng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (46, N'0    ', 21, N'Araliaceae', N'Họ Nhân sâm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (47, N'0    ', 21, N'Pittosporaceae', N'Họ Hắc châu', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (48, N'0    ', 22, N'Schisandraceae', N'Họ Ngũ vị tử', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (49, N'0    ', 23, N'Staphyleaceae', N'Họ Ngô vàng', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (50, N'0    ', 24, N'Dilleniaceae', N'Họ Sổ', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (51, N'0    ', 25, N'Caprifoliaceae', N'Họ Kim Ngân', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (52, N'0    ', 26, N'Actinidiaceae', N'Họ Dương đào', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (53, N'0    ', 26, N'Ericaceae', N'Họ Đỗ quyên', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (54, N'0    ', 26, N'Ebenaceae', N'Họ Thị', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (55, N'0    ', 26, N'Myrsinoideae', N'Họ Đơn nem', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (56, N'0    ', 26, N'Sapotaceae', N'Họ Hồng xiêm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (57, N'0    ', 26, N'Styracaceae', N'Họ Bồ đề', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (58, N'0    ', 26, N'Symplocaceae', N'Họ Dung', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (59, N'0    ', 26, N'Theaceae', N'Họ Chè', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (60, N'0    ', 27, N'Fabaceae', N'Họ Đậu', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (61, N'0    ', 28, N'Fagaceae', N'Họ Dẻ', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (62, N'0    ', 28, N'Juglandaceae', N'Họ Hồ đào', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (63, N'0    ', 29, N'Garryaceae', N'Họ Giảo mộc', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (64, N'0    ', 30, N'Apocynaceae', N'Họ Trúc đào', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (65, N'0    ', 30, N'Gentianaceae', N'Họ Long đởm', N'chưa có', 0, N'0')
GO
INSERT [dbo].[Ho] ([MaHo], [KiHieu], [Bo], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (66, N'0    ', 30, N'Rubiaceae', N'Họ Cà phê', N'chưa có', 0, N'0')
GO
SET IDENTITY_INSERT [dbo].[Ho] OFF
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2238, N'0    ', 3, N'Anorrhinus tickelli', N'Niệc nâu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Blyth', 1855, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2239, N'0    ', 4, N'Spilornis cheela', N'Diều hoa Miến Điện', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Latham', 1790, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2240, N'0    ', 5, N'Polihierax insignis', N'Cắt nhỏ họng trắng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Walden', 1872, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2241, N'0    ', 6, N'Polyplectron germaini', N'Gà tiền mặt đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Elliot', 1866, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2242, N'0    ', 7, N'Rheinardia ocellata', N'Trĩ sao', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Elliot', 1871, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2243, N'0    ', 8, N'Pavo muticus', N'Công Java', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1766, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2244, N'0    ', 9, N'Lophura diardi', N'Gà lôi hông tía', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Bonaparte', 1856, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2245, N'0    ', 10, N'Psittacula finschii', N'Vẹc đầu xám', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hume', 1874, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2246, N'0    ', 10, N'Psittacula roseata', N'Vẹt đầu hồng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Biswas', 1951, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2247, N'0    ', 10, N'Psittacula alexandri', N'Vẹt ngực đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2248, N'0    ', 11, N'Copsychus malabaricus', N'Chích chòe lửa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Scopoli', 1788, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2249, N'0    ', 12, N'Garrulax merulinus', N'Khướu ngực đốm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Blyth', 1851, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2250, N'0    ', 12, N'Garrulax milleti', N'Khướu đầu đen', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Robinson & Kloss', 1919, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2251, N'0    ', 12, N'Garrulax vassali', N'Khướu đầu xám', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Ogilvie-Grant', 1906, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2252, N'0    ', 12, N'Garrulax yersini', N'Khướu đầu đen má xám', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Robinson & Kloss', 1919, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2253, N'0    ', 13, N'Gracula religiosa', N'Yểng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2254, N'0    ', 14, N'Tyto alba', N'Cú lợn lưng xám', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Scopoli', 1769, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2255, N'0    ', 14, N'Tyto capensis', N'Cú lợn lưng nâu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'A. Smith', 1834, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2256, N'0    ', 15, N'Axis porcinus', N'Hươu vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Zimmerman', 1780, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2257, N'0    ', 16, N'Muntiacus truongsonensis', N'Mang Trường Sơn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Giao et al', 1998, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2258, N'0    ', 17, N'Naemorhedus sumatraensis', N'Sơn dương', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'chưa có', 0, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2259, N'0    ', 18, N'Tragulus javanicus', N'Cheo cheo', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Osbeck', 1765, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2260, N'0    ', 19, N'Ursus malayanus', N'Gấu chó', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Raffles', 1821, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2261, N'0    ', 19, N'Ursus thibetanus', N'Gấu ngựa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'G. Cuvier', 1823, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2262, N'0    ', 20, N'Lutra lutra', N'Rái cá thường', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2263, N'0    ', 20, N'Lutra sumatrana', N'Rái cá lông mũi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Gray', 1865, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2264, N'0    ', 21, N'Lutrogale perspicillata', N'Rái cá lông mượt', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Geoffroy Saint Hilaire', 1826, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2265, N'0    ', 22, N'Aonyx cinerea', N'Rái cá vuốt bé', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Illiger', 1815, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2266, N'0    ', 23, N'Arctictis binturong', N'Chồn mực, Cầy đen', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Raffles', 1821, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2267, N'0    ', 24, N'Viverra zibetha', N'Cầy giông', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2268, N'0    ', 25, N'Viverricula indica', N'Cầy hương', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Desmarest', 1804, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2269, N'0    ', 26, N'Pardofelis temminckii', N'Báo lửa, Beo vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Vigors & Horsfield', 1827, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2270, N'0    ', 27, N'Prionailurus bengalensis', N'Mèo rừng, Mèo báo', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Kerr', 1792, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2271, N'0    ', 28, N'Panthera pardus', N'Báo hoa mai', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2272, N'0    ', 29, N'Cynocephalus variegatus', N'Chồn bay, Cầy bay', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Audebert', 1799, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2273, N'0    ', 30, N'Nycticebus coucan , Nycticebus bengalensis', N'Cu li lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Boddaert', 1785, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2274, N'0    ', 30, N'Nycticebus pygmaeus', N'Cu li nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Bonhote', 1907, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2275, N'0    ', 31, N'Nomascus gabriellae', N'Vượn đen má hung', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Thomas', 1909, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2276, N'0    ', 32, N'Pygathrix nemaeus', N'Vọoc chà vá chân đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'chưa có', 1771, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2277, N'0    ', 33, N'Macaca arctoides', N'Khỉ mặt đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'I. Geoffroy Saint-Hilaire', 1831, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2278, N'0    ', 33, N'Macaca assamensis', N'Khỉ mốc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'McClelland', 1840, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2279, N'0    ', 33, N'Macaca fascicularis', N'Khỉ đuôi dài', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Raffles', 1821, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2280, N'0    ', 33, N'Macaca nemestrina, Macaca leonina', N'Khỉ đuôi lợn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1776, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2281, N'0    ', 33, N'Macaca mulatta', N'Khỉ vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Zimmerman', 1780, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2282, N'0    ', 34, N'Hylopetes alboniger', N'Sóc bay đen trắng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hodgson', 1836, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2283, N'0    ', 35, N'Petaurista petaurista', N'Sóc bay lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Pallas', 1766, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2284, N'0    ', 36, N'Manis javanica', N'Tê tê Java', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Desmarest', 1822, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2285, N'0    ', 37, N'Dorcus curvidens', N'Kẹp kìm sừng cong', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hope', 1840, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2286, N'0    ', 37, N'Dorcus grandis (1962)', N'Kẹp kìm lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'chưa có', 1962, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2287, N'0    ', 37, N'Dorcus antaeus (Hope, 1842)', N'Kẹp kìm sừng lưỡi hái', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hope', 1842, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2288, N'0    ', 38, N'Eurytrachelteulus titanneus', N'Kẹp kìm song dao', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'chưa có', 0, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2289, N'0    ', 39, N'Teinopalpus aureus', N'Bướm phượng đuôi kiếm răng nhọn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Mell', 1923, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2290, N'0    ', 39, N'Teinopalpus imperialis (Hope, 1843)', N'Bướm phượng đuôi kiếm răng tù', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hope', 1843, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2291, N'0    ', 40, N'Troides helena cerberus (C. & R. Felder, 1865)', N'Bướm phượng cánh chim chấm liền', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'C. & R. Felder', 1865, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2292, N'0    ', 41, N'Zeuxidia masoni (Moore, 1878)', N'Bướm rừng đuôi trái đào', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Moore', 1878, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2293, N'0    ', 42, N'Phyllium succiforlium (Linnaeus, 1766)', N'Bọ lá', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1766, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2294, N'0    ', 43, N'Ophiophagus hannah (Cantor, 1836)', N'Hổ mang chúa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Cantor', 1836, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2295, N'0    ', 44, N'Bungarus multicinctus (Blyth, 1861)', N'Rắn Cạp nia bắc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Blyth', 1861, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2296, N'0    ', 44, N'Bungarus candidus (Linnaeus, 1758)', N'Rắn Cạp nia nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2297, N'0    ', 44, N'Bungarus fasciatus (Schneider, 1801)', N'Rắn Cạp nong', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Schneider', 1801, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2298, N'0    ', 45, N'Naja naja (Linnaeus, 1758)', N'Rắn hổ mang Ấn Độ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2299, N'0    ', 46, N'Varanus bengalensis (Daudin, 1802)', N'Kỳ đà vân', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Daudin', 1802, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2300, N'0    ', 46, N'Varanus salvator (Laurenti, 1768)', N'Kỳ đà hoa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Laurenti', 1768, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2301, N'0    ', 47, N'Python curtus (Schlegel, 1872)', N'Trăn cộc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Schlegel', 1872, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2302, N'0    ', 47, N'Python molurus (Linnaeus, 1758)', N'Trăn đất', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2303, N'0    ', 47, N'Python reticulatus (Schneider, 1801)', N'Trăn gấm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Schneider', 1801, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2304, N'0    ', 48, N'Elaphe radiata(F. Boie, 1827)', N'Rắn Sọc dưa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'F. Boie', 1827, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2305, N'0    ', 49, N'Ptyas mucosus (Cope, 1861)', N'Rắn Ráo trâu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Cope', 1861, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2306, N'0    ', 50, N'Cuora trifasciata (Bell, 1825)', N'Rùa hộp ba vạch', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Bell', 1825, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2307, N'0    ', 51, N'Heosemys grandis (Gray, 1860)', N'Rùa đất lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Gray', 1860, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2308, N'0    ', 52, N'Mauremys annamensis (Siebenrock, 1903)', N'Rùa Trung bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Siebenrock', 1903, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2309, N'0    ', 53, N'Indotestudo elongata (Blyth, 1853)', N'Rùa Núi vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Blyth', 1853, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2310, N'0    ', 54, N'Manouria impressa (Günther, 1882)', N'Rùa Núi viền', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Günther', 1882, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2311, N'0    ', 55, N'Gallus gallus (Linnaeus, 1758)', N'Gà rừng lông đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'chưa có', 0, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2312, N'0    ', 56, N'Cervus unicolor (Kerr, 1792)', N'Nai', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2313, N'0    ', 16, N'Muntiacus muntjak (Zimmermann, 1780)', N'Mang đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Kerr', 1792, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2314, N'0    ', 57, N'Sus scrofa (Linnaeus, 1758)', N'Lợn rừng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Zimmermann', 1780, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2315, N'0    ', 58, N'Paguma larvata (C. E. H. Smith, 1827)', N'Cầy vòi mốc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2316, N'0    ', 59, N'Paradoxurus hermaphroditus (Pallas, 1777)', N'Cầy vòi hương', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'C. E. H. Smith', 1827, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2317, N'0    ', 60, N'Martes flavigula (Boddaert, 1785)', N'Chồn váng, Cầy vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Pallas', 1777, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2318, N'0    ', 61, N'Melogale moschata (Gray, 1831)', N'Chồn bạc má bắc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Boddaert', 1785, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2319, N'0    ', 61, N'Melogale personata (I.Geoffroy Saint-Hilaire, 1831)', N'Chồn bạc má nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Gray', 1831, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2320, N'0    ', 62, N'Cannomys badius (Hodgson, 1841)', N'Dúi nâu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'I. Geoffroy Saint-Hilaire', 1831, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2321, N'0    ', 63, N'Rhizomys pruinosus (Blyth, 1851)', N'Dúi mốc lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Hodgson', 1841, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2322, N'0    ', 63, N'Rhizomys sinensis (Gray, 1831)', N'Dúi mốc nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Blyth', 1851, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2323, N'0    ', 63, N'Rhizomys sumatrensis (Raffles, 1821)', N'Dúi má vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Gray', 1831, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2324, N'0    ', 64, N'Atherurus macrourus (Linnaeus, 1758)', N'Don', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Raffles', 1821, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2325, N'0    ', 65, N'Hystrix brachyura (Linnaeus, 1758)', N'Nhím đuôi ngắn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2326, N'0    ', 66, N'Leiolepis guentherpetersi (Darevsky & Kupriyanova, 1993)', N'Nhông cát', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Darevsky & Kupriyanova', 1993, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2327, N'0    ', 67, N'Physignathus cocincinus (Cuvier, 1829)', N'Rồng đất', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Cuvier', 1829, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2328, N'0    ', 68, N'Gekko gecko (Linnaeus, 1758)', N'Tắc kè', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2329, N'0    ', 69, N'Physignatus cocincinus', N'Kỳ tôm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2330, N'0    ', 70, N'Cyclemys dentata (Gray, 1831)', N'Rùa dứa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2331, N'0    ', 70, N'Cyclemys tcheponensis (Bourret, 1939)', N'Rùa đất sê pôn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2332, N'0    ', 71, N'Cupressus torulosa (D.Don)', N'Hoàng đàn tràng hạt', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2333, N'0    ', 72, N'Pinus kesiya (Royle ex Gordon)', N'Thông ba lá', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2334, N'0    ', 73, N'Dacrycarpus imbricatus ((Blume) de Laub., 1969)', N'Thông nàng: Thông lông gà', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2335, N'0    ', 73, N'Dacrydium elatum ((Roxb.) Wall. ex Hook., 1843)', N'Thông chàng: Hoàng đan giả', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2336, N'0    ', 74, N'Nageia fleuryi ((Hickel) de Laub.)', N'Kim giao', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2337, N'0    ', 75, N'Ilex chapaensis (Merr., 1940)', N'Chân chim lá ngược', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2338, N'0    ', 76, N'Gomphandra tetrandra ((Wall.) Sleum., 1940)', N'Thổ ti', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2339, N'0    ', 77, N'Gonocaryum maclurei (Merr.)', N'Quỳnh lãm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2340, N'0    ', 78, N'Stemonurus coriaceus (Miers)', N'Mao nhụy chất da', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2341, N'0    ', 78, N'Stemonurus chingianus (Hand.-Mazz.)', N'Mao nhụy nhân xương', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2342, N'0    ', 79, N'Dendropanax sp.', N'Chân chim 8 lá', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2343, N'0    ', 79, N'Dendropanax venosus (Merr., 1938)', N'Chân chim vidal', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2344, N'0    ', 80, N'Schefflera chevalieri (C.B.Shang, 1984)', N'Chân chim', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2345, N'0    ', 80, N'Schefflera hypoleucoides var. tomentosa (Grushvitzky & Skvortsova)', N'San hô lá tỳ bà', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2346, N'0    ', 80, N'Schefflera obovatifoliolata (C.B.Shang, 1984)', N'Ké hoa vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2347, N'0    ', 80, N'Schefflera heptaphylla ((L.) Frodin, 1990)', N'Muồng đen', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2348, N'0    ', 80, N'Schefflera vidaliana (C.B.Shang, 1984)', N'Xoay', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2349, N'0    ', 80, N'Schefflera sp.', N'Lim vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2350, N'0    ', 81, N'Pittosporum pauciflorum (Hook. & Arn.)', N'Hài đồng hoa thưa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2351, N'0    ', 82, N'Illicium parviflorum (Michx. ex Vent., 1799)', N'Hồi hoa nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2352, N'0    ', 83, N'Turpinia montana ((Blume) Kurz, 1875)', N'Hương viên núi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2353, N'0    ', 84, N'Dillenia indica (L.)', N'Sao dạng đuôi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2354, N'0    ', 85, N'Viburnum oldhami', N'Bứa nét đen', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2355, N'0    ', 85, N'Viburnum punctatum (Ham. ex G.Don)', N'Tai chua', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2356, N'0    ', 86, N'Saurauia roxburghii (Wall)', N'Sổ dã roxburgh', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2357, N'0    ', 87, N'Enkianthus quinqueflorus (Lour., 1790)', N'Kha nạp hương Sài Gòn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2358, N'0    ', 88, N'Rhododendron moulmainense (Hook.)', N'Giác đề da noãn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2359, N'0    ', 89, N'Vaccinium sprengelii ((G. Don) Sleumer, 1941)', N'Giác đế Đà Nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2360, N'0    ', 89, N'Vaccinium bracteatum (Thunb., 1784)', N'Quần đầu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2361, N'0    ', 89, N'Vaccinium eberhardtii (Dop.)', N'Nhọc lau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2362, N'0    ', 90, N'Diospyros apiculata (Hiern, 1873)', N'Thị dạng sóng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2363, N'0    ', 90, N'Diospyros longipedicellata (Lecomte, 1928)', N'Thị', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2364, N'0    ', 90, N'Diospyros nebuloeum (Lecomte)', N'Côm tầng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2365, N'0    ', 90, N'Diospyros salletii (Lecomte, 1928)', N'Côm phiến tròn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2366, N'0    ', 90, N'Diospyros touranensis (Lecomte, 1928)', N'Côm vân nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2367, N'0    ', 90, N'Diospyros undulata (Wall. ex G. Don, 1837)', N'Côm kontum', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2368, N'0    ', 91, N'Ardisia solanacea (Roxb., 1795)', N'Trọng đũa tựa cà', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2369, N'0    ', 91, N'Ardisia annamensis (Pit., 1930)', N'Trọng đũa trung bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2370, N'0    ', 92, N'Diospyros sp.', N'Côm lông xám', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2371, N'0    ', 93, N'Eberhardtia krempfii (Lecomte, 1920)', N'Cồng sữa khánh hòa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2372, N'0    ', 94, N'Madhuca pasquieri ((Dubard) H.J.Lam)', N'Sến mật', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2373, N'0    ', 95, N'Palaquium annamense (Lecomte, 1930)', N'Chay trung bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2374, N'0    ', 96, N'Planchonella annamensis (Pierre ex Dubard, 1911)', N'Nóng trung bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2375, N'0    ', 97, N'Sarcosperma angustifolium (Gagnep., 1948)', N'Nhục thực lá hẹp', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2376, N'0    ', 98, N'Rehderodendron macrocarpum (Hu, 1932)', N'Đua đũa quả to', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2377, N'0    ', 99, N'Styrax agrestis ((Lour.) G. Don, 1837)', N'Bồ đề', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2378, N'0    ', 100, N'Symplocos adenophylla var. touranensis ((Guillaum.) Nooteb)', N'Dung Đà nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2379, N'0    ', 100, N'Symplocos banaensis (Guill)', N'Dung bà nà', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2380, N'0    ', 100, N'Symplocos coriacea (A. DC., 1844)', N'Dung lá da', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2381, N'0    ', 100, N'Symplocos caudata (Wall. ex. A.DC.)', N'Dung dạng đuôi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2382, N'0    ', 100, N'Symplocos glauca ((Thunb. ex Murray) Koidz., 1925)', N'Dung lục phấn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2383, N'0    ', 100, N'Symplocos glomerata ssp. congesta var. pvilanci ((Guillaum.) Nooteb)', N'Dung đen', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2384, N'0    ', 100, N'Symplocos lancifolia (Siebold & Zucc., 1846)', N'Dung lá mác', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2385, N'0    ', 100, N'Symplocos paniculata ((Thunb. ex Murray) Miq., 1867)', N'Dung chùy tròn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2386, N'0    ', 100, N'Symplocos sp.', N'Dung', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2387, N'0    ', 101, N'Adinandra hainanensis (Hayata, 1913)', N'Hồng đạm chấm đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2388, N'0    ', 101, N'Adinandra megaphylla (Hu, 1935)', N'Sum lá lớn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2389, N'0    ', 102, N'Camellia japonica (L., 1753)', N'Sơn trà Nhật bản', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2390, N'0    ', 103, N'Eurya annamensis (Gagnep.)', N'Súm trung bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2391, N'0    ', 103, N'Eurya cf. japonica (L.)', N'Linh Nhật bản', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2392, N'0    ', 104, N'Gordonia bidoupensis (Gagnep., 1942)', N'Tri âm bì đúp', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2393, N'0    ', 104, N'Gordonia axillaris ((Roxburgh) Sweet, 1842)', N'Tri âm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2394, N'0    ', 104, N'Gordonia balansae (Pit., 1910)', N'Tri âm ba vì', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2395, N'0    ', 105, N'Schima wallichii ssp. noronhae ((Blume) Bloernle)', N'Chò xót', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2396, N'0    ', 106, N'Ternstroemia kwangtungensis (Merr., 1918)', N'Hậu bì hương Quảng đông', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2397, N'0    ', 107, N'Cassia siamea (Lam., 1785)', N'Gụ lau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2398, N'0    ', 108, N'Dialium cochinchinense (Pierre)', N'Giáp mê bắc bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2399, N'0    ', 109, N'Peltophorum dasyrhachis ((Miq.) Kurz)', N'Giáp mê chấm đốm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2400, N'0    ', 109, N'Peltophorum dasyrrhachis var. tonkinense ((Pierre) K.Larsen & S.S.Larsen)', N'Cồng Đà Nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2401, N'0    ', 109, N'Peltophorum ferrugineum ((Decne.) Benth.)', N'Cồng lá cách', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2402, N'0    ', 110, N'Sindora tonkinensis (A. Chev.)', N'Thành ngạch', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2403, N'0    ', 111, N'Cynometra glomerulata (Gagnep.)', N'Mót đoàn tản nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2404, N'0    ', 112, N'Dalbergia lanceolaria (L.f.)', N'Trắc nhọn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2405, N'0    ', 113, N'Millettia sericea (Benth.)', N'Mát lông tơ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2406, N'0    ', 114, N'Ormosia dasycarpa (Jacks.)', N'Ràng ràng lông', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2407, N'0    ', 115, N'Saraca declinata ((Jack) Miq.)', N'Vàng anh khuynh tả', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2408, N'0    ', 115, N'Saraca dives (Pierre)', N'Vàng anh', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2409, N'0    ', 116, N'Albizia chinensis ((Osbeck) Merr.)', N'Chu mè', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2410, N'0    ', 117, N'Archidendron poilanei ((Kosterm.) I.C.Nielsen)', N'Mán đĩa tuyến không', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2411, N'0    ', 117, N'Archidendron chevalieri ((Kosterm.) I.C.Nielsen)', N'Mán đĩa nhẵn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2412, N'0    ', 117, N'Archidendron clypearia ((Jack)I.C.Nielsen)', N'Mán đĩa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2413, N'0    ', 118, N'Castanopsis delavayi (Franch., 1899)', N'Cà ổi núi cao', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2414, N'0    ', 118, N'Castanopsis carlesii ((Hemsl.) Hayata, 1917)', N'Cà ổi đỏ nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2415, N'0    ', 118, N'Castanopsis choboensis (Hickel & A.Camus, 1928)', N'Cà ổi chợ bờ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2416, N'0    ', 118, N'Castanopsis ferox ((Roxb.) Spach, 1842)', N'Dẻ bự', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2417, N'0    ', 118, N'Castanopsis hystrix (A.DC., 1863)', N'Cà ổi đỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2418, N'0    ', 118, N'Castanopsis mekongensis (A.Camus, 1938)', N'Cà ổi mêkong', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2419, N'0    ', 118, N'Castanopsis poilanei (Hickel & A.Camus, 1921)', N'Cà ổi polan', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2420, N'0    ', 118, N'Castanopsis sp1.', N'Cà ổi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2421, N'0    ', 118, N'Castanopsis sp2.', N'Cà ổi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2422, N'0    ', 119, N'Lithocarpus braianensis (A.Camus, 1938)', N'Sồi Braian', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2423, N'0    ', 119, N'Lithocarpus chevalieri (A.Camus, 1942)', N'Sồi đấu cụm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2424, N'0    ', 119, N'Lithocarpus iteaphylloides (Chun)', N'Sồi mắt ngọc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2425, N'0    ', 119, N'Lithocarpus fenestratus ((Roxb.) Rehder, 1919)', N'Dẻ cau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2426, N'0    ', 119, N'Lithocarpus ochrocarpus (A.Camus, 1938)', N'Sồi quả son', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2427, N'0    ', 119, N'Lithocarpus proboscideus ((Hickel & A.Camus) A.Camus, 1931)', N'Sồi dạng mũi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2428, N'0    ', 119, N'Lithocarpus quangnamensis (A.Camus, 1944)', N'Dẻ quảng nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2429, N'0    ', 119, N'Lithocarpus scortechinii ((King ex Hook.f.) A.Camus, 1931)', N'Sồi Đà nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2430, N'0    ', 119, N'Lithocarpus sp1.', N'Sồi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2431, N'0    ', 119, N'Lithocarpus sp2.', N'Sồi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2432, N'0    ', 120, N'Quercus auricoma (A.Camus, 1935)', N'Dẻ lông vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2433, N'0    ', 120, N'Quercus langbianensis (Hickel & A.Camus, 1921)', N'Dẻ langbian', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2434, N'0    ', 120, N'Quercus myrsinifolia (Blume, 1850)', N'Dẻ lá thiết tử', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2435, N'0    ', 120, N'Quercus bambusifolia (Hance)', N'Sồi lá tre', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2436, N'0    ', 120, N'Quercus cryptocarpus ((Drake) A. Camus)', N'Sồi quả ẩn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2437, N'0    ', 120, N'Quercus poilanei (Hickel & A.Camus, 1921)', N'Sồi poilan', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2438, N'0    ', 121, N'Engelhardtia roxburghiana (Lindl., 1831)', N'Chẹo', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2439, N'0    ', 121, N'Engelhardtia wallichiana (Lindl.)', N'Chẹo tím', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2440, N'0    ', 122, N'Aucuba eriobotryaefolia (F.T.Wang)', N'Lim xẹt', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2441, N'0    ', 123, N'Wrightia macrocarpa (Pit.)', N'Chân chim lá đa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2442, N'0    ', 123, N'Wrightia rubriflora (Pit.)', N'Chân chim lông', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2443, N'0    ', 124, N'Fagraea fragrans (Roxb.)', N'Trai', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2444, N'0    ', 125, N'Adina pilulifera ((Lam.) Franch. ex Drake, 1895)', N'Gáo nước cầu nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2445, N'0    ', 126, N'Adia oxyodonta ((Drake) Yamazaki)', N'Mãi táp răng nhọn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2446, N'0    ', 126, N'Adia oxyodonta var. microdonta ((Pit) P.H.H)', N'Mãi táp vi xỉ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2447, N'0    ', 127, N'Lasianthus cyanocarpus (Jack, 1823)', N'Kê thi quả cam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2448, N'0    ', 128, N'Morinda sessiliflora sp.nov.', N'Nhàu không cuống', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2449, N'0    ', 129, N'Nauclea officinalis ((Pierre ex Pit.) Merr. & Chun)', N'Gáo cam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2450, N'0    ', 130, N'Psychotria montana (Blume, 1823)', N'Lấu núi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2451, N'0    ', 130, N'Psychotria sp.', N'Lấu', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2452, N'0    ', 130, N'Psychotria yunnanensis (Hutch., 1916)', N'Lấu vân nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2453, N'0    ', 131, N'Urophyllum argenteum (Pit., 1923)', N'Vĩ diệp bạc', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2454, N'0    ', 132, N'Wendlandia acuminata (Cowan, 1938)', N'Chà hươu đầu nhọn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2455, N'0    ', 133, N'Stereospermum colais ((Dillwyn) Mabb.)', N'Lim xẹt', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2456, N'0    ', 134, N'Linociera macrothyrsa (Merr.)', N'Lý lãm chùy trụ tản to', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2457, N'0    ', 134, N'Linociera thorelii (Gagnep.)', N'Lý lãm thon ngược', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2458, N'0    ', 134, N'Linociera ramiflora ((Roxb.) Wall. ex G. Don)', N'Lý lãm hoa cành', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2459, N'0    ', 134, N'Linociera parvilimba (Merr. & Chun)', N'Lý lãm chi đài nhỏ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2460, N'0    ', 134, N'Linociera ramiflora ((Roxb.) Wall. ex G. Don)', N'Lý lãm hoa cành', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2461, N'0    ', 134, N'Linociera verticillata (Gagnep.)', N'Lý lãm mọc vòng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2462, N'0    ', 135, N'Osmanthus peduncularis (Gagnep)', N'Hoa thơm có cuống', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2463, N'0    ', 136, N'Clerodendrum wallichii (Merrill, 1952)', N'Mò treo', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2643, N'0    ', 71, N'Cupressus torulosa(D. Don)', N'Hoàng đàn', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2649, N'0    ', 227, N'Paphiopedilum spp.', N'Các loài lan hài', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2650, N'0    ', 92, N'Diospyros salletii (Lecome, 1928)', N'Mun sọc ( Thị bong)', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2651, N'0    ', 112, N'Dalbergia cochinchinensis ( Piere)', N'Trắc ( Cẩm lai nam)', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2652, N'0    ', 112, N'Dalbergia oliveri ( Gamble ex Prain)', N'Cẩm lai ( cẩm lai bà rịa)', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2654, N'0    ', 110, N'Sindora siamensis (Teijsm ex Miq)', N'Gụ mật (Gõ mật)', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2655, N'0    ', 110, N'Sindora tonkinensis (A. Chev)', N'Gụ lau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2661, N'0    ', 87, N'Enkianthus quinqueflorus (Lour., 1790)', N'Đào chuông', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2662, N'0    ', 94, N'Madhuca pasquieri ((Dubard) H.J.Lam)', N'Sến mật', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2663, N'0    ', 108, N'Dialium cochinchinense (Pierre)', N'Xoay', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2664, N'0    ', 110, N'Sindora tokinensis (A.Chev)', N'Gụ lau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2665, N'0    ', 109, N'Peltophorum dayrrachis ( Kurz, 1950)', N'Lim vàng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2666, N'0    ', 112, N'Dalbergia bariaensis (Pierre, 1898)', N'Cẩm lai Bà Rịa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2667, N'0    ', 118, N'Castanopsis ceratacantha (Rehder & E.H.Wilson, 1916)', N'Dẻ gai sừng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2668, N'0    ', 118, N'Castanopsis nebulorum (A. Cam.)', N'Dẻ gai nhỏ, Kha thụ Hải Vân', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2669, N'0    ', 118, N'Castanopsis nhatrangensis (Hickel & A.Camus, 1923)', N'Dẻ gai Nha Trang', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2670, N'0    ', 118, N'Castanopsis scortechinii (Gamble, 1914)', N'Dẻ gai Đà Nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2671, N'0    ', 118, N'Castanopsis tribuloides ((Sm.) A.DC., 1863)', N'Dẻ gai tụ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2672, N'0    ', 119, N'Lithocarpus amygdalifolius ((Skan) Hayata, 1917)', N'Dẻ hạnh nhân', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2673, N'0    ', 119, N'Lithocarpus annamensis ((Hickel & A.Camus) Barnett, 1944)', N'Dẻ Trung Bộ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2674, N'0    ', 119, N'Lithocarpus bacgiangensis ((Hickel & A.Camus) A.Camus, 1931)', N'Dẻ Bắc Giang', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2675, N'0    ', 119, N'Lithocarpus elaeagnifolia ((Seemen) Chun)', N'Dẻ lá nhót', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2676, N'0    ', 119, N'Lithocarpus fenestratus ((Roxb.) Rehder, 1919)', N'Dẻ cau', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2677, N'0    ', 119, N'Lithocarpus vestitus ((Hickel & A.Camus) A.Camus, 1931)', N'Dẻ đá', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2678, N'0    ', 119, N'Lithocarpus ombrophila( A.Camus)', N'Dẻ đá chấm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2679, N'0    ', 119, N'Lithocarpus quangnamensis (A.Camus, 1944)', N'Dẻ đá Quảng Nam', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2680, N'0    ', 119, N'Lithocarpus scortechinii ((King ex Hook.f.) A.Camus, 1931)', N'Dẻ đá Đà Nẵng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2681, N'0    ', 119, N'Lithocarpus thomsonii ((Miq.) Rehder, 1919)', N'Dẻ đá Tom Son', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2682, N'0    ', 120, N'Quercus thorelii (Hickel & A.Camus, 1923)', N'Sồi xanh', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2683, N'0    ', 120, N'Quercus subumbilicata (A.Camus)', N'Sồi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2702, N'0    ', 233, N'Gnetum montanum ( Markgr, 1930)', N'Dây gắm', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2703, N'0    ', 234, N'Drynaria fortunei((Kunze) J. Smith', N'Cốt toái bổ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2704, N'0    ', 235, N'Marsilea quadrifolia (L)', N'Rau bợ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2706, N'0    ', 80, N'Schefflera octophylla((L.) Frodin, 1990)', N'Ngũ gia bì chân chim', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2709, N'0    ', 55, N'Ardisia silvestris( Charles-Joseph Marie Pitard, 1930)', N'Lá khôi', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2710, N'0    ', 239, N'Streptocaulon griffithii(Hook)', N'Hà thủ ô Griffith', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2711, N'0    ', 240, N'Strychnos ovata (A.W.Hill, 1909)', N'Mã tiền hình trứng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2713, N'0    ', 241, N'Smilax glabra (Roxb)', N'Thổ phục linh', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2715, N'0    ', 242, N'Breynia fruticosa ((L.) Mull.Arg, 1866)', N'Bồ cu vẽ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2727, N'0    ', 251, N'Hoplobatrachus rugulosus (Wiegmann, 1834)', N'Ếch đồng', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2735, N'0    ', 257, N'Megophrys longipes (Boulenger, 1886)', N'Cóc mắt chân dài', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2737, N'0    ', 259, N'Microhyla fissipes (Boulenger, 1884)', N'Nhái bầu hoa', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2738, N'0    ', 259, N'Microhyla picta (Schenkel, 1901)', N'Nhái bầu vẽ', N'chưa có', 0, N'chưa có', N'chưa có', N'chưa có', N'chưa có', N'Linnaeus', 1758, N'chưa có', 0, N'chưa có', 0, NULL, N'chưa có')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2956, N'0    ', 438, N'9', N'9', N'9', 9, N'9', N'9', N'9', N'9', N'9', 9, N'9', 9, N'9', 9, N'5151.JPG  ', N'minh')
GO
INSERT [dbo].[Loai] ([MaLoai], [KiHieu], [Chi], [DanhPhapKhoaHoc], [TenThuongGoi], [TenKhac], [SoLuongCaThe], [DacDiemSinhSan], [DacDiemGioiTinh], [DacDiemKhac], [MucDoBaoDong], [NguoiPhatHien], [NamPhatHien], [TapTinhSinhHoc], [KichCoTrungBinh], [ThucAn], [XuatXu], [Image], [TenNguoiTao]) VALUES (2957, N'8    ', 438, N'999', N'800', N'8', 8, N'8', N'8', N'8', N'8', N'8', 8, N'8', 8, N'8', 8, N'5151.JPG  ', N'minh')
GO
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
SET IDENTITY_INSERT [dbo].[Lop] ON 

GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (1, N'0    ', 1, N'Aves', N'Lớp Chim', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', 1, N'Mammalia', N'Lớp Thú', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (3, N'0    ', 1, N'Reptilia', N'Lớp Bò sát', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (4, N'0    ', 2, N'Pinopsida', N'Lớp Thông', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (5, N'0    ', 3, N'Magnoliopsida', N'Lớp Thực vật hai lá mầm', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (6, N'0    ', 4, N'Cycadopsida', N'Lớp tuế', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (7, N'0    ', 3, N'Liliopsida', N'Thực vật một lá mầm', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (8, N'0    ', 5, N'Gnetopsida', N'Lớp Dây gắm', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (9, N'0    ', 6, N'Polypodiopsida', N'Lớp Dương xỉ', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (10, N'0    ', 3, N'Lilopsida', N'Thực vật một lá mầm', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (11, N'0    ', 1, N'Amphibia', N'Động vật lưỡng cư', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (12, N'0    ', 1, N'Actinopterygii', N'Lớp Cá vây tia', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Lop] ([MaLop], [KiHieu], [Nganh], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (13, N'0    ', 1, N'Chondrichthyes', N'Lớp Cá sụn', N'chưa có', N'0         ', 0)
GO
SET IDENTITY_INSERT [dbo].[Lop] OFF
GO
SET IDENTITY_INSERT [dbo].[MoiTruongSong] ON 

GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (1, N'Sơn Trà', N'12051282', N'1819295')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (2, N'Bà Nà', N'12039434', N'1810963')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (3, N'Sông Hàn', N'12048492', N'1810007')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (4, N'Phía đông  Sơn  Trà', N'12058161', N'1819371')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (5, N'Phía bắc Sơn trà', N'12050136', N'1822161')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (6, N'Phía nam Sơn trà', N'12053843', N'1816963')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (7, N'Phía Bắc Bà Nà', N'12037179', N'1812148')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (8, N'Phía Nam Bà Nà', N'12039969', N'1809472')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (9, N'Thượng lưu sông Hàn', N'12048225', N'1807753')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (10, N'Hạ lưu sông Hàn', N'12047690', N'1813638')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (11, N'Hòa Bắc', N'12027281', N'1824569')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (1008, NULL, N'12055812', N'1817311')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (1009, NULL, N'12055373', N'1813527')
GO
INSERT [dbo].[MoiTruongSong] ([MaVung], [TenViTri], [ViDo], [KinhDo]) VALUES (1010, NULL, N'12041079', N'1817311')
GO
SET IDENTITY_INSERT [dbo].[MoiTruongSong] OFF
GO
SET IDENTITY_INSERT [dbo].[Nganh] ON 

GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (1, N'0    ', 1, N'Chordata', N'Động vật có dây sống', N'chưa có', N'0         ', 0)
GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (2, N'0    ', 2, N'Pinophyta', N'Ngành Thông', N' chưa có', N'0         ', 0)
GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (3, N'0    ', 2, N'Magnoliophyta', N'Ngành hạt kín', N' chưa có', N'0         ', 0)
GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (4, N'0    ', 2, N'Cycadophyta', N'Ngành thông', N' chưa có', N'0         ', 0)
GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (5, N'0    ', 2, N'Gnetophyta', N'Ngành tuế', N' chưa có', N'0         ', 0)
GO
INSERT [dbo].[Nganh] ([MaNganh], [KiHieu], [Gioi], [DanhPhapKhoaHoc], [TenTiengViet], [NguoiPhatHien], [NamPhatHien], [TenNguoiTao]) VALUES (6, N'0    ', 2, N'Pteridophyta', N'Ngành hạt kín, Ngành thực vật có hoa', N' chưa có', N'0         ', 0)
GO
SET IDENTITY_INSERT [dbo].[Nganh] OFF
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2238, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2238, 1008, 1, 1, 1)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2238, 1009, 9, 9, 9)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2238, 1010, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2239, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2239, 1008, 1, 1, 1)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2240, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2241, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2241, 1008, 2, 2, 2)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2242, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2243, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2244, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2245, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2245, 1008, 1, 1, 1)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2245, 1009, 99, 9, 9)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2246, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2247, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2248, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2249, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2250, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2251, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2252, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2253, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2254, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2255, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2256, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2257, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2258, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2259, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2260, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2261, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2262, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2263, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2264, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2265, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2266, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2267, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2268, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2269, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2270, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2271, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2272, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2273, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2274, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2275, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2276, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2277, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2278, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2279, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2279, 1009, 77, 7, 7)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2280, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2281, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2282, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2283, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2284, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2285, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2286, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2287, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2288, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2289, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2290, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2291, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2292, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2293, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2294, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2295, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2296, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2297, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2298, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2299, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2300, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2301, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2302, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2303, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2304, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2305, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2306, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2307, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2308, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2309, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2310, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2311, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2312, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2313, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2314, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2315, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2316, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2317, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2318, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2319, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2320, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2321, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2322, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2323, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2324, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2325, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2326, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2327, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2328, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2329, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2330, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2331, 4, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2332, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2333, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2334, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2335, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2336, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2337, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2338, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2339, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2340, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2341, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2342, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2343, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2344, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2345, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2346, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2347, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2348, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2349, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2350, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2351, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2352, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2353, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2354, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2355, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2356, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2357, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2358, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2359, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2360, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2361, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2362, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2363, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2364, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2365, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2366, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2367, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2368, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2369, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2370, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2371, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2372, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2373, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2374, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2375, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2376, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2377, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2378, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2379, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2380, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2381, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2382, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2383, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2384, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2385, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2386, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2387, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2388, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2389, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2390, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2391, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2392, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2393, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2394, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2395, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2396, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2397, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2398, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2399, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2400, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2401, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2402, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2403, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2404, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2405, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2406, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2407, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2408, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2409, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2410, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2411, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2412, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2413, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2414, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2415, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2416, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2417, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2418, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2419, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2420, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2421, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2422, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2423, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2424, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2425, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2426, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2427, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2428, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2429, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2430, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2431, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2432, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2433, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2434, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2435, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2436, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2437, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2438, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2439, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2440, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2441, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2442, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2443, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2444, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2445, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2446, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2447, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2448, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2449, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2450, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2451, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2452, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2453, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2454, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2455, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2456, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2457, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2458, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2459, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2460, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2461, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2462, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2463, 7, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2643, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2649, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2650, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2651, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2652, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2654, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2655, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2661, 2, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2662, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2663, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2664, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2665, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2666, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2667, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2668, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2669, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2670, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2671, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2672, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2673, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2674, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2675, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2676, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2677, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2678, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2679, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2680, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2681, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2682, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2683, 5, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2702, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2703, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2704, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2706, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2709, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2710, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2711, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2713, 6, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2715, 1, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2727, 11, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2735, 11, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2737, 11, 0, 0, 0)
GO
INSERT [dbo].[PhanBo] ([MaLoai], [VungPhanBo], [TiLePhanBo], [MatDo], [SoLuongCaThe]) VALUES (2738, 11, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (1, 1, N'Admin', NULL, NULL, 1)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (2, 2, N'NguoiDung', NULL, NULL, 2)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (4, 2, N'NguoiDung', NULL, NULL, 24)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (5, 2, N'NguoiDung', NULL, NULL, 6)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (7, 2, N'NguoiDung', NULL, NULL, 25)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (27, 2, N'NguoiDung', NULL, NULL, 26)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (28, 2, N'NguoiDung', NULL, NULL, 27)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (29, 2, N'NguoiDung', NULL, NULL, 28)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (30, 2, N'NguoiDung', NULL, NULL, 29)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (31, 2, N'NguoiDung', NULL, NULL, 30)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (32, 2, N'NguoiDung', NULL, NULL, 31)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (33, 2, N'NguoiDung', NULL, NULL, 32)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (34, 2, N'NguoiDung', NULL, NULL, 33)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (35, 2, N'NguoiDung', NULL, NULL, 34)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (36, 1, N'Admin', NULL, NULL, 2)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (37, 1, N'Admin', NULL, NULL, 6)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (38, 1, N'Admin', NULL, NULL, 24)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (39, 1, N'Admin', NULL, NULL, 25)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (40, 1, N'Admin', NULL, NULL, 26)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (41, 1, N'Admin', NULL, NULL, 27)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (42, 1, N'Admin', NULL, NULL, 28)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (43, 1, N'Admin', NULL, NULL, 29)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (44, 1, N'NguoiDung', NULL, NULL, 30)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (45, 1, NULL, NULL, NULL, 31)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (46, 1, NULL, NULL, NULL, 32)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (47, 1, NULL, NULL, NULL, 33)
GO
INSERT [dbo].[PhanQuyen] ([Id], [ObjId], [ObjType], [Xoa], [NgayXoa], [IdChucNang]) VALUES (48, 1, NULL, NULL, NULL, 34)
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [HoLot], [Ten], [Email], [NgaySinh], [Khoa], [MaKichHoat], [NgayKichHoat], [NgayTao], [NgaySua], [Xoa], [NgayXoa]) VALUES (1, N'vuongnv', N'630cf47e05814a7980506777ae7b1b12', N'Nguyễn Văn', N'Vương', N'vanvuong2610@gmail.com', CAST(0x0000823600000000 AS DateTime), NULL, NULL, NULL, CAST(0x0000A44000000000 AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [HoLot], [Ten], [Email], [NgaySinh], [Khoa], [MaKichHoat], [NgayKichHoat], [NgayTao], [NgaySua], [Xoa], [NgayXoa]) VALUES (2, N'thanhvinh', N'83cc0e5c5f0406ccb473d8a49ff8eedc', N'Trần Thanh', N'Vinh', N'skyx304@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [HoLot], [Ten], [Email], [NgaySinh], [Khoa], [MaKichHoat], [NgayKichHoat], [NgayTao], [NgaySua], [Xoa], [NgayXoa]) VALUES (26, N'abc', N'eb4af421115c906f5141e209b8a01406', N'abc', N'abc', N'thuctapviettel.ict@gmail.com', CAST(0x00008E1B00000000 AS DateTime), 1, N'qEDZbgoQQkCSDrRzirYRAA', CAST(0xAD390B00 AS Date), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [HoLot], [Ten], [Email], [NgaySinh], [Khoa], [MaKichHoat], [NgayKichHoat], [NgayTao], [NgaySua], [Xoa], [NgayXoa]) VALUES (28, N'vinh', N'a7b83f712ba93a756a253a9de2b882ef', N'vinh', N'vinh', N'skyx304@gmail.com', CAST(0x00008E1B00000000 AS DateTime), 1, N'SRe23KeU7U6JnbokEdON2A', CAST(0xB7390B00 AS Date), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [HoLot], [Ten], [Email], [NgaySinh], [Khoa], [MaKichHoat], [NgayKichHoat], [NgayTao], [NgaySua], [Xoa], [NgayXoa]) VALUES (29, N'minh', N'f61510ec75319d5ab8ba11bfd0c5f14e', N'minh', N'minh', N'skyx304@gmail.com', CAST(0x00008E1B00000000 AS DateTime), 1, N'bbjPymvc0msH9ixj3PLFQ', CAST(0xC7390B00 AS Date), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (2, 10, 2)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (12, 22, 2)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (14, 25, 2)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (15, 26, 2)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (16, 28, 2)
GO
INSERT [dbo].[UserGroup] ([Id], [UserId], [GroupId]) VALUES (17, 29, 2)
GO
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
GO
ALTER TABLE [dbo].[Bo]  WITH CHECK ADD  CONSTRAINT [FK_Bo_Lop] FOREIGN KEY([Lop])
REFERENCES [dbo].[Lop] ([MaLop])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bo] CHECK CONSTRAINT [FK_Bo_Lop]
GO
ALTER TABLE [dbo].[Chi]  WITH CHECK ADD  CONSTRAINT [FK_Chi_Ho] FOREIGN KEY([Ho])
REFERENCES [dbo].[Ho] ([MaHo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chi] CHECK CONSTRAINT [FK_Chi_Ho]
GO
ALTER TABLE [dbo].[Ho]  WITH CHECK ADD  CONSTRAINT [FK_Ho_Bo] FOREIGN KEY([Bo])
REFERENCES [dbo].[Bo] ([MaBo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ho] CHECK CONSTRAINT [FK_Ho_Bo]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_Chi] FOREIGN KEY([Chi])
REFERENCES [dbo].[Chi] ([MaChi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_Chi]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Nganh] FOREIGN KEY([Nganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Nganh]
GO
ALTER TABLE [dbo].[Nganh]  WITH CHECK ADD  CONSTRAINT [FK_Nganh_Gioi] FOREIGN KEY([Gioi])
REFERENCES [dbo].[Gioi] ([MaGioi])
GO
ALTER TABLE [dbo].[Nganh] CHECK CONSTRAINT [FK_Nganh_Gioi]
GO
ALTER TABLE [dbo].[PhanBo]  WITH CHECK ADD  CONSTRAINT [FK_PhanBo_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanBo] CHECK CONSTRAINT [FK_PhanBo_Loai]
GO
ALTER TABLE [dbo].[PhanBo]  WITH CHECK ADD  CONSTRAINT [FK_PhanBo_VungPhanBo] FOREIGN KEY([VungPhanBo])
REFERENCES [dbo].[MoiTruongSong] ([MaVung])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanBo] CHECK CONSTRAINT [FK_PhanBo_VungPhanBo]
GO
