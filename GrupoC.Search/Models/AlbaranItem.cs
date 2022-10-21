namespace GrupoC.Search.Models
{
    public class AlbaranItem
    {
        public int AlbaranId { get; set; }
        public int Id { get; set; }
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }
        public Producto? Producto { get; set; }
    }
}
