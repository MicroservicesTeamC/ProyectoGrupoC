using GrupoC.Producto.Models;

namespace GrupoC.Producto.DAL
{
    public class ProductoRepositoryFake : IProductoRepository
    {
        private readonly List<Productos> repo = new List<Productos>();

        public ProductoRepositoryFake()
        {
            for (int i = 0; i < 100; i++)
            {
                Random r = new Random();
                repo.Add(new Models.Productos()
                {
                    Id = (i + 1),
                    Nombre = $"Producto {i + 1}",
                    Precio = (double)i * Math.PI,
                    FechaAlta = new DateTime(2022, 10, r.Next(1, 31))
                });
            }
        }
        public ProductoRepositoryFake(string CreacionRepositoriVacio) 
        { 
        }
        public Task<Productos?> GetAsync(int id)
        {
            var product = repo.FirstOrDefault(p => p.Id == id);
            return Task.FromResult(product);
        }

        public Task<List<Productos>>? GetAllAsync()
        {
            return Task.FromResult(repo);
        }
    }
}
