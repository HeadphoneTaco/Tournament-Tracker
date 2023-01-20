USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetByTournament]    Script Date: 2023-01-19 4:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
        -- Gets all the prizes for a given tournament
ALTER PROCEDURE [dbo].[spPrizes_GetByTournament]
    @TournamentId int
AS
BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT p.*
	FROM dbo.Prizes p
    INNER JOIN dbo.TournamentPrizes t ON p.id = t.PrizeId
    WHERE t.TournamentId = @TournamentId;


END