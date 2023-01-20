USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 2023-01-19 4:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTeam_GetByTournament]
	@TournamentId int

AS
BEGIN
	SET NOCOUNT ON;

	SELECT t.*
	FROM dbo.Teams t
	INNER JOIN dbo.TournamentEntries e on t.id = e.TeamId
	WHERE e.TournamentId = @TournamentId;

END