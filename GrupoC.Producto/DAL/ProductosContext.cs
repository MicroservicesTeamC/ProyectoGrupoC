using GrupoC.Producto.Models;
using Microsoft.EntityFrameworkCore;

namespace GrupoC.Producto.DAL
{
    public class ProductosContext : DbContext
    {
        public ProductosContext(DbContextOptions<ProductosContext> options)
            : base(options)
        {

        }

        public DbSet<Models.Productos>? Productos { get; set; }
    }
}
