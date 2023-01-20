USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 2023-01-19 4:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTournamentPrizes_Insert]
		@TournamentId int,
		@PrizeId int,
		@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO dbo.TournamentPrizes(TournamentId, PrizeId)
	VALUES (@TournamentId, @PrizeId);

	SELECT @id = SCOPE_IDENTITY();
    
END