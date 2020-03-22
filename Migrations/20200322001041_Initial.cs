using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {           
            migrationBuilder.CreateTable(
                name: "atividade",
                columns: table => new
                {
                    idAtividade = table.Column<int>(type: "int(11)", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    descricao = table.Column<string>(type: "text", nullable: true)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    atividade = table.Column<string>(type: "varchar(30)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    valor = table.Column<string>(type: "enum('Muito bom','Bom','Regular','Ruim','Muito ruim')", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idAtividade);
                });

            migrationBuilder.CreateTable(
                name: "disciplina",
                columns: table => new
                {
                    idDisciplina = table.Column<int>(type: "int(11)", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    descricao = table.Column<string>(type: "text", nullable: true)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    materia = table.Column<string>(type: "varchar(35)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    turno = table.Column<string>(type: "varchar(20)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idDisciplina);
                });

            migrationBuilder.CreateTable(
                name: "escola",
                columns: table => new
                {
                    cnpj = table.Column<string>(type: "varchar(20)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    nome = table.Column<string>(type: "varchar(35)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    telefone = table.Column<string>(type: "varchar(25)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.cnpj);
                });

            migrationBuilder.CreateTable(
                name: "disciplina_atividade",
                columns: table => new
                {
                    idDisciplina_atividade = table.Column<int>(type: "int(11)", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    disciplina_idDisciplina = table.Column<int>(type: "int(11)", nullable: false),
                    atividade_idAtividade = table.Column<int>(type: "int(11)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idDisciplina_atividade);
                    table.ForeignKey(
                        name: "fk_Disciplina_has_Atividade_Atividade1",
                        column: x => x.atividade_idAtividade,
                        principalTable: "atividade",
                        principalColumn: "idAtividade",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "fk_Disciplina_has_Atividade_Disciplina1",
                        column: x => x.disciplina_idDisciplina,
                        principalTable: "disciplina",
                        principalColumn: "idDisciplina",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "usuario",
                columns: table => new
                {
                    cpf = table.Column<string>(type: "varchar(20)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    email = table.Column<string>(type: "varchar(90)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    tipoUsuario = table.Column<string>(type: "enum('Aluno','Professor','Responsavel','Adm')", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    dataNascimento = table.Column<DateTime>(type: "date", nullable: false),
                    senha = table.Column<string>(type: "varchar(45)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    nomeSobrenome = table.Column<string>(type: "varchar(35)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    telefone = table.Column<string>(type: "varchar(25)", nullable: true)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    escola_cnpj = table.Column<string>(type: "varchar(20)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.cpf);
                    table.ForeignKey(
                        name: "fk_Usuario_Escola",
                        column: x => x.escola_cnpj,
                        principalTable: "escola",
                        principalColumn: "cnpj",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "usuario_disciplina",
                columns: table => new
                {
                    idUsuario_Disciplina = table.Column<int>(type: "int(11)", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    usuario_cpf = table.Column<string>(type: "varchar(20)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    disciplina_idDisciplina = table.Column<int>(type: "int(11)", nullable: false),
                    tipoUsuario = table.Column<string>(type: "enum('Aluno','Professor','Responsavel','Adm')", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idUsuario_Disciplina);
                    table.ForeignKey(
                        name: "fk_Usuario_has_Disciplina_Disciplina1",
                        column: x => x.disciplina_idDisciplina,
                        principalTable: "disciplina",
                        principalColumn: "idDisciplina",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "fk_Usuario_has_Disciplina_Usuario1",
                        column: x => x.usuario_cpf,
                        principalTable: "usuario",
                        principalColumn: "cpf",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "pontuacao",
                columns: table => new
                {
                    idPontuacao = table.Column<int>(type: "int(11)", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    pontuacao = table.Column<string>(type: "varchar(30)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    descricao = table.Column<string>(type: "text", nullable: true)
                        .Annotation("MySql:CharSet", "utf8")
                        .Annotation("MySql:Collation", "utf8_general_ci"),
                    pontuacao_usuario_disciplina = table.Column<int>(type: "int(11)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idPontuacao);
                    table.ForeignKey(
                        name: "fk_Pontuacao_Usuario_Disciplina1",
                        column: x => x.pontuacao_usuario_disciplina,
                        principalTable: "usuario_disciplina",
                        principalColumn: "idUsuario_Disciplina",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "fk_Disciplina_has_Atividade_Atividade1_idx",
                table: "disciplina_atividade",
                column: "atividade_idAtividade");

            migrationBuilder.CreateIndex(
                name: "fk_Disciplina_has_Atividade_Disciplina1_idx",
                table: "disciplina_atividade",
                column: "disciplina_idDisciplina");

            migrationBuilder.CreateIndex(
                name: "telefone_UNIQUE",
                table: "escola",
                column: "telefone",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "fk_Pontuacao_Usuario_Disciplina1_idx",
                table: "pontuacao",
                column: "pontuacao_usuario_disciplina");

            migrationBuilder.CreateIndex(
                name: "email_UNIQUE",
                table: "usuario",
                column: "email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_Escola_idx",
                table: "usuario",
                column: "escola_cnpj");

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_has_Disciplina_Disciplina1_idx",
                table: "usuario_disciplina",
                column: "disciplina_idDisciplina");

            migrationBuilder.CreateIndex(
                name: "fk_Usuario_has_Disciplina_Usuario1_idx",
                table: "usuario_disciplina",
                column: "usuario_cpf");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "disciplina_atividade");

            migrationBuilder.DropTable(
                name: "pontuacao");

            migrationBuilder.DropTable(
                name: "atividade");

            migrationBuilder.DropTable(
                name: "usuario_disciplina");

            migrationBuilder.DropTable(
                name: "disciplina");

            migrationBuilder.DropTable(
                name: "usuario");

            migrationBuilder.DropTable(
                name: "escola");
        }
    }
}
