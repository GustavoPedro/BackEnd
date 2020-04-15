using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class INDICE_UNICO_USUARIO_DISCIPLINA : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_usuario_disciplina_usuario_cpf_disciplina_idDisciplina",
                table: "usuario_disciplina",
                columns: new[] { "usuario_cpf", "disciplina_idDisciplina" },
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_usuario_disciplina_usuario_cpf_disciplina_idDisciplina",
                table: "usuario_disciplina");
        }
    }
}
