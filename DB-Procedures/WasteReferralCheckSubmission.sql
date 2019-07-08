USE [ProdRubbishRecycling]
GO

/****** Object:  StoredProcedure [dbo].[WasteReferralCheckSubmission]    Script Date: 08/07/2019 12:37:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 20/10/2017
-- Description:	Checks if the user submitted a Waste referral form already
-- =============================================
CREATE PROCEDURE [dbo].[WasteReferralCheckSubmission] 
	-- Add the parameters for the stored procedure here
	@WhoAreYou varchar (20), 
	@UPRNP int,
	@FirstLineAddressP varchar (20),
	@PostcodeP varchar (20),
	@UPRNC int,
	@FirstLineAddressC varchar (20),
	@PostcodeC varchar (20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @count int
	SET @count = 0
    --Determine whether the record already exists
    IF @WhoAreYou = 'for myself'
	SELECT @count = COUNT(*)
	FROM WasteReferral
	WHERE (UPRN = @UPRNP  OR (FirstLineAddress =@FirstLineAddressP AND Postcode = @PostcodeP)) AND Approved IS NULL 
	IF @WhoAreYou = 'for somebody else'
	SELECT @count = COUNT(*)
	FROM WasteReferral
	WHERE (UPRN = @UPRNC  OR (FirstLineAddress =@FirstLineAddressC AND Postcode = @PostcodeC)) AND Approved IS NULL 
	--print message if the record exists
	IF (@count > 0)
		BEGIN
		SELECT 'You have already applied for a waste referral, please wait for the decision.' AS Message
		END
END

GO

