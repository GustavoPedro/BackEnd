using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Filho
    {
        [Key]
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Telefone { get; set; }        

        public int IdPai { get; set; }
        public Pais Pai { get; set; }
    }
}
