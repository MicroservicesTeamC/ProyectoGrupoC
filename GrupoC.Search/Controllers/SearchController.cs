using GrupoC.Search.Interfaces;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;
using RouteAttribute = Microsoft.AspNetCore.Mvc.RouteAttribute;

namespace GrupoC.Search.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : ControllerBase
    {
        private readonly IEstanteriaService estanteriaService;
        private readonly IProductoService productoService;
        private readonly IAlbaranService albaranService;

        public SearchController(IEstanteriaService estanteriaService, IProductoService productoService, IAlbaranService albaranService)
        {
            this.estanteriaService = estanteriaService;
            this.productoService = productoService;
            this.albaranService = albaranService;
        }

        [HttpGet("albaran/{estanteriaId}")]
        public async Task<IActionResult> AlbaranAsync(string estanteriaId)
        {
            if (string.IsNullOrWhiteSpace(estanteriaId)) return BadRequest();
            try
            {
                var estanteria = await estanteriaService.GetAsync(estanteriaId);
                var albaranes = await albaranService.GetAsync(estanteriaId);
                foreach(var albaran in albaranes)
                {
                    foreach (var item in albaran.Productos)
                    {
                        var product = await productoService.GetAsync(item.ProductoId);
                        item.Producto = product;
                    }
                }
                


                return Ok(albaranes);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
