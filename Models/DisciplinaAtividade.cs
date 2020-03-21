using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class DisciplinaAtividade
    {
        public int IdDisciplinaAtividade { get; set; }
        public int DisciplinaIdDisciplina { get; set; }
        public int AtividadeIdAtividade { get; set; }

        public virtual Atividade AtividadeIdAtividadeNavigation { get; set; }
        public virtual Disciplina DisciplinaIdDisciplinaNavigation { get; set; }
    }
}
