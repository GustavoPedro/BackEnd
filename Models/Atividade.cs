using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace BackEnd.Models
{
    public partial class Atividade
    {
        public Atividade()
        {
            AtividadeUsuarioDisciplina = new HashSet<AtividadeUsuario>();
        }

        [Key]
        public int IdAtividade { get; set; }

        [Required(ErrorMessage = "O campo de Id da Disciplina é obrigatório")]
        public int IdDisciplina { get; set; }


        public string Descricao { get; set; }

        [Required(ErrorMessage = "O campo de Atividade é obrigatório")]
        [StringLength(30)]
        public string Atividade1 { get; set; }

        [Required(ErrorMessage = "O campo de Valor é obrigatório")]
        public float Valor { get; set; }
        [Required(ErrorMessage = "O campo de Status da Atividade é obrigatório")]        
        public StatusAtividadeEnum StatusAtividade { get; set; }
        [Required(ErrorMessage = "O campo de Data de Entrega é obrigatório")]
        public DateTime DataEntrega { get; set; }
        [Required(ErrorMessage = "O campo de Tipo de Atividade é obrigatório")]
        [StringLength(45)]
        public string TipoAtividade { get; set; }
        [Required(ErrorMessage = "O campo de Premiação é obrigatório")]
        [StringLength(45)]
        public string Premiacao { get; set; }
        [Required(ErrorMessage = "O campo de Moral da Atividade é obrigatório")]
        [StringLength(45)]
        public string MoralAtividade { get; set; }

        public virtual ICollection<AtividadeUsuario> AtividadeUsuarioDisciplina { get; set; }
        public virtual  Disciplina Disciplina { get; set; }
    }

    public enum StatusAtividadeEnum
    {
        [EnumMember(Value = "Pendente")]
        Pendente,
        [Display(Name ="Em andamento")]
        [EnumMember(Value = "Em andamento")]
        Emand
    }
}
