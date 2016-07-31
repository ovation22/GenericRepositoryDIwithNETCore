using System.Collections.Generic;

namespace Example.Services.Interfaces
{
    public interface IHorseService
    {
        IEnumerable<Dto.Horse> GetAll();
        Dto.Horse Get(int id);
    }
}
