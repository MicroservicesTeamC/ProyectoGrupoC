using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GrupoC.AlbaranDeEntrega.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Albaranes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AlbaranDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EstanteriaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Albaranes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AlbaranItems",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AlbaranId = table.Column<int>(type: "int", nullable: false),
                    ProductoId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Cantidad = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AlbaranItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AlbaranItems_Albaranes_AlbaranId",
                        column: x => x.AlbaranId,
                        principalTable: "Albaranes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AlbaranItems_AlbaranId",
                table: "AlbaranItems",
                column: "AlbaranId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AlbaranItems");

            migrationBuilder.DropTable(
                name: "Albaranes");
        }
    }
}
