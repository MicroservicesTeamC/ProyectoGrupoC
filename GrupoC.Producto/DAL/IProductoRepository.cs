using GrupoC.Producto.Models;

namespace GrupoC.Producto.DAL
{
    public interface IProductoRepository
    {
        Task<Productos?> GetAsync(int id);
        Task<List<Productos>?> GetAllAsync();
    }
}
