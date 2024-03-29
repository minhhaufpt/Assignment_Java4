USE [master]
GO
/****** Object:  Database [ManageVideo]    Script Date: 04/04/2023 07:47:12 PM ******/
CREATE DATABASE [ManageVideo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageVideo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENMINHHAU\MSSQL\DATA\ManageVideo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManageVideo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYENMINHHAU\MSSQL\DATA\ManageVideo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ManageVideo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageVideo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageVideo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageVideo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageVideo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageVideo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageVideo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageVideo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManageVideo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageVideo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageVideo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageVideo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageVideo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageVideo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageVideo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageVideo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageVideo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManageVideo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageVideo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageVideo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageVideo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageVideo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageVideo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageVideo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageVideo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageVideo] SET  MULTI_USER 
GO
ALTER DATABASE [ManageVideo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageVideo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageVideo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageVideo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManageVideo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManageVideo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ManageVideo] SET QUERY_STORE = OFF
GO
USE [ManageVideo]
GO
/****** Object:  User [minhhau]    Script Date: 04/04/2023 07:47:12 PM ******/
CREATE USER [minhhau] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 04/04/2023 07:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
	[LikeDate] [datetime] NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 04/04/2023 07:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
	[Emails] [nvarchar](50) NULL,
	[ShareDate] [date] NULL,
 CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/04/2023 07:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Passwords] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 04/04/2023 07:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[Tittle] [nvarchar](100) NOT NULL,
	[Poster] [nvarchar](50) NULL,
	[Views] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (1, 1, 5, CAST(N'2023-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (2, 3, 5, CAST(N'2023-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (4, 5, 7, CAST(N'2023-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (5, 6, 4, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (6, 8, 8, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (7, 9, 9, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (8, 8, 4, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (9, 8, 10, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (10, 9, 8, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (12, 9, 7, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (13, 1, 6, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (14, 1, 7, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (15, 3, 8, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (16, 3, 9, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (17, 5, 10, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (18, 5, 8, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (20, 8, 7, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (21, 8, 6, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorite] ([Id], [UserId], [VideoId], [LikeDate]) VALUES (22, 5, 9, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
GO
SET IDENTITY_INSERT [dbo].[Share] ON 

INSERT [dbo].[Share] ([Id], [UserId], [VideoId], [Emails], [ShareDate]) VALUES (2, 1, 5, NULL, CAST(N'2023-12-06' AS Date))
INSERT [dbo].[Share] ([Id], [UserId], [VideoId], [Emails], [ShareDate]) VALUES (3, 3, 6, NULL, CAST(N'2023-12-06' AS Date))
INSERT [dbo].[Share] ([Id], [UserId], [VideoId], [Emails], [ShareDate]) VALUES (6, 6, 5, NULL, CAST(N'2023-12-06' AS Date))
SET IDENTITY_INSERT [dbo].[Share] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (1, N'minhhau', N'123', N'haunguyenvn2k3@gmail.com', N'Nguyễn Minh Hậu', 1)
INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (3, N'admin', N'1234', N'admin@gmail.com', N'Nguyễn Minh Hậu', 1)
INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (5, N'nhanvien', N'1234', N'ngochoa@gmail.com', N'Nguyễn Ngọc Ánh Hoa', 1)
INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (6, N'krito', N'1234', N'wibu@gmail.com', N'Trịnh Trần Bảo Minh', 0)
INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (8, N'anhhoa', N'1234', N'anhhoa123@gmail.com', N'Nguyễn Ngọc Ánh Hoa', 0)
INSERT [dbo].[Users] ([Id], [Username], [Passwords], [Email], [Fullname], [isAdmin]) VALUES (9, N'lanhuong', N'1234', N'huong@gmail.com', N'Nguyễn Thị Lan Hương', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (4, N'https://www.youtube.com/watch?v=lcLvrF0FKjI&list=RDlcLvrF0FKjI&start_radio=1', N'ĐÂU CÒN ĐÂY | LEE KEN x NAL | OFFICIAL MUSIC VIDEO', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (5, N'https://www.youtube.com/watch?v=zd66fekPTmg&list=RDlcLvrF0FKjI&index=2', N'Trót Trao Duyên - NB3 Hoài Bảo | OFFICIAL MUSIC VIDEO', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (6, N'https://www.youtube.com/watch?v=G2iaxsilkng&list=RDlcLvrF0FKjI&index=3', N'Khuất Lối - H-Kray | Official Lyrics Video', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (7, N'https://www.youtube.com/watch?v=P3h_HY5QEas&list=RDlcLvrF0FKjI&index=5', N'Đóa Quỳnh Lan ( Htrol Remix ) H2k ft Yuni Boo | Nhạc EDM Tiktok Remix Gây Nghiện 2020 Hay Nhất !', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (8, N'https://www.youtube.com/watch?v=njQz2MaorFY&list=RDlcLvrF0FKjI&index=6', N'THAY LÒNG - NAL x TVK x Truzg | OFFICIAL MUSIC VIDEO LYRICS | TẠM BIẾT NHÉ NGƯỜI ANH YÊU :(', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (9, N'https://www.youtube.com/watch?v=KFJn2qcQ8C0&list=RDlcLvrF0FKjI&index=8', N'ÉP DUYÊN - YUNIBOO ft NAM ANH | LONG NÓN LÁ ft KAYDEE COVER', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (10, N'https://www.youtube.com/watch?v=wJ4w8L8GCHk&list=RDlcLvrF0FKjI&index=9', N'♬CÂU HỨA CHƯA VẸN TRÒN - PHÁT HUY T4 x HOÀNG GREEN || OFFICIAL MUSIC VIDEO', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (11, N'https://www.youtube.com/watch?v=aMMZRIU46lI&list=RDlcLvrF0FKjI&index=11', N'♬ PHẬN DUYÊN LỠ LÀNG - PHÁT HUY T4 X TRUZG | OFFICIAL MUSIC VIDEO', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (12, N'https://www.youtube.com/watch?v=gxU-5B-nFnU&list=RDlcLvrF0FKjI&index=12', N'♬ THÊ LƯƠNG - PHÚC CHINH ( OFFICIAL LYRIC VIDEO )', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (13, N'https://www.youtube.com/watch?v=kqOybgUwTGY&list=RDlcLvrF0FKjI&index=13', N'THUYỀN QUYÊN | DIỆU KIÊN - OFFICIAL MV', NULL, 100, NULL, 1)
INSERT [dbo].[Video] ([Id], [Link], [Tittle], [Poster], [Views], [Description], [Active]) VALUES (15, N'https://www.youtube.com/watch?v=OLI_-W7Qoq4&list=RDlcLvrF0FKjI&index=19', N'Tránh Duyên ( Htrol Remix ) Đình Dũng | Nhạc Gây Nghiện 2019', NULL, 100, NULL, 1)
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Video]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_User]
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD  CONSTRAINT [FK_Share_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO
ALTER TABLE [dbo].[Share] CHECK CONSTRAINT [FK_Share_Video]
GO
/****** Object:  StoredProcedure [dbo].[spFavoriteByYear]    Script Date: 04/04/2023 07:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spFavoriteByYear](@year INT)
AS
BEGIN
SELECT
v.Tittle AS 'group',
count(f.Id) AS 'likes',
max(f.LikeDate) AS 'newest',
min(f.LikeDate) AS 'oldest'
FROM Favorite f JOIN Video v ON v.Id = f.VideoId
WHERE year(f.LikeDate) = @year
GROUP BY v.Tittle
END
GO
USE [master]
GO
ALTER DATABASE [ManageVideo] SET  READ_WRITE 
GO
