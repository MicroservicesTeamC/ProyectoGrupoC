using GrupoC.Search.Models;

namespace GrupoC.Search.Interfaces
{
    public interface IProductoService
    {
        Task<Producto?> GetAsync(int id);
        Task<List<Producto>> GetAllAsync();
    }
}
