using GrupoC.Search.Models;

namespace GrupoC.Search.Interfaces
{
    public interface IProductoService
    {
        Task<Producto?> GetAsync(string id);
        Task<List<Producto>> GetAllAsync();
    }
}
