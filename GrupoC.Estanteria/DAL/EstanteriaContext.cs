using GrupoC.Estanteria.Models;
using Microsoft.EntityFrameworkCore;

namespace GrupoC.Estanteria.DAL
{
    public class EstanteriaContext:DbContext
    {
        public EstanteriaContext(DbContextOptions<EstanteriaContext> options)
        : base(options)
        {
        }
        public DbSet<Estanterias> Estanterias { get; set; }
    }
}
