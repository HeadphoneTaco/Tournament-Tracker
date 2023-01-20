USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 2023-01-19 4:56:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTeam_GetAll]



AS
BEGIN

	SET NOCOUNT ON;

    
	SELECT *
	FROM dbo.Teams;

END