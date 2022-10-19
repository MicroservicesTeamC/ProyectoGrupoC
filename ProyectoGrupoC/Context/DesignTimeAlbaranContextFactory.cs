using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace GrupoC.AlbaranDeEntrega.Context
{
    public class DesignTimeAlbaranContextFactory : IDesignTimeDbContextFactory<AlbaranContext>
    {
        public AlbaranContext CreateDbContext(string[] args)
        {
            var dbContextBuilder = new DbContextOptionsBuilder<AlbaranContext>();

            var connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Albaran; Integrated Security=True;";

            dbContextBuilder.UseSqlServer(connectionString);
            return new AlbaranContext(dbContextBuilder.Options);
        }
    }
}
