using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.ViewModel.Disciplinas
{
    public class DisciplinaViewModel
    {
        public int IdDisciplina { get; set; }
        public string Descricao { get; set; }
        public string Materia { get; set; }
        public string Turno { get; set; }
    }
}
