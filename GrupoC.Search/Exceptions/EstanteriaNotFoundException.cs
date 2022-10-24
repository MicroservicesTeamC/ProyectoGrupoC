namespace GrupoC.Search.Exceptions
{
    /// <summary>
    /// Este es un ejemplo de excepcion personalizada. 
    /// Realmente el no encontrar un curso no debería de ser una excepción.
    /// Pero se va a forzar para ver un ejemplo sencillo
    /// Mejor Excepcion en Real sería CursoException que podría englobar todas aquellas situaciones
    /// Que nos hemos podido dejar de controlar.
    /// </summary>
    [Serializable]
    public class EstanteriaNotFoundException : Exception
    {
        public int CursoId { get; }

        public EstanteriaNotFoundException() { }

        public EstanteriaNotFoundException(string message)
            : base(message) { }

        public EstanteriaNotFoundException(string message, Exception inner)
            : base(message, inner) { }

        public EstanteriaNotFoundException(string message, int cursoId)
        : this(message)
        {
            CursoId = cursoId;
        }
        public EstanteriaNotFoundException(string message, Exception inner, int cursoId)
        : this(message,inner)
        {
            CursoId = cursoId;
        }
    }
}
