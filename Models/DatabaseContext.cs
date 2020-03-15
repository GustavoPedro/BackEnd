using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class DatabaseContext: DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options)
      : base(options)
        { }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           
        }
        public DbSet<Usuario> Usuarios { get; set; }

        public DbSet<Professor> Professores { get; set; }

        public DbSet<Pais> Pais { get; set; }
        public DbSet<Filho> Filhos { get; set; }
    }
}
