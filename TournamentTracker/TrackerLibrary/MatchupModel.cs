using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary
{
    public class MatchupModel
    {
        /// <summary>
        /// Represents the collection of teams entered into a tournament.
        /// </summary>
        public List<MatchupEntryModel> Entries { get; set; } = new List<MatchupEntryModel> ();
        
        /// <summary>
        /// Represents who won the matchup.
        /// </summary>
        public TeamModel Winner { get; set; }

        /// <summary>
        /// Represents the bracket of a matchup (1st round, semifinals, final, etc).
        /// </summary>
        public int MatchupRound { get; set; }

    }
}
