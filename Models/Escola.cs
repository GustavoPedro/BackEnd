using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BackEnd.Models
{
    public partial class Escola
    {
        public Escola()
        {
            Usuario = new HashSet<Usuario>();
        }

        [StringLength(20)]
        public string Cnpj { get; set; }
        [StringLength(35)]
        public string Nome { get; set; }
        [StringLength(25)]
        public string Telefone { get; set; }
    
        public virtual ICollection<Usuario> Usuario { get; set; }
    }
}
