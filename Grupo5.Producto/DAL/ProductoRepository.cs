using Grupo5.Producto.Models;
namespace Grupo5.Producto.DAL
{
    public class ProductoRepository:IProductoRepository
    {
        private List<Productos> repo = new List<Productos>();

        public ProductoRepository()
        {
            for (int i = 0; i < 100; i++)
            {
                Random r = new Random();
                repo.Add(new Productos()
                {
                    Id = (i + 1).ToString(),
                    Nombre = $"Producto {i + 1}",
                    Precio = (double)i * Math.PI,
                    Caducidad = new DateTime(2022, 10, r.Next(1, 31))
                });
            }
        }
        public Task<Productos> GetAsync(string id)
        {
            var product = repo.FirstOrDefault(p => p.Id == id);
            return Task.FromResult(product);
        }

        public Task<List<Productos>> GetAllAsync()
        {
            return Task.FromResult(repo);
        }
    }
}
