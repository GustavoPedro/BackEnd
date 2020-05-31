using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class blabla : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Disciplina",
                columns: table => new
                {
                    IdDisciplina = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Descricao = table.Column<string>(nullable: true),
                    Materia = table.Column<string>(maxLength: 35, nullable: true),
                    Turno = table.Column<string>(maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Disciplina", x => x.IdDisciplina);
                });

            migrationBuilder.CreateTable(
                name: "Escola",
                columns: table => new
                {
                    Cnpj = table.Column<string>(maxLength: 20, nullable: false),
                    Nome = table.Column<string>(maxLength: 35, nullable: true),
                    Telefone = table.Column<string>(maxLength: 25, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.Cnpj);
                });

            migrationBuilder.CreateTable(
                name: "Atividade",
                columns: table => new
                {
                    IdAtividade = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    IdDisciplina = table.Column<int>(nullable: false),
                    Descricao = table.Column<string>(nullable: true),
                    Atividade1 = table.Column<string>(maxLength: 30, nullable: false),
                    Valor = table.Column<float>(nullable: false),
                    StatusAtividade = table.Column<string>(nullable: false),
                    DataEntrega = table.Column<DateTime>(nullable: false),
                    TipoAtividade = table.Column<string>(maxLength: 45, nullable: false),
                    Premiacao = table.Column<string>(maxLength: 45, nullable: false),
                    MoralAtividade = table.Column<string>(maxLength: 45, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Atividade", x => x.IdAtividade);
                    table.ForeignKey(
                        name: "fk_Disciplina_has_Atividade_Atividade1",
                        column: x => x.IdDisciplina,
                        principalTable: "Disciplina",
                        principalColumn: "IdDisciplina",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Usuario",
                columns: table => new
                {
                    Cpf = table.Column<string>(maxLength: 20, nullable: false),
                    Email = table.Column<string>(maxLength: 90, nullable: false),
                    TipoUsuario = table.Column<string>(nullable: false),
                    DataNascimento = table.Column<DateTime>(nullable: false),
                    Senha = table.Column<string>(maxLength: 45, nullable: false),
                    NomeSobrenome = table.Column<string>(maxLength: 35, nullable: false),
                    Telefone = table.Column<string>(maxLength: 25, nullable: true),
                    EscolaCnpj = table.Column<string>(maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.Cpf);
                    table.ForeignKey(
                        name: "fk_Usuario_Escola",
                        column: x => x.EscolaCnpj,
                        principalTable: "Escola",
                        principalColumn: "Cnpj",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UsuarioDisciplina",
                columns: table => new
                {
                    idUsuario_Disciplina = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    UsuarioCpf = table.Column<string>(maxLength: 20, nullable: false),
                    disciplina_idDisciplina = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UsuarioDisciplina", x => x.idUsuario_Disciplina);
                    table.ForeignKey(
                        name: "fk_Usuario_has_Disciplina_Disciplina1",
                        column: x => x.disciplina_idDisciplina,
                        principalTable: "Disciplina",
                        principalColumn: "IdDisciplina",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "fk_Usuario_has_Disciplina_Usuario1",
                        column: x => x.UsuarioCpf,
                        principalTable: "Usuario",
                        principalColumn: "Cpf",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "AtividadeUsuario",
                columns: table => new
                {
                    IdAtividadeUsuario = table.Column<int>(nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    IdAtividade = table.Column<int>(nullable: false),
                    IdUsuarioDisciplina = table.Column<int>(nullable: false),
                    Status = table.Column<string>(nullable: true),
                    Total = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AtividadeUsuario", x => x.IdAtividadeUsuario);
                    table.ForeignKey(
                        name: "fk_atividade_has_usuario_disciplina_atividade1",
                        column: x => x.IdAtividade,
                        principalTable: "Atividade",
                        principalColumn: "IdAtividade",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "fk_atividade_has_usuario_disciplina_usuario_disciplina1",
                        column: x => x.IdUsuarioDisciplina,
                        principalTable: "UsuarioDisciplina",
                        principalColumn: "idUsuario_Disciplina",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "Escola",
                columns: new[] { "Cnpj", "Nome", "Telefone" },
                values: new object[] { "12345", "Una Aimorés", "31 3 3333 3333" });

            migrationBuilder.CreateIndex(
                name: "IX_Atividade_IdDisciplina",
                table: "Atividade",
                column: "IdDisciplina");

            migrationBuilder.CreateIndex(
                name: "IX_AtividadeUsuario_IdAtividade",
                table: "AtividadeUsuario",
                column: "IdAtividade");

            migrationBuilder.CreateIndex(
                name: "IX_AtividadeUsuario_IdUsuarioDisciplina",
                table: "AtividadeUsuario",
                column: "IdUsuarioDisciplina");

            migrationBuilder.CreateIndex(
                name: "telefone_UNIQUE",
                table: "Escola",
                column: "Telefone",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "email_UNIQUE",
                table: "Usuario",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_Escola_idx",
                table: "Usuario",
                column: "EscolaCnpj");

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_has_Disciplina_Disciplina1_idx",
                table: "UsuarioDisciplina",
                column: "disciplina_idDisciplina");

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_has_Disciplina_Usuario1_idx",
                table: "UsuarioDisciplina",
                column: "UsuarioCpf");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AtividadeUsuario");

            migrationBuilder.DropTable(
                name: "Atividade");

            migrationBuilder.DropTable(
                name: "UsuarioDisciplina");

            migrationBuilder.DropTable(
                name: "Disciplina");

            migrationBuilder.DropTable(
                name: "Usuario");

            migrationBuilder.DropTable(
                name: "Escola");
        }
    }
}
