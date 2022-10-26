using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GrupoC.Producto.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "FechaAlta",
                table: "Productos",
                newName: "FechaCaducidad");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "FechaCaducidad",
                table: "Productos",
                newName: "FechaAlta");
        }
    }
}
