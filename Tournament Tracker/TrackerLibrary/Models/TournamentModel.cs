using System;
using System.Collections.Generic;

namespace TrackerLibrary.Model
{
    /// <summary>
    /// Represents a single tournament.
    /// </summary>
    public class TournamentModel
    {
        public event EventHandler<DateTime> OnTournamentComplete;

        /// <summary>
        /// The unique identifier for the tournament
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Name of the tournament.
        /// </summary>
        public string TournamentName { get; set; }

        /// <summary>
        /// Entry fee of the tournament.
        /// </summary>
        public decimal EntryFee { get; set; }

        /// <summary>
        /// The collection of teams in the tournament.
        /// </summary>
        public List<TeamModel> EnteredTeams { get; set; } = new List<TeamModel>();

        /// <summary>
        /// The collection of prizes in the tournament.
        /// </summary>
        public List<PrizeModel> Prizes { get; set; } = new List<PrizeModel>();

        /// <summary>
        /// The collection of rounds in the tournament.
        /// </summary>
        public List<List<MatchupModel>> Rounds { get; set; } = new List<List<MatchupModel>>();

        public void CompleteTournament()
        {
            OnTournamentComplete?.Invoke(this, DateTime.Now);
        }
    }
}