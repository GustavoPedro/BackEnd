using BackEnd.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.ViewModel
{
    public class UsuarioDisciplinaSearchViewModel
    {
        public string Nome { get; set; }
        public string Email { get; set; }

        public string Tipo { get; set; }
        public List<Disciplina> Disciplinas { get; set; }
    }
}
