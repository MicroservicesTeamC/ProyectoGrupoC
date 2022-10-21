using GrupoC.Producto.Models;
using Microsoft.EntityFrameworkCore;


namespace GrupoC.Producto.DAL
{
    public class ProductoRepository : IProductoRepository
    {
        private readonly ProductosContext _context;

        public ProductoRepository(ProductosContext context)
        {
            _context = context;
        }


        public Task<List<Productos>>? GetAllAsync()
        {
            if (_context.Productos is not null)
            {
                return _context.Productos.ToListAsync();
            }
            return Task.FromResult<List<Productos>>(null);
        }

        public async Task<Productos?> GetAsync(int id)
        {
            if(_context.Productos is not null)
            {
                return await _context.Productos.FindAsync(id);
            }
            return null;
        }
    }



       
}
