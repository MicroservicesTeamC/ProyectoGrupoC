using GrupoC.Search.Interfaces;
using GrupoC.Search.Models;
using Newtonsoft.Json;

namespace GrupoC.Search.Services
{
    public class AlbaranService : IAlbaranService
    {
        private IHttpClientFactory httpClientFactory;
        public AlbaranService(IHttpClientFactory httpClientFactory)
        {
            this.httpClientFactory = httpClientFactory;
        }
        public async Task<ICollection<Albaran>> GetAsync(string customerId)
        {
            var client = httpClientFactory.CreateClient("albaranService");

            var response = await client.GetAsync($"api/Albaran/{customerId}");
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                var orders = JsonConvert.DeserializeObject<ICollection<Albaran>>(content);
                return orders;
            }

            return null;
        }
    }
}
