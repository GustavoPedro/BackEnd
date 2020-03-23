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

        /// <summary>
        /// Realiza o login do usuário na aplicação
        /// </summary>
        /// <param name="model"></param>
        /// <returns>Retorna um JSON com informações do usuário mais o token</returns>

        [HttpPost]
        [AllowAnonymous]
        [Route("login")]
        public async Task<dynamic> Login([FromBody]Usuario model)
        {
            Usuario usuario = await _context.Usuario.Where(usr => usr.Email == model.Email && usr.Senha == model.Senha).FirstOrDefaultAsync();
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
    }
}