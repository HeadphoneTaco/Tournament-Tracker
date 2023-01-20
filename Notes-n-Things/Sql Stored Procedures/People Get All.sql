USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 2023-01-19 4:56:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spPeople_GetAll]

AS
BEGIN

	SET NOCOUNT ON

	SELECT *
	FROM dbo.People

END