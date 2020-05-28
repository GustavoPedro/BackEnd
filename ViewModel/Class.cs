using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.ViewModel
{
    public class Class
    {
        public string Descricao { get; set; }
        public IFormFile file { get; set; }
    }
}
