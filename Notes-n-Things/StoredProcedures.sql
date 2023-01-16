--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 2023-01-06 7:00:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_GetAll]

AS
BEGIN

	SET NOCOUNT ON

	SELECT *
	FROM dbo.People

END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetByLastName]    Script Date: 2023-01-06 6:07:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_GetByLastName]

	@LastName nvarchar(100)

AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM dbo.People
	WHERE LastName = @LastName;
END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 2023-01-06 4:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_Insert] 
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@EmailAddress nvarchar(100),
	@CellphoneNumber varchar(20),
	@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	VALUES (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	SELECT @id=SCOPE_IDENTITY();

END
--
--
USE [Tournaments]
GO
/****** Object: StoredProcedure [dbo].[spPrizes_GetByTournament] Script Date: 2023-01-02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
        -- Gets all the prizes for a given tournament
CREATE PROCEDURE [dbo].[spPrizes_GetByTournament]
    @TournamentId int
AS
BEGIN

    SET NOCOUNT ON;

    SELECT p.*
	FROM dbo.Prizes p
    INNER JOIN dbo.TournamentPrizes t ON p.id = t.PrizesId
    WHERE t.TournamentId = @TournamentId;


END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 2023-01-04 3:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPrizes_Insert]
	@PlaceNumber int,
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output

AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Prizes (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	VALUES (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	SELECT @id = SCOPE_IDENTITY();


END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 2023-01-09 12:00:15 PM ******/
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
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 2023-01-09 12:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTeamMembers_GetByTeam]
	@TeamId int
AS
BEGIN

	SET NOCOUNT ON;

    SELECT p.*
    FROM dbo.TeamMembers m
    INNER JOIN dbo.People p ON m.PersonId = p.id
    WHERE m.TeamId = @TeamId;


END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_GetAll]    Script Date: 2023-01-16 3:21:21 PM ******/
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
--
--

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.spMatchupEntries_GetByMatchup
		@MatchupId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT *
	FROM MatchupEntries
	WHERE MatchupId = @MatchupId

END
GO
