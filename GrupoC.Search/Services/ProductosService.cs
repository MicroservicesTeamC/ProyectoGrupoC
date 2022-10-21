using GrupoC.Search.Interfaces;
using GrupoC.Search.Logs;
using GrupoC.Search.Models;
using Newtonsoft.Json;

namespace GrupoC.Search.Services
{
    public class ProductosService : IProductoService
    {
        private readonly IHttpClientFactory httpClientFactory;
        readonly ILoggerManager LoggerManager;
        public ProductosService(IHttpClientFactory httpClientFactory, ILoggerManager loggerManager)
        {
            this.LoggerManager = loggerManager;
            this.LoggerManager.LogInfo("-----REQUEST Producto-----");
            this.httpClientFactory = httpClientFactory;
        }
        public async Task<Producto?> GetAsync(int id)
        {
            this.LoggerManager.LogInfo("REQUEST SINGLE Product");
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
            this.LoggerManager.LogInfo("REQUEST ALL Products");
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
