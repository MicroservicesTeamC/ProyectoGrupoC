﻿using GrupoC.Search.Interfaces;
using GrupoC.Search.Logs;
using GrupoC.Search.Models;
using Newtonsoft.Json;

namespace GrupoC.Search.Services
{
    public class EstanteriaService : IEstanteriaService
    {
        private readonly IHttpClientFactory httpClientFactory;
        readonly ILoggerManager LoggerManager;

        public EstanteriaService(IHttpClientFactory httpClientFactory, ILoggerManager loggerManager)
        {
            this.LoggerManager = loggerManager;
            this.LoggerManager.LogInfo("-----REQUEST Estanteria-----");
            this.httpClientFactory = httpClientFactory;
        }

        public async Task<Estanteria> GetAsync(int estanteriaId)
        {
            this.LoggerManager.LogInfo("REQUEST SINGLE Estanteria");
            var client = httpClientFactory.CreateClient("estanteriasService");

            var response = await client.GetAsync($"api/Estanteria/{estanteriaId}");

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                var orders = JsonConvert.DeserializeObject<Estanteria>(content);

                return orders;
            }

            return null;
        }
    }
}
