using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class AtividadeUsuarioDisciplina
    {
        public int IdAtividadeDisciplina { get; set; }
        public int AtividadeIdAtividade { get; set; }
        public int UsuarioDisciplinaIdUsuarioDisciplina { get; set; }
        public string Status { get; set; }
        public double Total { get; set; }

        public virtual Atividade AtividadeIdAtividadeNavigation { get; set; }
        public virtual UsuarioDisciplina UsuarioDisciplinaIdUsuarioDisciplinaNavigation { get; set; }
    }
}
