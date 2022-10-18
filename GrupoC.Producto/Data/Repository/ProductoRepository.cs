using GrupoC.Producto.Data.Repository.Interfaces;
using GrupoC.Producto.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.Entity;

namespace GrupoC.Producto.Data.Repository
{
    public class ProductoRepository: IProductoRepository
    {
        private readonly ProductosContext _context;

        public ProductoRepository(ProductosContext context)
        {
            _context = context;
        }

        //GetAll
        public async Task<IEnumerable<Models.Producto>> GetAll()
        {
            var productos = await _context.Productos.ToListAsync();
            return productos;
        }

        // GetByID
        public async Task<Models.Producto> GetProducto(int Id)
        {
            var producto = await _context.Productos.FindAsync(Id);
           
            return producto;
        }

        // Create
        public async Task<int> Create(Models.Producto producto)
        {
            producto.FechaAlta = DateTime.Now;
            _context.Add(producto);
            return await _context.SaveChangesAsync();
        }

        // Update
        public async Task<int> Update(Models.Producto producto)
        { 
            _context.Update(producto);
            return await _context.SaveChangesAsync();
        }

        // Delete
        public async Task<bool> Delete(int Id)
        {
            var producto = await _context.Productos.FindAsync(Id);
            _context.Productos.Remove(producto);
            if (await _context.SaveChangesAsync() >= 0)
                return true;

            return false;
        }
    }
}
