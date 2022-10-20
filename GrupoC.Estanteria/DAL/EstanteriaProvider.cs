using GrupoC.Estanteria.Models;

namespace GrupoC.Estanteria.DAL
{
    public class EstanteriaProvider : IEstanteriaProvider
    {
        private readonly EstanteriaContext _context;
        public EstanteriaProvider(EstanteriaContext context)
        {
            _context = context;
        }
        public async Task<Estanterias> GetAsnyc(string id)
        {
            var customer = await _context.Estanterias.FindAsync(id);
            return customer;
        }
    }
}
