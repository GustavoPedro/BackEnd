using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BackEnd.Models
{
    public partial class AtividadeUsuario
    {
        [Key]
        public int IdAtividadeUsuario { get; set; }
        public int IdAtividade { get; set; }
        public int IdUsuarioDisciplina { get; set; }
        public string Status { get; set; }
        public double Total { get; set; }

        public virtual Atividade IdAtividadeNavigation { get; set; }
        public virtual UsuarioDisciplina IdUsuarioDisciplinaNavigation { get; set; }
    }
}
