USE [ProdRubbishRecycling]
GO

/****** Object:  StoredProcedure [dbo].[WasteHealthDecision]    Script Date: 08/07/2019 12:36:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 15/10/2017
-- Description:	Updates table dbo.WasteReferral with decision(approved or not) from the Waste - Health referral form
-- =============================================
CREATE PROCEDURE [dbo].[WasteHealthDecision] 
	-- Add the parameters for the stored procedure here

	 @Approved varchar (10),
	 @ApprovedDate date,
     @UPRNP int,
     @UPRNC int,
	 @FirstLineAddressP varchar (50),
     @FirstLineAddressC varchar (50),
	 @PostcodeP varchar (10),
     @PostcodeC varchar (10)
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.WasteReferral
	SET   Approved = @Approved,
		  ApprovedDate = @ApprovedDate
	WHERE (UPRN = @UPRNP or (FirstLineAddress = @FirstLineAddressP and Postcode = @PostcodeP)) or
	(UPRN = @UPRNC or (FirstLineAddress = @FirstLineAddressC and Postcode = @PostcodeC))
	
		UPDATE dbo.WasteHealthCollection
	SET   Approved = @Approved
		  
	WHERE (UPRN = @UPRNP or (FirstLineAddress = @FirstLineAddressP and Postcode = @PostcodeP)) or
	(UPRN = @UPRNC or (FirstLineAddress = @FirstLineAddressC and Postcode = @PostcodeC))
END

GO

