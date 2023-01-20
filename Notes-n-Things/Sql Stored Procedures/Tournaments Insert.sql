USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Insert]    Script Date: 2023-01-19 4:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTournaments_Insert]
	@TournamentName nvarchar(200),
	@EntryFee money,
	@id int = 0 output
	

AS
BEGIN

	SET NOCOUNT ON;

    
	INSERT INTO dbo.Tournaments (TournamentName, EntryFee, Active)
	VALUES ( @TournamentName, @EntryFee, 1);
END