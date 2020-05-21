using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Atividade
    {
        public Atividade()
        {
            AtividadeUsuarioDisciplina = new HashSet<AtividadeUsuario>();
        }

        public int IdAtividade { get; set; }
        public int IdDisciplina { get; set; }
        public string Descricao { get; set; }
        public string Atividade1 { get; set; }
        public float Valor { get; set; }
        public string StatusAtividade { get; set; }
        public DateTime DataEntrega { get; set; }
        public string TipoAtividade { get; set; }
        public string Premiacao { get; set; }
        public string MoralAtividade { get; set; }

        public virtual ICollection<AtividadeUsuario> AtividadeUsuarioDisciplina { get; set; }
        public virtual  Disciplina Disciplina { get; set; }
    }
}
