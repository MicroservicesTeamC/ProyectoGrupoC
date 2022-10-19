using GrupoC.Producto.DAL;

using Microsoft.AspNetCore.Mvc;

namespace GrupoC.Producto.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : Controller
    {
        private readonly IProductoRepository _productoRepository;
        //private readonly ProductosContext _productosContext;

        public ProductoController(IProductoRepository productosRepository)
        {
            _productoRepository = productosRepository;
        }

        //public ProductoController(ProductosContext productosContext)
        //{
        //    _productosContext = productosContext;
        //}

        [HttpGet]
        [Route("getAll")]
        public async Task<IActionResult> GetAllAsync()
        {
            var productos = await _productoRepository.GetAllAsync();
        
            return Ok(productos);         
        }

        [HttpGet]
        [Route("getProducto")]
        public async Task<IActionResult> GetAsync(int id)
        {
            var producto = await _productoRepository.GetAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            return Ok(producto);
        }


        //[HttpPost]
        //[Route("addProducto")]
        //public async Task<IActionResult> Create(Models.Producto request)
        //{
        //    var result = await _productoRepository.Create(request);
        //    return Ok(result);
        //}

        //[HttpPut]
        //[Route("updateProducto")]
        //public async Task<IActionResult> Update(Models.Producto request)
        //{
        //    var product = await _productoRepository.GetProducto(request.Id);
        //    if (product == null)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        await _productoRepository.Update(product);
        //        product.Nombre = request.Nombre;
        //        product.Precio = request.Precio;
        //        product.TipoProducto = request.TipoProducto;
        //        product.FechaAlta = request.FechaAlta;

        //        return Ok(product);
        //    }
        //    return BadRequest();
        //}

        //[HttpPut]
        //[Route("deleteProducto")]
        //public async Task<IActionResult> Delete(int id)
        //{
        //    var result = await _productoRepository.Delete(id);
        //    if (result)
        //        return Ok(result);
        //    return BadRequest("No product found");
        //}
    }
}
