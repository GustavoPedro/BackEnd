using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace BackEnd.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            UsuarioDisciplina = new HashSet<UsuarioDisciplina>();
        }
        [StringLength(20)]
        public string Cpf { get; set; }
        [Required(ErrorMessage = "O campo de Email é obrigatório")]
        [StringLength(90)]
        public string Email { get; set; }
        [Required]
        public TipoUsuarioEnum TipoUsuario { get; set; }

        [Required]
        public DateTime DataNascimento { get; set; }

        [Required]
        [StringLength(45)]
        public string Senha { get; set; }
        [Required]
        [StringLength(35)]
        public string NomeSobrenome { get; set; }

        [StringLength(25)]
        public string Telefone { get; set; }
        [StringLength(20)]
        [Required]
        public string EscolaCnpj { get; set; }

        public virtual Escola EscolaCnpjNavigation { get; set; }
        public virtual ICollection<UsuarioDisciplina> UsuarioDisciplina { get; set; }
    }
    public enum TipoUsuarioEnum
    {
        [EnumMember(Value = "Aluno")]
        Aluno,
        [EnumMember(Value = "Professor")]
        Professor,
        [EnumMember(Value = "Responsavel")]
        Responsavel,
        [EnumMember(Value = "Adm")]
        Adm
    }
}
