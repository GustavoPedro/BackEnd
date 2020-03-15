using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using BackEnd.Services;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public DatabaseContext _context { get; set; }

        public AuthController(DatabaseContext context)
        {
            _context = context;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("login")]
        public async Task<dynamic> Login([FromBody]Usuario model)
        {
            Usuario usuario = await _context.Usuarios.Where(usr => usr.Email == model.Email && usr.Senha == model.Senha).FirstOrDefaultAsync();
            //User user = UserRepository.Get(model.Username, model.Password);
            if(usuario == null)
            {
                return NotFound(new {message="Usuário ou senha inválidas" });
            }
            string token = TokenService.GenerateToken(usuario);
            usuario.Senha = "";
            return new
            {
                user = usuario,
                token = token
            };
        }

        [HttpGet]
        [Authorize(Roles = "Peao")]
        [Route("notall")]
        public string Teste() => "Permitido somente para peão";

        [HttpGet]        
        [AllowAnonymous]
        [Route("all")]
        public string Teste2() => "Permitido para todos";
    }
}