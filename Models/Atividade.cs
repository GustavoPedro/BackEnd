using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Atividade
    {
        public Atividade()
        {
            DisciplinaAtividade = new HashSet<DisciplinaAtividade>();
        }

        public int IdAtividade { get; set; }
        public string Descricao { get; set; }
        public string Atividade1 { get; set; }
        public string Valor { get; set; }

        public virtual ICollection<DisciplinaAtividade> DisciplinaAtividade { get; set; }
    }
}
