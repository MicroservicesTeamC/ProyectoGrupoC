using GrupoC.Producto.DAL;
using GrupoC.Producto.Models;
using Microsoft.AspNetCore.Mvc;

namespace GrupoC.Producto.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : Controller
    {
        private readonly IProductoRepository _productoRepository;

        public ProductoController(IProductoRepository productosRepository)
        {
            _productoRepository = productosRepository;
        }

        [HttpGet]
        [Route("getAll")]
        public async Task<IActionResult> GetAllAsync()
        {
            var productos = await _productoRepository.GetAllAsync();
            if(productos is not null && productos.Count > 0)
            {
                return Ok(productos);   
            }
           
            return NotFound();

        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> GetAsync(int id)
        {
            var producto = await _productoRepository.GetAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            return Ok(producto);
        }

    }
}
