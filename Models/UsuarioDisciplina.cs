using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class UsuarioDisciplina
    {
        public UsuarioDisciplina()
        {
            AtividadeUsuarioDisciplina = new HashSet<AtividadeUsuarioDisciplina>();
        }

        public int IdUsuarioDisciplina { get; set; }
        public string UsuarioCpf { get; set; }
        public int DisciplinaIdDisciplina { get; set; }
        public virtual Disciplina DisciplinaIdDisciplinaNavigation { get; set; }
        public virtual Usuario UsuarioCpfNavigation { get; set; }
        public virtual ICollection<AtividadeUsuarioDisciplina> AtividadeUsuarioDisciplina { get; set; }
    }
}
