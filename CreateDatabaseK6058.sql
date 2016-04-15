<<<<<<< HEAD
/****** Skript to Create K6058 -database. Copyright (c) k6058@student.jamk.fi ******/
USE [master]
GO

/****** Create database ******/

CREATE DATABASE [K6058]
GO

/****** Use created database ******/

USE [K6058]
GO

/****** Create Users-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](254) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[IsAdmin] [bit] NOT NULL CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)),
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Create Categories-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categories](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[CategoryLevel] [int] NULL,
	[OwnerId] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](254) NULL,
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Create Payments-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Payments](
	[PaymentId] [uniqueidentifier] NOT NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[SubCategoryId] [uniqueidentifier] NULL,
	[PayorName] [nvarchar](254) NOT NULL,
	[DueDate] [datetime] NULL,
	[Paid] [datetime] NOT NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[Amount] [float] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO

ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Categories]
GO

ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO


/****** Insert test data to Users-table ******/

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Mika', N'Mähönen', N'k6058@student.jamk.fi', 'k6058', N'hLFFIxRat2t1LZyfTk0rraK8ncguQ/V4XMDP9XuUTBk=', N'Harjoitustyön tekijä: k6058@student.jamk.fi', 1, CAST(N'2016-03-19 12:31:38.363' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:17:23.047' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'8b42ad58-8b99-47bb-b0f6-30dca7a812c4', N'Jaska', N'Jokunen', NULL, NULL, NULL, N'Sarjakuvasankari', 0, CAST(N'2016-03-29 21:49:03.937' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:17:33.283' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 20:26:52.690' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006')
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b9d690b2-96d6-491e-9f16-5df386af80c2', N'Oiva', N'Oppilas', NULL, NULL, NULL, N'opiskelija', 0, CAST(N'2016-03-29 21:56:26.533' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-13 13:10:10.833' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elina', N'Mähönen', N'elina.mahonen@hotmail.com', NULL, N'+fE26Mpb/5gAQGp9gSg0YPKglwvOxnXBxc1VXkyKor0=', N'Harjoitustyön tekijän aviovaimo', 0, CAST(N'2016-03-19 20:11:31.780' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 17:40:43.233' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO

/****** Insert test data to Categories-table ******/

INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'32c8b3dc-e659-407c-844d-0254fa547f1b', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Ruoka', N'Ruokamenojen pääkategoria', CAST(N'2016-04-11 17:07:25.793' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'f940532f-ab7b-4399-a98a-09cf97ef30db', N'32c8b3dc-e659-407c-844d-0254fa547f1b', 2, N'00000000-0000-0000-0000-000000000000', N'Ravintolat', N'', CAST(N'2016-04-11 17:07:45.060' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'58f376e1-6312-4af6-956a-0cfad9afda15', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Polttoaineet', N'Autoilun kulujen polttoaineiden alakategoria', CAST(N'2016-03-22 16:25:14.823' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:44.227' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b4614566-e96d-4077-b5e9-183768604e69', N'c478fd85-533a-455f-8520-db95d77e791d', 2, N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elinan alakategoria', N'Vain Elinalle näkyvä alakategoria', CAST(N'2016-04-12 18:55:25.830' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'78963c4d-d6e3-4c41-b10c-1dd223faebba', N'00000000-0000-0000-0000-000000000000', 1, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Autoilu', N'Autoilun kulujen pääkategoria', CAST(N'2016-03-21 17:09:41.063' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Vastikkeet', N'', CAST(N'2016-03-30 21:42:09.263' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:43:04.257' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'090585c7-36dc-400a-bb71-3b0b113fe487', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Vakuutukset', N'Autoilun kulujen vakuutusten alakategoria', CAST(N'2016-03-22 16:26:52.647' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:33.700' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'21412324-f2d0-4839-859e-491d782fe81c', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Verot', N'Autoilun kulujen verojen alakategoria', CAST(N'2016-03-22 16:27:10.417' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:25.110' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'61ea2c25-fe19-48c5-963d-4b134f2c133a', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Vaatteet', N'', CAST(N'2016-03-30 17:23:06.483' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:45:53.023' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'cf8ec217-f391-4ef7-96f5-54536772af99', N'0e2d473c-c418-48ab-8f48-ec476526d9a3', 2, N'00000000-0000-0000-0000-000000000000', N'Uinti', N'', CAST(N'2016-03-30 18:18:37.877' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:51:32.117' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'dc4d9080-bfdd-446b-911d-6120cb1e82bf', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Vesimaksu', N'', CAST(N'2016-03-30 21:43:54.127' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:08:39.363' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'8568403b-5b5a-4a65-b635-65e6299f9c77', N'61ea2c25-fe19-48c5-963d-4b134f2c133a', 2, N'00000000-0000-0000-0000-000000000000', N'Uusien hankinta', N'', CAST(N'2016-04-12 11:46:55.030' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:47:38.303' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'c89ac7b9-da49-4c0f-91d6-b5efcdfdfafa', N'61ea2c25-fe19-48c5-963d-4b134f2c133a', 2, N'00000000-0000-0000-0000-000000000000', N'Korjaukset', N'Ompelutyöt', CAST(N'2016-04-12 11:45:28.973' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'2075d991-f275-4cc4-b7da-cb8418916b26', N'32c8b3dc-e659-407c-844d-0254fa547f1b', 2, N'00000000-0000-0000-0000-000000000000', N'Pikaruokalat', N'', CAST(N'2016-04-11 17:08:06.297' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'c478fd85-533a-455f-8520-db95d77e791d', N'00000000-0000-0000-0000-000000000000', 1, N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elinan kategoria', N'Vain Elinalle näkyvä pääkategoria!', CAST(N'2016-04-12 18:54:37.120' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', CAST(N'2016-04-12 18:54:56.210' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'16bc3aa4-8503-4bef-ad00-ec0bcdd71cc2', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Huollot', N'Autoilun kulujen huoltojen alakategoria', CAST(N'2016-03-22 16:24:17.610' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:48.650' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'0e2d473c-c418-48ab-8f48-ec476526d9a3', N'00000000-0000-0000-0000-000000000000', 1, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Harrastukset', N'Harrastusten kulujen pääkategoria', CAST(N'2016-03-21 17:11:24.917' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'525afc55-5381-4d4b-a057-ef2f0ab19a52', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Renkaat', N'Autoilun kulujen renkaiden alakategoria', CAST(N'2016-03-22 16:26:29.043' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:39.647' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b7225c73-dc81-4c34-892a-f805c001035d', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Sähkölasku', N'', CAST(N'2016-03-30 21:42:48.873' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:43:10.833' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b78dac2d-92e4-48fc-8d03-fc27e8ec1905', N'0e2d473c-c418-48ab-8f48-ec476526d9a3', 2, N'00000000-0000-0000-0000-000000000000', N'Kuntosali', N'', CAST(N'2016-03-30 18:19:19.390' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 18:19:28.390' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Asuminen', N'Asumisen kulujen pääkategoria', CAST(N'2016-03-21 17:11:08.193' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-02 14:16:24.750' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL)
GO

/****** Insert test data to Payments-table ******/

INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'f63a44f4-aa10-447a-989e-7934671bdaeb', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'b7225c73-dc81-4c34-892a-f805c001035d', N'Jyväskylän energia', CAST(N'2016-03-28 00:00:00.000' AS DateTime), CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 21, N'Pelkkä siirtomaksu?', CAST(N'2016-03-30 22:10:02.180' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'1add848c-3a76-4a1c-9d30-8a3c1394c902', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), NULL, 220, N'', CAST(N'2016-04-02 14:31:58.777' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:44.357' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'80a211c4-5282-4ac0-b75e-935f26dfff4f', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', NULL, N'OK Auto', CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-03-01 00:00:00.000' AS DateTime), NULL, 581, N'Piti vaihtaa samalla kuluneet jarrulevyt ja -palat', CAST(N'2016-03-22 17:40:55.580' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 21:24:14.823' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'70bae0f8-78fa-484d-aa75-a95594077ac5', N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'c478fd85-533a-455f-8520-db95d77e791d', N'b4614566-e96d-4077-b5e9-183768604e69', N'YTHS', NULL, CAST(N'2016-04-12 00:00:00.000' AS DateTime), NULL, 40, N'', CAST(N'2016-04-12 19:07:43.993' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', CAST(N'2016-04-12 19:12:54.483' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'834ca155-a919-4c6d-acd0-d0c5fd5046b3', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), NULL, 220, N'', CAST(N'2016-04-02 14:30:34.437' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:53.987' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [ReferenceNumber], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'20742181-3f8f-44ae-86c1-d97bfe3acb12', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), NULL, 220, N'', CAST(N'2016-04-02 14:31:23.567' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:49.090' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
=======
/****** Skript to Create K6058 -database. Copyright (c) k6058@student.jamk.fi ******/
USE [master]
GO

/****** Create database ******/

CREATE DATABASE [K6058]
GO

/****** Use created database ******/

USE [K6058]
GO

/****** Create Users-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](254) NULL,
	[Password] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[IsAdmin] [bit] NOT NULL CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)),
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Create Categories-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categories](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[CategoryLevel] [int] NULL,
	[OwnerId] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](254) NULL,
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Create Payments-table ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Payments](
	[PaymentId] [uniqueidentifier] NOT NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[SubCategoryId] [uniqueidentifier] NULL,
	[PayorName] [nvarchar](254) NOT NULL,
	[DueDate] [datetime] NULL,
	[Paid] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[CreatorId] [uniqueidentifier] NOT NULL,
	[Modified] [datetime] NULL,
	[ModifierId] [uniqueidentifier] NULL,
	[Archived] [datetime] NULL,
	[ArchiverId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO

ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Categories]
GO

ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO


/****** Insert test data to Users-table ******/

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Mika', N'Mähönen', N'k6058@student.jamk.fi', N'hLFFIxRat2t1LZyfTk0rraK8ncguQ/V4XMDP9XuUTBk=', N'Harjoitustyön tekijä: k6058@student.jamk.fi', 1, CAST(N'2016-03-19 12:31:38.363' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:17:23.047' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'8b42ad58-8b99-47bb-b0f6-30dca7a812c4', N'Jaska', N'Jokunen', N'', NULL, N'Sarjakuvasankari', 0, CAST(N'2016-03-29 21:49:03.937' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:17:33.283' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 20:26:52.690' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006')
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b9d690b2-96d6-491e-9f16-5df386af80c2', N'Oiva', N'Oppilas', N'', NULL, N'opiskelija', 0, CAST(N'2016-03-29 21:56:26.533' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-13 13:10:10.833' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [Notes], [IsAdmin], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elina', N'Mähönen', N'elina.mahonen@hotmail.com', N'+fE26Mpb/5gAQGp9gSg0YPKglwvOxnXBxc1VXkyKor0=', N'Harjoitustyön tekijän aviovaimo', 0, CAST(N'2016-03-19 20:11:31.780' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 17:40:43.233' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO

/****** Insert test data to Categories-table ******/

INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'32c8b3dc-e659-407c-844d-0254fa547f1b', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Ruoka', N'Ruokamenojen pääkategoria', CAST(N'2016-04-11 17:07:25.793' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'f940532f-ab7b-4399-a98a-09cf97ef30db', N'32c8b3dc-e659-407c-844d-0254fa547f1b', 2, N'00000000-0000-0000-0000-000000000000', N'Ravintolat', N'', CAST(N'2016-04-11 17:07:45.060' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'58f376e1-6312-4af6-956a-0cfad9afda15', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Polttoaineet', N'Autoilun kulujen polttoaineiden alakategoria', CAST(N'2016-03-22 16:25:14.823' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:44.227' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b4614566-e96d-4077-b5e9-183768604e69', N'c478fd85-533a-455f-8520-db95d77e791d', 2, N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elinan alakategoria', N'Vain Elinalle näkyvä alakategoria', CAST(N'2016-04-12 18:55:25.830' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'78963c4d-d6e3-4c41-b10c-1dd223faebba', N'00000000-0000-0000-0000-000000000000', 1, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Autoilu', N'Autoilun kulujen pääkategoria', CAST(N'2016-03-21 17:09:41.063' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Vastikkeet', N'', CAST(N'2016-03-30 21:42:09.263' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:43:04.257' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'090585c7-36dc-400a-bb71-3b0b113fe487', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Vakuutukset', N'Autoilun kulujen vakuutusten alakategoria', CAST(N'2016-03-22 16:26:52.647' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:33.700' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'21412324-f2d0-4839-859e-491d782fe81c', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Verot', N'Autoilun kulujen verojen alakategoria', CAST(N'2016-03-22 16:27:10.417' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:25.110' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'61ea2c25-fe19-48c5-963d-4b134f2c133a', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Vaatteet', N'', CAST(N'2016-03-30 17:23:06.483' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:45:53.023' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'cf8ec217-f391-4ef7-96f5-54536772af99', N'0e2d473c-c418-48ab-8f48-ec476526d9a3', 2, N'00000000-0000-0000-0000-000000000000', N'Uinti', N'', CAST(N'2016-03-30 18:18:37.877' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:51:32.117' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'dc4d9080-bfdd-446b-911d-6120cb1e82bf', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Vesimaksu', N'', CAST(N'2016-03-30 21:43:54.127' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:08:39.363' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'8568403b-5b5a-4a65-b635-65e6299f9c77', N'61ea2c25-fe19-48c5-963d-4b134f2c133a', 2, N'00000000-0000-0000-0000-000000000000', N'Uusien hankinta', N'', CAST(N'2016-04-12 11:46:55.030' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:47:38.303' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'c89ac7b9-da49-4c0f-91d6-b5efcdfdfafa', N'61ea2c25-fe19-48c5-963d-4b134f2c133a', 2, N'00000000-0000-0000-0000-000000000000', N'Korjaukset', N'Ompelutyöt', CAST(N'2016-04-12 11:45:28.973' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'2075d991-f275-4cc4-b7da-cb8418916b26', N'32c8b3dc-e659-407c-844d-0254fa547f1b', 2, N'00000000-0000-0000-0000-000000000000', N'Pikaruokalat', N'', CAST(N'2016-04-11 17:08:06.297' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'c478fd85-533a-455f-8520-db95d77e791d', N'00000000-0000-0000-0000-000000000000', 1, N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'Elinan kategoria', N'Vain Elinalle näkyvä pääkategoria!', CAST(N'2016-04-12 18:54:37.120' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', CAST(N'2016-04-12 18:54:56.210' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'16bc3aa4-8503-4bef-ad00-ec0bcdd71cc2', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Huollot', N'Autoilun kulujen huoltojen alakategoria', CAST(N'2016-03-22 16:24:17.610' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:48.650' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 21:02:12.477' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006')
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'0e2d473c-c418-48ab-8f48-ec476526d9a3', N'00000000-0000-0000-0000-000000000000', 1, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Harrastukset', N'Harrastusten kulujen pääkategoria', CAST(N'2016-03-21 17:11:24.917' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'525afc55-5381-4d4b-a057-ef2f0ab19a52', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', 2, N'627788aa-1a43-4f36-aaa0-1498d816c006', N'Renkaat', N'Autoilun kulujen renkaiden alakategoria', CAST(N'2016-03-22 16:26:29.043' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:09:39.647' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b7225c73-dc81-4c34-892a-f805c001035d', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', 2, N'00000000-0000-0000-0000-000000000000', N'Sähkölasku', N'', CAST(N'2016-03-30 21:42:48.873' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 21:43:10.833' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'b78dac2d-92e4-48fc-8d03-fc27e8ec1905', N'0e2d473c-c418-48ab-8f48-ec476526d9a3', 2, N'00000000-0000-0000-0000-000000000000', N'Kuntosali', N'', CAST(N'2016-03-30 18:19:19.390' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-03-30 18:19:28.390' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [ParentId], [CategoryLevel], [OwnerId], [Name], [Description], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'00000000-0000-0000-0000-000000000000', 1, N'00000000-0000-0000-0000-000000000000', N'Asuminen', N'Asumisen kulujen pääkategoria', CAST(N'2016-03-21 17:11:08.193' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-02 14:16:24.750' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL)
GO

/****** Insert test data to Payments-table ******/

INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'f63a44f4-aa10-447a-989e-7934671bdaeb', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'b7225c73-dc81-4c34-892a-f805c001035d', N'Jyväskylän energia', CAST(N'2016-03-28 00:00:00.000' AS DateTime), CAST(N'2016-03-28 00:00:00.000' AS DateTime), 21, N'Pelkkä siirtomaksu?', CAST(N'2016-03-30 22:10:02.180' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'1add848c-3a76-4a1c-9d30-8a3c1394c902', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-04-02 00:00:00.000' AS DateTime), CAST(N'2016-04-02 00:00:00.000' AS DateTime), 220, N'', CAST(N'2016-04-02 14:31:58.777' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:44.357' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'80a211c4-5282-4ac0-b75e-935f26dfff4f', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'78963c4d-d6e3-4c41-b10c-1dd223faebba', NULL, N'OK Auto', CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-03-01 00:00:00.000' AS DateTime), 581, N'Piti vaihtaa samalla kuluneet jarrulevyt ja -palat', CAST(N'2016-03-22 17:40:55.580' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 21:24:14.823' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'70bae0f8-78fa-484d-aa75-a95594077ac5', N'3098815d-f141-4954-ad5a-ad7f9a1408b3', N'c478fd85-533a-455f-8520-db95d77e791d', N'b4614566-e96d-4077-b5e9-183768604e69', N'YTHS', NULL, CAST(N'2016-04-12 00:00:00.000' AS DateTime), 40, N'', CAST(N'2016-04-12 19:07:43.993' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', CAST(N'2016-04-12 19:12:54.483' AS DateTime), N'3098815d-f141-4954-ad5a-ad7f9a1408b3', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'834ca155-a919-4c6d-acd0-d0c5fd5046b3', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-02-02 00:00:00.000' AS DateTime), CAST(N'2016-02-02 00:00:00.000' AS DateTime), 220, N'', CAST(N'2016-04-02 14:30:34.437' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:53.987' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
GO
INSERT [dbo].[Payments] ([PaymentId], [OwnerId], [CategoryId], [SubCategoryId], [PayorName], [DueDate], [Paid], [Amount], [Notes], [Created], [CreatorId], [Modified], [ModifierId], [Archived], [ArchiverId]) VALUES (N'20742181-3f8f-44ae-86c1-d97bfe3acb12', N'627788aa-1a43-4f36-aaa0-1498d816c006', N'dca20ce5-d7a1-4d8b-87f9-fd42d8ab42c9', N'1c8ee1a1-b6e7-4fcb-9032-2e23abc65eb1', N'Taloyhtiö Oy', CAST(N'2016-03-02 00:00:00.000' AS DateTime), CAST(N'2016-03-02 00:00:00.000' AS DateTime), 220, N'', CAST(N'2016-04-02 14:31:23.567' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', CAST(N'2016-04-12 11:51:49.090' AS DateTime), N'627788aa-1a43-4f36-aaa0-1498d816c006', NULL, NULL)
>>>>>>> e594172f88d881b389a0f14a4921a6d8e078d370
GO