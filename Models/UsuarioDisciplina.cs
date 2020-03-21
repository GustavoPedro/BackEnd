using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class UsuarioDisciplina
    {
        public UsuarioDisciplina()
        {
            Pontuacao = new HashSet<Pontuacao>();
        }

        public int IdUsuarioDisciplina { get; set; }
        public string UsuarioCpf { get; set; }
        public int DisciplinaIdDisciplina { get; set; }
        public string TipoUsuario { get; set; }

        public virtual Disciplina DisciplinaIdDisciplinaNavigation { get; set; }
        public virtual Usuario UsuarioCpfNavigation { get; set; }
        public virtual ICollection<Pontuacao> Pontuacao { get; set; }
    }
}
