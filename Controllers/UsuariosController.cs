using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using Microsoft.AspNetCore.Authorization;
using BackEnd.Services;
using BackEnd.ViewModel;
using AutoMapper;
using System.IdentityModel.Tokens.Jwt;
using BackEnd.Filters;

namespace BackEnd.Controllers
{    
    [ApiController]    
    public class UsuariosController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly IMapper _mapper;
        public UsuariosController(DatabaseContext context,IMapper mapper )
        {
            _context = context;
            _mapper = mapper;
        }

        /// <summary>
        /// Realiza a consulta de usuário por email
        /// </summary>
        /// <returns>Retorna usuário correspondente ao email</returns>
        [HttpGet("/api/Usuario")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<ActionResult<object>> GetUsuario([FromQuery] string email)
        {
            var usuario = await _context.Usuario
                .Where(us => us.Email == email)
                .Select(us => new
                {
                    Cpf = us.Cpf,
                    Email = us.Email,
                    TipoUsuario = us.TipoUsuario,
                    DataNascimento = us.DataNascimento,
                    NomeSobrenome = us.NomeSobrenome,
                    Telefone = us.Telefone,                    
                    Escola = us.EscolaCnpjNavigation.Nome
                }).FirstOrDefaultAsync();

            if (usuario == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar usuário" });
            }

            return usuario;
        }

        /// <summary>
        /// Realiza a consulta de um usuário específico através do nome dele
        /// </summary>
        /// <returns>Retorna todos usuário filtrando por nome</returns>
        /// 
     
        [HttpGet("/api/Usuarios/{nomeSobrenome}")]
        [Authorize]
        public async Task<ActionResult<object>> GetUsuarioNome(string nomeSobrenome)
        {

            nomeSobrenome=nomeSobrenome.ToUpper();
            List <Usuario> usuario =  _context.Usuario.Where(usr => usr.NomeSobrenome.ToUpper().Contains(nomeSobrenome.ToUpper())).Select(us => new Usuario
            {
                Cpf = us.Cpf,
                Email = us.Email,
                TipoUsuario = us.TipoUsuario,
                DataNascimento = us.DataNascimento,
                NomeSobrenome = us.NomeSobrenome,
                Telefone = us.Telefone,
                EscolaCnpj = us.EscolaCnpj
            }).ToList();

            if (usuario == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar usuário" });
            }

            return usuario;
        }

        /// <summary>
        /// Retorna todos os usuários
        /// </summary>
        /// <returns>Todos os usuários</returns>

        [HttpPut("/api/Usuarios")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<IActionResult> PutUsuario([FromQuery]string email, UsuarioViewModel usuarioViewModel)
        {           
            
            Usuario usuario = _mapper.Map<Usuario>(usuarioViewModel);

            _context.Entry(usuario).State = EntityState.Modified;
            _context.Entry(usuario).Property(x => x.Senha).IsModified = false;
            _context.Entry(usuario).Property(x => x.EscolaCnpj).IsModified = false;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioExists(email))
                {
                    return NotFound(new {msg = "Não foi possível encontrar usuário" });
                }
                else
                {
                   throw;                 
                }
            }
            catch(DbUpdateException ex)
            {
                if (UsuarioExists(usuario.Cpf, usuario.Email))
                {
                    return Conflict(new { msg = "O Cpf ou Email informado já existe" });
                }
                else
                {
                    throw;
                }

            }

            return StatusCode(200,new {msg = $"Usuário {usuario.NomeSobrenome} alterado com sucesso" });
        }

        [HttpGet]
        [Authorize]
        [Route("api/Alunos")]
        public async Task<ActionResult<List<Usuario>>> getAlunos(){
            return await _context.Usuario
            .Where(usr => usr.TipoUsuario== "Aluno")
            .Select(usr => new Usuario{
                Cpf = usr.Cpf,
                NomeSobrenome = usr.NomeSobrenome,
                TipoUsuario = usr.TipoUsuario
            })
            .ToListAsync();
        } 

        [HttpGet]
        [Authorize]
        [Route("api/Professores")]
        public async Task<ActionResult<List<Usuario>>> getProfessores(){
            return await _context.Usuario.Where(usr => usr.TipoUsuario== "Professor").Select(usr => new Usuario{
                Cpf = usr.Cpf,
                NomeSobrenome = usr.NomeSobrenome,
                TipoUsuario = usr.TipoUsuario
            }).ToListAsync();
        } 
        /// <summary>
        /// Realiza o cadastro de usuário
        /// </summary>
        /// <returns>Usuário cadastrado</returns>
        /// <returns>Conflito caso cpf já exista</returns>
        
        [HttpPost]
        [AllowAnonymous]
        [Route("signup")]
        public async Task<dynamic> PostUsuario([FromBody] UsuarioViewModel usuarioViewModel)
        {
            usuarioViewModel.Cpf = usuarioViewModel.Cpf.Replace("-", "").Replace(".","");
            Usuario usuario = _mapper.Map<Usuario>(usuarioViewModel);
            _context.Usuario.Add(usuario);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (UsuarioExists(usuario.Cpf,usuario.Email))
                {
                    return Conflict(new {msg= "O Cpf ou Email informado já existe" });
                }
                else
                {
                    throw;
                }
            }
            return GetUserLogged(usuario);
        }

        private object GetUserLogged(Usuario usuario)
        {
            string token = TokenService.GenerateToken(usuario);
            usuario.Senha = "";
            return new
            {
                Usuario = usuario,
                token = token
            };
        }

        /// <summary>
        /// Realiza o login do usuário na aplicação
        /// </summary>
        /// <param name="model"></param>
        /// <returns>Retorna um JSON com informações do usuário mais o token</returns>

        [HttpPost]
        [AllowAnonymous]
        [Route("signin")]
        public async Task<dynamic> Login([FromBody]UsuarioLoginViewModel model)
        {
            Usuario usuario = await _context.Usuario.Where(usr => usr.Email == model.Email && usr.Senha == model.Senha).FirstOrDefaultAsync();
            //User user = UserRepository.Get(model.Username, model.Password);
            if (usuario == null)
            {
                return NotFound(new { message = "Usuário ou senha inválidas" });
            }
            return GetUserLogged(usuario);
        }

        /// <summary>
        /// Realiza a deleção do usuário através de seu email
        /// </summary>
        /// <returns>Usuário deletado</returns>
        /// <returns>Not found caso usuário do cpf não seja encontrado</returns>

        [HttpDelete("/api/Usuarios")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<ActionResult<Usuario>> DeleteUsuario(string email)
        {
            var usuario = await _context.Usuario.Where(usr => usr.Email == email).FirstOrDefaultAsync();
            if (usuario == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar usuário" });
            }

            _context.Usuario.Remove(usuario);
            await _context.SaveChangesAsync();

            return usuario;
        }

        private bool UsuarioExists(string id,string email)
        {
            return _context.Usuario.Any(e => e.Cpf == id || e.Email == email);
        }
        private bool UsuarioExists(string email)
        {
            return _context.Usuario.Any(e => e.Email == email);
        }


        /// <summary>
        /// Altera Senha informando o CPF do usuario
        /// </summary>
        [HttpPut("/api/Usuarios/Senha")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<IActionResult> PutSenha(Usuario usuario)
        {

            Usuario user = _context.Usuario.Where(usr => usr.Email == usuario.Email).FirstOrDefault();

            if (usuario.Senha == user.Senha)
            {
                return BadRequest(new { msg = "Sua senha não pode ser idêntica a senha anterior" });
            }
            try
            {
                user.Senha = usuario.Senha;
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioExists(usuario.Email))
                {
                    return NotFound(new { msg = "Não foi possível encontrar usuário" });
                }
            }

            return StatusCode(200, new { msg = $"Senha alterada com sucesso" });
        }
    }
}
