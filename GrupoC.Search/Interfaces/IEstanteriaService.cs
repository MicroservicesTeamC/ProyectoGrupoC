using GrupoC.Search.Models;

namespace GrupoC.Search.Interfaces
{
    public interface IEstanteriaService
    {
        Task<Estanteria?> GetAsync(string estanteriaId);
    }
}
