using GrupoC.Search.Interfaces;
using GrupoC.Search.Models;
using Newtonsoft.Json;

namespace GrupoC.Search.Services
{
    public class ProductosService : IProductoService
    {
        private readonly IHttpClientFactory httpClientFactory;

        public ProductosService(IHttpClientFactory httpClientFactory)
        {
            this.httpClientFactory = httpClientFactory;
        }
        public async Task<Producto?> GetAsync(int id)
        {
            var client = httpClientFactory.CreateClient("productosService");

            var response = await client.GetAsync($"api/Producto/{id}");
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                var product = JsonConvert.DeserializeObject<Producto>(content);

                return product;
            }
            return null;
        }

        public async Task<List<Producto>?> GetAllAsync()
        {
            var client = httpClientFactory.CreateClient("productosService");

            var response = await client.GetAsync($"api/Producto/getAll");
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                var products = JsonConvert.DeserializeObject<List<Producto>>(content);

                return products;
            }
            return null;
        }
    }
}
