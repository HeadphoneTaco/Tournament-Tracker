namespace TrackerLibrary.Model
{
    /// <summary>
    /// Represents what the prize is for the given place.
    /// </summary>
    public class PrizeModel
    {
        /// <summary>
        /// The unique identifier for the prize.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// The numeric identifier of the place (1st, 2nd, 3rd, etc).
        /// </summary>
        public int PlaceNumber { get; set; }

        /// <summary>
        /// The friendly name of the place (Champion, runner up, etc).
        /// </summary>
        public string PlaceName { get; set; }

        /// <summary>
        /// Amount of a prize in absolute values ($5, 0 jellybeans, 1 high five, etc).
        /// </summary>
        public decimal PrizeAmount { get; set; }

        /// <summary>
        /// Amount of a prize in calculated values (10%, 1/3, etc). 
        /// </summary>
        public double PrizePercentage { get; set; }

        public PrizeModel()
        {

        }

        public PrizeModel(string placeName, string placeNumber, string prizeAmount, string prizePercentage)
        {
            PlaceName = placeName;

            int placeNumberValue = 0;
            int.TryParse(placeNumber, out placeNumberValue);
            PlaceNumber = placeNumberValue;

            decimal prizeAmountValue = 0;
            decimal.TryParse(prizeAmount, out prizeAmountValue);
            PrizeAmount = prizeAmountValue;

            double prizePercentageValue = 0;
            double.TryParse(prizePercentage, out prizePercentageValue);
            PrizePercentage = prizePercentageValue;
        }

    }
}
