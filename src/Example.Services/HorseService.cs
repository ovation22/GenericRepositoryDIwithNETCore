using Example.Repositories.Interfaces;
using Example.Services.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Example.Services
{
    public class HorseService : IHorseService
    {
        private readonly IRepository<Models.Horse> _horseRepository;

        public HorseService(IRepository<Models.Horse> horseRepository)
        {
            _horseRepository = horseRepository;
        }

        public IEnumerable<Dto.Horse> GetAll()
        {
            var horses = _horseRepository.GetAll();

            return horses.Select(Map);
        }

        public Dto.Horse Get(int id)
        {
            var horse = _horseRepository.Get(id);

            return horse == null ? null : Map(horse);
        }

        private static Dto.Horse Map(Models.Horse horse)
        {
            return new Dto.Horse
            {
                Id = horse.Id,
                Name = horse.Name,
                Starts = horse.RaceStarts,
                Win = horse.RaceWins,
                Place = horse.RacePlace,
                Show = horse.RaceShow,
                Earnings = horse.Earnings
            };
        }
    }
}
