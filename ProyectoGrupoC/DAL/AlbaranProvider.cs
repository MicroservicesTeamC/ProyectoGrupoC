using GrupoC.AlbaranDeEntrega.Context;
using GrupoC.AlbaranDeEntrega.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Azure;

namespace GrupoC.AlbaranDeEntrega.DAL
{
    public class AlbaranProvider : IAlbaranProvider
    {
        private readonly AlbaranContext _context;

        public AlbaranProvider(AlbaranContext context)
        {
            _context = context;
        }
        public async Task<ICollection<Albaran>> GetAsnyc(int estanteriaId)
        {
            var albaran = await _context.Albaranes.Where(o => o.EstanteriaId == estanteriaId).ToListAsync();
            foreach(var item in albaran)
            {
                List<AlbaranItem> listaCarga = _context.AlbaranItems.Where(o => o.AlbaranId == item.Id).ToList();
                item.Productos = listaCarga ;
            }
            return albaran;
        }
    }
}
