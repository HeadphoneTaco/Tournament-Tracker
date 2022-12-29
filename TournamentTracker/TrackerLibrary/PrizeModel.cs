using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TrackerLibrary
{
    public class PrizeModel
    {
        /// <summary>
        /// Represents the place of a team (1st, 2nd, 3rd, etc).
        /// </summary>
        public int PlaceNumber { get; set; }

        /// <summary>
        /// Represents the name of the placed teams (Champions, runner up, etc).
        /// </summary>
        public string PlaceName { get; set; }

        /// <summary>
        /// Represents the amount of a prize in absolute values ($5, 3 jellybeans, 1 high five, etc).
        /// </summary>
        public decimal PrizeAmount { get; set; }

        /// <summary>
        /// Represents the amount of a price in calculated values (10%, 1/3, etc). 
        /// </summary>
        public double PrizePercentage { get; set; }
    }
}
