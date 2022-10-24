using GrupoC.Search.Exceptions;
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
        private readonly IProductoService productoService;
        private readonly IAlbaranService albaranService;

        public SearchController(IProductoService productoService, IAlbaranService albaranService)
        {
            this.productoService = productoService;
            this.albaranService = albaranService;
        }

        [HttpGet("albaran/{estanteriaId}")]
        public async Task<IActionResult> AlbaranAsync(int estanteriaId)
        {
            try
            {
                var albaranes = await albaranService.GetAsync(estanteriaId);
               

                if (albaranes != null)
                {
                    foreach (var albaran in albaranes)
                    {
                        if(albaran.Productos is not null)
                        {
                            foreach (var item in albaran.Productos)
                            {
                                var product = await productoService.GetAsync(item.ProductoId);
                                if (product is not null)
                                    item.Producto = product;
                            }
                        }
                            
                        
                       
                    }
                    return Ok(albaranes);
                }
                else
                {
                    return NotFound();
                }
                
            }
            catch (Exception)
            {
                throw new AlbaranNotFoundException("Prueba de excepcion");
            }
        }

        [HttpGet("caducidad")]
        public async Task<IActionResult> CaducidadAsync()
        {
            try
            {

                var productos = await productoService.GetAllAsync();
                if(productos is not null)
                {
                    var caducados = productos.FindAll(x => x.Caducidad <= DateTime.Now).ToList();
                    var noCaducados = productos.FindAll(x => x.Caducidad > DateTime.Now).ToList();
                    var resultado = new
                    {
                        caducados = caducados,
                        noCaducados = noCaducados
                    };

                    return Ok(resultado);
                    
                }
                else
                {
                    return NotFound();
                }
                
            }
            catch (Exception)
            {
                return BadRequest();
            }
                                  }
    }
}
