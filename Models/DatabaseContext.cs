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

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseMySql("server=localhost;port=3306;user=root;password=1802;database=pi", x => x.ServerVersion("8.0.20-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Atividade>(entity =>
            {
                entity.HasKey(e => e.IdAtividade)
                    .HasName("PRIMARY");

                entity.ToTable("atividade");

                entity.Property(e => e.IdAtividade).HasColumnName("idAtividade");

                entity.Property(e => e.Atividade1)
                    .IsRequired()
                    .HasColumnName("atividade")
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.DataEntrega)
                    .HasColumnName("dataEntrega")
                    .HasColumnType("date");

                entity.Property(e => e.Descricao)
                    .HasColumnName("descricao")
                    .HasColumnType("text")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.MoralAtividade)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.Premiacao)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.StatusAtividade)
                    .IsRequired()
                    .HasColumnName("statusAtividade")
                    .HasColumnType("enum('Pendente','Em andamento')")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.TipoAtividade)
                    .IsRequired()
                    .HasColumnName("tipoAtividade")
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.HasOne(d => d.Disciplina)
                    .WithMany(p => p.Atividades)
                    .HasForeignKey(d => d.IdDisciplina)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Disciplina_has_Atividade_Atividade1");

            });

            

            modelBuilder.Entity<Disciplina>(entity =>
            {
                entity.HasKey(e => e.IdDisciplina)
                    .HasName("PRIMARY");

                entity.ToTable("disciplina");

                entity.Property(e => e.IdDisciplina).HasColumnName("idDisciplina");

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
                entity.HasKey(e => e.IdUsuarioDisciplina)
                    .HasName("PRIMARY");

                entity.ToTable("usuario_disciplina");

                entity.HasIndex(e => e.DisciplinaIdDisciplina)
                    .HasName("fk_Usuario_has_Disciplina_Disciplina1_idx");

                entity.HasIndex(e => e.UsuarioCpf)
                    .HasName("fk_Usuario_has_Disciplina_Usuario1_idx");

                entity.Property(e => e.IdUsuarioDisciplina).HasColumnName("idUsuario_Disciplina");

                entity.Property(e => e.DisciplinaIdDisciplina).HasColumnName("disciplina_idDisciplina");
                

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
