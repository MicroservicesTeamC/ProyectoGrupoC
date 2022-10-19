using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace GrupoC.Estanteria.DAL
{
    public class DeisgnTimeEstanteriaContextFactory : IDesignTimeDbContextFactory<EstanteriaContext>
    {
        public EstanteriaContext CreateDbContext(string[] args)
        {
            var dbContextBuilder = new DbContextOptionsBuilder<EstanteriaContext>();
            var connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Estanteria; Integrated Security=True;";
            dbContextBuilder.UseSqlServer(connectionString);
            return new EstanteriaContext(dbContextBuilder.Options);
        }
    }
}
