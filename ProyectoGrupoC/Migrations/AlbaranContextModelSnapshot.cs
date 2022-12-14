// <auto-generated />
using System;
using GrupoC.AlbaranDeEntrega.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace GrupoC.AlbaranDeEntrega.Migrations
{
    [DbContext(typeof(AlbaranContext))]
    partial class AlbaranContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.0-rc.2.22472.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("GrupoC.AlbaranDeEntrega.Models.Albaran", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("AlbaranDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("EstanteriaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Albaranes");
                });

            modelBuilder.Entity("GrupoC.AlbaranDeEntrega.Models.AlbaranItem", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("AlbaranId")
                        .HasColumnType("int");

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<string>("ProductoId")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("AlbaranId");

                    b.ToTable("AlbaranItems");
                });

            modelBuilder.Entity("GrupoC.AlbaranDeEntrega.Models.AlbaranItem", b =>
                {
                    b.HasOne("GrupoC.AlbaranDeEntrega.Models.Albaran", null)
                        .WithMany("Productos")
                        .HasForeignKey("AlbaranId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GrupoC.AlbaranDeEntrega.Models.Albaran", b =>
                {
                    b.Navigation("Productos");
                });
#pragma warning restore 612, 618
        }
    }
}
