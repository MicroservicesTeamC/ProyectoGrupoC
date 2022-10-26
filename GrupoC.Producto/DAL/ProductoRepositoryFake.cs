using GrupoC.Producto.Models;

namespace GrupoC.Producto.DAL
{
    public class ProductoRepositoryFake : IProductoRepository
    {
        private readonly List<Productos> repo = new ();

        public ProductoRepositoryFake()
        {
            for (int i = 0; i < 100; i++)
            {
                Random r = new();
                repo.Add(new Productos()
                {
                    Id = (i + 1),
                    Nombre = $"Producto {i + 1}",
                    Precio = (double)i * Math.PI,
                    FechaCaducidad = new DateTime(2022, 10, r.Next(1, 31))
                });
            }
        }
        public ProductoRepositoryFake(string CreacionRepositoriVacio) 
        { 
        }
        public Task<Productos?> GetAsync(int id)
        {
            if(repo is not null)
            {
                var product = repo.FirstOrDefault(p => p.Id == id);
                return Task.FromResult(product);
            }
            return Task.FromResult<Productos?>(null);
        }

        public Task<List<Productos>> GetAllAsync()
        {
            return Task.FromResult(repo);
        }
    }
}
