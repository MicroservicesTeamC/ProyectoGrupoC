using GrupoC.Producto.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking.Internal;


namespace GrupoC.Producto.DAL
{
    public class ProductoRepository : IProductoRepository
    {
        private readonly ProductosContext _context;

        public ProductoRepository(ProductosContext context)
        {
            _context = context;
        }


        public Task<List<Productos>> GetAllAsync()
        {
            if (_context.Productos is not null)
            {
                return _context.Productos.ToListAsync();
            }
            else
            {
                List<Productos> listaVacia = new List<Productos>();
                return Task.FromResult(listaVacia);
            }
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
