using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
