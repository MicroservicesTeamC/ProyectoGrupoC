﻿namespace GrupoC.AlbaranDeEntrega.Models
{
    public class EstanteriaItem
    {
        public string EstanteriaId { get; set; }
        public int Id { get; set; }
        public string ProductoId { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }
    }
}
