﻿namespace GrupoC.Search.Models
{
    public class Albaran
    {
        public string Id { get; set; }
        public DateTime AlbaranDate { get; set; }
        public string EstanteriaId { get; set; }
        public List<AlbaranItem> Productos { get; set; }
    }
}
