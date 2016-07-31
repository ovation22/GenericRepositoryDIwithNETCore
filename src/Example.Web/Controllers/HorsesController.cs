using Example.Services.Interfaces;
using Example.Web.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Example.Web.Controllers
{
    public class HorsesController : Controller
    {
        private readonly IHorseService _horseService;
        private readonly IMapper<Dto.Horse, Models.HorseSummary> _horseSummaryMapper;

        public HorsesController(IHorseService horseService,
            IMapper<Dto.Horse, Models.HorseSummary> horseSummaryMapper)
        {
            _horseService = horseService;
            _horseSummaryMapper = horseSummaryMapper;
        }

        public ActionResult Index()
        {
            var horses = _horseService.GetAll();

            var model = horses.Select(_horseSummaryMapper.Map).ToList();

            return View(model);
        }
    }
}
