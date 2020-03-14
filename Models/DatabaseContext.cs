﻿using Microsoft.EntityFrameworkCore;
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
        public DbSet<User> Users { get; set; }

        public DbSet<Professor> Professores { get; set; }
    }
}
