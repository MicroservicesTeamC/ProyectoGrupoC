using GrupoC.Search.Models;

namespace GrupoC.Search.Interfaces
{
    public interface IAlbaranService
    {
        Task<ICollection<Albaran>> GetAsync(string estanteriaId);
    }
}
