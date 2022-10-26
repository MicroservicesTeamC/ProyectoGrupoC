using System.Runtime.Serialization;

namespace GrupoC.Search.Exceptions
{
    [Serializable]
    public class AlbaranNotFoundException : Exception
    {
        public int ModuloId { get; }
        public AlbaranNotFoundException() { }

        public AlbaranNotFoundException(string message)
            : base(message) { }

        public AlbaranNotFoundException(string message, Exception inner)
            : base(message, inner) { }
        public AlbaranNotFoundException(string message, int moduloId) : this(message) 
        {
            ModuloId = moduloId;
        }
    }
}
