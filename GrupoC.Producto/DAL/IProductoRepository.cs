using GrupoC.Producto.Models;

namespace GrupoC.Producto.DAL
{
    public interface IProductoRepository
    {
        Task<Models.Producto> GetAsync(int id);
        Task<List<Models.Producto>> GetAllAsync();
    }
}
