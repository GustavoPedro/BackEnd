using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace BackEnd.Models
{
    public partial class DatabaseContext : DbContext
    {

        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Atividade> Atividade { get; set; }
        public virtual DbSet<AtividadeUsuario> AtividadeUsuario { get; set; }
        public virtual DbSet<Disciplina> Disciplina { get; set; }
        public virtual DbSet<Escola> Escola { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<UsuarioDisciplina> UsuarioDisciplina { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Atividade>(entity =>
            {                
               entity.Property(c => c.StatusAtividade)
               .HasConversion<string>();

                entity.HasOne(d => d.Disciplina)
                    .WithMany(p => p.Atividades)
                    .HasForeignKey(d => d.IdDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Disciplina_has_Atividade_Atividade1");                
            });




            modelBuilder.Entity<Escola>(entity =>
            {
                entity.HasKey(e => e.Cnpj)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.Telefone)
                    .HasName("telefone_UNIQUE")
                    .IsUnique();                
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.Property(c => c.TipoUsuario)
                .HasConversion<string>();

                entity.HasKey(e => e.Cpf)
                    .HasName("PRIMARY");

                entity.HasIndex(e => e.Email)
                    .HasName("email_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.EscolaCnpj)
                    .HasName("fk_Usuario_Escola_idx");

                entity.HasOne(d => d.EscolaCnpjNavigation)
                    .WithMany(p => p.Usuario)
                    .HasForeignKey(d => d.EscolaCnpj)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Usuario_Escola");
            });

            modelBuilder.Entity<AtividadeUsuario>(entity =>
            {
                entity.HasOne(d => d.IdAtividadeNavigation)
                                    .WithMany(p => p.AtividadeUsuarioDisciplina)
                                    .HasForeignKey(d => d.IdAtividade)
                                    .OnDelete(DeleteBehavior.ClientSetNull)
                                    .HasConstraintName("fk_atividade_has_usuario_disciplina_atividade1");

                entity.HasOne(d => d.IdUsuarioDisciplinaNavigation)
                    .WithMany(p => p.AtividadeUsuarioDisciplina)
                    .HasForeignKey(d => d.IdUsuarioDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_atividade_has_usuario_disciplina_usuario_disciplina1");
            });

            modelBuilder.Entity<UsuarioDisciplina>(entity =>
            {               

                entity.HasIndex(e => e.DisciplinaIdDisciplina)
                    .HasName("fk_Usuario_has_Disciplina_Disciplina1_idx");

                entity.HasIndex(e => e.UsuarioCpf)
                    .HasName("fk_Usuario_has_Disciplina_Usuario1_idx");

                entity.Property(e => e.IdUsuarioDisciplina).HasColumnName("idUsuario_Disciplina");

                entity.Property(e => e.DisciplinaIdDisciplina).HasColumnName("disciplina_idDisciplina");
                

                entity.HasOne(d => d.DisciplinaIdDisciplinaNavigation)
                    .WithMany(p => p.UsuarioDisciplina)
                    .HasForeignKey(d => d.DisciplinaIdDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Usuario_has_Disciplina_Disciplina1");

                entity.HasOne(d => d.UsuarioCpfNavigation)
                    .WithMany(p => p.UsuarioDisciplina)
                    .HasForeignKey(d => d.UsuarioCpf)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Usuario_has_Disciplina_Usuario1");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
