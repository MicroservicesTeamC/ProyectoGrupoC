using GrupoC.AlbaranDeEntrega.Models;

namespace GrupoC.AlbaranDeEntrega.DAL
{
    public class AlbaranProviderFake : IAlbaranProvider
    {
        private List<Albaran> Albaran = new ();
        public AlbaranProviderFake()
        {
            Albaran.Add(new Albaran() { Id = 1, AlbaranDate = DateTime.Now.AddMonths(-1), EstanteriaId = 1,
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem() { AlbaranId = 1, Id = 1, ProductoId = "1", Cantidad = 2},
                    new AlbaranItem() { AlbaranId = 1, Id = 2, ProductoId = "3", Cantidad = 1},
                    new AlbaranItem() { AlbaranId = 1, Id = 3, ProductoId = "2", Cantidad = 1}
                }
            });
            Albaran.Add(new Albaran()
            {
                Id = 5,
                EstanteriaId = 2,
                AlbaranDate = DateTime.Now.AddMonths(-1),
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem() { AlbaranId = 1, Id = 1, ProductoId = "1", Cantidad = 2},
                    new AlbaranItem() { AlbaranId = 1, Id = 2, ProductoId = "3", Cantidad = 1},
                    new AlbaranItem() { AlbaranId = 1, Id = 3, ProductoId = "2", Cantidad = 1}
                }
            });
            Albaran.Add(new Albaran()
            {
                Id = 2,
                EstanteriaId = 3,
                AlbaranDate = DateTime.Now.AddMonths(-1),
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem() { AlbaranId = 2, Id = 1, ProductoId = "1", Cantidad = 2},
                    new AlbaranItem() { AlbaranId = 2, Id = 2, ProductoId = "3", Cantidad = 1},
                    new AlbaranItem() { AlbaranId = 2, Id = 3, ProductoId = "2", Cantidad = 1}
                }
            });
            Albaran.Add(new Albaran()
            {
                Id = 3,
                EstanteriaId = 3,
                AlbaranDate = DateTime.Now.AddMonths(-1),
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem() { AlbaranId = 3, Id = 1, ProductoId = "1", Cantidad = 2},
                    new AlbaranItem() { AlbaranId = 3, Id = 2, ProductoId = "3", Cantidad = 1},
                    new AlbaranItem() { AlbaranId = 3, Id = 3, ProductoId = "2", Cantidad = 1}
                }
            });
            Albaran.Add(new Albaran()
            {
                Id = 4,
                AlbaranDate = DateTime.Now.AddMonths(-2),
                EstanteriaId = 1,
                Productos = new List<AlbaranItem>()
                {
                    new AlbaranItem() { AlbaranId = 4, Id = 1, ProductoId = "1", Cantidad = 2},
                    new AlbaranItem() { AlbaranId = 4, Id = 2, ProductoId = "3", Cantidad = 1},
                    new AlbaranItem() { AlbaranId = 4, Id = 3, ProductoId = "2", Cantidad = 1}
                }
            });
        }
        public async Task<ICollection<Albaran>> GetAsnyc(int id)
        {
            var customer = Albaran.Where(o => o.EstanteriaId == id).ToList();
            return await Task.FromResult(customer);
        }
    }
}
