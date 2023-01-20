USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Complete]    Script Date: 2023-01-19 4:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTournaments_Complete]
	@id int

AS
BEGIN

	SET NOCOUNT ON;

    
	UPDATE dbo.Tournaments
	SET Active = 0
	WHERE id = @id;
END