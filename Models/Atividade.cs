using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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
        public int IdDisciplina { get; set; }


        public string Descricao { get; set; }

        [Required]
        [StringLength(30)]
        public string Atividade1 { get; set; }

        [Required]
        public float Valor { get; set; }
        [Required]        
        public StatusAtividadeEnum StatusAtividade { get; set; }
        [Required]
        public DateTime DataEntrega { get; set; }
        [Required]
        [StringLength(45)]
        public string TipoAtividade { get; set; }
        [Required]
        [StringLength(45)]
        public string Premiacao { get; set; }
        [Required]
        [StringLength(45)]
        public string MoralAtividade { get; set; }

        public virtual ICollection<AtividadeUsuario> AtividadeUsuarioDisciplina { get; set; }
        public virtual  Disciplina Disciplina { get; set; }
    }

    public enum StatusAtividadeEnum
    {
        Pendente,
        [Display(Name ="Em andamento")]
        Emand
    }
}
