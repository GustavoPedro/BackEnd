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
        public virtual DbSet<Disciplina> Disciplina { get; set; }
        public virtual DbSet<DisciplinaAtividade> DisciplinaAtividade { get; set; }
        public virtual DbSet<Escola> Escola { get; set; }
        public virtual DbSet<Pontuacao> Pontuacao { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<UsuarioDisciplina> UsuarioDisciplina { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Atividade>(entity =>
            {
                entity.HasKey(e => e.IdAtividade)
                    .HasName("PRIMARY");

                entity.ToTable("atividade");

                entity.Property(e => e.IdAtividade)
                    .HasColumnName("idAtividade")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Atividade1)
                    .IsRequired()
                    .HasColumnName("atividade")
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Descricao)
                    .HasColumnName("descricao")
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Valor)
                    .IsRequired()
                    .HasColumnName("valor")
                    .HasColumnType("enum('Muito bom','Bom','Regular','Ruim','Muito ruim')")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Disciplina>(entity =>
            {
                entity.HasKey(e => e.IdDisciplina)
                    .HasName("PRIMARY");

                entity.ToTable("disciplina");

                entity.Property(e => e.IdDisciplina)
                    .HasColumnName("idDisciplina")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Descricao)
                    .HasColumnName("descricao")
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Materia)
                    .IsRequired()
                    .HasColumnName("materia")
                    .HasColumnType("varchar(35)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Turno)
                    .IsRequired()
                    .HasColumnName("turno")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<DisciplinaAtividade>(entity =>
            {
                entity.HasKey(e => e.IdDisciplinaAtividade)
                    .HasName("PRIMARY");

                entity.ToTable("disciplina_atividade");

                entity.HasIndex(e => e.AtividadeIdAtividade)
                    .HasName("fk_Disciplina_has_Atividade_Atividade1_idx");

                entity.HasIndex(e => e.DisciplinaIdDisciplina)
                    .HasName("fk_Disciplina_has_Atividade_Disciplina1_idx");

                entity.Property(e => e.IdDisciplinaAtividade)
                    .HasColumnName("idDisciplina_atividade")
                    .HasColumnType("int(11)");

                entity.Property(e => e.AtividadeIdAtividade)
                    .HasColumnName("atividade_idAtividade")
                    .HasColumnType("int(11)");

                entity.Property(e => e.DisciplinaIdDisciplina)
                    .HasColumnName("disciplina_idDisciplina")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.AtividadeIdAtividadeNavigation)
                    .WithMany(p => p.DisciplinaAtividade)
                    .HasForeignKey(d => d.AtividadeIdAtividade)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Disciplina_has_Atividade_Atividade1");

                entity.HasOne(d => d.DisciplinaIdDisciplinaNavigation)
                    .WithMany(p => p.DisciplinaAtividade)
                    .HasForeignKey(d => d.DisciplinaIdDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Disciplina_has_Atividade_Disciplina1");
            });

            modelBuilder.Entity<Escola>(entity =>
            {
                entity.HasKey(e => e.Cnpj)
                    .HasName("PRIMARY");

                entity.ToTable("escola");

                entity.HasIndex(e => e.Telefone)
                    .HasName("telefone_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Cnpj)
                    .HasColumnName("cnpj")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Nome)
                    .IsRequired()
                    .HasColumnName("nome")
                    .HasColumnType("varchar(35)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Telefone)
                    .IsRequired()
                    .HasColumnName("telefone")
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");
            });

            modelBuilder.Entity<Pontuacao>(entity =>
            {
                entity.HasKey(e => e.IdPontuacao)
                    .HasName("PRIMARY");

                entity.ToTable("pontuacao");

                entity.HasIndex(e => e.PontuacaoUsuarioDisciplina)
                    .HasName("fk_Pontuacao_Usuario_Disciplina1_idx");

                entity.Property(e => e.IdPontuacao)
                    .HasColumnName("idPontuacao")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Descricao)
                    .HasColumnName("descricao")
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Pontuacao1)
                    .IsRequired()
                    .HasColumnName("pontuacao")
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.PontuacaoUsuarioDisciplina)
                    .HasColumnName("pontuacao_usuario_disciplina")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.PontuacaoUsuarioDisciplinaNavigation)
                    .WithMany(p => p.Pontuacao)
                    .HasForeignKey(d => d.PontuacaoUsuarioDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Pontuacao_Usuario_Disciplina1");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.Cpf)
                    .HasName("PRIMARY");

                entity.ToTable("usuario");

                entity.HasIndex(e => e.Email)
                    .HasName("email_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.EscolaCnpj)
                    .HasName("fk_Usuario_Escola_idx");                

                entity.Property(e => e.Cpf)
                    .HasColumnName("cpf")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.DataNascimento)
                    .HasColumnName("dataNascimento")
                    .HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasColumnType("varchar(90)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.EscolaCnpj)
                    .IsRequired()
                    .HasColumnName("escola_cnpj")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.NomeSobrenome)
                    .IsRequired()
                    .HasColumnName("nomeSobrenome")
                    .HasColumnType("varchar(35)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Senha)
                    .IsRequired()
                    .HasColumnName("senha")
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Telefone)
                    .HasColumnName("telefone")
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.TipoUsuario)
                    .IsRequired()
                    .HasColumnName("tipoUsuario")
                    .HasColumnType("enum('Aluno','Professor','Responsavel','Adm')")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.HasOne(d => d.EscolaCnpjNavigation)
                    .WithMany(p => p.Usuario)
                    .HasForeignKey(d => d.EscolaCnpj)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Usuario_Escola");
            });

            modelBuilder.Entity<UsuarioDisciplina>(entity =>
            {
                entity.HasKey(e => e.IdUsuarioDisciplina)
                    .HasName("PRIMARY");

                entity.ToTable("usuario_disciplina");

                entity.HasIndex(e => e.DisciplinaIdDisciplina)
                    .HasName("fk_Usuario_has_Disciplina_Disciplina1_idx");

                entity.HasIndex(e => e.UsuarioCpf)
                    .HasName("fk_Usuario_has_Disciplina_Usuario1_idx");

                entity.Property(e => e.IdUsuarioDisciplina)
                    .HasColumnName("idUsuario_Disciplina")
                    .HasColumnType("int(11)");

                entity.Property(e => e.DisciplinaIdDisciplina)
                    .HasColumnName("disciplina_idDisciplina")
                    .HasColumnType("int(11)");

                entity.Property(e => e.TipoUsuario)
                    .IsRequired()
                    .HasColumnName("tipoUsuario")
                    .HasColumnType("enum('Aluno','Professor','Responsavel','Adm')")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.UsuarioCpf)
                    .IsRequired()
                    .HasColumnName("usuario_cpf")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

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
