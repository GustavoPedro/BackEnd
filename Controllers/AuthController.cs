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
        public async Task<dynamic> Login([FromBody]User model)
        {
            User user = await _context.Users.Where(usr => usr.Username == model.Username && usr.Password == model.Password).FirstOrDefaultAsync();
            //User user = UserRepository.Get(model.Username, model.Password);
            if(user == null)
            {
                return NotFound(new {message="Usuário ou senha inválidas" });
            }
            string token = TokenService.GenerateToken(user);
            user.Password = "";
            return new
            {
                user = user,
                token = token
            };
        }

        [HttpGet]
        [Authorize(Roles = "Peao")]
        public string Teste() => "Permitido";
    }
}