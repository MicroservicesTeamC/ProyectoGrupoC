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
        public async Task<Estanterias?> GetAsnyc(int id)
        {
            if(_context.Estanterias is not null)
            {
                return await _context.Estanterias.FindAsync(id);
            }
            
            return null;
        }
    }
}
