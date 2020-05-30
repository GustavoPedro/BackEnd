using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BackEnd.Models
{
    public partial class Disciplina
    {
        public Disciplina()
        {
            Atividades = new HashSet<Atividade>();
            UsuarioDisciplina = new HashSet<UsuarioDisciplina>();
        }
        [Key]
        public int IdDisciplina { get; set; }
        public string Descricao { get; set; }
        [StringLength(35)]
        public string Materia { get; set; }
        [StringLength(20)]
        public string Turno { get; set; }

        public virtual ICollection<Atividade> Atividades { get; set; }
        public virtual ICollection<UsuarioDisciplina> UsuarioDisciplina { get; set; }
    }
}
