using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GrupoC.Search.Interfaces;
using GrupoC.Search.Models;

namespace SearchTest
{

    class ProductosFake : IProductoService
    {
        public static List<Producto> productos = new()
            {
                new Producto()
                {
                    Id = "1",
                    Nombre = "Caca",
                    Caducidad = new DateTime(2022, 10, 1)
                },
                new Producto()
                {
                    Id = "2",
                    Nombre = "Caca2",
                    Caducidad = new DateTime(2022, 10, 28)
                }
            };

        public Task<Producto?> GetAsync(string id)
        {
            var producto = productos.FirstOrDefault(x => x.Id.Equals(id));
            return Task.FromResult(producto);
        }

        public Task<List<Producto>> GetAllAsync()
        {
            return Task.FromResult(productos);
        }
    }

    class EstanteriasFake : IEstanteriaService
    {
        public Task<Estanteria?> GetAsync(string estanteriaId)
        {
            throw new NotImplementedException();
        }
    }

    class AlbaranFake : IAlbaranService
    {
        private List<Albaran> albaranes = new()
        {
            new Albaran()
            {
                Id = "1",
                AlbaranDate = DateTime.Now
            }
        };
        public Task<ICollection<Albaran>> GetAsync(string estanteriaId)
        {
            ICollection<Albaran> coleccion = albaranes;
            return Task.FromResult(coleccion);
        }
    }
}

