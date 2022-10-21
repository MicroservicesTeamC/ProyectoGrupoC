using GrupoC.Estanteria.Models;

namespace GrupoC.Estanteria.DAL
{
    public class EstanteriaProviderFake : IEstanteriaProvider
    {
        private readonly List<Estanterias> estanterias = new ();
        public EstanteriaProviderFake()
        {
            estanterias.Add(new Estanterias() { Id = 1, Name = "Estanteria Principal", Capacidad = 5 });
            estanterias.Add(new Estanterias() { Id = 2, Name = "Estanteria Secundaria", Capacidad = 15});
            estanterias.Add(new Estanterias() { Id = 3, Name = "Estanteria Terciaria", Capacidad = 20});
            estanterias.Add(new Estanterias() { Id = 4, Name = "Cuarta Estanteria", Capacidad = 25});
        }
        public async Task<Estanterias?> GetAsnyc(int id)
        {
            var customer = estanterias.FirstOrDefault(x => x.Id == id);
            return await Task.FromResult(customer);
        }
    }
}
