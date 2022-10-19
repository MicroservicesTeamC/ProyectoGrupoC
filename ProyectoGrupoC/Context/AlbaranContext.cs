using GrupoC.AlbaranDeEntrega.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System.Reflection;
using System.Reflection.Metadata;
using System.Text.Json;

namespace GrupoC.AlbaranDeEntrega.Context
{
    public class AlbaranContext : DbContext
    {
        public AlbaranContext(DbContextOptions<AlbaranContext> options)
        : base(options)
        {
        }

        public DbSet<Albaran> Albaranes { get; set; }
        public DbSet<AlbaranItem> AlbaranItems { get; set; }

    }
}
