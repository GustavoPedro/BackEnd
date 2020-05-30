using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BackEnd.Models
{
    public partial class UsuarioDisciplina
    {
        public UsuarioDisciplina()
        {
            AtividadeUsuarioDisciplina = new HashSet<AtividadeUsuario>();
        }

        [Key]
        public int IdUsuarioDisciplina { get; set; }

        [StringLength(20)]
        public string UsuarioCpf { get; set; }
        public int DisciplinaIdDisciplina { get; set; }
        public virtual Disciplina DisciplinaIdDisciplinaNavigation { get; set; }
        public virtual Usuario UsuarioCpfNavigation { get; set; }
        public virtual ICollection<AtividadeUsuario> AtividadeUsuarioDisciplina { get; set; }
    }
}
