using TrackerLibrary.Model;

namespace TrackerLibrary.DataAccess

{
    public interface IDataConnection
    {
        PrizeModel CreatePrize(PrizeModel model);
        PersonModel CreatePerson(PersonModel model);
    }
}
