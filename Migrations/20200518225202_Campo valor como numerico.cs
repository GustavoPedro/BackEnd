using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class Campovalorcomonumerico : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "valor",
                table: "atividade",
                newName: "Valor");

            migrationBuilder.AlterColumn<decimal>(
                name: "Valor",
                table: "atividade",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "enum('Muito bom','Bom','Regular','Ruim','Muito ruim')")
                .OldAnnotation("MySql:CharSet", "utf8")
                .OldAnnotation("MySql:Collation", "utf8_general_ci");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Valor",
                table: "atividade",
                newName: "valor");

            migrationBuilder.AlterColumn<string>(
                name: "valor",
                table: "atividade",
                type: "enum('Muito bom','Bom','Regular','Ruim','Muito ruim')",
                nullable: false,
                oldClrType: typeof(decimal))
                .Annotation("MySql:CharSet", "utf8")
                .Annotation("MySql:Collation", "utf8_general_ci");
        }
    }
}
