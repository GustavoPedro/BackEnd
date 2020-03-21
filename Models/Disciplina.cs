using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Disciplina
    {
        public Disciplina()
        {
            DisciplinaAtividade = new HashSet<DisciplinaAtividade>();
            UsuarioDisciplina = new HashSet<UsuarioDisciplina>();
        }

        public int IdDisciplina { get; set; }
        public string Descricao { get; set; }
        public string Materia { get; set; }
        public string Turno { get; set; }

        public virtual ICollection<DisciplinaAtividade> DisciplinaAtividade { get; set; }
        public virtual ICollection<UsuarioDisciplina> UsuarioDisciplina { get; set; }
    }
}
