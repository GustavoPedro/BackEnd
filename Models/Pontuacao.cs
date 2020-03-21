using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Pontuacao
    {
        public int IdPontuacao { get; set; }
        public string Pontuacao1 { get; set; }
        public string Descricao { get; set; }
        public int PontuacaoUsuarioDisciplina { get; set; }

        public virtual UsuarioDisciplina PontuacaoUsuarioDisciplinaNavigation { get; set; }
    }
}
