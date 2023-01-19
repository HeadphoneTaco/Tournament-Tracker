using System.Collections.Generic;
using TrackerLibrary.Model;
namespace TrackerLibrary.DataAccess

{   /// <summary>
    /// An Interface for managing Data Access.
    /// </summary>
    public interface IDataConnection
    {
        /// <summary>
        /// Creates an object of PrizeModel type.
        /// </summary>
        /// <param name="model"></param>
        void CreatePrize(PrizeModel model);

        /// <summary>
        /// Creates an object of PersonModel type.
        /// </summary>
        /// <param name="model"></param>
        void CreatePerson(PersonModel model);

        /// <summary>
        /// Creates an object of TeamModel type.
        /// </summary>
        /// <param name="model"></param>
        void CreateTeam(TeamModel model);

        /// <summary>
        /// Creates an object of TournamentModel type.
        /// </summary>
        /// <param name="model"></param>
        void CreateTournament(TournamentModel model);

        /// <summary>
        /// Allows for a particular Matchup of two teams to be modified.
        /// </summary>
        /// <param name="model"></param>
        void UpdateMatchup(MatchupModel model);

        /// <summary>
        /// Allows for a particular Tournament to be modified.
        /// </summary>
        /// <param name="model"></param>
        void CompleteTournament(TournamentModel model);

        /// <summary>
        /// A List of TeamModel objects.
        /// </summary>
        /// <returns></returns>
        List<TeamModel> GetTeam_All();

        /// <summary>
        /// A List of PersonModel objects.
        /// </summary>
        /// <returns></returns>
        List<PersonModel> GetPerson_All();

        /// <summary>
        /// A List of TournamentModel objects.
        /// </summary>
        /// <returns></returns>
        List<TournamentModel> GetTournament_All();
    }
}
