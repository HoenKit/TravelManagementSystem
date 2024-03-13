USE [master]
GO
/****** Object:  Database [TravelManagementSystem]    Script Date: 3/13/2024 7:40:01 PM ******/
CREATE DATABASE [TravelManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TravelManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TravelManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TravelManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TravelManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TravelManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [TravelManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TravelManagementSystem]
GO
/****** Object:  Table [dbo].[ActivitySchedules]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitySchedules](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[day_number] [int] NULL,
	[activity_name] [nvarchar](255) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[location] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[payment_date] [date] NULL,
	[payment_method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[user_id] [int] NULL,
	[booking_date] [date] NULL,
	[number_of_people] [int] NULL,
	[total_price] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[hotel_name] [nvarchar](255) NULL,
	[location_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelTour]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelTour](
	[hotel_id] [int] NOT NULL,
	[tour_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC,
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[restaurant_id] [int] IDENTITY(1,1) NOT NULL,
	[restaurant_name] [nvarchar](255) NULL,
	[location_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantTour]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantTour](
	[restaurant_id] [int] NOT NULL,
	[tour_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurant_id] ASC,
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[content] [nvarchar](max) NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourDates]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourDates](
	[tour_date_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[current_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourLocation]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourLocation](
	[tour_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[tour_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[tour_price] [decimal](18, 2) NULL,
	[image_url] [nvarchar](max) NULL,
	[employee_id] [int] NULL,
	[start_location] [nvarchar](255) NULL,
	[max_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourTransportation]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourTransportation](
	[tour_id] [int] NOT NULL,
	[transportation_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[transportation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportations]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportations](
	[transportation_id] [int] IDENTITY(1,1) NOT NULL,
	[transportation_name] [nvarchar](255) NULL,
	[image_url] [nvarchar](max) NULL,
	[departure_time] [time](7) NULL,
	[return_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[transportation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/13/2024 7:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](15) NULL,
	[role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivitySchedules]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[HotelTour]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotels] ([hotel_id])
GO
ALTER TABLE [dbo].[HotelTour]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[RestaurantTour]  WITH CHECK ADD FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[Restaurants] ([restaurant_id])
GO
ALTER TABLE [dbo].[RestaurantTour]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[TourDates]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[TourLocation]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[TourLocation]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[TourTransportation]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[TourTransportation]  WITH CHECK ADD FOREIGN KEY([transportation_id])
REFERENCES [dbo].[Transportations] ([transportation_id])
GO
USE [master]
GO
ALTER DATABASE [TravelManagementSystem] SET  READ_WRITE 
GO
-- Thêm cột status vào bảng Users
ALTER TABLE [dbo].[Users]
ADD [status] NVARCHAR(50) NULL;

-- Thêm cột status vào bảng Bookings
ALTER TABLE [dbo].[Bookings]
ADD [status] NVARCHAR(50) NULL;

-- Tạo bảng Customer
CREATE TABLE [dbo].[Customer](
    [customer_id] [int] IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NULL,
    [phone] NVARCHAR(15) NULL,
    [id_card] NVARCHAR(255) NULL,
    [booking_id] INT NULL,
    PRIMARY KEY CLUSTERED 
    (
        [customer_id] ASC
    ) ON [PRIMARY]
);

-- Tạo ràng buộc ngoại khoá cho booking_id trong bảng Customer
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT FK_Customer_Bookings FOREIGN KEY (booking_id) REFERENCES [dbo].[Bookings]([booking_id]);