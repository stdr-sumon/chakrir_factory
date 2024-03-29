/****** Object:  Table [dbo].[tbl_Company_AddressInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company_AddressInfo](
	[Cmp_ID] [int] NOT NULL,
	[Cmp_Address] [varchar](120) NOT NULL,
	[Cmp_City] [int] NOT NULL,
	[Cmp_PhoneNumber] [bigint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Company_BasicInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company_BasicInfo](
	[Cmp_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Cmp_UserName] [varchar](40) NOT NULL,
	[Cmp_Password] [varchar](60) NOT NULL,
	[Cmp_Name] [varchar](120) NOT NULL,
	[Cmp_Status] [varchar](15) NOT NULL,
	[Cmp_Description] [varchar](250) NOT NULL,
 CONSTRAINT [pk_CmpID] PRIMARY KEY CLUSTERED 
(
	[Cmp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Company_IndustryType]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company_IndustryType](
	[Cmp_ID] [int] NOT NULL,
	[Cmp_IndustryType] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Company_JobsApplyInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company_JobsApplyInfo](
	[Job_ID] [int] NOT NULL,
	[Js_ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Company_PersonInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company_PersonInfo](
	[Cmp_ID] [int] NOT NULL,
	[Cmp_PersName] [varchar](40) NOT NULL,
	[Cmp_PersDesignation] [varchar](30) NOT NULL,
	[Cmp_PersTelNum] [bigint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Company_PostedJobInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company_PostedJobInfo](
	[Job_ID] [int] IDENTITY(100000,1) NOT NULL,
	[Cmp_ID] [int] NOT NULL,
	[Job_Title] [varchar](60) NOT NULL,
	[Job_Category] [int] NOT NULL,
	[Job_VacancyNo] [int] NOT NULL,
	[Job_Gender] [varchar](30) NOT NULL,
	[Job_Nature] [int] NOT NULL,
	[Job_Experience] [nvarchar](max) NOT NULL,
	[Job_Location] [int] NOT NULL,
	[Job_SalRange] [varchar](150) NOT NULL,
	[Job_Decription] [varchar](max) NOT NULL,
	[Job_ExpReq] [varchar](max) NOT NULL,
	[Job_EduRequirement] [nvarchar](max) NOT NULL,
	[Job_Requirement] [varchar](max) NOT NULL,
	[Job_OtherBenifit] [varchar](max) NOT NULL,
	[Job_PostDate] [datetime] NOT NULL,
	[Job_Deadline] [date] NULL,
	[Job_Status] [varchar](15) NOT NULL,
 CONSTRAINT [pk_JobID] PRIMARY KEY CLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobSeeker_BasicInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_BasicInfo](
	[Js_ID] [int] IDENTITY(10000,1) NOT NULL,
	[Js_UserName] [varchar](30) NOT NULL,
	[Js_Password] [varchar](60) NOT NULL,
	[Js_FirstName] [varchar](20) NOT NULL,
	[Js_LastName] [varchar](20) NOT NULL,
	[Js_Email] [varchar](20) NOT NULL,
 CONSTRAINT [pk_JsID] PRIMARY KEY CLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobSeeker_CareerInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_CareerInfo](
	[Js_ID] [int] NOT NULL,
	[Js_Objective] [varchar](500) NULL,
	[Js_Expatsal] [int] NULL,
	[Js_JobLevel] [int] NULL,
	[Js_JobNature] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobSeeker_EducationSummary]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_EducationSummary](
	[Js_ID] [int] NOT NULL,
	[Js_EduLevel] [int] NULL,
	[Js_DegreeTitle] [int] NULL,
	[Js_DegreeMajor] [varchar](60) NULL,
	[Js_InstituteName] [varchar](60) NULL,
	[Js_DegreeResult] [varchar](20) NULL,
	[Js_YearofPassing] [varchar](20) NULL,
	[Js_DegreeDuration] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobSeeker_PersonalInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_PersonalInfo](
	[Js_ID] [int] NOT NULL,
	[Js_FatherName] [varchar](40) NULL,
	[Js_MotherName] [varchar](40) NULL,
	[Js_DOB] [datetime] NULL,
	[Js_Gender] [int] NULL,
	[Js_Religion] [int] NULL,
	[Js_MaritalStatus] [int] NULL,
	[Js_NID] [bigint] NULL,
	[Js_PresentAddress] [varchar](250) NULL,
	[Js_PermanentAddress] [varchar](250) NULL,
	[Js_CurrentLocation] [int] NULL,
	[Js_PhoneNumber_1] [bigint] NULL,
	[Js_PhoneNumber_2] [bigint] NULL,
	[Js_PhotoName] [varchar](30) NULL,
	[Js_CVName] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_JobSeeker_PreferredJobCategory]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory](
	[Js_ID] [int] NOT NULL,
	[Js_PrefJobCat_1] [int] NULL,
	[Js_PrefJobCat_2] [int] NULL,
	[Js_PrefJobCat_3] [int] NULL,
	[Js_PrefJobLoc_1] [int] NULL,
	[Js_PrefJobLoc_2] [int] NULL,
	[Js_PrefJobLoc_3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_JobSeeker_Specialization]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_JobSeeker_Specialization](
	[Js_ID] [int] NOT NULL,
	[Js_Skill_1] [int] NULL,
	[Js_Skill_2] [int] NULL,
	[Js_Skill_3] [int] NULL,
	[Js_Skill_4] [int] NULL,
	[Js_Skill_5] [int] NULL,
	[Js_ExtrCurrAct] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_CityName]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_CityName](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [varchar](30) NOT NULL,
	[Country_ID] [int] NOT NULL,
 CONSTRAINT [pk_CityID] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_CountryName]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_CountryName](
	[Country_ID] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [varchar](30) NOT NULL,
 CONSTRAINT [pk_CountryID] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_DegreeLevel]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_DegreeLevel](
	[DegLevel_ID] [int] IDENTITY(1,1) NOT NULL,
	[DegLevel_Name] [varchar](60) NOT NULL,
	[EduLevel_ID] [int] NOT NULL,
 CONSTRAINT [pk_DegLevelID] PRIMARY KEY CLUSTERED 
(
	[DegLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_EducationLevel]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_EducationLevel](
	[EduLevel_ID] [int] IDENTITY(1,1) NOT NULL,
	[EduLevel_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_EduLevelID] PRIMARY KEY CLUSTERED 
(
	[EduLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_Gender]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Name] [varchar](30) NOT NULL,
 CONSTRAINT [pk_GenderID] PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_IndustryType]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_IndustryType](
	[IndustryType_ID] [int] IDENTITY(1,1) NOT NULL,
	[IndustryType_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_IndustryTypeID] PRIMARY KEY CLUSTERED 
(
	[IndustryType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_JobCategory]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_JobCategory](
	[JobCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[JobCategory_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_JobCategoryID] PRIMARY KEY CLUSTERED 
(
	[JobCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_JobLevel]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_JobLevel](
	[JobLevel_ID] [int] IDENTITY(1,1) NOT NULL,
	[JobLevel_Name] [varchar](30) NOT NULL,
 CONSTRAINT [pk_JobLevelID] PRIMARY KEY CLUSTERED 
(
	[JobLevel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_JobNature]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_JobNature](
	[JobNature_ID] [int] IDENTITY(1,1) NOT NULL,
	[JobNature_Name] [varchar](30) NOT NULL,
 CONSTRAINT [pk_JobNatureID] PRIMARY KEY CLUSTERED 
(
	[JobNature_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_JobReportType]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_JobReportType](
	[ReportType_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_ReportTypeID] PRIMARY KEY CLUSTERED 
(
	[ReportType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_Language]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_Language](
	[Language_ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_LanguageID] PRIMARY KEY CLUSTERED 
(
	[Language_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_LanguageProficiency]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_LanguageProficiency](
	[LangProf_ID] [int] IDENTITY(1,1) NOT NULL,
	[LangProf_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_LangProfID] PRIMARY KEY CLUSTERED 
(
	[LangProf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_MaritalStatus]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_MaritalStatus](
	[MaritalStatus_ID] [int] IDENTITY(1,1) NOT NULL,
	[MaritalStatus_Name] [varchar](15) NOT NULL,
 CONSTRAINT [pk_MaritalStatusID] PRIMARY KEY CLUSTERED 
(
	[MaritalStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_Religion]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_Religion](
	[Religion_ID] [int] IDENTITY(1,1) NOT NULL,
	[Religion_Name] [varchar](15) NOT NULL,
 CONSTRAINT [pk_ReligionID] PRIMARY KEY CLUSTERED 
(
	[Religion_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_ReportJob]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_ReportJob](
	[Job_ID] [int] NOT NULL,
	[Js_ID] [int] NOT NULL,
	[ReportType_ID] [int] NOT NULL,
	[Add_Cmnt] [varchar](250) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_SkillInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_SkillInfo](
	[Skill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_Name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_SkillID] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_System_SystemInfo]    Script Date: 02-Apr-18 12:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_System_SystemInfo](
	[System_ID] [int] IDENTITY(1,1) NOT NULL,
	[System_UserName] [varchar](40) NOT NULL,
	[System_Password] [varchar](60) NOT NULL,
 CONSTRAINT [pk_SystemAdminID] PRIMARY KEY CLUSTERED 
(
	[System_ID] ASC,
	[System_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_System_CityName] ON 

INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (2, N'DHAKA', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (3, N'SYLHET', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (5, N'KHULNA', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (7, N'CHITTAGONG', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (9, N'BARISAL', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (10, N'RANGPUR', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (11, N'MYMENSINGH', 1)
INSERT [dbo].[tbl_System_CityName] ([City_ID], [City_Name], [Country_ID]) VALUES (12, N'RAJSHAHI', 1)
SET IDENTITY_INSERT [dbo].[tbl_System_CityName] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_CountryName] ON 

INSERT [dbo].[tbl_System_CountryName] ([Country_ID], [Country_Name]) VALUES (1, N'BANGLADESH')
INSERT [dbo].[tbl_System_CountryName] ([Country_ID], [Country_Name]) VALUES (6, N'BHUTAN')
INSERT [dbo].[tbl_System_CountryName] ([Country_ID], [Country_Name]) VALUES (2, N'GERMANY')
INSERT [dbo].[tbl_System_CountryName] ([Country_ID], [Country_Name]) VALUES (4, N'INDIA')
INSERT [dbo].[tbl_System_CountryName] ([Country_ID], [Country_Name]) VALUES (5, N'NEPAL')
SET IDENTITY_INSERT [dbo].[tbl_System_CountryName] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_DegreeLevel] ON 

INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (1, N'Bachelor of Architecture', 1)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (2, N'Bachelor of Business Administration', 1)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (3, N'Bachelor of Science in Computer Science', 1)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (4, N'JSC', 5)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (5, N'JDC', 5)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (6, N'Class 8', 5)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (7, N'Diploma in Automobile Engineering', 2)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (8, N'Diploma in Civil Engineering', 2)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (9, N'Diploma in Computer Science and Engineering', 2)
INSERT [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID], [DegLevel_Name], [EduLevel_ID]) VALUES (10, N'Diploma in Electrical Engineering', 2)
SET IDENTITY_INSERT [dbo].[tbl_System_DegreeLevel] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_EducationLevel] ON 

INSERT [dbo].[tbl_System_EducationLevel] ([EduLevel_ID], [EduLevel_Name]) VALUES (1, N'Bachelor/Honors')
INSERT [dbo].[tbl_System_EducationLevel] ([EduLevel_ID], [EduLevel_Name]) VALUES (2, N'Diploma')
INSERT [dbo].[tbl_System_EducationLevel] ([EduLevel_ID], [EduLevel_Name]) VALUES (5, N'JSC/JDC/8 Pass')
INSERT [dbo].[tbl_System_EducationLevel] ([EduLevel_ID], [EduLevel_Name]) VALUES (4, N'Masters')
INSERT [dbo].[tbl_System_EducationLevel] ([EduLevel_ID], [EduLevel_Name]) VALUES (3, N'Secondary')
SET IDENTITY_INSERT [dbo].[tbl_System_EducationLevel] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_Gender] ON 

INSERT [dbo].[tbl_System_Gender] ([Gender_ID], [Gender_Name]) VALUES (2, N'FEMALE')
INSERT [dbo].[tbl_System_Gender] ([Gender_ID], [Gender_Name]) VALUES (1, N'MALE')
INSERT [dbo].[tbl_System_Gender] ([Gender_ID], [Gender_Name]) VALUES (3, N'OTHER')
SET IDENTITY_INSERT [dbo].[tbl_System_Gender] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_IndustryType] ON 

INSERT [dbo].[tbl_System_IndustryType] ([IndustryType_ID], [IndustryType_Name]) VALUES (3, N'COMPUTER ACCESORIES')
INSERT [dbo].[tbl_System_IndustryType] ([IndustryType_ID], [IndustryType_Name]) VALUES (4, N'HARDWARE')
INSERT [dbo].[tbl_System_IndustryType] ([IndustryType_ID], [IndustryType_Name]) VALUES (2, N'ISP')
INSERT [dbo].[tbl_System_IndustryType] ([IndustryType_ID], [IndustryType_Name]) VALUES (1, N'IT')
SET IDENTITY_INSERT [dbo].[tbl_System_IndustryType] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_JobCategory] ON 

INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (8, N'Accounting/Finance ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (25, N'Agro (Plant/Animal/Fisheries)')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (9, N'Bank/ Non-Bank Fin. Institution')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (18, N'Beauty Care/ Health & Fitness')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (10, N'Commercial/Supply Chain')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (22, N'Customer Support/Call Centre')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (29, N'Data Entry/Operator/BPO ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (16, N'Design/Creative ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (30, N'Driving/Motor Technician ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (11, N'Education/Training ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (19, N'Electrician/ Construction/ Repair')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (12, N'Engineer/Architects ')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (13, N'Garments/Textile')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (15, N'Gen Mgt/Admin')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (14, N'HR/Org. Development')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (20, N'IT & Telecommunication')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (32, N'Law/Legal')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (21, N'Marketing/Sales')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (23, N'Media/Ad./Event Mgt')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (24, N'Medical/Pharma')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (26, N'NGO/Development')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (33, N'Others')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (17, N'Production/Operation')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (27, N'Research/Consultancy')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (28, N'Secretary/Receptionist')
INSERT [dbo].[tbl_System_JobCategory] ([JobCategory_ID], [JobCategory_Name]) VALUES (31, N'Security/Support Service')
SET IDENTITY_INSERT [dbo].[tbl_System_JobCategory] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_JobLevel] ON 

INSERT [dbo].[tbl_System_JobLevel] ([JobLevel_ID], [JobLevel_Name]) VALUES (1, N'BEGINING')
INSERT [dbo].[tbl_System_JobLevel] ([JobLevel_ID], [JobLevel_Name]) VALUES (3, N'HIGH')
INSERT [dbo].[tbl_System_JobLevel] ([JobLevel_ID], [JobLevel_Name]) VALUES (2, N'MID')
SET IDENTITY_INSERT [dbo].[tbl_System_JobLevel] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_JobNature] ON 

INSERT [dbo].[tbl_System_JobNature] ([JobNature_ID], [JobNature_Name]) VALUES (4, N'CONTRACTUAL')
INSERT [dbo].[tbl_System_JobNature] ([JobNature_ID], [JobNature_Name]) VALUES (2, N'FULL-TIME')
INSERT [dbo].[tbl_System_JobNature] ([JobNature_ID], [JobNature_Name]) VALUES (3, N'INTERN')
INSERT [dbo].[tbl_System_JobNature] ([JobNature_ID], [JobNature_Name]) VALUES (1, N'PART-TIME')
SET IDENTITY_INSERT [dbo].[tbl_System_JobNature] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_JobReportType] ON 

INSERT [dbo].[tbl_System_JobReportType] ([ReportType_ID], [ReportType_Name]) VALUES (1, N'Fraudulent')
INSERT [dbo].[tbl_System_JobReportType] ([ReportType_ID], [ReportType_Name]) VALUES (3, N'Invalid Data')
INSERT [dbo].[tbl_System_JobReportType] ([ReportType_ID], [ReportType_Name]) VALUES (2, N'Offensive')
INSERT [dbo].[tbl_System_JobReportType] ([ReportType_ID], [ReportType_Name]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[tbl_System_JobReportType] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_Language] ON 

INSERT [dbo].[tbl_System_Language] ([Language_ID], [Language_Name]) VALUES (2, N'BANGLA')
INSERT [dbo].[tbl_System_Language] ([Language_ID], [Language_Name]) VALUES (1, N'ENGLISH')
INSERT [dbo].[tbl_System_Language] ([Language_ID], [Language_Name]) VALUES (3, N'GERMAN')
SET IDENTITY_INSERT [dbo].[tbl_System_Language] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_LanguageProficiency] ON 

INSERT [dbo].[tbl_System_LanguageProficiency] ([LangProf_ID], [LangProf_Name]) VALUES (3, N'HIGH')
INSERT [dbo].[tbl_System_LanguageProficiency] ([LangProf_ID], [LangProf_Name]) VALUES (1, N'LOW')
INSERT [dbo].[tbl_System_LanguageProficiency] ([LangProf_ID], [LangProf_Name]) VALUES (2, N'MID')
SET IDENTITY_INSERT [dbo].[tbl_System_LanguageProficiency] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_MaritalStatus] ON 

INSERT [dbo].[tbl_System_MaritalStatus] ([MaritalStatus_ID], [MaritalStatus_Name]) VALUES (4, N'DIVORCED')
INSERT [dbo].[tbl_System_MaritalStatus] ([MaritalStatus_ID], [MaritalStatus_Name]) VALUES (1, N'MARRIED')
INSERT [dbo].[tbl_System_MaritalStatus] ([MaritalStatus_ID], [MaritalStatus_Name]) VALUES (3, N'SEPARATED')
INSERT [dbo].[tbl_System_MaritalStatus] ([MaritalStatus_ID], [MaritalStatus_Name]) VALUES (2, N'UNMARRIED')
SET IDENTITY_INSERT [dbo].[tbl_System_MaritalStatus] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_Religion] ON 

INSERT [dbo].[tbl_System_Religion] ([Religion_ID], [Religion_Name]) VALUES (4, N'BUDDHISM')
INSERT [dbo].[tbl_System_Religion] ([Religion_ID], [Religion_Name]) VALUES (3, N'CHRISTIAN')
INSERT [dbo].[tbl_System_Religion] ([Religion_ID], [Religion_Name]) VALUES (1, N'HINDU')
INSERT [dbo].[tbl_System_Religion] ([Religion_ID], [Religion_Name]) VALUES (2, N'MUSLIM')
SET IDENTITY_INSERT [dbo].[tbl_System_Religion] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_SkillInfo] ON 

INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (3, N'ASP.NET MVC')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (2, N'ASP.NET Web Form')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (8, N'C')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (4, N'C#')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (9, N'C++')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (5, N'JAVA')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (10, N'LINUX OS')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (1, N'MS Office')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (6, N'PHP')
INSERT [dbo].[tbl_System_SkillInfo] ([Skill_ID], [Skill_Name]) VALUES (7, N'PYTHON')
SET IDENTITY_INSERT [dbo].[tbl_System_SkillInfo] OFF
SET IDENTITY_INSERT [dbo].[tbl_System_SystemInfo] ON 

INSERT [dbo].[tbl_System_SystemInfo] ([System_ID], [System_UserName], [System_Password]) VALUES (1, N'admin', N'admin123')
SET IDENTITY_INSERT [dbo].[tbl_System_SystemInfo] OFF
/****** Object:  Index [uk_CmpPhoneNumber]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_AddressInfo] ADD  CONSTRAINT [uk_CmpPhoneNumber] UNIQUE NONCLUSTERED 
(
	[Cmp_PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Comp__1BBEA02915F09DE4]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_AddressInfo] ADD UNIQUE NONCLUSTERED 
(
	[Cmp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_CmpName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_BasicInfo] ADD  CONSTRAINT [uk_CmpName] UNIQUE NONCLUSTERED 
(
	[Cmp_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_CmpUserName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_BasicInfo] ADD  CONSTRAINT [uk_CmpUserName] UNIQUE NONCLUSTERED 
(
	[Cmp_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Comp__1BBEA0295F304E67]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_IndustryType] ADD UNIQUE NONCLUSTERED 
(
	[Cmp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uk_CmpPersTelNum]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_PersonInfo] ADD  CONSTRAINT [uk_CmpPersTelNum] UNIQUE NONCLUSTERED 
(
	[Cmp_PersTelNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Comp__1BBEA0294A649B72]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_Company_PersonInfo] ADD UNIQUE NONCLUSTERED 
(
	[Cmp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_JsEmail]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_BasicInfo] ADD  CONSTRAINT [uk_JsEmail] UNIQUE NONCLUSTERED 
(
	[Js_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_JsUserName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_BasicInfo] ADD  CONSTRAINT [uk_JsUserName] UNIQUE NONCLUSTERED 
(
	[Js_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_JobS__C4D7E9AAC5BA6EF1]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo] ADD UNIQUE NONCLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_JobS__C4D7E9AACA81EF21]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary] ADD UNIQUE NONCLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_JobS__C4D7E9AADB9C4BB0]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] ADD UNIQUE NONCLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_JobS__C4D7E9AA3F55D6FB]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] ADD UNIQUE NONCLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_JobS__C4D7E9AA0F2281EB]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] ADD UNIQUE NONCLUSTERED 
(
	[Js_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_CityName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_CityName] ADD  CONSTRAINT [uk_CityName] UNIQUE NONCLUSTERED 
(
	[City_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_CountryName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_CountryName] ADD  CONSTRAINT [uk_CountryName] UNIQUE NONCLUSTERED 
(
	[Country_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_DegLevelName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_DegreeLevel] ADD  CONSTRAINT [uk_DegLevelName] UNIQUE NONCLUSTERED 
(
	[DegLevel_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_EduLevelName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_EducationLevel] ADD  CONSTRAINT [uk_EduLevelName] UNIQUE NONCLUSTERED 
(
	[EduLevel_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_GenderName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_Gender] ADD  CONSTRAINT [uk_GenderName] UNIQUE NONCLUSTERED 
(
	[Gender_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_IndustryTypeName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_IndustryType] ADD  CONSTRAINT [uk_IndustryTypeName] UNIQUE NONCLUSTERED 
(
	[IndustryType_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_JobCategoryName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_JobCategory] ADD  CONSTRAINT [uk_JobCategoryName] UNIQUE NONCLUSTERED 
(
	[JobCategory_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_JobLevelName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_JobLevel] ADD  CONSTRAINT [uk_JobLevelName] UNIQUE NONCLUSTERED 
(
	[JobLevel_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_JobNatureName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_JobNature] ADD  CONSTRAINT [uk_JobNatureName] UNIQUE NONCLUSTERED 
(
	[JobNature_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_ReportTypeName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_JobReportType] ADD  CONSTRAINT [uk_ReportTypeName] UNIQUE NONCLUSTERED 
(
	[ReportType_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_LanguageName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_Language] ADD  CONSTRAINT [uk_LanguageName] UNIQUE NONCLUSTERED 
(
	[Language_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_LangProfName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_LanguageProficiency] ADD  CONSTRAINT [uk_LangProfName] UNIQUE NONCLUSTERED 
(
	[LangProf_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_MaritalStatusName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_MaritalStatus] ADD  CONSTRAINT [uk_MaritalStatusName] UNIQUE NONCLUSTERED 
(
	[MaritalStatus_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_ReligionName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_Religion] ADD  CONSTRAINT [uk_ReligionName] UNIQUE NONCLUSTERED 
(
	[Religion_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Syst__E76A7687F4F2DDD0]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_ReportJob] ADD UNIQUE NONCLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_SkillName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_SkillInfo] ADD  CONSTRAINT [uk_SkillName] UNIQUE NONCLUSTERED 
(
	[Skill_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uk_SystemUserName]    Script Date: 02-Apr-18 12:55:08 PM ******/
ALTER TABLE [dbo].[tbl_System_SystemInfo] ADD  CONSTRAINT [uk_SystemUserName] UNIQUE NONCLUSTERED 
(
	[System_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Company_AddressInfo]  WITH CHECK ADD  CONSTRAINT [fk_CmpCity] FOREIGN KEY([Cmp_City])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_Company_AddressInfo] CHECK CONSTRAINT [fk_CmpCity]
GO
ALTER TABLE [dbo].[tbl_Company_AddressInfo]  WITH CHECK ADD  CONSTRAINT [fk_CmpIDAddressInfo] FOREIGN KEY([Cmp_ID])
REFERENCES [dbo].[tbl_Company_BasicInfo] ([Cmp_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Company_AddressInfo] CHECK CONSTRAINT [fk_CmpIDAddressInfo]
GO
ALTER TABLE [dbo].[tbl_Company_IndustryType]  WITH CHECK ADD  CONSTRAINT [fk_CmpIDIndustryType] FOREIGN KEY([Cmp_ID])
REFERENCES [dbo].[tbl_Company_BasicInfo] ([Cmp_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Company_IndustryType] CHECK CONSTRAINT [fk_CmpIDIndustryType]
GO
ALTER TABLE [dbo].[tbl_Company_IndustryType]  WITH CHECK ADD  CONSTRAINT [fk_CmpIndustryType] FOREIGN KEY([Cmp_IndustryType])
REFERENCES [dbo].[tbl_System_IndustryType] ([IndustryType_ID])
GO
ALTER TABLE [dbo].[tbl_Company_IndustryType] CHECK CONSTRAINT [fk_CmpIndustryType]
GO
ALTER TABLE [dbo].[tbl_Company_JobsApplyInfo]  WITH CHECK ADD  CONSTRAINT [fk_JobIDJobsApplyInfo] FOREIGN KEY([Job_ID])
REFERENCES [dbo].[tbl_Company_PostedJobInfo] ([Job_ID])
GO
ALTER TABLE [dbo].[tbl_Company_JobsApplyInfo] CHECK CONSTRAINT [fk_JobIDJobsApplyInfo]
GO
ALTER TABLE [dbo].[tbl_Company_JobsApplyInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsIDJobsApplyInfo] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Company_JobsApplyInfo] CHECK CONSTRAINT [fk_JsIDJobsApplyInfo]
GO
ALTER TABLE [dbo].[tbl_Company_PersonInfo]  WITH CHECK ADD  CONSTRAINT [fk_CmpIDPersonInfo] FOREIGN KEY([Cmp_ID])
REFERENCES [dbo].[tbl_Company_BasicInfo] ([Cmp_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Company_PersonInfo] CHECK CONSTRAINT [fk_CmpIDPersonInfo]
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo]  WITH CHECK ADD  CONSTRAINT [fk_CmpIDPostedJobInfo] FOREIGN KEY([Cmp_ID])
REFERENCES [dbo].[tbl_Company_BasicInfo] ([Cmp_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo] CHECK CONSTRAINT [fk_CmpIDPostedJobInfo]
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo]  WITH CHECK ADD  CONSTRAINT [fk_JobCategory] FOREIGN KEY([Job_Category])
REFERENCES [dbo].[tbl_System_JobCategory] ([JobCategory_ID])
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo] CHECK CONSTRAINT [fk_JobCategory]
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo]  WITH CHECK ADD  CONSTRAINT [fk_JobLocation] FOREIGN KEY([Job_Location])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo] CHECK CONSTRAINT [fk_JobLocation]
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo]  WITH CHECK ADD  CONSTRAINT [fk_JobNature] FOREIGN KEY([Job_Nature])
REFERENCES [dbo].[tbl_System_JobNature] ([JobNature_ID])
GO
ALTER TABLE [dbo].[tbl_Company_PostedJobInfo] CHECK CONSTRAINT [fk_JobNature]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsIDCareerInfo] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo] CHECK CONSTRAINT [fk_JsIDCareerInfo]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsJobLevel] FOREIGN KEY([Js_JobLevel])
REFERENCES [dbo].[tbl_System_JobLevel] ([JobLevel_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo] CHECK CONSTRAINT [fk_JsJobLevel]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsJobNature] FOREIGN KEY([Js_JobNature])
REFERENCES [dbo].[tbl_System_JobNature] ([JobNature_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_CareerInfo] CHECK CONSTRAINT [fk_JsJobNature]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary]  WITH CHECK ADD  CONSTRAINT [fk_JsDegreeTitle] FOREIGN KEY([Js_DegreeTitle])
REFERENCES [dbo].[tbl_System_DegreeLevel] ([DegLevel_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary] CHECK CONSTRAINT [fk_JsDegreeTitle]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary]  WITH CHECK ADD  CONSTRAINT [fk_JsEduLevel] FOREIGN KEY([Js_EduLevel])
REFERENCES [dbo].[tbl_System_EducationLevel] ([EduLevel_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary] CHECK CONSTRAINT [fk_JsEduLevel]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary]  WITH CHECK ADD  CONSTRAINT [fk_JsIDEducationSummary] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_JobSeeker_EducationSummary] CHECK CONSTRAINT [fk_JsIDEducationSummary]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsCurrentLocation] FOREIGN KEY([Js_CurrentLocation])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] CHECK CONSTRAINT [fk_JsCurrentLocation]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsGender] FOREIGN KEY([Js_Gender])
REFERENCES [dbo].[tbl_System_Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] CHECK CONSTRAINT [fk_JsGender]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsIDPersonalInfo] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] CHECK CONSTRAINT [fk_JsIDPersonalInfo]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsMaritalStatus] FOREIGN KEY([Js_MaritalStatus])
REFERENCES [dbo].[tbl_System_MaritalStatus] ([MaritalStatus_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] CHECK CONSTRAINT [fk_JsMaritalStatus]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo]  WITH CHECK ADD  CONSTRAINT [fk_JsReligion] FOREIGN KEY([Js_Religion])
REFERENCES [dbo].[tbl_System_Religion] ([Religion_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PersonalInfo] CHECK CONSTRAINT [fk_JsReligion]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsIDPreferredJobCategory] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsIDPreferredJobCategory]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobCat1] FOREIGN KEY([Js_PrefJobCat_1])
REFERENCES [dbo].[tbl_System_JobCategory] ([JobCategory_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobCat1]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobCat2] FOREIGN KEY([Js_PrefJobCat_2])
REFERENCES [dbo].[tbl_System_JobCategory] ([JobCategory_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobCat2]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobCat3] FOREIGN KEY([Js_PrefJobCat_3])
REFERENCES [dbo].[tbl_System_JobCategory] ([JobCategory_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobCat3]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobLoc1] FOREIGN KEY([Js_PrefJobLoc_1])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobLoc1]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobLoc2] FOREIGN KEY([Js_PrefJobLoc_2])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobLoc2]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory]  WITH CHECK ADD  CONSTRAINT [fk_JsPrefJobLoc3] FOREIGN KEY([Js_PrefJobLoc_3])
REFERENCES [dbo].[tbl_System_CityName] ([City_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_PreferredJobCategory] CHECK CONSTRAINT [fk_JsPrefJobLoc3]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsIDSpecialization] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsIDSpecialization]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsSkill1] FOREIGN KEY([Js_Skill_1])
REFERENCES [dbo].[tbl_System_SkillInfo] ([Skill_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsSkill1]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsSkill2] FOREIGN KEY([Js_Skill_2])
REFERENCES [dbo].[tbl_System_SkillInfo] ([Skill_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsSkill2]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsSkill3] FOREIGN KEY([Js_Skill_3])
REFERENCES [dbo].[tbl_System_SkillInfo] ([Skill_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsSkill3]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsSkill4] FOREIGN KEY([Js_Skill_4])
REFERENCES [dbo].[tbl_System_SkillInfo] ([Skill_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsSkill4]
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization]  WITH CHECK ADD  CONSTRAINT [fk_JsSkill5] FOREIGN KEY([Js_Skill_5])
REFERENCES [dbo].[tbl_System_SkillInfo] ([Skill_ID])
GO
ALTER TABLE [dbo].[tbl_JobSeeker_Specialization] CHECK CONSTRAINT [fk_JsSkill5]
GO
ALTER TABLE [dbo].[tbl_System_CityName]  WITH CHECK ADD  CONSTRAINT [fk_CountryID] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[tbl_System_CountryName] ([Country_ID])
GO
ALTER TABLE [dbo].[tbl_System_CityName] CHECK CONSTRAINT [fk_CountryID]
GO
ALTER TABLE [dbo].[tbl_System_DegreeLevel]  WITH CHECK ADD  CONSTRAINT [fk_EduLevelID] FOREIGN KEY([EduLevel_ID])
REFERENCES [dbo].[tbl_System_EducationLevel] ([EduLevel_ID])
GO
ALTER TABLE [dbo].[tbl_System_DegreeLevel] CHECK CONSTRAINT [fk_EduLevelID]
GO
ALTER TABLE [dbo].[tbl_System_ReportJob]  WITH CHECK ADD  CONSTRAINT [fk_JobIDReportJob] FOREIGN KEY([Job_ID])
REFERENCES [dbo].[tbl_Company_PostedJobInfo] ([Job_ID])
GO
ALTER TABLE [dbo].[tbl_System_ReportJob] CHECK CONSTRAINT [fk_JobIDReportJob]
GO
ALTER TABLE [dbo].[tbl_System_ReportJob]  WITH CHECK ADD  CONSTRAINT [fk_JsIDReportJob] FOREIGN KEY([Js_ID])
REFERENCES [dbo].[tbl_JobSeeker_BasicInfo] ([Js_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_System_ReportJob] CHECK CONSTRAINT [fk_JsIDReportJob]
GO
ALTER TABLE [dbo].[tbl_System_ReportJob]  WITH CHECK ADD  CONSTRAINT [fk_ReportTypeID] FOREIGN KEY([ReportType_ID])
REFERENCES [dbo].[tbl_System_JobReportType] ([ReportType_ID])
GO
ALTER TABLE [dbo].[tbl_System_ReportJob] CHECK CONSTRAINT [fk_ReportTypeID]
GO
/****** Object:  StoredProcedure [dbo].[SP_AllJobInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AllJobInfo]
AS
BEGIN
SELECT 
job.Job_ID,
job.Job_Title,
job.Job_VacancyNo,
job.Job_Gender,
job.Job_Experience,
job.Job_SalRange,
job.Job_Decription,
job.Job_ExpReq,
job.Job_EduRequirement,
job.Job_Requirement,
job.Job_OtherBenifit,
job.Job_PostDate,
job.Job_Deadline,
city.City_Name,
category.JobCategory_Name,
nature.JobNature_Name,
cmp.Cmp_Name
FROM tbl_Company_PostedJobInfo as job
INNER JOIN tbl_System_CityName as city on job.Job_Location = city.City_ID
INNER JOIN tbl_System_JobCategory as category on job.Job_Category = category.JobCategory_ID
INNER JOIN tbl_System_JobNature as nature on job.Job_Nature = nature.JobNature_ID
INNER JOIN tbl_Company_BasicInfo as cmp on job.Cmp_ID = cmp.Cmp_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CatJobInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CatJobInfo]
@Cat_Name varchar(60)
AS
BEGIN
SELECT 
job.Job_ID,
job.Job_Title,
job.Job_VacancyNo,
job.Job_Gender,
job.Job_Experience,
job.Job_SalRange,
job.Job_Decription,
job.Job_ExpReq,
job.Job_EduRequirement,
job.Job_Requirement,
job.Job_OtherBenifit,
job.Job_PostDate,
job.Job_Deadline,
city.City_Name,
category.JobCategory_Name,
nature.JobNature_Name,
cmp.Cmp_Name
FROM tbl_Company_PostedJobInfo as job
INNER JOIN tbl_System_CityName as city on job.Job_Location = city.City_ID
INNER JOIN tbl_System_JobCategory as category on job.Job_Category = category.JobCategory_ID
INNER JOIN tbl_System_JobNature as nature on job.Job_Nature = nature.JobNature_ID
INNER JOIN tbl_Company_BasicInfo as cmp on job.Cmp_ID = cmp.Cmp_ID
where category.JobCategory_Name like @Cat_Name+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CityJobInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CityJobInfo]
@City_Name varchar(60)
AS
BEGIN
SELECT 
job.Job_ID,
job.Job_Title,
job.Job_VacancyNo,
job.Job_Gender,
job.Job_Experience,
job.Job_SalRange,
job.Job_Decription,
job.Job_ExpReq,
job.Job_EduRequirement,
job.Job_Requirement,
job.Job_OtherBenifit,
job.Job_PostDate,
job.Job_Deadline,
city.City_Name,
category.JobCategory_Name,
nature.JobNature_Name,
cmp.Cmp_Name
FROM tbl_Company_PostedJobInfo as job
INNER JOIN tbl_System_CityName as city on job.Job_Location = city.City_ID
INNER JOIN tbl_System_JobCategory as category on job.Job_Category = category.JobCategory_ID
INNER JOIN tbl_System_JobNature as nature on job.Job_Nature = nature.JobNature_ID
INNER JOIN tbl_Company_BasicInfo as cmp on job.Cmp_ID = cmp.Cmp_ID
where city.City_Name like @City_Name+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CityName_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Countrys City Name CRUD Stored Procedure 
CREATE proc [dbo].[SP_CityName_SYS]
@City_ID int =0,
@City_Name varchar(60)=null,
@Country_ID int =0, 
@status varchar(50) 

as

begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_CityName(City_Name,Country_ID) values(@City_Name,@Country_ID) 
end


--- Select Records in Table 
if @status='SELECT' 
begin 
select C.City_ID, C.City_Name, D.Country_Name FROM tbl_System_CityName C 
INNER JOIN tbl_System_CountryName D 
on C.Country_ID = D.Country_ID order by 3
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_CityName set City_Name=@City_Name where City_ID=@City_ID
end 
--- Delete Records from Table 
if @status='DELETE'  
delete from tbl_System_CityName where City_ID=@City_ID
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CountryName_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Country Name CRUD Stored Procedure 
CREATE proc [dbo].[SP_CountryName_SYS]
@Country_ID int =0,
@Country_Name varchar(60)=null, 
@status varchar(50) 

as

begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin
IF NOT EXISTS(SELECT * FROM tbl_System_CountryName WHERE Country_Name=@Country_Name)
begin 
insert into tbl_System_CountryName(Country_Name) values(@Country_Name) 
end
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Country_ID, Country_Name FROM tbl_System_CountryName ORDER BY Country_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_CountryName set Country_Name=@Country_Name where Country_ID=@Country_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin

delete from tbl_System_CountryName where Country_ID=@Country_ID
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DegreeLevel_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Degree Level CRUD Stored Procedure 
create proc [dbo].[SP_DegreeLevel_SYS]
@DegLevel_ID int =0,
@DegLevel_Name varchar(60)=null,
@EduLevel_ID int =0, 
@status varchar(50) 

as

begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_DegreeLevel(DegLevel_Name,EduLevel_ID) values(@DegLevel_Name,@EduLevel_ID) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select EduLevel_ID,DegLevel_ID, DegLevel_Name FROM tbl_System_DegreeLevel ORDER BY DegLevel_ID 
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_DegreeLevel set DegLevel_Name=@DegLevel_Name where DegLevel_ID=@DegLevel_ID and EduLevel_ID=@EduLevel_ID
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @DegLevel_ID_Del int = (select DegLevel_ID from tbl_System_DegreeLevel where DegLevel_ID=@DegLevel_ID and EduLevel_ID=@EduLevel_ID) 
delete from tbl_System_DegreeLevel where DegLevel_ID=@DegLevel_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EducationLevel_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_EducationLevel_SYS]
@EduLevel_ID int =0,
@EduLevel_Name varchar(15)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_EducationLevel(EduLevel_Name) values(@EduLevel_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select EduLevel_ID, EduLevel_Name FROM tbl_System_EducationLevel ORDER BY EduLevel_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_EducationLevel set EduLevel_Name=@EduLevel_Name where EduLevel_ID=@EduLevel_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @EduLevel_ID_Del int = (select EduLevel_ID  from tbl_System_EducationLevel where EduLevel_Name=@EduLevel_Name) 
delete from tbl_System_EducationLevel where EduLevel_ID=@EduLevel_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Gender_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Gender CRUD Stored Procedure 
create proc [dbo].[SP_Gender_SYS]
@Gender_ID int =0,
@Gender_Name varchar(30)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_Gender(Gender_Name) values(@Gender_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Gender_ID, Gender_Name FROM tbl_System_Gender ORDER BY Gender_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_Gender set Gender_Name=@Gender_Name where Gender_ID=@Gender_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @Gender_ID_Del int = (select Gender_ID  from tbl_System_Gender where Gender_Name=@Gender_Name) 
delete from tbl_System_Gender where Gender_ID=@Gender_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_IndustryType_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_IndustryType_SYS]
@IndustryType_ID int =0,
@IndustryType_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_IndustryType(IndustryType_Name) values(@IndustryType_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select IndustryType_ID, IndustryType_Name FROM tbl_System_IndustryType ORDER BY IndustryType_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_IndustryType set IndustryType_Name=@IndustryType_Name where IndustryType_ID=@IndustryType_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @IndustryType_ID_Del int = (select IndustryType_ID  from tbl_System_IndustryType where IndustryType_Name=@IndustryType_Name) 
delete from tbl_System_IndustryType where IndustryType_ID=@IndustryType_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_JobApply]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_JobApply]
@Job_ID int =0,
@Js_ID int=0, 
@status varchar(50),
@ERROR VARCHAR(100) OUT

as

begin
set nocount on; 

--- Insert New Records 
if @status='INSERT'
begin
IF NOT EXISTS(SELECT * FROM tbl_Company_JobsApplyInfo WHERE Job_ID=@Job_ID and Js_ID=@Js_ID)
begin 
insert into tbl_Company_JobsApplyInfo(Job_ID,Js_ID) values(@Job_ID,@Js_ID) 
SET @ERROR=''
end
ELSE
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR='Already Applied'
END 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Job_ID, Js_ID FROM tbl_Company_JobsApplyInfo where Job_ID = @Job_ID ORDER BY Job_ID 
end
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_JobCategory_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_JobCategory_SYS]
@JobCategory_ID int =0,
@JobCategory_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_JobCategory(JobCategory_Name) values(@JobCategory_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select JobCategory_ID, JobCategory_Name FROM tbl_System_JobCategory ORDER BY JobCategory_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_JobCategory set JobCategory_Name=@JobCategory_Name where JobCategory_ID=@JobCategory_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @JobCategory_ID_Del int = (select JobCategory_ID  from tbl_System_JobCategory where JobCategory_Name=@JobCategory_Name) 
delete from tbl_System_JobCategory where JobCategory_ID=@JobCategory_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_JobLevel_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_JobLevel_SYS]
@JobLevel_ID int =0,
@JobLevel_Name varchar(15)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_JobLevel(JobLevel_Name) values(@JobLevel_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select JobLevel_ID, JobLevel_Name FROM tbl_System_JobLevel ORDER BY JobLevel_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_JobLevel set JobLevel_Name=@JobLevel_Name where JobLevel_ID=@JobLevel_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @JobLevel_ID_Del int = (select JobLevel_ID  from tbl_System_JobLevel where JobLevel_Name=@JobLevel_Name) 
delete from tbl_System_JobLevel where JobLevel_ID=@JobLevel_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_JobNature_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Job Nature CRUD Stored Procedure 
create proc [dbo].[SP_JobNature_SYS]
@JobNature_ID int =0,
@JobNature_Name varchar(15)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_JobNature(JobNature_Name) values(@JobNature_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select JobNature_ID, JobNature_Name FROM tbl_System_JobNature ORDER BY JobNature_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_JobNature set JobNature_Name=@JobNature_Name where JobNature_ID=@JobNature_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @JobNature_ID_Del int = (select JobNature_ID  from tbl_System_JobNature where JobNature_Name=@JobNature_Name) 
delete from tbl_System_JobNature where JobNature_ID=@JobNature_ID_Del
end 
set nocount off 
end

GO
/****** Object:  StoredProcedure [dbo].[SP_JobPostCompany]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_JobPostCompany]
@Cmp_ID int,
@Job_Title varchar(60),
@Job_Category int,
@Job_VacancyNo int,
@Job_Gender varchar(30),
@Job_Nature int,
@Job_Location int,
@Job_SalRange varchar(150),
@Job_Decription varchar(MAX),
@Job_ExpReq varchar(MAX),
@Job_EduRequirement nvarchar(max),
@Job_Requirement varchar(MAX),
@Job_OtherBenifit varchar(MAX),
@Job_Deadline date,
@ERROR VARCHAR(100) OUT

AS

BEGIN 
INSERT INTO tbl_Company_PostedJobInfo
( 
Cmp_ID,
Job_Title,
Job_Category,
Job_VacancyNo,
Job_Gender,
Job_Nature,
Job_Experience,
Job_Location,
Job_SalRange,
Job_Decription,
Job_ExpReq,
Job_EduRequirement,
Job_Requirement,
Job_OtherBenifit,
Job_PostDate,
Job_Deadline,
Job_Status
)
VALUES
(
@Cmp_ID,
@Job_Title,
@Job_Category,
@Job_VacancyNo,
@Job_Gender,
@Job_Nature,
'Job Experiance',
@Job_Location,
@Job_SalRange,
@Job_Decription,
@Job_ExpReq,
@Job_EduRequirement,
@Job_Requirement,
@Job_OtherBenifit,
GETDATE(),
@Job_Deadline,
'Enable'
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@Job_Title+ ' Posted Successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_JobReportType_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Job Report Type CRUD Stored Procedure 
create proc [dbo].[SP_JobReportType_SYS]
@ReportType_ID int =0,
@ReportType_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_JobReportType(ReportType_Name) values(@ReportType_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select ReportType_ID, ReportType_Name FROM tbl_System_JobReportType ORDER BY ReportType_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_JobReportType set ReportType_Name=@ReportType_Name where ReportType_ID=@ReportType_ID
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @ReportType_ID_Del int = (select ReportType_ID  from tbl_System_JobReportType where ReportType_Name=@ReportType_Name) 
delete from tbl_System_JobReportType where ReportType_ID=@ReportType_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_JobSeekerCarrerInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_JobSeekerCarrerInfo]
@Js_ID int
AS
BEGIN
SELECT * FROM tbl_JobSeeker_CareerInfo WHERE Js_ID = @Js_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_JobSeekerPersonalInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_JobSeekerPersonalInfo]
@Js_ID int
AS
BEGIN
SELECT * FROM tbl_JobSeeker_PersonalInfo WHERE Js_ID = @Js_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_JobSeekerPreferredJobCatandLoc]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_JobSeekerPreferredJobCatandLoc]
@Js_ID int
AS
BEGIN
SELECT * FROM tbl_JobSeeker_PreferredJobCategory WHERE Js_ID = @Js_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Language_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Language CRUD Stored Procedure 
create proc [dbo].[SP_Language_SYS]
@Language_ID int =0,
@Language_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_Language(Language_Name) values(@Language_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Language_ID, Language_Name FROM tbl_System_Language ORDER BY Language_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_Language set Language_Name=@Language_Name where Language_ID=@Language_ID
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @Language_ID_Del int = (select Language_ID  from tbl_System_Language where Language_Name=@Language_Name) 
delete from tbl_System_Language where Language_ID=@Language_ID_Del
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_LanguageProficiency_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Language Proficiency CRUD Stored Procedure 
create proc [dbo].[SP_LanguageProficiency_SYS]
@LangProf_ID int =0,
@LangProf_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_LanguageProficiency(LangProf_Name) values(@LangProf_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select LangProf_ID, LangProf_Name FROM tbl_System_LanguageProficiency ORDER BY LangProf_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_LanguageProficiency set LangProf_Name=@LangProf_Name where LangProf_ID=@LangProf_ID
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @LangProf_ID_Del int = (select LangProf_ID  from tbl_System_LanguageProficiency where LangProf_Name=@LangProf_Name) 
delete from tbl_System_LanguageProficiency where LangProf_ID=@LangProf_ID_Del
end 
set nocount off 
end

GO
/****** Object:  StoredProcedure [dbo].[SP_LoginCompany]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_LoginCompany]
@Cmp_UserName varchar(40),
@Cmp_Password varchar(60)

AS

BEGIN
	select  CL.Cmp_ID, CL.Cmp_UserName, cl.Cmp_Name, CL.Cmp_Status, cl.Cmp_Description
	FROM tbl_Company_BasicInfo CL
	WHERE Cmp_UserName = @Cmp_UserName and Cmp_Password=@Cmp_Password
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginJobSeeker]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_LoginJobSeeker]
@Js_UserName varchar(40),
@Js_Password varchar(60)

AS

BEGIN
	select JSL.Js_ID, JSL.Js_Email, JSL.Js_FirstName, JSL.Js_LastName, JSL.Js_UserName  
	FROM tbl_JobSeeker_BasicInfo JSL
	WHERE Js_UserName = @Js_UserName and Js_Password=@Js_Password
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginSystem]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_LoginSystem]
@System_UserName varchar(40),
@System_Password varchar(60)

AS

BEGIN
	select SL.System_ID, SL.System_UserName 
	FROM tbl_System_SystemInfo SL
	WHERE System_UserName = @System_UserName and System_Password=@System_Password
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MaritalStatus_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Marital Status CRUD Stored Procedure 
CREATE proc [dbo].[SP_MaritalStatus_SYS]
@MaritalStatus_ID int =0,
@MaritalStatus_Name varchar(15)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_MaritalStatus(MaritalStatus_Name) values(@MaritalStatus_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select MaritalStatus_ID, MaritalStatus_Name FROM tbl_System_MaritalStatus ORDER BY MaritalStatus_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_MaritalStatus set MaritalStatus_Name=@MaritalStatus_Name where MaritalStatus_ID=@MaritalStatus_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
delete from tbl_System_MaritalStatus where MaritalStatus_ID=@MaritalStatus_ID
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_NatureJobInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NatureJobInfo]
@Nature_Name varchar(30)
AS
BEGIN
SELECT 
job.Job_ID,
job.Job_Title,
job.Job_VacancyNo,
job.Job_Gender,
job.Job_Experience,
job.Job_SalRange,
job.Job_Decription,
job.Job_ExpReq,
job.Job_EduRequirement,
job.Job_Requirement,
job.Job_OtherBenifit,
job.Job_PostDate,
job.Job_Deadline,
city.City_Name,
category.JobCategory_Name,
nature.JobNature_Name,
cmp.Cmp_Name
FROM tbl_Company_PostedJobInfo as job
INNER JOIN tbl_System_CityName as city on job.Job_Location = city.City_ID
INNER JOIN tbl_System_JobCategory as category on job.Job_Category = category.JobCategory_ID
INNER JOIN tbl_System_JobNature as nature on job.Job_Nature = nature.JobNature_ID
INNER JOIN tbl_Company_BasicInfo as cmp on job.Cmp_ID = cmp.Cmp_ID
where nature.JobNature_Name = @Nature_Name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationCareerInfoJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Job Seeker Career Information Registration Stored Procedure 
CREATE  PROCEDURE [dbo].[SP_RegisterationCareerInfoJS]
@Js_ID int, --pass from session
@Js_Objective varchar(500),
@Js_Expatsal int,
@Js_JobLevel int,
@Js_JobNature int,
@ERROR VARCHAR(100) OUT

AS

BEGIN
 
UPDATE tbl_JobSeeker_CareerInfo
SET
Js_ID = @Js_ID,
Js_Objective = @Js_Objective,
Js_Expatsal = @Js_Expatsal,
Js_JobLevel = @Js_JobLevel,
Js_JobNature = @Js_JobNature
WHERE Js_ID = @Js_ID
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR='Carrer Information Registered Successfully' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationCMP]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_RegisterationCMP]
@Cmp_UserName varchar(40),
@Cmp_Password varchar(60),
@Cmp_Name varchar(120),
@Cmp_Description varchar(250),
@Cmp_Address varchar(120),
@Cmp_City int,
@Cmp_PhoneNumber bigint,
@Cmp_PersName varchar(40),
@Cmp_PersDesignation varchar(30),
@Cmp_PersTelNum bigint,

@ERROR VARCHAR(100) OUT


AS

BEGIN
--Checking Condition if User exists or not 
--if user not exists returns different message if exists returns different message 

IF NOT EXISTS(SELECT * FROM tbl_Company_BasicInfo 
							WHERE Cmp_UserName=@Cmp_UserName or Cmp_Name=@Cmp_Name
			 )
BEGIN 
INSERT INTO tbl_Company_BasicInfo
( 
Cmp_UserName,
Cmp_Password,
Cmp_Name,
Cmp_Status,
Cmp_Description
)
VALUES(
@Cmp_UserName,
@Cmp_Password,
@Cmp_Name,
'Enable',
@Cmp_Description
)
 declare @Company_ID int = scope_identity()
 
 INSERT INTO tbl_Company_AddressInfo
( 
Cmp_ID,
Cmp_Address,
Cmp_City,
Cmp_PhoneNumber
)
VALUES(
@Company_ID,
@Cmp_Address,
@Cmp_City,
@Cmp_PhoneNumber
)
 INSERT INTO tbl_Company_PersonInfo
 ( 
Cmp_ID,
Cmp_PersName,
Cmp_PersDesignation,
Cmp_PersTelNum
)
VALUES(
@Company_ID,
@Cmp_PersName,
@Cmp_PersDesignation,
@Cmp_PersTelNum
)

 INSERT INTO tbl_Company_IndustryType
 ( 
Cmp_ID,
Cmp_IndustryType
)
VALUES(
@Company_ID,
0
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@Cmp_UserName+ ' Registered Successfully'
END 
ELSE 
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR=@Cmp_UserName+ ' or ' + @Cmp_Name + ' Already Exists'
END 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationEducationSummaryJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  PROCEDURE [dbo].[SP_RegisterationEducationSummaryJS]
@Js_ID int, --pass from session
@Js_UserName varchar(40), --pass from session,used for messege
@Js_EduLevel int,
@Js_DegreeTitle int,
@Js_DegreeMajor varchar(60),
@Js_InstituteName varchar(60),
@Js_DegreeResult varchar(20),
@Js_YearofPassing varchar(20),
@Js_DegreeDuration varchar(20), 
@ERROR VARCHAR(100) OUT

AS

BEGIN

INSERT INTO tbl_JobSeeker_EducationSummary
( 
Js_ID,
Js_EduLevel,
Js_DegreeTitle,
Js_DegreeMajor,
Js_InstituteName,
Js_DegreeResult,
Js_YearofPassing,
Js_DegreeDuration
)
VALUES
(
@Js_ID,
@Js_EduLevel,
@Js_DegreeTitle,
@Js_DegreeMajor,
@Js_InstituteName,
@Js_DegreeResult,
@Js_YearofPassing,
@Js_DegreeDuration
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@Js_UserName + ', Information Registered Successfully'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_RegisterationJS]
@Js_UserName varchar(40),
@Js_Password varchar(60),
@Js_FirstName varchar(20),
@Js_LastName varchar(20),
@Js_Email varchar(50),
@ERROR VARCHAR(100) OUT


AS

BEGIN
--Checking Condition if User exists or not 
--if user not exists returns different message if exists returns different message 

IF NOT EXISTS(SELECT * FROM tbl_JobSeeker_BasicInfo 
							WHERE Js_UserName=@Js_UserName or Js_Email=@Js_Email
			 )
BEGIN 
INSERT INTO tbl_JobSeeker_BasicInfo
( 
Js_UserName,
Js_Password,
Js_FirstName,
Js_LastName,
Js_Email
)
VALUES(
@Js_UserName,
@Js_Password,
@Js_FirstName,
@Js_LastName,
@Js_Email 
)
declare @Js_JBI_ID int = scope_identity()

INSERT INTO tbl_JobSeeker_PersonalInfo
( 
Js_ID
)
VALUES
(
@Js_JBI_ID
)

INSERT INTO tbl_JobSeeker_CareerInfo
( 
Js_ID
)
VALUES
(
@Js_JBI_ID
)

INSERT INTO tbl_JobSeeker_PreferredJobCategory
( 
Js_ID
)
VALUES
(
@Js_JBI_ID
)

INSERT INTO tbl_JobSeeker_EducationSummary
( 
Js_ID
)
VALUES
(
@Js_JBI_ID
)

INSERT INTO tbl_JobSeeker_Specialization
( 
Js_ID
)
VALUES
(
@Js_JBI_ID
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=''
END 
ELSE 
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR=@Js_UserName+ ' or ' + @Js_Email + ' Already Exists'
END 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationLanguageLevelJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Job Seeker Language Level Registration Stored Procedure 
Create  PROCEDURE [dbo].[SP_RegisterationLanguageLevelJS]
@Js_ID int, --pass from session
@Js_UserName varchar(40), --pass from session,used for messege
@Js_LanguageName int,
@Js_LangRead int,
@Js_LangWrite int,
@Js_LangSpeak int,
@ERROR VARCHAR(100) OUT

AS

BEGIN

INSERT INTO tbl_JobSeeker_LanguageLevel
( 
Js_ID,
Js_LanguageName,
Js_LangRead,
Js_LangWrite,
Js_LangSpeak
)
VALUES
(
@Js_ID,
@Js_LanguageName,
@Js_LangRead,
@Js_LangWrite,
@Js_LangSpeak
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@Js_UserName + ', Information Registered Successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationPersonalInfoJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Job Seeker Personal Information Registration Stored Procedure 
CREATE  PROCEDURE [dbo].[SP_RegisterationPersonalInfoJS]
@Js_ID int, --pass from session
@Js_FatherName varchar(40),
@Js_MotherName varchar(40),
@Js_DOB varchar(40),
@Js_Gender int,
@Js_Religion int,
@Js_MaritalStatus int,
@Js_NID bigint,
@Js_PresentAddress varchar(250),
@Js_PermanentAddress varchar(250),
@Js_CurrentLocation int,
@Js_PhoneNumber_1 bigint,
@Js_PhoneNumber_2 bigint,
@ERROR VARCHAR(100) OUT
AS
BEGIN
UPDATE tbl_JobSeeker_PersonalInfo
SET
Js_ID = @Js_ID,
Js_FatherName = @Js_FatherName,
Js_MotherName = @Js_MotherName,
Js_DOB = @Js_DOB,
Js_Gender = @Js_Gender,
Js_Religion = @Js_Religion,
Js_MaritalStatus = @Js_MaritalStatus,
Js_NID = @Js_NID,
Js_PresentAddress = @Js_PresentAddress,
Js_PermanentAddress = @Js_PermanentAddress,
Js_CurrentLocation = @Js_CurrentLocation,
Js_PhoneNumber_1 = @Js_PhoneNumber_1,
Js_PhoneNumber_2 = @Js_PhoneNumber_2
WHERE Js_ID = @Js_ID
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR='Personal Information Updated Successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationPreferredJobCategoryJS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_RegisterationPreferredJobCategoryJS]
@Js_ID int, --pass from session
@Js_PrefJobCat_1 int,
@Js_PrefJobCat_2 int,
@Js_PrefJobCat_3 int,
@Js_PrefJobLoc_1 int,
@Js_PrefJobLoc_2 int,
@Js_PrefJobLoc_3 int,  
@ERROR VARCHAR(100) OUT
AS
BEGIN
UPDATE tbl_JobSeeker_PreferredJobCategory
SET
Js_ID = @Js_ID,
Js_PrefJobCat_1 = @Js_PrefJobCat_1,
Js_PrefJobCat_2 = @Js_PrefJobCat_2,
Js_PrefJobCat_3 = @Js_PrefJobCat_3,
Js_PrefJobLoc_1 = @Js_PrefJobLoc_1,
Js_PrefJobLoc_2 = @Js_PrefJobLoc_2,
Js_PrefJobLoc_3 = @Js_PrefJobLoc_3
WHERE Js_ID = @Js_ID
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR='Preferred Job Category and Location Information Updated Successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterationSYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  PROCEDURE [dbo].[SP_RegisterationSYS]
@System_UserName varchar(40),
@System_Password varchar(60),
@ERROR VARCHAR(100) OUT

AS

BEGIN
--Checking Condition if User exists or not 
--if user not exists returns different message if exists returns different message 

IF NOT EXISTS(SELECT * FROM tbl_System_SystemInfo 
							WHERE System_UserName=@System_UserName
			 )
BEGIN 
INSERT INTO tbl_System_SystemInfo
( 
System_UserName,
System_Password
)
VALUES(
@System_UserName,
@System_Password
)
--If User Successfully Registerd I am returing this Message as Output Parameter
SET @ERROR=@System_UserName + ' Registered Successfully'
END 
ELSE 
BEGIN
--If User already Exists i am returning this Message as Output Parameter
SET @ERROR=@System_UserName + ' Already Exists'
END 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Religion_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Admin Gender CRUD Stored Procedure 
CREATE proc [dbo].[SP_Religion_SYS]
@Religion_ID int =0,
@Religion_Name varchar(15)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_Religion(Religion_Name) values(@Religion_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Religion_ID, Religion_Name FROM tbl_System_Religion ORDER BY Religion_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_Religion set Religion_Name=@Religion_Name where Religion_ID=@Religion_ID 
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
delete from tbl_System_Religion where Religion_ID=@Religion_ID
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ReportJob_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ReportJob_SYS]
@Job_ID int =0,
@Js_ID int =0,
@ReportType_ID int =0,
@Add_Cmnt varchar(250),
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_ReportJob(Job_ID,Js_ID,ReportType_ID,Add_Cmnt) values(@Job_ID,@Js_ID,@ReportType_ID,@Add_Cmnt) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Job_ID,Js_ID,ReportType_ID,Add_Cmnt FROM tbl_System_ReportJob ORDER BY Job_ID
end 
set nocount off 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_SingleJobInfo]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SingleJobInfo]
@Job_ID int
AS
BEGIN
SELECT 
job.Job_ID,
job.Job_Title,
job.Job_VacancyNo,
job.Job_Gender,
job.Job_Experience,
job.Job_SalRange,
job.Job_Decription,
job.Job_ExpReq,
job.Job_EduRequirement,
job.Job_Requirement,
job.Job_OtherBenifit,
job.Job_PostDate,
job.Job_Deadline,
city.City_Name,
category.JobCategory_Name,
nature.JobNature_Name,
cmp.Cmp_Name,
cmpAddress.Cmp_Address,
cmpAddress.Cmp_PhoneNumber
FROM tbl_Company_PostedJobInfo as job
INNER JOIN tbl_System_CityName as city on job.Job_Location = city.City_ID
INNER JOIN tbl_System_JobCategory as category on job.Job_Category = category.JobCategory_ID
INNER JOIN tbl_System_JobNature as nature on job.Job_Nature = nature.JobNature_ID
INNER JOIN tbl_Company_BasicInfo as cmp on job.Cmp_ID = cmp.Cmp_ID
INNER JOIN tbl_Company_AddressInfo as cmpAddress on job.Cmp_ID = cmpAddress.Cmp_ID
WHERE Job_ID = @Job_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SkillInfo_SYS]    Script Date: 02-Apr-18 12:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_SkillInfo_SYS]
@Skill_ID int =0,
@Skill_Name varchar(60)=null, 
@status varchar(50) 

as
 
begin
set nocount on; 

--- Insert New Records 
if @status='INSERT' 
begin 
insert into tbl_System_SkillInfo(Skill_Name) values(@Skill_Name) 
end

--- Select Records in Table 
if @status='SELECT' 
begin 
select Skill_ID, Skill_Name FROM tbl_System_SkillInfo ORDER BY Skill_ID
end 
--- Update Records in Table  
if @status='UPDATE' 
begin
update tbl_System_SkillInfo set Skill_Name=@Skill_Name where Skill_ID=@Skill_ID
end 
--- Delete Records from Table 
if @status='DELETE' 
begin
declare @Skill_ID_Del int = (select Skill_ID  from tbl_System_SkillInfo where Skill_Name=@Skill_Name) 
delete from tbl_System_SkillInfo where Skill_ID=@Skill_ID_Del
end 
set nocount off 
end
GO
