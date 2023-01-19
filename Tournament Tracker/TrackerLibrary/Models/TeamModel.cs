using System.Collections.Generic;
namespace TrackerLibrary.Model
{
    public class TeamModel
    {
        /// <summary>
        /// The unique identifier for a team.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Represents the name of a team. 
        /// </summary>
        public string TeamName { get; set; }

        /// <summary>
        /// Represents a collection of members of a team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();
    }
}
