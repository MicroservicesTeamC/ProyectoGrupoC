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
        public static List<Producto>? productos = new();

        public ProductosFake()
        {
            productos = new()
            {
                new Producto()
                {
                    Id = 1,
                    Nombre = "Caca",
                    Caducidad = new DateTime(2022, 10, 1)
                },
                new Producto()
                {
                    Id = 2,
                    Nombre = "Caca2",
                    Caducidad = new DateTime(2022, 10, 28)
                }
            };
        }
        public ProductosFake(string fakeDataVacia)
        {
            productos = new();
        }

        public Task<Producto?> GetAsync(int id)
        {
            Producto? producto = null;
            if (productos is not null)
            { 
                producto = productos.FirstOrDefault(x => x.Id.Equals(id));
                return Task.FromResult(producto);
            }
            return Task.FromResult(producto);
        }

        public Task<List<Producto>?> GetAllAsync()
        {
            return Task.FromResult(productos);
        }
    }

    class EstanteriasFake : IEstanteriaService
    {
        public List<Estanteria> lista = new List<Estanteria>();
        public Task<Estanteria?> GetAsync(int estanteriaId)
        {
            lista.Add(new Estanteria() { Id = 1, Name = "Estanteria Principal", Capacidad = 5 });
            lista.Add(new Estanteria() { Id = 2, Name = "Estanteria 2", Capacidad = 5 });

            return Task.FromResult(lista.FirstOrDefault(x => x.Id.Equals("1")));
        }
    }

    class AlbaranFake : IAlbaranService
    {
        private List<Albaran>? albaranes;
        public AlbaranFake()
        {
            albaranes = new()
        {
            new Albaran()
            {
                Id = 1,
                AlbaranDate = DateTime.Now,
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem()
                    {
                        Id = 1,
                        AlbaranId = 1,
                        Producto = new Producto(),
                        Cantidad = 2,
                        ProductoId = 1
                    }
                }
            }
        };
        }
        public AlbaranFake(string repoVacio)
        {
            albaranes = null;
        }

        public Task<ICollection<Albaran>?> GetAsync(int estanteriaId)
        {
            ICollection<Albaran>? coleccion = albaranes;

            return Task.FromResult(coleccion);
        }
    }
}

