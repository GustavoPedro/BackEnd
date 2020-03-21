using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            UsuarioDisciplina = new HashSet<UsuarioDisciplina>();
        }

        public string Cpf { get; set; }
        public string Email { get; set; }
        public string TipoUsuario { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }
        public string NomeSobrenome { get; set; }
        public string Telefone { get; set; }
        public string EscolaCnpj { get; set; }

        public virtual Escola EscolaCnpjNavigation { get; set; }
        public virtual ICollection<UsuarioDisciplina> UsuarioDisciplina { get; set; }
    }
}
