USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_GetAll]    Script Date: 2023-01-19 4:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTournaments_GetAll]

AS
BEGIN

	SET NOCOUNT ON;

    SELECT *
	FROM dbo.Tournaments
	WHERE Active = 1;

END