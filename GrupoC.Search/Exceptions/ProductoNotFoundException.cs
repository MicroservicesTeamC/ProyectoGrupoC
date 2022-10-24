namespace GrupoC.Search.Exceptions
{
    [Serializable]
    public class ProductoNotFoundException : Exception
    {
        public int ModuloId { get; }
        public ProductoNotFoundException() { }

        public ProductoNotFoundException(string message)
            : base(message) { }

        public ProductoNotFoundException(string message, Exception inner)
            : base(message, inner) { }
        public ProductoNotFoundException(string message, int moduloId) : this(message) 
        {
            ModuloId = moduloId;
        }
    }
}
