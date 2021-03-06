USE [master]
GO
/****** Object:  Database [PINKZONE]    Script Date: 04/04/2018 8:58:42 p. m. ******/
CREATE DATABASE [PINKZONE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PINKZONE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\PINKZONE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PINKZONE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\PINKZONE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PINKZONE] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PINKZONE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PINKZONE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PINKZONE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PINKZONE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PINKZONE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PINKZONE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PINKZONE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PINKZONE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PINKZONE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PINKZONE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PINKZONE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PINKZONE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PINKZONE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PINKZONE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PINKZONE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PINKZONE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PINKZONE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PINKZONE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PINKZONE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PINKZONE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PINKZONE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PINKZONE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PINKZONE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PINKZONE] SET RECOVERY FULL 
GO
ALTER DATABASE [PINKZONE] SET  MULTI_USER 
GO
ALTER DATABASE [PINKZONE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PINKZONE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PINKZONE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PINKZONE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PINKZONE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PINKZONE', N'ON'
GO
ALTER DATABASE [PINKZONE] SET QUERY_STORE = OFF
GO
USE [PINKZONE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PINKZONE]
GO
/****** Object:  Table [dbo].[profile_picture]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile_picture](
	[photo] [varchar](max) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login_detail]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_detail](
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[username] [varchar](50) NULL,
	[i_am] [nchar](6) NULL,
	[dobdd] [nvarchar](2) NULL,
	[dobmm] [nvarchar](50) NULL,
	[dobyy] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[user_name] [varchar](50) NOT NULL,
	[password] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[MemberDetails]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MemberDetails]
as
Select user_name,first_name,last_name,photo from login l join login_detail ld on l.user_name=ld.username join profile_picture p on  l.user_name=p.username


GO
/****** Object:  Table [dbo].[message]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](max) NULL,
	[senddate] [datetime] NULL,
	[username] [varchar](50) NULL,
	[r_username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[message_Details]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[message_Details]
AS
SELECT        m.id, m.r_username, l.user_name, ld.first_name, ld.last_name, p.photo, m.message, m.senddate
FROM            dbo.login AS l INNER JOIN
                         dbo.login_detail AS ld ON l.user_name = ld.username INNER JOIN
                         dbo.profile_picture AS p ON l.user_name = p.username INNER JOIN
                         dbo.message AS m ON m.username = l.user_name AND l.user_name = m.username


GO
/****** Object:  Table [dbo].[post]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](max) NULL,
	[post] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[viewpost]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewpost]
AS
SELECT        po.id, ld.username, ld.first_name, ld.last_name, p.photo, po.post, po.date, po.img
FROM            dbo.login_detail AS ld INNER JOIN
                         dbo.profile_picture AS p ON ld.username = p.username INNER JOIN
                         dbo.post AS po ON ld.username = po.username


GO
/****** Object:  Table [dbo].[homepost]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homepost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[viewhomepost]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewhomepost]
AS
SELECT        hp.id, ld.username, ld.first_name, ld.last_name, p.photo, hp.post, hp.date
FROM            dbo.login_detail AS ld INNER JOIN
                         dbo.profile_picture AS p ON ld.username = p.username INNER JOIN
                         dbo.homepost AS hp ON ld.username = hp.username


GO
/****** Object:  Table [dbo].[act_interest]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[act_interest](
	[activities] [nvarchar](50) NULL,
	[interests] [nvarchar](50) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adlogin]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adlogin](
	[user_name] [varchar](50) NOT NULL,
	[password] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adlogin_detail]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adlogin_detail](
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[username] [varchar](50) NULL,
	[i_am] [nchar](6) NULL,
	[dobdd] [nvarchar](2) NULL,
	[dobmm] [nvarchar](20) NULL,
	[dobyy] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[albumphoto]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[albumphoto](
	[albumid] [int] NOT NULL,
	[albumname] [nvarchar](50) NULL,
	[albumphoto] [varchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[albumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[art_entertainment]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[art_entertainment](
	[music] [nvarchar](50) NULL,
	[books] [nvarchar](50) NULL,
	[movies] [nvarchar](50) NULL,
	[television] [nvarchar](50) NULL,
	[games] [nvarchar](50) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[basic_info]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[basic_info](
	[current_city] [varchar](20) NULL,
	[hometown] [varchar](20) NULL,
	[interested_in] [varchar](max) NULL,
	[languages] [varchar](max) NULL,
	[about_us] [varchar](max) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact_information]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_information](
	[emails] [nvarchar](50) NULL,
	[phones] [nvarchar](15) NULL,
	[address] [nvarchar](50) NULL,
	[city_town] [nvarchar](50) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[education_works]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[education_works](
	[employer] [varchar](20) NULL,
	[college_university] [nvarchar](50) NULL,
	[high_school] [nvarchar](50) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[friends]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friends](
	[username] [varchar](50) NULL,
	[f_username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[friends_family]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friends_family](
	[relationship_status] [varchar](20) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[photo]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photo](
	[photoid] [int] NULL,
	[photo] [varchar](max) NULL,
	[albumid] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[request]    Script Date: 04/04/2018 8:58:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[username] [varchar](50) NULL,
	[r_username] [varchar](50) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[act_interest] ([activities], [interests], [username]) VALUES (N'', N'', N'roopam')
INSERT [dbo].[act_interest] ([activities], [interests], [username]) VALUES (N'', N'', N'shagun')
INSERT [dbo].[act_interest] ([activities], [interests], [username]) VALUES (N'', N'', N'aarohi')
INSERT [dbo].[adlogin] ([user_name], [password]) VALUES (N'roopam', N'jain')
INSERT [dbo].[adlogin_detail] ([first_name], [last_name], [username], [i_am], [dobdd], [dobmm], [dobyy]) VALUES (N'roopam', N'jain', N'roopam', N'female', N'22', N'May', N'1990')
INSERT [dbo].[albumphoto] ([albumid], [albumname], [albumphoto], [location], [username]) VALUES (3, N'', N'~/siteMember/albumPhotos/roopambaby-blue-eyes-hat-2.jpg', N'', N'roopam')
INSERT [dbo].[albumphoto] ([albumid], [albumname], [albumphoto], [location], [username]) VALUES (4, N'', N'~/siteMember/albumPhotos/shagunimages (5).jpg', N'', N'shagun')
INSERT [dbo].[albumphoto] ([albumid], [albumname], [albumphoto], [location], [username]) VALUES (5, N'', N'~/siteMember/albumPhotos/shagunimages (2).jpg', N'', N'shagun')
INSERT [dbo].[art_entertainment] ([music], [books], [movies], [television], [games], [username]) VALUES (N'', N'', N'', N'', N'', N'roopam')
INSERT [dbo].[art_entertainment] ([music], [books], [movies], [television], [games], [username]) VALUES (N'', N'', N'', N'', N'', N'shagun')
INSERT [dbo].[art_entertainment] ([music], [books], [movies], [television], [games], [username]) VALUES (N'', N'', N'', N'', N'', N'aarohi')
INSERT [dbo].[basic_info] ([current_city], [hometown], [interested_in], [languages], [about_us], [username]) VALUES (N'udaipur', N'salumber', N'boys', N'hindi,English', N'', N'roopam')
INSERT [dbo].[basic_info] ([current_city], [hometown], [interested_in], [languages], [about_us], [username]) VALUES (N'Udaipur', N'Udaipur', N'boys', N'Hindi,English', N'', N'shagun')
INSERT [dbo].[basic_info] ([current_city], [hometown], [interested_in], [languages], [about_us], [username]) VALUES (N'Udaipur', N'Udaipur', N'boys', N'Hindi,English', N'', N'aarohi')
INSERT [dbo].[contact_information] ([emails], [phones], [address], [city_town], [username]) VALUES (N'roopamjain01@gmail.com', N'9468967574', N'gandhi chowk salumber', N'udaipur', N'roopam')
INSERT [dbo].[contact_information] ([emails], [phones], [address], [city_town], [username]) VALUES (N'Shagun@gmail.com', N'9414726070', N'', N'', N'shagun')
INSERT [dbo].[contact_information] ([emails], [phones], [address], [city_town], [username]) VALUES (N'aarohi@gmail.com', N'9468704160', N'Goverdhan vilas', N'Udaipur', N'aarohi')
INSERT [dbo].[education_works] ([employer], [college_university], [high_school], [username]) VALUES (N'', N'techno india njr institute of technology', N'government girls ', N'roopam')
INSERT [dbo].[education_works] ([employer], [college_university], [high_school], [username]) VALUES (N'', N'techo', N'dps', N'shagun')
INSERT [dbo].[education_works] ([employer], [college_university], [high_school], [username]) VALUES (N'', N'', N'Dps', N'aarohi')
INSERT [dbo].[friends_family] ([relationship_status], [username]) VALUES (N'single', N'roopam')
INSERT [dbo].[friends_family] ([relationship_status], [username]) VALUES (N'single', N'shagun')
INSERT [dbo].[friends_family] ([relationship_status], [username]) VALUES (N'single', N'aarohi')
SET IDENTITY_INSERT [dbo].[homepost] ON 

INSERT [dbo].[homepost] ([id], [post], [date], [username]) VALUES (41, N'hi....;
 I m Roopam Jain', CAST(N'2012-05-11T18:57:02.737' AS DateTime), N'roopam')
INSERT [dbo].[homepost] ([id], [post], [date], [username]) VALUES (44, N'hi.....', CAST(N'2012-05-12T09:58:13.827' AS DateTime), N'shagun')
INSERT [dbo].[homepost] ([id], [post], [date], [username]) VALUES (43, N'All the best......; All dear friends', CAST(N'2012-05-11T19:00:23.080' AS DateTime), N'aarohi ')
SET IDENTITY_INSERT [dbo].[homepost] OFF
INSERT [dbo].[login] ([user_name], [password]) VALUES (N'aarohi', N'jain')
INSERT [dbo].[login] ([user_name], [password]) VALUES (N'roopam', N'jain')
INSERT [dbo].[login] ([user_name], [password]) VALUES (N'shagun', N'jain')
INSERT [dbo].[login_detail] ([first_name], [last_name], [username], [i_am], [dobdd], [dobmm], [dobyy]) VALUES (N'roopam', N'jain', N'roopam', N'female', N'22', N'May', N'1990')
INSERT [dbo].[login_detail] ([first_name], [last_name], [username], [i_am], [dobdd], [dobmm], [dobyy]) VALUES (N'shagun', N'jain', N'shagun', N'female', N'19', N'January', N'2004')
INSERT [dbo].[login_detail] ([first_name], [last_name], [username], [i_am], [dobdd], [dobmm], [dobyy]) VALUES (N'aarohi', N'Jain', N'aarohi', N'female', N'18', N'May', N'2005')
SET IDENTITY_INSERT [dbo].[message] ON 

INSERT [dbo].[message] ([id], [message], [senddate], [username], [r_username]) VALUES (31, N'hello shagun', CAST(N'2012-05-16T13:11:18.383' AS DateTime), N'ronak', N'shagun')
SET IDENTITY_INSERT [dbo].[message] OFF
INSERT [dbo].[photo] ([photoid], [photo], [albumid]) VALUES (5, N'~/siteMember/albumPhotos/shagunimages (5).jpg', 4)
INSERT [dbo].[photo] ([photoid], [photo], [albumid]) VALUES (4, N'~/siteMember/albumPhotos/roopambaby-blue-eyes-hat-2.jpg', 3)
INSERT [dbo].[photo] ([photoid], [photo], [albumid]) VALUES (6, N'~/siteMember/albumPhotos/shagunimages (2).jpg', 5)
INSERT [dbo].[photo] ([photoid], [photo], [albumid]) VALUES (7, N'~/siteMember/Photos/shaguna1.PNG', 4)
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [img], [post], [date], [username]) VALUES (23, N'~/siteMember/postphoto/shagunnature_0011.jpg', N'hi.......;
ye pic aabu ki hai', CAST(N'2012-05-12T09:58:43.957' AS DateTime), N'shagun')
SET IDENTITY_INSERT [dbo].[post] OFF
INSERT [dbo].[profile_picture] ([photo], [username]) VALUES (N'~/ProfilePic/roopama1.PNG', N'roopam')
INSERT [dbo].[profile_picture] ([photo], [username]) VALUES (N'~/ProfilePic/shagunbaby-blue-eyes-hat-2.jpg', N'shagun')
INSERT [dbo].[profile_picture] ([photo], [username]) VALUES (N'~/ProfilePic/aarohiimages (3).jpg', N'aarohi')
INSERT [dbo].[request] ([username], [r_username]) VALUES (N'roopam', N'aarohi')
INSERT [dbo].[request] ([username], [r_username]) VALUES (N'aarohi', N'shagun')
ALTER TABLE [dbo].[act_interest]  WITH CHECK ADD  CONSTRAINT [FK__act_interest__usern__1A14E395] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[act_interest] CHECK CONSTRAINT [FK__act_interest__usern__1A14E395]
GO
ALTER TABLE [dbo].[adlogin_detail]  WITH CHECK ADD  CONSTRAINT [FK__adlogin_d__usern__07C12930] FOREIGN KEY([username])
REFERENCES [dbo].[adlogin] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[adlogin_detail] CHECK CONSTRAINT [FK__adlogin_d__usern__07C12930]
GO
ALTER TABLE [dbo].[albumphoto]  WITH CHECK ADD  CONSTRAINT [FK__albumphoto__usern__3B75D760] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[albumphoto] CHECK CONSTRAINT [FK__albumphoto__usern__3B75D760]
GO
ALTER TABLE [dbo].[art_entertainment]  WITH CHECK ADD  CONSTRAINT [FK__art_entertainment__usern__0F975522] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[art_entertainment] CHECK CONSTRAINT [FK__art_entertainment__usern__0F975522]
GO
ALTER TABLE [dbo].[basic_info]  WITH NOCHECK ADD  CONSTRAINT [FK__basic_info__usern__47DBAE45] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[basic_info] CHECK CONSTRAINT [FK__basic_info__usern__47DBAE45]
GO
ALTER TABLE [dbo].[contact_information]  WITH CHECK ADD  CONSTRAINT [FK__contact_info__usern__1367E606] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contact_information] CHECK CONSTRAINT [FK__contact_info__usern__1367E606]
GO
ALTER TABLE [dbo].[education_works]  WITH CHECK ADD  CONSTRAINT [FK__education_work__usern__0DAF0CB0] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[education_works] CHECK CONSTRAINT [FK__education_work__usern__0DAF0CB0]
GO
ALTER TABLE [dbo].[friends_family]  WITH CHECK ADD  CONSTRAINT [FK_friends_family_login] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[friends_family] CHECK CONSTRAINT [FK_friends_family_login]
GO
ALTER TABLE [dbo].[homepost]  WITH CHECK ADD  CONSTRAINT [FK__homepost__userna__7C4F7684] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[homepost] CHECK CONSTRAINT [FK__homepost__userna__7C4F7684]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_login] FOREIGN KEY([user_name])
REFERENCES [dbo].[login] ([user_name])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_login]
GO
ALTER TABLE [dbo].[login_detail]  WITH CHECK ADD  CONSTRAINT [FK__login_detail__usern__68487DD7] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[login_detail] CHECK CONSTRAINT [FK__login_detail__usern__68487DD7]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK__message__r_usern__0C85DE4D] FOREIGN KEY([r_username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK__message__r_usern__0C85DE4D]
GO
ALTER TABLE [dbo].[photo]  WITH CHECK ADD  CONSTRAINT [FK__photo__albumid__628FA481] FOREIGN KEY([albumid])
REFERENCES [dbo].[albumphoto] ([albumid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[photo] CHECK CONSTRAINT [FK__photo__albumid__628FA481]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK__post__username__7A672E12] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK__post__username__7A672E12]
GO
ALTER TABLE [dbo].[profile_picture]  WITH CHECK ADD  CONSTRAINT [FK__profile_picture__usern__15502E78] FOREIGN KEY([username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profile_picture] CHECK CONSTRAINT [FK__profile_picture__usern__15502E78]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK__request__r_usern__45F365D3] FOREIGN KEY([r_username])
REFERENCES [dbo].[login] ([user_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK__request__r_usern__45F365D3]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[5] 4[56] 2[21] 3) )"
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
         Begin Table = "l"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ld"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 197
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 267
               Right = 416
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
      Begin ColumnWidths = 9
         Width = 284
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
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'message_Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'message_Details'
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
         Begin Table = "ld"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hp"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 231
               Right = 416
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
      Begin ColumnWidths = 9
         Width = 284
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
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewhomepost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewhomepost'
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
         Begin Table = "ld"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "po"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 231
               Right = 416
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
      Begin ColumnWidths = 9
         Width = 284
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
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewpost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewpost'
GO
USE [master]
GO
ALTER DATABASE [PINKZONE] SET  READ_WRITE 
GO
