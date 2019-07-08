USE [ProdRubbishRecycling]
GO

/****** Object:  StoredProcedure [dbo].[WasteReferralGetInfo]    Script Date: 08/07/2019 12:35:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 13/10/2017
-- Description:	approves or declines the referral form for Waste healthcare referral
-- =============================================
CREATE PROCEDURE [dbo].[WasteReferralGetInfo]
			@Date date
		   ,@FormReference varchar (20)
		   ,@Contact_FullName varchar(30)
           ,@Contact_ContactDetails varchar(50)
           ,@Contact_Address varchar(100)
           ,@Customer_FullName varchar(30)
           ,@Customer_ContactDetails varchar(50)
           ,@Customer_Address varchar(100)
           ,@UPRNP int
           ,@UPRNC int
           ,@UCRN varchar(20)
           ,@FirstLineAddressP varchar (50)
           ,@FirstLineAddressC varchar (50)
           ,@PostcodeP varchar (7)
           ,@PostcodeC varchar (7)
           ,@Referral_FullName varchar(30)
           ,@Referral_ContactDetails varchar(50)
           ,@Referral_Address varchar(300)
           ,@WasteType varchar(20)
           ,@HowOften varchar(20)
           ,@Frequency varchar(60)
           ,@Location varchar(50)
           ,@Neighbour varchar(max)
           ,@SecurePlace varchar(max)
           ,@ForSelf varchar(20)
           ,@DatePicked varchar(40)
         
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 DECLARE @RequestType varchar (20)
 SET @RequestType = 'Collection'
 DECLARE @DateChosen	varchar (30)
 SET @DateChosen = CONVERT(date, RIGHT(@DatePicked, 10), 103)
IF @ForSelf = 'for myself'
BEGIN
INSERT INTO [ProdRubbishRecycling].[dbo].[WasteReferral]
			([Date]
		   ,[FormReference]
		   ,[Contact_FullName]
           ,[Contact_ContactDetails]
           ,[Contact_Address]
           ,[Customer_FullName]
           ,[Customer_ContactDetails]
           ,[Customer_Address]
           ,[UPRN]
           ,[UCRN]
           ,[FirstLineAddress]
           ,[Postcode]
           ,[Referral_FullName]
           ,[Referral_ContactDetails]
           ,[Referral_Address]
           ,[WasteType]
           ,[HowOften]
           ,[Frequency]
           ,[Location]
           ,[Neighbour]
           ,[SecurePlace]
           ,[DesiredStartDate]
           ,[ActualColDate])
        
           
     VALUES
		   (@Date
		   ,@FormReference
		   ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@UPRNP
           ,@UCRN
           ,@FirstLineAddressP
           ,@PostcodeP
           ,@Referral_FullName
           ,@Referral_ContactDetails
           ,@Referral_Address
           ,@WasteType
           ,@HowOften
           ,@Frequency
           ,@Location
           ,@Neighbour
           ,@SecurePlace
           ,@DateChosen
           ,@DateChosen)
           
END
IF @ForSelf = 'for somebody else'
BEGIN
INSERT INTO [ProdRubbishRecycling].[dbo].[WasteReferral]
			([Date]
		   ,[FormReference]
		   ,[Contact_FullName]
           ,[Contact_ContactDetails]
           ,[Contact_Address]
           ,[Customer_FullName]
           ,[Customer_ContactDetails]
           ,[Customer_Address]
           ,[UPRN]
           ,[UCRN]
           ,[FirstLineAddress]
           ,[Postcode]
           ,[Referral_FullName]
           ,[Referral_ContactDetails]
           ,[Referral_Address]
           ,[WasteType]
           ,[HowOften]
           ,[Frequency]
           ,[Location]
           ,[Neighbour]
           ,[SecurePlace]
           ,[DesiredStartDate]
           ,[ActualColDate])
          
     VALUES
		   (@Date
		   ,@FormReference
		   ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@Customer_FullName
           ,@Customer_ContactDetails
           ,@Customer_Address
           ,@UPRNC
           ,@UCRN
           ,@FirstLineAddressC
           ,@PostcodeC
           ,@Referral_FullName
           ,@Referral_ContactDetails
           ,@Referral_Address
           ,@WasteType
           ,@HowOften
           ,@Frequency
           ,@Location
           ,@Neighbour
           ,@SecurePlace
           ,@DateChosen
           ,@DateChosen)
         
END
IF @ForSelf = 'for myself'
BEGIN
INSERT INTO [ProdRubbishRecycling].[dbo].[WasteHealthCollection]
			([Date]
		   ,[FormReference]
		   ,[RequestType]
		   ,[Contact_FullName]
           ,[Contact_ContactDetails]
           ,[Contact_Address]
           ,[Customer_FullName]
           ,[Customer_ContactDetails]
           ,[Customer_Address]
           ,[UPRN]
           ,[UCRN]
           ,[FirstLineAddress]
           ,[Postcode]
           ,[WasteType]
           ,[HowOften]
           ,[Frequency]
           ,[Location]
           ,[Neighbour]
           ,[SecurePlace]
           ,[DesiredStartDate]
           ,[ActualColDate])
        
           
     VALUES
		   (@Date
		   ,@FormReference
		   ,@RequestType
		   ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@UPRNP
           ,@UCRN
           ,@FirstLineAddressP
           ,@PostcodeP
           ,@WasteType
           ,@HowOften
           ,@Frequency
           ,@Location
           ,@Neighbour
           ,@SecurePlace
           ,@DateChosen
           ,@DateChosen )
           
END
IF @ForSelf = 'for somebody else'
BEGIN
INSERT INTO [ProdRubbishRecycling].[dbo].[WasteHealthCollection]
			([Date]
		   ,[FormReference]
		   ,[RequestType]
		   ,[Contact_FullName]
           ,[Contact_ContactDetails]
           ,[Contact_Address]
           ,[Customer_FullName]
           ,[Customer_ContactDetails]
           ,[Customer_Address]
           ,[UPRN]
           ,[UCRN]
           ,[FirstLineAddress]
           ,[Postcode]
           ,[WasteType]
           ,[HowOften]
           ,[Frequency]
           ,[Location]
           ,[Neighbour]
           ,[SecurePlace]
           ,[DesiredStartDate]
           ,[ActualColDate])
          
     VALUES
		   (@Date
		   ,@FormReference
		   ,@RequestType
		   ,@Contact_FullName
           ,@Contact_ContactDetails
           ,@Contact_Address
           ,@Customer_FullName
           ,@Customer_ContactDetails
           ,@Customer_Address
           ,@UPRNC
           ,@UCRN
           ,@FirstLineAddressC
           ,@PostcodeC
           ,@WasteType
           ,@HowOften
           ,@Frequency
           ,@Location
           ,@Neighbour
           ,@SecurePlace
           ,@DateChosen
           ,@DateChosen)
         
END

END



GO

