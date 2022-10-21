using System.ComponentModel.DataAnnotations;

namespace GrupoC.Producto.Models
{
    public class Productos
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El nombre es requerido")]
        public string? Nombre { get; set; }

        [Required(ErrorMessage = "El precio es requerido")]
        public double Precio { get; set; }

        [Required(ErrorMessage = "El tipo es requerido")]
        public int TipoProducto { get; set; }

        public DateTime? FechaAlta { get; set; }
    }
}
