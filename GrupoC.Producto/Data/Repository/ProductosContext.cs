using GrupoC.Producto.Models;
using Microsoft.EntityFrameworkCore;

namespace GrupoC.Producto.Data.Repository
{
    public class ProductosContext: DbContext
    {
        public ProductosContext(DbContextOptions<ProductosContext> options)
            : base(options) 
        {

        }

        public  DbSet<Models.Producto> Productos { get; set; }
    }
}
