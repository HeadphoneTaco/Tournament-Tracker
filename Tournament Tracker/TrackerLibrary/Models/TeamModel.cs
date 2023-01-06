using System.Collections.Generic;

namespace TrackerLibrary.Model
{
    public class TeamModel
    {
        /// <summary>
        /// Represents a list of members of a team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();

        /// <summary>
        /// Represents the name of a team. 
        /// </summary>
        public string TeamName { get; set; }
    }
}
