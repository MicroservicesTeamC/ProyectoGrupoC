using GrupoC.Producto.Models;

namespace GrupoC.Producto.DAL
{
    public class ProductoRepository:IProductoRepository
    {
        private List<Models.Producto> repo = new List<Models.Producto>();

        public ProductoRepository()
        {
            for (int i = 0; i < 100; i++)
            {
                Random r = new Random();
                repo.Add(new Models.Producto()
                {
                    Id = (i + 1),
                    Nombre = $"Producto {i + 1}",
                    Precio = (double)i * Math.PI,
                    FechaAlta = new DateTime(2022, 10, r.Next(1, 31))
                });
            }
        }
        public ProductoRepository(string CreacionRepositoriVacio) 
        { 
        }
        public Task<Models.Producto> GetAsync(int id)
        {
            var product = repo.FirstOrDefault(p => p.Id == id);
            return Task.FromResult(product);
        }

        public Task<List<Models.Producto>> GetAllAsync()
        {
            return Task.FromResult(repo);
        }
    }
}
