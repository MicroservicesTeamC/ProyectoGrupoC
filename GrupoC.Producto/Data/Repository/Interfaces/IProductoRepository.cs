using GrupoC.Producto.Models;

namespace GrupoC.Producto.Data.Repository.Interfaces
{
    public interface IProductoRepository
    {
        Task<IEnumerable<Models.Producto>> GetAll();

        //GetProducto
        Task<Models.Producto> GetProducto(int Id);

        // Create
        Task<int> Create(Models.Producto producto);

        // Update
        Task<int> Update(Models.Producto producto);

        //Delete
        Task<bool> Delete (int Id);

    }
}
