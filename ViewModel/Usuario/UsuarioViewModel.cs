using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.ViewModel
{
    public class UsuarioViewModel
    {
        public string Cpf { get; set; }
        public string Email { get; set; }
        public string TipoUsuario { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }
        public string NomeSobrenome { get; set; }
        public string Telefone { get; set; }
        public string EscolaCnpj { get; set; }
    }
}
