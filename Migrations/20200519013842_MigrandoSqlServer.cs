﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class MigrandoSqlServer : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "atividade",
                columns: table => new
                {
                    idAtividade = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    descricao = table.Column<string>(type: "text", nullable: true),
                    atividade = table.Column<string>(type: "varchar(30)", nullable: false),
                    Valor = table.Column<decimal>(type: "decimal(18,4)", nullable: false),
                    statusAtividade = table.Column<string>(type: "VARCHAR(45) CHECK (statusAtividade IN ('Pendente','Em andamento'))", nullable: false),
                    dataEntrega = table.Column<DateTime>(type: "date", nullable: false),
                    tipoAtividade = table.Column<string>(type: "varchar(45)", nullable: false),
                    Premiacao = table.Column<string>(type: "varchar(45)", nullable: false),
                    MoralAtividade = table.Column<string>(type: "varchar(45)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idAtividade);
                });

            migrationBuilder.CreateTable(
                name: "disciplina",
                columns: table => new
                {
                    idDisciplina = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    descricao = table.Column<string>(type: "text", nullable: true),
                    materia = table.Column<string>(type: "varchar(35)", nullable: false),
                    turno = table.Column<string>(type: "varchar(20)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idDisciplina);
                });

            migrationBuilder.CreateTable(
                name: "escola",
                columns: table => new
                {
                    cnpj = table.Column<string>(type: "varchar(20)", nullable: false),
                    nome = table.Column<string>(type: "varchar(35)", nullable: false),
                    telefone = table.Column<string>(type: "varchar(25)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.cnpj);
                });

            migrationBuilder.CreateTable(
                name: "disciplina_atividade",
                columns: table => new
                {
                    idDisciplina_atividade = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    disciplina_idDisciplina = table.Column<int>(nullable: false),
                    atividade_idAtividade = table.Column<int>(nullable: false)
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
                    cpf = table.Column<string>(type: "varchar(20)", nullable: false),
                    email = table.Column<string>(type: "varchar(90)", nullable: false),
                    tipoUsuario = table.Column<string>(type: "VARCHAR(45) CHECK (statusAtividade IN ('Aluno','Professor','Responsavel','Adm'))", nullable: false),
                    dataNascimento = table.Column<DateTime>(type: "date", nullable: false),
                    senha = table.Column<string>(type: "varchar(45)", nullable: false),
                    nomeSobrenome = table.Column<string>(type: "varchar(35)", nullable: false),
                    telefone = table.Column<string>(type: "varchar(25)", nullable: true),
                    escola_cnpj = table.Column<string>(type: "varchar(20)", nullable: false)
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
                    idUsuario_Disciplina = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    usuario_cpf = table.Column<string>(type: "varchar(20)", nullable: false),
                    disciplina_idDisciplina = table.Column<int>(nullable: false),
                    tipoUsuario = table.Column<string>(type: "VARCHAR(45) CHECK (statusAtividade IN ('Aluno','Professor','Responsavel','Adm'))", nullable: false)
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
                name: "atividade_usuario_disciplina",
                columns: table => new
                {
                    idAtividade_disciplina = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    atividade_idAtividade = table.Column<int>(nullable: false),
                    usuario_disciplina_idUsuario_Disciplina = table.Column<int>(nullable: false),
                    status = table.Column<string>(type: "VARCHAR(45) CHECK (statusAtividade IN ('Pendente','Entregue','Atrasado'))", nullable: false),
                    total = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PRIMARY", x => x.idAtividade_disciplina);
                    table.ForeignKey(
                        name: "fk_atividade_has_usuario_disciplina_atividade1",
                        column: x => x.atividade_idAtividade,
                        principalTable: "atividade",
                        principalColumn: "idAtividade",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "fk_atividade_has_usuario_disciplina_usuario_disciplina1",
                        column: x => x.usuario_disciplina_idUsuario_Disciplina,
                        principalTable: "usuario_disciplina",
                        principalColumn: "idUsuario_Disciplina",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "fk_atividade_has_usuario_disciplina_atividade1_idx",
                table: "atividade_usuario_disciplina",
                column: "atividade_idAtividade");

            migrationBuilder.CreateIndex(
                name: "fk_atividade_has_usuario_disciplina_usuario_disciplina1_idx",
                table: "atividade_usuario_disciplina",
                column: "usuario_disciplina_idUsuario_Disciplina");

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
                name: "atividade_usuario_disciplina");

            migrationBuilder.DropTable(
                name: "disciplina_atividade");

            migrationBuilder.DropTable(
                name: "usuario_disciplina");

            migrationBuilder.DropTable(
                name: "atividade");

            migrationBuilder.DropTable(
                name: "disciplina");

            migrationBuilder.DropTable(
                name: "usuario");

            migrationBuilder.DropTable(
                name: "escola");
        }
    }
}
