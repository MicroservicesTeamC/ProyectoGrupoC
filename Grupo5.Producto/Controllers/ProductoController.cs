using Grupo5.Producto.DAL;
using Microsoft.AspNetCore.Mvc;

namespace Grupo5.Producto.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly IProductoRepository _productosRepository;

        public ProductoController(IProductoRepository productosRepository)
        {
            _productosRepository = productosRepository;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAsync(string id)
        {
            var result = await _productosRepository.GetAsync(id);

            if (result != null)
            {
                return Ok(result);
            }

            return NotFound();
        }

        [HttpGet("all")]
        public async Task<IActionResult> GetAllAsync()
        {
            var result = await _productosRepository.GetAllAsync();

            if (result.Count > 0)
            {
                return Ok(result);
            }

            return NotFound();
        }
    }
}
