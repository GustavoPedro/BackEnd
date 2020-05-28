using BackEnd.ViewModel.AtividadeUsuarioDisciplina;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.ViewModel.Atividade
{
    public class AtividadeViewModel
    {
        public string Descricao { get; set; }
        public string Atividade1 { get; set; }
        public decimal Valor { get; set; }
        public string StatusAtividade { get; set; }
        public DateTime DataEntrega { get; set; }
        public string TipoAtividade { get; set; }
        public string Premiacao { get; set; }
        public string MoralAtividade { get; set; }

        public int IdDisciplina { get; set; }

    }
}
