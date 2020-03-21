using System;
using System.Collections.Generic;

namespace BackEnd.Models
{
    public partial class Escola
    {
        public Escola()
        {
            Usuario = new HashSet<Usuario>();
        }

        public string Cnpj { get; set; }
        public string Nome { get; set; }
        public string Telefone { get; set; }

        public virtual ICollection<Usuario> Usuario { get; set; }
    }
}
