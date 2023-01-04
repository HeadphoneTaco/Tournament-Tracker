using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary
{
    /// <summary>
    /// Represents one prize.
    /// </summary>
    public class PrizeModel
    {
        /// <summary>
        /// The unique identified for the prize.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// The place of a team (1st, 2nd, 3rd, etc).
        /// </summary>
        public int PlaceNumber { get; set; }

        /// <summary>
        /// The description of the placed team (Champion, runner up, etc).
        /// </summary>
        public string PlaceName { get; set; }

        /// <summary>
        /// Amount of a prize in absolute values ($5, 3 jellybeans, 1 high five, etc).
        /// </summary>
        public decimal PrizeAmount { get; set; }

        /// <summary>
        /// Amount of a prize in calculated values (10%, 1/3, etc). 
        /// </summary>
        public double PrizePercentage { get; set; }
    }
}
