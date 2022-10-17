using GrupoC.AlbaranDeEntrega.DAL;
using Microsoft.AspNetCore.Mvc;

namespace GrupoC.AlbaranDeEntrega.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlbaranController : ControllerBase
    {
        private readonly IAlbaranProvider albaranProvider;
        public AlbaranController(IAlbaranProvider albaranProvider)
        {
            this.albaranProvider = albaranProvider;
        }

        [HttpGet("{estanteriaId}")]
        public async Task<IActionResult> GetAsync(string estanteriaId)
        {
            var result = await albaranProvider.GetAsnyc(estanteriaId);
            if (result.Count != 0) return Ok(result);
            return NotFound();
        }
    }
}
