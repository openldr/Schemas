USE master
GO

IF EXISTS(select * from sys.databases where name='ViralLoadData')
BEGIN
	IF EXISTS (SELECT * FROM ViralLoadData.dbo.VersionControl WHERE VersionStamp = '1.0.0')
	BEGIN
		PRINT 'The database ViralLoadData already exists'
		SET NOEXEC ON
		SET NOCOUNT ON
	END
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'ViralLoadData'
	ALTER DATABASE [ViralLoadData] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE [ViralLoadData]
END
GO
CREATE DATABASE ViralLoadData  
COLLATE SQL_Latin1_General_CP1_CI_AS;
GO

USE [ViralLoadData]
GO
/****** Object:  Table [dbo].[VlData]    Script Date: 8/14/2019 1:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VlData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [varchar](26) NULL,
	[Versionstamp] [varchar](30) NULL,
	[REFNO] [varchar](56) NULL,
	[REGISTEREDDATE] [datetime] NULL,
	[LOCATION] [varchar](5) NULL,
	[WARD] [varchar](5) NULL,
	[HOSPID] [varchar](26) NULL,
	[NATIONALITY] [varchar](5) NULL,
	[NATIONALID] [varchar](26) NULL,
	[UNIQUEID] [varchar](31) NULL,
	[SURNAME] [varchar](31) NULL,
	[FIRSTNAME] [varchar](31) NULL,
	[INITIALS] [varchar](16) NULL,
	[REFDRCODE] [varchar](5) NULL,
	[REFDR] [varchar](41) NULL,
	[MEDAID] [varchar](5) NULL,
	[MEDAIDNO] [varchar](26) NULL,
	[BILLACCNO] [varchar](23) NULL,
	[TELHOME] [varchar](20) NULL,
	[TELWORK] [varchar](20) NULL,
	[MOBILE] [varchar](20) NULL,
	[EMAIL] [varchar](60) NULL,
	[DOB] [date] NULL,
	[DOBType] [varchar](25) NULL,
	[AgeInDays] [int] NULL,
	[HL7SexCode] [char](1) NULL,
	[SpecimenDatetime] [datetime] NULL,
	[ReceivedDateTime] [datetime] NULL,
	[RegisteredDateTime] [datetime] NULL,
	[AnalysisDateTime] [datetime] NULL,
	[AuthorisedDateTime] [datetime] NULL,
	[LIMSRejectionCode] [varchar](10) NULL,
	[LIMSRejectionDesc] [varchar](250) NULL,
	[LIMSDateTimeStamp] [datetime] NULL,
	[Newborn] [bit] NULL,
	[Pregnant] [varchar](80) NOT NULL,
	[BreastFeeding] [varchar](80) NOT NULL,
	[FirstTime] [varchar](80) NOT NULL,
	[CollectedDate] [varchar](80) NULL,
	[CollectedTime] [varchar](80) NULL,
	[DataDeInicioDoTARV] [varchar](80) NULL,
	[PrimeiraLinha] [varchar](80) NOT NULL,
	[SegundaLinha] [varchar](80) NOT NULL,
	[ARTRegimen] [varchar](80) NOT NULL,
	[TypeOfSampleCollection] [varchar](80) NOT NULL,
	[LastViralLoadDate] [varchar](80) NOT NULL,
	[LastViralLoadResult] [varchar](80) NOT NULL,
	[RequestingClinician] [varchar](80) NOT NULL,
	[LIMSVersionstamp] [varchar](30) NULL,
	[LOINCPanelCode] [varchar](10) NULL,
	[HL7PriorityCode] [char](1) NULL,
	[AdmitAttendDateTime] [datetime] NULL,
	[CollectionVolume] [float] NULL,
	[LIMSFacilityCode] [varchar](15) NULL,
	[LIMSFacilityName] [varchar](50) NULL,
	[LIMSProvinceName] [varchar](50) NULL,
	[LIMSDistrictName] [varchar](50) NULL,
	[RequestingFacilityCode] [varchar](15) NULL,
	[RequestingFacilityName] [varchar](50) NULL,
	[RequestingProvinceName] [varchar](50) NULL,
	[RequestingDistrictName] [varchar](50) NULL,
	[ReceivingFacilityCode] [varchar](10) NULL,
	[ReceivingFacilityName] [varchar](50) NULL,
	[ReceivingProvinceName] [varchar](50) NULL,
	[ReceivingDistrictName] [varchar](50) NULL,
	[TestingFacilityCode] [varchar](10) NULL,
	[TestingFacilityName] [varchar](50) NULL,
	[TestingProvinceName] [varchar](50) NULL,
	[TestingDistrictName] [varchar](50) NULL,
	[LIMSPointOfCareDesc] [varchar](50) NULL,
	[RequestTypeCode] [varchar](3) NULL,
	[ICD10ClinicalInfoCodes] [varchar](50) NULL,
	[ClinicalInfo] [varchar](250) NULL,
	[HL7SpecimenSourceCode] [varchar](10) NULL,
	[LIMSSpecimenSourceCode] [varchar](10) NULL,
	[LIMSSpecimenSourceDesc] [varchar](50) NULL,
	[HL7SpecimenSiteCode] [varchar](10) NULL,
	[LIMSSpecimenSiteCode] [varchar](10) NULL,
	[LIMSSpecimenSiteDesc] [varchar](50) NULL,
	[WorkUnits] [float] NULL,
	[CostUnits] [float] NULL,
	[HL7SectionCode] [varchar](3) NULL,
	[HL7ResultStatusCode] [char](1) NULL,
	[RegisteredBy] [varchar](250) NULL,
	[TestedBy] [varchar](250) NULL,
	[AuthorisedBy] [varchar](250) NULL,
	[OrderingNotes] [varchar](250) NULL,
	[EncryptedPatientID] [varchar](20) NULL,
	[HL7EthnicGroupCode] [char](3) NULL,
	[Deceased] [bit] NULL,
	[HL7PatientClassCode] [char](1) NULL,
	[AttendingDoctor] [varchar](50) NULL,
	[ReferringRequestID] [varchar](25) NULL,
	[Therapy] [varchar](250) NULL,
	[LIMSAnalyzerCode] [varchar](10) NULL,
	[TargetTimeDays] [int] NULL,
	[TargetTimeMins] [int] NULL,
	[Repeated] [tinyint] NULL,
	[HIVVL_AuthorisedDateTime] [datetime] NULL,
	[HIVVL_LIMSRejectionCode] [varchar](10) NULL,
	[HIVVL_LIMSRejectionDesc] [varchar](250) NULL,
	[HIVVL_VRLogValue] [varchar](80) NULL,
	[ViralLoadResultCategory] [nvarchar](1024) NULL,
	[HIVVL_ViralLoadResult] [varchar](80) NULL,
	[HIVVL_ViralLoadCAPCTM] [varchar](80) NULL,
	[AgeGroup] [nvarchar](64) NULL,
	[AgeInYears] [int] NULL,
	[ReasonForTest] [nvarchar](64) NOT NULL,
	[RegisteredYearAndQuarter] [varchar](25) NOT NULL,
	[RegisteredYearAndMonth] [varchar](25) NOT NULL,
	[DateTimeStamp] [datetime] NULL,
	[HealthCareID] [varchar](20) NULL,
	[FullFacilityCode] [varchar](50) NULL,
 CONSTRAINT [PK_vldata] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VlTemp]    Script Date: 8/14/2019 1:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VlTemp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [varchar](26) NULL,
	[Versionstamp] [varchar](30) NULL,
	[REFNO] [varchar](56) NULL,
	[REGISTEREDDATE] [datetime] NULL,
	[LOCATION] [varchar](5) NULL,
	[WARD] [varchar](5) NULL,
	[HOSPID] [varchar](26) NULL,
	[NATIONALITY] [varchar](5) NULL,
	[NATIONALID] [varchar](26) NULL,
	[UNIQUEID] [varchar](31) NULL,
	[SURNAME] [varchar](31) NULL,
	[FIRSTNAME] [varchar](31) NULL,
	[INITIALS] [varchar](16) NULL,
	[REFDRCODE] [varchar](5) NULL,
	[REFDR] [varchar](41) NULL,
	[MEDAID] [varchar](5) NULL,
	[MEDAIDNO] [varchar](26) NULL,
	[BILLACCNO] [varchar](23) NULL,
	[TELHOME] [varchar](20) NULL,
	[TELWORK] [varchar](20) NULL,
	[MOBILE] [varchar](20) NULL,
	[EMAIL] [varchar](60) NULL,
	[DOB] [date] NULL,
	[DOBType] [varchar](25) NULL,
	[AgeInDays] [int] NULL,
	[HL7SexCode] [char](1) NULL,
	[SpecimenDatetime] [datetime] NULL,
	[ReceivedDateTime] [datetime] NULL,
	[RegisteredDateTime] [datetime] NULL,
	[AnalysisDateTime] [datetime] NULL,
	[AuthorisedDateTime] [datetime] NULL,
	[LIMSRejectionCode] [varchar](10) NULL,
	[LIMSRejectionDesc] [varchar](250) NULL,
	[LIMSDateTimeStamp] [datetime] NULL,
	[Newborn] [bit] NULL,
	[Pregnant] [varchar](80) NOT NULL,
	[BreastFeeding] [varchar](80) NOT NULL,
	[FirstTime] [varchar](80) NOT NULL,
	[CollectedDate] [varchar](80) NULL,
	[CollectedTime] [varchar](80) NULL,
	[DataDeInicioDoTARV] [varchar](80) NULL,
	[PrimeiraLinha] [varchar](80) NOT NULL,
	[SegundaLinha] [varchar](80) NOT NULL,
	[ARTRegimen] [varchar](80) NOT NULL,
	[TypeOfSampleCollection] [varchar](80) NOT NULL,
	[LastViralLoadDate] [varchar](80) NOT NULL,
	[LastViralLoadResult] [varchar](80) NOT NULL,
	[RequestingClinician] [varchar](80) NOT NULL,
	[LIMSVersionstamp] [varchar](30) NULL,
	[LOINCPanelCode] [varchar](10) NULL,
	[HL7PriorityCode] [char](1) NULL,
	[AdmitAttendDateTime] [datetime] NULL,
	[CollectionVolume] [float] NULL,
	[LIMSFacilityCode] [varchar](15) NULL,
	[LIMSFacilityName] [varchar](50) NULL,
	[LIMSProvinceName] [varchar](50) NULL,
	[LIMSDistrictName] [varchar](50) NULL,
	[RequestingFacilityCode] [varchar](15) NULL,
	[RequestingFacilityName] [varchar](50) NULL,
	[RequestingProvinceName] [varchar](50) NULL,
	[RequestingDistrictName] [varchar](50) NULL,
	[ReceivingFacilityCode] [varchar](10) NULL,
	[ReceivingFacilityName] [varchar](50) NULL,
	[ReceivingProvinceName] [varchar](50) NULL,
	[ReceivingDistrictName] [varchar](50) NULL,
	[TestingFacilityCode] [varchar](10) NULL,
	[TestingFacilityName] [varchar](50) NULL,
	[TestingProvinceName] [varchar](50) NULL,
	[TestingDistrictName] [varchar](50) NULL,
	[LIMSPointOfCareDesc] [varchar](50) NULL,
	[RequestTypeCode] [varchar](3) NULL,
	[ICD10ClinicalInfoCodes] [varchar](50) NULL,
	[ClinicalInfo] [varchar](250) NULL,
	[HL7SpecimenSourceCode] [varchar](10) NULL,
	[LIMSSpecimenSourceCode] [varchar](10) NULL,
	[LIMSSpecimenSourceDesc] [varchar](50) NULL,
	[HL7SpecimenSiteCode] [varchar](10) NULL,
	[LIMSSpecimenSiteCode] [varchar](10) NULL,
	[LIMSSpecimenSiteDesc] [varchar](50) NULL,
	[WorkUnits] [float] NULL,
	[CostUnits] [float] NULL,
	[HL7SectionCode] [varchar](3) NULL,
	[HL7ResultStatusCode] [char](1) NULL,
	[RegisteredBy] [varchar](250) NULL,
	[TestedBy] [varchar](250) NULL,
	[AuthorisedBy] [varchar](250) NULL,
	[OrderingNotes] [varchar](250) NULL,
	[EncryptedPatientID] [varchar](20) NULL,
	[HL7EthnicGroupCode] [char](3) NULL,
	[Deceased] [bit] NULL,
	[HL7PatientClassCode] [char](1) NULL,
	[AttendingDoctor] [varchar](50) NULL,
	[ReferringRequestID] [varchar](25) NULL,
	[Therapy] [varchar](250) NULL,
	[LIMSAnalyzerCode] [varchar](10) NULL,
	[TargetTimeDays] [int] NULL,
	[TargetTimeMins] [int] NULL,
	[Repeated] [tinyint] NULL,
	[HIVVL_AuthorisedDateTime] [datetime] NULL,
	[HIVVL_LIMSRejectionCode] [varchar](10) NULL,
	[HIVVL_LIMSRejectionDesc] [varchar](250) NULL,
	[HIVVL_VRLogValue] [varchar](80) NULL,
	[ViralLoadResultCategory] [nvarchar](1024) NULL,
	[HIVVL_ViralLoadResult] [varchar](80) NULL,
	[HIVVL_ViralLoadCAPCTM] [varchar](80) NULL,
	[AgeGroup] [nvarchar](64) NULL,
	[AgeInYears] [int] NULL,
	[ReasonForTest] [nvarchar](64) NOT NULL,
	[RegisteredYearAndQuarter] [varchar](25) NOT NULL,
	[RegisteredYearAndMonth] [varchar](25) NOT NULL,
	[DateTimeStamp] [datetime] NULL,
	[HealthCareID] [varchar](20) NULL,
	[FullFacilityCode] [varchar](50) NULL,
 CONSTRAINT [PK_vltemp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[viewVLData]    Script Date: 8/14/2019 1:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- select * from OpenLDRDict.[dbo].[viewFacilities] 
CREATE VIEW [dbo].[viewVLData]
AS 

SELECT [RequestID]
      ,[AgeInDays]
      ,[HL7SexCode]
      ,[SpecimenDatetime]
      ,[ReceivedDateTime]
      ,[RegisteredDateTime]
      ,[AnalysisDateTime]
      ,[AuthorisedDateTime]
      ,[LIMSRejectionCode]
      ,[LIMSRejectionDesc]
      ,[LIMSDateTimeStamp]
      ,[Newborn]
      ,[Pregnant]
      ,[BreastFeeding]
      ,[FirstTime]
      ,[CollectedDate]
      ,[CollectedTime]
      ,[DataDeInicioDoTARV]
      ,[PrimeiraLinha]
      ,[SegundaLinha]
      ,[ARTRegimen]
      ,[TypeOfSampleCollection]
      ,[LastViralLoadDate]
      ,[LastViralLoadResult]
      ,[RequestingClinician]
      ,[LIMSVersionstamp]
      ,[LOINCPanelCode]
      ,[HL7PriorityCode]
      ,[AdmitAttendDateTime]
      ,[CollectionVolume]
      ,[LIMSFacilityCode]
      ,[LIMSFacilityName]
      ,[LIMSProvinceName]
      ,[LIMSDistrictName]
      ,[RequestingFacilityCode]
      ,[RequestingFacilityName]
      ,[RequestingProvinceName]
      ,[RequestingDistrictName]
      ,[ReceivingFacilityCode]
      ,[ReceivingFacilityName]
      ,[ReceivingProvinceName]
      ,[ReceivingDistrictName]
      ,[TestingFacilityCode]
      ,[TestingFacilityName]
      ,[TestingProvinceName]
      ,[TestingDistrictName]
      ,[LIMSPointOfCareDesc]
      ,[RequestTypeCode]
      ,[ICD10ClinicalInfoCodes]
      ,[ClinicalInfo]
      ,[HL7SpecimenSourceCode]
      ,[LIMSSpecimenSourceCode]
      ,[LIMSSpecimenSourceDesc]
      ,[HL7SpecimenSiteCode]
      ,[LIMSSpecimenSiteCode]
      ,[LIMSSpecimenSiteDesc]
      ,[WorkUnits]
      ,[CostUnits]
      ,[HL7SectionCode]
      ,[HL7ResultStatusCode]
      ,[RegisteredBy]
      ,[TestedBy]
      ,[AuthorisedBy]
      ,[OrderingNotes]
      ,[EncryptedPatientID]
      ,[HL7EthnicGroupCode]
      ,[Deceased]
      ,[HL7PatientClassCode]
      ,[AttendingDoctor]
      ,[ReferringRequestID]
      ,[Therapy]
      ,[LIMSAnalyzerCode]
      ,[TargetTimeDays]
      ,[TargetTimeMins]
      ,[Repeated]
      ,[HIVVL_AuthorisedDateTime]
      ,[HIVVL_LIMSRejectionCode]
      ,[HIVVL_LIMSRejectionDesc]
      ,[HIVVL_VRLogValue]
      ,[ViralLoadResultCategory]
      ,[HIVVL_ViralLoadResult]
      ,[HIVVL_ViralLoadCAPCTM]
      ,[AgeGroup]
      ,[AgeInYears]
      ,[ReasonForTest]
      ,[RegisteredYearAndQuarter]
      ,[RegisteredYearAndMonth]
      ,[DateTimeStamp]
      ,[HealthCareID]
      ,[FullFacilityCode]
  FROM [ViralLoadData].[dbo].[VlData]




GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VersionControl](
	[DateTimeStamp] [datetime] NULL,
	[VersionActivationDate] [datetime] NULL,
	[VERBase] [int] NULL,
	[VERUpdate] [int] NULL,
	[VERBuild] [int] NULL,
	[VersionStamp] [varchar](20) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO [dbo].[VersionControl] VALUES(GETDATE(),GETDATE(),null,null,null,'1.0.0')
GO

SET NOCOUNT OFF
SET NOEXEC OFF
