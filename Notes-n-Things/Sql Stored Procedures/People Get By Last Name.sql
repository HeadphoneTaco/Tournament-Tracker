USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetByLastName]    Script Date: 2023-01-19 4:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spPeople_GetByLastName]

	@LastName nvarchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM dbo.People
	WHERE LastName = @LastName;
END