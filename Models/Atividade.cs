using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Atividade
    {
        public Atividade()
        {
            AtividadeUsuarioDisciplina = new HashSet<AtividadeUsuarioDisciplina>();
            DisciplinaAtividade = new HashSet<DisciplinaAtividade>();
        }

        public int IdAtividade { get; set; }
        public string Descricao { get; set; }
        public string Atividade1 { get; set; }
        public string Valor { get; set; }
        public string StatusAtividade { get; set; }
        public DateTime DataEntrega { get; set; }
        public string TipoAtividade { get; set; }
        public string Premiacao { get; set; }
        public string MoralAtividade { get; set; }

        public virtual ICollection<AtividadeUsuarioDisciplina> AtividadeUsuarioDisciplina { get; set; }
        public virtual ICollection<DisciplinaAtividade> DisciplinaAtividade { get; set; }
    }
}
