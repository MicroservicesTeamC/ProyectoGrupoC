using System.ComponentModel.DataAnnotations;

namespace GrupoC.Estanteria.Models
{
    public class Estanterias
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public int Capacidad { get; set; }
    }
}
