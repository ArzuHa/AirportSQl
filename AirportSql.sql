USE [Airport]
GO
/****** Object:  Table [dbo].[Airplanes]    Script Date: 08.10.2019 13:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplanes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Airplanes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 08.10.2019 13:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 08.10.2019 13:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AirplaneId] [int] NOT NULL,
	[AirplaneRegister] [datetime] NOT NULL,
	[AirplaneTecnicalSupportDate] [datetime] NULL,
	[TecnicalSupportProblem] [nvarchar](300) NULL,
	[FlightId] [int] NOT NULL,
	[FlightFrom] [nvarchar](100) NOT NULL,
	[FlightTo] [nvarchar](100) NOT NULL,
	[DelayedFlight] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWairport]    Script Date: 08.10.2019 13:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VWairport] as
SELECT  Airport.[Id]
      ,[AirplaneId]
	  ,Airplanes.[Name] as AirplaneName
      ,[AirplaneRegister]
      ,[AirplaneTecnicalSupportDate]
      ,[TecnicalSupportProblem]
      ,[FlightId]
	 , flights.[Name] as FlightName
      ,[FlightFrom] 
      ,[FlightTo]
      ,[DelayedFlight]
  FROM [dbo].[Airport]
join airplanes on airport.AirplaneId=Airplanes.id
join flights on airport.FlightId=Flights.id
GO
SET IDENTITY_INSERT [dbo].[Airplanes] ON 
GO
INSERT [dbo].[Airplanes] ([Id], [Name]) VALUES (1, N'Airbus A320')
GO
INSERT [dbo].[Airplanes] ([Id], [Name]) VALUES (2, N'Airbus A380')
GO
INSERT [dbo].[Airplanes] ([Id], [Name]) VALUES (3, N'Boeing 737')
GO
INSERT [dbo].[Airplanes] ([Id], [Name]) VALUES (4, N'Boeing 747')
GO
SET IDENTITY_INSERT [dbo].[Airplanes] OFF
GO
SET IDENTITY_INSERT [dbo].[Airport] ON 
GO
INSERT [dbo].[Airport] ([Id], [AirplaneId], [AirplaneRegister], [AirplaneTecnicalSupportDate], [TecnicalSupportProblem], [FlightId], [FlightFrom], [FlightTo], [DelayedFlight]) VALUES (1, 1, CAST(N'2019-02-02T15:10:00.000' AS DateTime), NULL, NULL, 1, N'Baku', N'Moscow', NULL)
GO
INSERT [dbo].[Airport] ([Id], [AirplaneId], [AirplaneRegister], [AirplaneTecnicalSupportDate], [TecnicalSupportProblem], [FlightId], [FlightFrom], [FlightTo], [DelayedFlight]) VALUES (2, 2, CAST(N'2019-02-03T16:45:00.000' AS DateTime), CAST(N'2019-02-03T16:00:00.000' AS DateTime), N'Good', 2, N'Baku', N'Istanbul', NULL)
GO
SET IDENTITY_INSERT [dbo].[Airport] OFF
GO
SET IDENTITY_INSERT [dbo].[Flights] ON 
GO
INSERT [dbo].[Flights] ([Id], [Name]) VALUES (1, N'Daxili')
GO
INSERT [dbo].[Flights] ([Id], [Name]) VALUES (2, N'Xarici')
GO
SET IDENTITY_INSERT [dbo].[Flights] OFF
GO
