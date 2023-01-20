--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_GetByMatchup]    Script Date: 2023-01-19 4:56:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
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
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 2023-01-19 4:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchupEntries_Insert]
	@MatchupId int,
	@ParentMatchupId int,
	@TeamCompetingId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;


	INSERT INTO dbo.MatchupEntries (MatchupId, ParentMatchupId, TeamCompetingId)
	VALUES (@MatchupId, @ParentMatchupId, @TeamCompetingId);

	SELECT @id = SCOPE_IDENTITY();

END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 2023-01-19 4:56:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchupEntries_Update]
	@id int,
	@TeamCompetingId int = null,
	@Score float = null


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.MatchupEntries
	SET TeamCompetingId = @TeamCompetingId, Score =@Score
	WHERE id = @id;

END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_GetByTournament]    Script Date: 2023-01-19 4:56:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchups_GetByTournament]
		@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT m.*
	FROM dbo.Matchups m
	WHERE m.TournamentId = @TournamentId
	ORDER BY MatchupRound;
END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Insert]    Script Date: 2023-01-19 4:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchups_Insert]
	@TournamentId int,
	@MatchupRound int,
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO dbo.Matchups (TournamentId, MatchupRound)
	VALUES (@TournamentId, @MatchupRound);

	SELECT @id = SCOPE_IDENTITY();



END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 2023-01-19 4:56:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spMatchups_Update]
	@id int,
	@WinnerId int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.Matchups
	SET WinnerId = @WinnerId
	WHERE id = @id;


END
--
--
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
--
--
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
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 2023-01-19 4:56:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spPeople_Insert] 
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
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 2023-01-19 4:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spPrizes_Insert]
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
--
--
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
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 2023-01-19 4:55:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 2023-01-19 4:55:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTeamMembers_Insert]
	@TeamId int,
	@PersonId int,
	@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO dbo.TeamMembers(TeamId, PersonId)
	VALUES (@TeamId, @PersonId);

	SELECT @id = SCOPE_IDENTITY();
END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 2023-01-19 4:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTeams_Insert]
	@TeamName nvarchar(100),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Teams (TeamName)
	VALUES (@TeamName);

	SELECT @id = SCOPE_IDENTITY();

END
--
--
USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 2023-01-19 4:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spTournamentEntries_Insert]
	@TournamentId int,
	@TeamId int,
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO dbo.TournamentEntries (TournamentId, TeamId)
	VALUES (@TournamentId, @TeamId);

	SELECT @id = SCOPE_IDENTITY();


END
--
--
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
--
--
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
--
--
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
--
--
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
