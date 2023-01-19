using System.Collections.Generic;

namespace TrackerLibrary.Model
{
    /// <summary>
    /// Represents one match in the tournament.
    /// </summary>
    public class MatchupModel
    {
        /// <summary>
        /// The unique identifier for the matchup.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Represents the collection of teams participating in this match.
        /// </summary>
        public List<MatchupEntryModel> Entries { get; set; } = new List<MatchupEntryModel>();

        /// <summary>
        /// The ID from the database that will be used to identify the winner.
        /// </summary>
        public int WinnerId { get; set; }

        /// <summary>
        /// Represents who won the matchup.
        /// </summary>
        public TeamModel Winner { get; set; }

        /// <summary>
        /// Represents which round this match is a part of (1st round, semifinals, final, etc).
        /// </summary>
        public int MatchupRound { get; set; }

        // Not sure why this is here, commenting out for now to see what breaks
        //public string DisplayName
        //{
        //    get
        //    {
        //        string output = "";
        //        foreach (MatchupEntryModel me in Entries)
        //        {
        //            if (me.TeamCompeting != null)
        //            {
        //                if (output.Length == 0)
        //                {
        //                    output = me.TeamCompeting.TeamName;
        //                }
        //                else
        //                {
        //                    output += $" vs. {me.TeamCompeting.TeamName}";
        //                }
        //            }
        //            else
        //            {
        //                output = "Matchup Not Yet Determined";
        //                break;
        //            }
        //        }
        //        return output;
        //    }
        //}
    }
}