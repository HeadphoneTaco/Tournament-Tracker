USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 2023-01-19 4:56:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchups_Update]
	@id int,
	@WinnerId int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.Matchups
	SET WinnerId = @WinnerId
	WHERE id = @id;


END