﻿// <auto-generated />
using System;
using BackEnd.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace BackEnd.Migrations
{
    [DbContext(typeof(DatabaseContext))]
    partial class DatabaseContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.2");

            modelBuilder.Entity("BackEnd.Models.Atividade", b =>
                {
                    b.Property<int>("IdAtividade")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Atividade1")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(30);

                    b.Property<DateTime>("DataEntrega")
                        .HasColumnType("TEXT");

                    b.Property<string>("Descricao")
                        .HasColumnType("TEXT");

                    b.Property<int>("IdDisciplina")
                        .HasColumnType("INTEGER");

                    b.Property<string>("MoralAtividade")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(45);

                    b.Property<string>("Premiacao")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(45);

                    b.Property<string>("StatusAtividade")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<string>("TipoAtividade")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(45);

                    b.Property<float>("Valor")
                        .HasColumnType("REAL");

                    b.HasKey("IdAtividade");

                    b.HasIndex("IdDisciplina");

                    b.ToTable("Atividade");
                });

            modelBuilder.Entity("BackEnd.Models.AtividadeUsuario", b =>
                {
                    b.Property<int>("IdAtividadeUsuario")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int>("IdAtividade")
                        .HasColumnType("INTEGER");

                    b.Property<int>("IdUsuarioDisciplina")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Status")
                        .HasColumnType("TEXT");

                    b.Property<double>("Total")
                        .HasColumnType("REAL");

                    b.HasKey("IdAtividadeUsuario");

                    b.HasIndex("IdAtividade");

                    b.HasIndex("IdUsuarioDisciplina");

                    b.ToTable("AtividadeUsuario");
                });

            modelBuilder.Entity("BackEnd.Models.Disciplina", b =>
                {
                    b.Property<int>("IdDisciplina")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Descricao")
                        .HasColumnType("TEXT");

                    b.Property<string>("Materia")
                        .HasColumnType("TEXT")
                        .HasMaxLength(35);

                    b.Property<string>("Turno")
                        .HasColumnType("TEXT")
                        .HasMaxLength(20);

                    b.HasKey("IdDisciplina");

                    b.ToTable("Disciplina");
                });

            modelBuilder.Entity("BackEnd.Models.Escola", b =>
                {
                    b.Property<string>("Cnpj")
                        .HasColumnType("TEXT")
                        .HasMaxLength(20);

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT")
                        .HasMaxLength(35);

                    b.Property<string>("Telefone")
                        .HasColumnType("TEXT")
                        .HasMaxLength(25);

                    b.HasKey("Cnpj")
                        .HasName("PRIMARY");

                    b.HasIndex("Telefone")
                        .IsUnique()
                        .HasName("telefone_UNIQUE");

                    b.ToTable("Escola");

                    b.HasData(
                        new
                        {
                            Cnpj = "111",
                            Nome = "Una Aimorés",
                            Telefone = "31 3 3333 3333"
                        });
                });

            modelBuilder.Entity("BackEnd.Models.Usuario", b =>
                {
                    b.Property<string>("Cpf")
                        .HasColumnType("TEXT")
                        .HasMaxLength(20);

                    b.Property<DateTime>("DataNascimento")
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(90);

                    b.Property<string>("EscolaCnpj")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(20);

                    b.Property<string>("NomeSobrenome")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(35);

                    b.Property<string>("Senha")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(45);

                    b.Property<string>("Telefone")
                        .HasColumnType("TEXT")
                        .HasMaxLength(25);

                    b.Property<string>("TipoUsuario")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Cpf")
                        .HasName("PRIMARY");

                    b.HasIndex("Email")
                        .IsUnique()
                        .HasName("email_UNIQUE");

                    b.HasIndex("EscolaCnpj")
                        .HasName("fk_Usuario_Escola_idx");

                    b.ToTable("Usuario");
                });

            modelBuilder.Entity("BackEnd.Models.UsuarioDisciplina", b =>
                {
                    b.Property<int>("IdUsuarioDisciplina")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("idUsuario_Disciplina")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DisciplinaIdDisciplina")
                        .HasColumnName("disciplina_idDisciplina")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UsuarioCpf")
                        .IsRequired()
                        .HasColumnType("TEXT")
                        .HasMaxLength(20);

                    b.HasKey("IdUsuarioDisciplina");

                    b.HasIndex("DisciplinaIdDisciplina")
                        .HasName("fk_Usuario_has_Disciplina_Disciplina1_idx");

                    b.HasIndex("UsuarioCpf")
                        .HasName("fk_Usuario_has_Disciplina_Usuario1_idx");

                    b.ToTable("UsuarioDisciplina");
                });

            modelBuilder.Entity("BackEnd.Models.Atividade", b =>
                {
                    b.HasOne("BackEnd.Models.Disciplina", "Disciplina")
                        .WithMany("Atividades")
                        .HasForeignKey("IdDisciplina")
                        .HasConstraintName("fk_Disciplina_has_Atividade_Atividade1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.AtividadeUsuario", b =>
                {
                    b.HasOne("BackEnd.Models.Atividade", "IdAtividadeNavigation")
                        .WithMany("AtividadeUsuarioDisciplina")
                        .HasForeignKey("IdAtividade")
                        .HasConstraintName("fk_atividade_has_usuario_disciplina_atividade1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("BackEnd.Models.UsuarioDisciplina", "IdUsuarioDisciplinaNavigation")
                        .WithMany("AtividadeUsuarioDisciplina")
                        .HasForeignKey("IdUsuarioDisciplina")
                        .HasConstraintName("fk_atividade_has_usuario_disciplina_usuario_disciplina1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.Usuario", b =>
                {
                    b.HasOne("BackEnd.Models.Escola", "EscolaCnpjNavigation")
                        .WithMany("Usuario")
                        .HasForeignKey("EscolaCnpj")
                        .HasConstraintName("fk_Usuario_Escola")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("BackEnd.Models.UsuarioDisciplina", b =>
                {
                    b.HasOne("BackEnd.Models.Disciplina", "DisciplinaIdDisciplinaNavigation")
                        .WithMany("UsuarioDisciplina")
                        .HasForeignKey("DisciplinaIdDisciplina")
                        .HasConstraintName("fk_Usuario_has_Disciplina_Disciplina1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("BackEnd.Models.Usuario", "UsuarioCpfNavigation")
                        .WithMany("UsuarioDisciplina")
                        .HasForeignKey("UsuarioCpf")
                        .HasConstraintName("fk_Usuario_has_Disciplina_Usuario1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
