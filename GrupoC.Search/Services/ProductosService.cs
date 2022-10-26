using System.Reflection;
using System.Resources;
using GrupoC.Search.Exceptions;
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
        readonly ResourceManager resourceManager = new("GrupoC.Search.Resources.ExceptionMessages", Assembly.GetExecutingAssembly());
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
            if(resourceManager is not null)
            {
                string? mensajeError = resourceManager.GetString("ProductoNotFound");
                if (mensajeError != null)
                    throw new ProductoNotFoundException(mensajeError);
            }
            return null;           
        }
    }
}
