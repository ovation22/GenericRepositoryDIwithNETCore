using Example.Web.Interfaces;

namespace Example.Web.Mappers
{
    public class HorseToHorseSummaryMapper : IMapper<Dto.Horse, Models.HorseSummary>
    {
        public Models.HorseSummary Map(Dto.Horse horse)
        {
            return new Models.HorseSummary
            {
                Id = horse.Id,
                Name = horse.Name,
                Starts = horse.Starts,
                Win = horse.Win,
                Place = horse.Place,
                Show = horse.Show,
                Earnings = horse.Earnings
            };
        }
    }
}