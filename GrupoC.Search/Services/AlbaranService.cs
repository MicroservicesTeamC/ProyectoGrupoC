using System.Reflection;
using System.Resources;
using GrupoC.Search.Exceptions;
using GrupoC.Search.Interfaces;
using GrupoC.Search.Logs;
using GrupoC.Search.Models;
using Newtonsoft.Json;

namespace GrupoC.Search.Services
{
    public class AlbaranService : IAlbaranService
    {
        private readonly IHttpClientFactory httpClientFactory;
        readonly ILoggerManager LoggerManager;
        readonly ResourceManager resourceManager = new("GrupoC.Search.Resources.ExceptionMessages", Assembly.GetExecutingAssembly());
        public AlbaranService(IHttpClientFactory httpClientFactory, ILoggerManager loggerManager)

        {
            this.LoggerManager = loggerManager;
            this.LoggerManager.LogInfo("-----REQUEST Albaran-----");
            this.httpClientFactory = httpClientFactory;
        }
        public async Task<ICollection<Albaran>?> GetAsync(int estanteriaId)
        {
            this.LoggerManager.LogInfo("REQUEST SINGLE Albaran");
            var client = httpClientFactory.CreateClient("albaranService");

            var response = await client.GetAsync($"api/Albaran/{estanteriaId}");
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                var orders = JsonConvert.DeserializeObject<ICollection<Albaran>>(content);
                return orders;
            }
            if (resourceManager is not null)
            {
                string? mensajeError = resourceManager.GetString("AlbaranNotFound");
                if (mensajeError != null)
                {
                    this.LoggerManager.LogWarn(mensajeError);
                    throw new AlbaranNotFoundException(mensajeError);
                }   
               
            }
            return null;


        }
    }
}
