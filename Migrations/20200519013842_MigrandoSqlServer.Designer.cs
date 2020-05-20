﻿// <auto-generated />
using System;
using BackEnd.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace BackEnd.Migrations
{
    [DbContext(typeof(DatabaseContext))]
    [Migration("20200519013842_MigrandoSqlServer")]
    partial class MigrandoSqlServer
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("BackEnd.Models.Atividade", b =>
                {
                    b.Property<int>("IdAtividade")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idAtividade")
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Atividade1")
                        .IsRequired()
                        .HasColumnName("atividade")
                        .HasColumnType("varchar(30)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<DateTime>("DataEntrega")
                        .HasColumnName("dataEntrega")
                        .HasColumnType("date");

                    b.Property<string>("Descricao")
                        .HasColumnName("descricao")
                        .HasColumnType("text")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("MoralAtividade")
                        .IsRequired()
                        .HasColumnType("varchar(45)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Premiacao")
                        .IsRequired()
                        .HasColumnType("varchar(45)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("StatusAtividade")
                        .IsRequired()
                        .HasColumnName("statusAtividade")
                        .HasColumnType("VARCHAR(45) CHECK (statusAtividade IN ('Pendente','Em andamento'))")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("TipoAtividade")
                        .IsRequired()
                        .HasColumnName("tipoAtividade")
                        .HasColumnType("varchar(45)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<decimal>("Valor")
                        .HasColumnType("decimal(18,4)");

                    b.HasKey("IdAtividade")
                        .HasName("PRIMARY");

                    b.ToTable("atividade");
                });

            modelBuilder.Entity("BackEnd.Models.AtividadeUsuarioDisciplina", b =>
                {
                    b.Property<int>("IdAtividadeDisciplina")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idAtividade_disciplina")
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AtividadeIdAtividade")
                        .HasColumnName("atividade_idAtividade")
                        .HasColumnType("int");

                    b.Property<string>("Status")
                        .IsRequired()
                        .HasColumnName("status")
                        .HasColumnType("VARCHAR(45) CHECK (statusAtividade IN ('Pendente','Entregue','Atrasado'))")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<double>("Total")
                        .HasColumnName("total")
                        .HasColumnType("float");

                    b.Property<int>("UsuarioDisciplinaIdUsuarioDisciplina")
                        .HasColumnName("usuario_disciplina_idUsuario_Disciplina")
                        .HasColumnType("int");

                    b.HasKey("IdAtividadeDisciplina")
                        .HasName("PRIMARY");

                    b.HasIndex("AtividadeIdAtividade")
                        .HasName("fk_atividade_has_usuario_disciplina_atividade1_idx");

                    b.HasIndex("UsuarioDisciplinaIdUsuarioDisciplina")
                        .HasName("fk_atividade_has_usuario_disciplina_usuario_disciplina1_idx");

                    b.ToTable("atividade_usuario_disciplina");
                });

            modelBuilder.Entity("BackEnd.Models.Disciplina", b =>
                {
                    b.Property<int>("IdDisciplina")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idDisciplina")
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Descricao")
                        .HasColumnName("descricao")
                        .HasColumnType("text")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Materia")
                        .IsRequired()
                        .HasColumnName("materia")
                        .HasColumnType("varchar(35)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Turno")
                        .IsRequired()
                        .HasColumnName("turno")
                        .HasColumnType("varchar(20)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.HasKey("IdDisciplina")
                        .HasName("PRIMARY");

                    b.ToTable("disciplina");
                });

            modelBuilder.Entity("BackEnd.Models.DisciplinaAtividade", b =>
                {
                    b.Property<int>("IdDisciplinaAtividade")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idDisciplina_atividade")
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AtividadeIdAtividade")
                        .HasColumnName("atividade_idAtividade")
                        .HasColumnType("int");

                    b.Property<int>("DisciplinaIdDisciplina")
                        .HasColumnName("disciplina_idDisciplina")
                        .HasColumnType("int");

                    b.HasKey("IdDisciplinaAtividade")
                        .HasName("PRIMARY");

                    b.HasIndex("AtividadeIdAtividade")
                        .HasName("fk_Disciplina_has_Atividade_Atividade1_idx");

                    b.HasIndex("DisciplinaIdDisciplina")
                        .HasName("fk_Disciplina_has_Atividade_Disciplina1_idx");

                    b.ToTable("disciplina_atividade");
                });

            modelBuilder.Entity("BackEnd.Models.Escola", b =>
                {
                    b.Property<string>("Cnpj")
                        .HasColumnName("cnpj")
                        .HasColumnType("varchar(20)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Nome")
                        .IsRequired()
                        .HasColumnName("nome")
                        .HasColumnType("varchar(35)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Telefone")
                        .IsRequired()
                        .HasColumnName("telefone")
                        .HasColumnType("varchar(25)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.HasKey("Cnpj")
                        .HasName("PRIMARY");

                    b.HasIndex("Telefone")
                        .IsUnique()
                        .HasName("telefone_UNIQUE");

                    b.ToTable("escola");
                });

            modelBuilder.Entity("BackEnd.Models.Usuario", b =>
                {
                    b.Property<string>("Cpf")
                        .HasColumnName("cpf")
                        .HasColumnType("varchar(20)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<DateTime>("DataNascimento")
                        .HasColumnName("dataNascimento")
                        .HasColumnType("date");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnName("email")
                        .HasColumnType("varchar(90)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("EscolaCnpj")
                        .IsRequired()
                        .HasColumnName("escola_cnpj")
                        .HasColumnType("varchar(20)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("NomeSobrenome")
                        .IsRequired()
                        .HasColumnName("nomeSobrenome")
                        .HasColumnType("varchar(35)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Senha")
                        .IsRequired()
                        .HasColumnName("senha")
                        .HasColumnType("varchar(45)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("Telefone")
                        .HasColumnName("telefone")
                        .HasColumnType("varchar(25)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("TipoUsuario")
                        .IsRequired()
                        .HasColumnName("tipoUsuario")
                        .HasColumnType("VARCHAR(45) CHECK (statusAtividade IN ('Aluno','Professor','Responsavel','Adm'))")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.HasKey("Cpf")
                        .HasName("PRIMARY");

                    b.HasIndex("Email")
                        .IsUnique()
                        .HasName("email_UNIQUE");

                    b.HasIndex("EscolaCnpj")
                        .HasName("fk_Usuario_Escola_idx");

                    b.ToTable("usuario");
                });

            modelBuilder.Entity("BackEnd.Models.UsuarioDisciplina", b =>
                {
                    b.Property<int>("IdUsuarioDisciplina")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idUsuario_Disciplina")
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("DisciplinaIdDisciplina")
                        .HasColumnName("disciplina_idDisciplina")
                        .HasColumnType("int");

                    b.Property<string>("TipoUsuario")
                        .IsRequired()
                        .HasColumnName("tipoUsuario")
                        .HasColumnType("VARCHAR(45) CHECK (statusAtividade IN ('Aluno','Professor','Responsavel','Adm'))")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.Property<string>("UsuarioCpf")
                        .IsRequired()
                        .HasColumnName("usuario_cpf")
                        .HasColumnType("varchar(20)")
                        .HasAnnotation("MySql:CharSet", "utf8")
                        .HasAnnotation("MySql:Collation", "utf8_general_ci");

                    b.HasKey("IdUsuarioDisciplina")
                        .HasName("PRIMARY");

                    b.HasIndex("DisciplinaIdDisciplina")
                        .HasName("fk_Usuario_has_Disciplina_Disciplina1_idx");

                    b.HasIndex("UsuarioCpf")
                        .HasName("fk_Usuario_has_Disciplina_Usuario1_idx");

                    b.ToTable("usuario_disciplina");
                });

            modelBuilder.Entity("BackEnd.Models.AtividadeUsuarioDisciplina", b =>
                {
                    b.HasOne("BackEnd.Models.Atividade", "AtividadeIdAtividadeNavigation")
                        .WithMany("AtividadeUsuarioDisciplina")
                        .HasForeignKey("AtividadeIdAtividade")
                        .HasConstraintName("fk_atividade_has_usuario_disciplina_atividade1")
                        .IsRequired();

                    b.HasOne("BackEnd.Models.UsuarioDisciplina", "UsuarioDisciplinaIdUsuarioDisciplinaNavigation")
                        .WithMany("AtividadeUsuarioDisciplina")
                        .HasForeignKey("UsuarioDisciplinaIdUsuarioDisciplina")
                        .HasConstraintName("fk_atividade_has_usuario_disciplina_usuario_disciplina1")
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.DisciplinaAtividade", b =>
                {
                    b.HasOne("BackEnd.Models.Atividade", "AtividadeIdAtividadeNavigation")
                        .WithMany("DisciplinaAtividade")
                        .HasForeignKey("AtividadeIdAtividade")
                        .HasConstraintName("fk_Disciplina_has_Atividade_Atividade1")
                        .IsRequired();

                    b.HasOne("BackEnd.Models.Disciplina", "DisciplinaIdDisciplinaNavigation")
                        .WithMany("DisciplinaAtividade")
                        .HasForeignKey("DisciplinaIdDisciplina")
                        .HasConstraintName("fk_Disciplina_has_Atividade_Disciplina1")
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.Usuario", b =>
                {
                    b.HasOne("BackEnd.Models.Escola", "EscolaCnpjNavigation")
                        .WithMany("Usuario")
                        .HasForeignKey("EscolaCnpj")
                        .HasConstraintName("fk_Usuario_Escola")
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.UsuarioDisciplina", b =>
                {
                    b.HasOne("BackEnd.Models.Disciplina", "DisciplinaIdDisciplinaNavigation")
                        .WithMany("UsuarioDisciplina")
                        .HasForeignKey("DisciplinaIdDisciplina")
                        .HasConstraintName("fk_Usuario_has_Disciplina_Disciplina1")
                        .IsRequired();

                    b.HasOne("BackEnd.Models.Usuario", "UsuarioCpfNavigation")
                        .WithMany("UsuarioDisciplina")
                        .HasForeignKey("UsuarioCpf")
                        .HasConstraintName("fk_Usuario_has_Disciplina_Usuario1")
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
