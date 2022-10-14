namespace GrupoC.Search.Models
{
    public class AlbaranItem
    {
        public string AlbaranId { get; set; }
        public int Id { get; set; }
        public string ProductoId { get; set; }
        public int Cantidad { get; set; }
        public Producto Producto { get; set; }
    }
}
