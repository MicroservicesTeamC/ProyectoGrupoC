using GrupoC.AlbaranDeEntrega.Models;

namespace GrupoC.AlbaranDeEntrega.DAL
{
    public interface IAlbaranProvider
    {
        Task<ICollection<Albaran>> GetAsnyc(string estanteriaId);
    }
}
