﻿namespace GrupoC.Search.Models
{
    public class Producto
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }
        public int TipoProducto { get; set; }
        public DateTime Caducidad { get; set; }
    }
}
