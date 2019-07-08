USE [ProdRubbishRecycling]
GO

/****** Object:  StoredProcedure [dbo].[BiffaWasteCollectedOrNot]    Script Date: 08/07/2019 12:44:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 27/02/2018
-- Description:	Update table WasteHealthCollection with whether the collection has taken place or no
-- =============================================
CREATE PROCEDURE [dbo].[BiffaWasteCollectedOrNot]
	-- Add the parameters for the stored procedure here
	 @UPRNP int,
     @UPRNC int,
	 @FirstLineAddressP varchar (50),
     @FirstLineAddressC varchar (50),
	 @PostcodeP varchar (10),
     @PostcodeC varchar (10),
     @WasteCollected varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE dbo.WasteHealthCollection
	SET   WasteCollected = @WasteCollected
		  
	WHERE (UPRN = @UPRNP or (FirstLineAddress = @FirstLineAddressP and Postcode = @PostcodeP)) or
	(UPRN = @UPRNC or (FirstLineAddress = @FirstLineAddressC and Postcode = @PostcodeC))
END

GO

