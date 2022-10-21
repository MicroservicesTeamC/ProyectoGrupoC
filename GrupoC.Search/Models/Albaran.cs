namespace GrupoC.Search.Models
{
    public class Albaran
    {
        public int Id { get; set; }
        public DateTime AlbaranDate { get; set; }
        public int EstanteriaId { get; set; }
        public List<AlbaranItem> Productos { get; set; }
    }
}
