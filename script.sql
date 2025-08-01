USE [master]
GO
/****** Object:  Database [PRJAssignment]    Script Date: 7/21/2025 3:12:08 AM ******/
CREATE DATABASE [PRJAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRJAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRJAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRJAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJAssignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJAssignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJAssignment', N'ON'
GO
ALTER DATABASE [PRJAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJAssignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[aid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Employee]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Employee](
	[aid] [int] NOT NULL,
	[eid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Account_Employee] PRIMARY KEY CLUSTERED 
(
	[aid] ASC,
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[aid] [int] NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[aid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[did] [int] NOT NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[entrypoint] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestForLeave]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestForLeave](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NOT NULL,
	[reason] [varchar](150) NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[createdby] [int] NOT NULL,
	[processedby] [int] NULL,
	[note] [varchar](150) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_RequestForLeave] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 7/21/2025 3:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([aid], [username], [password], [displayname]) VALUES (1, N'mra', N'123', N'Mr A')
INSERT [dbo].[Account] ([aid], [username], [password], [displayname]) VALUES (2, N'msb', N'123', N'Ms B')
INSERT [dbo].[Account] ([aid], [username], [password], [displayname]) VALUES (3, N'mrc', N'123', N'Mr C')
INSERT [dbo].[Account] ([aid], [username], [password], [displayname]) VALUES (4, N'msi', N'123', N'Ms I')
GO
INSERT [dbo].[Account_Employee] ([aid], [eid], [active]) VALUES (1, 1, 1)
INSERT [dbo].[Account_Employee] ([aid], [eid], [active]) VALUES (2, 2, 1)
INSERT [dbo].[Account_Employee] ([aid], [eid], [active]) VALUES (3, 3, 1)
INSERT [dbo].[Account_Employee] ([aid], [eid], [active]) VALUES (4, 4, 1)
GO
INSERT [dbo].[Account_Role] ([aid], [rid]) VALUES (1, 1)
INSERT [dbo].[Account_Role] ([aid], [rid]) VALUES (2, 3)
INSERT [dbo].[Account_Role] ([aid], [rid]) VALUES (3, 1)
INSERT [dbo].[Account_Role] ([aid], [rid]) VALUES (4, 2)
GO
INSERT [dbo].[Department] ([did], [dname]) VALUES (1, N'Human Resources')
INSERT [dbo].[Department] ([did], [dname]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([did], [dname]) VALUES (3, N'Operations')
GO
INSERT [dbo].[Employee] ([eid], [ename], [did], [managerid]) VALUES (1, N'Mr A', 1, NULL)
INSERT [dbo].[Employee] ([eid], [ename], [did], [managerid]) VALUES (2, N'Ms B', 1, 1)
INSERT [dbo].[Employee] ([eid], [ename], [did], [managerid]) VALUES (3, N'Mr C', 2, 1)
INSERT [dbo].[Employee] ([eid], [ename], [did], [managerid]) VALUES (4, N'Ms I', 1, 3)
GO
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (1, N'Create Leave Request', N'/rfl/create')
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (2, N'View My Leave Requests', N'/rfl/own')
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (3, N'Manage All Leave Requests', N'/rfl/list')
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (4, N'Process Requests', N'/rfl/process')
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (5, N'View Agenda', N'/rfl/agenda')
INSERT [dbo].[Feature] ([fid], [description], [entrypoint]) VALUES (6, N'View Request Detail', N'/rfl/view')
GO
SET IDENTITY_INSERT [dbo].[RequestForLeave] ON 

INSERT [dbo].[RequestForLeave] ([rid], [title], [reason], [from], [to], [createdby], [processedby], [note], [status]) VALUES (8, N'Xin ngh? vi?c', N'Đi khám b?nh', CAST(N'2025-07-10' AS Date), CAST(N'2025-07-13' AS Date), 2, 1, N'Duy?t', 1)
INSERT [dbo].[RequestForLeave] ([rid], [title], [reason], [from], [to], [createdby], [processedby], [note], [status]) VALUES (9, N'Xin ngh? vi?c', N'Đi chơi ', CAST(N'2025-07-23' AS Date), CAST(N'2025-07-25' AS Date), 2, 1, N'Không', 2)
SET IDENTITY_INSERT [dbo].[RequestForLeave] OFF
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'Manager')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (2, N'Supervisor')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (3, N'Employee')
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 6)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 6)
GO
ALTER TABLE [dbo].[Account_Employee]  WITH CHECK ADD  CONSTRAINT [Account_Employee_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Account_Employee] CHECK CONSTRAINT [Account_Employee_Account]
GO
ALTER TABLE [dbo].[Account_Employee]  WITH CHECK ADD  CONSTRAINT [Account_Employee_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Account_Employee] CHECK CONSTRAINT [Account_Employee_Employee]
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [Account_Role_Account] FOREIGN KEY([aid])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [Account_Role_Account]
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [Account_Role_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [Account_Role_Role]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_Manager] FOREIGN KEY([managerid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_Manager]
GO
ALTER TABLE [dbo].[RequestForLeave]  WITH CHECK ADD  CONSTRAINT [RequestForLeave_Created] FOREIGN KEY([createdby])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[RequestForLeave] CHECK CONSTRAINT [RequestForLeave_Created]
GO
ALTER TABLE [dbo].[RequestForLeave]  WITH CHECK ADD  CONSTRAINT [RequestForLeave_Processed] FOREIGN KEY([processedby])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[RequestForLeave] CHECK CONSTRAINT [RequestForLeave_Processed]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [Role_Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [Role_Feature_Role]
GO
USE [master]
GO
ALTER DATABASE [PRJAssignment] SET  READ_WRITE 
GO
