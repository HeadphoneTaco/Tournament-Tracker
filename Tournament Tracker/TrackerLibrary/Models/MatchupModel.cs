﻿using System.Collections.Generic;

namespace TrackerLibrary.Model
{
    /// <summary>
    /// Represents one match in the tournament.
    /// </summary>
    public class MatchupModel
    {
        /// <summary>
        /// Represents the collection of teams participating in this match.
        /// </summary>
        public List<MatchupEntryModel> Entries { get; set; } = new List<MatchupEntryModel>();

        /// <summary>
        /// Represents who won the matchup.
        /// </summary>
        public TeamModel Winner { get; set; }

        /// <summary>
        /// Represents which round this match is a part of (1st round, semifinals, final, etc).
        /// </summary>
        public int MatchupRound { get; set; }

    }
}