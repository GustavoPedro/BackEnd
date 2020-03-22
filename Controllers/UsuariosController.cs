﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using Microsoft.AspNetCore.Authorization;
using BackEnd.Services;

namespace BackEnd.Controllers
{    
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public UsuariosController(DatabaseContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Realiza a consulta de todos os usuários
        /// </summary>
        /// <returns>Retorna todos os usuários</returns>

        [Authorize(Roles = "Professor,Adm")]
        [HttpGet]
        [Route("api/Usuarios")]         
        public async Task<ActionResult<IEnumerable<Usuario>>> GetUsuarios()
        {
            return await _context.Usuario.Select(us => new Usuario
            {
                Cpf = us.Cpf,
                Email = us.Email,
                TipoUsuario = us.TipoUsuario,
                DataNascimento = us.DataNascimento,
                NomeSobrenome = us.NomeSobrenome,
                Telefone = us.Telefone,
                EscolaCnpj = us.EscolaCnpj
            }).ToListAsync();
        }

        /// <summary>
        /// Realiza a consulta de um usuário específico através do cpf do mesmo
        /// </summary>
        /// <returns>Retorna todos os usuários</returns>
        /// 
        
        [HttpGet("/api/Usuarios/{cpf}")]
        [Authorize]
        public async Task<ActionResult<Usuario>> GetUsuario(string cpf)
        {
            var usuario = await _context.Usuario.Where(us => us.Cpf == cpf).
                Select(us => new Usuario 
                {
                    Cpf = us.Cpf, 
                    Email = us.Email,
                    TipoUsuario = us.TipoUsuario,
                    DataNascimento = us.DataNascimento,
                    NomeSobrenome = us.NomeSobrenome,
                    Telefone = us.Telefone,
                    EscolaCnpj = us.EscolaCnpj
                }).FirstOrDefaultAsync();

            if (usuario == null)
            {
                return NotFound(new {msg="Não foi possível encontrar usuário" });
            }

            return usuario;
        }

        /// <summary>
        /// Realiza a atualização de um usuário específico. Requisição necessita do cpf como parâmetro na url
        /// </summary>
        /// <returns>Status 201 em caso de sucesso</returns>
        /// <returns>Not found em caso de não encontrar Cpf</returns>
        /// <returns>Conflict em caso de email ou Cpf não forem encontrados</returns>
        
        [HttpPut("/api/Usuarios/{cpf}")]
        [Authorize]
        public async Task<IActionResult> PutUsuario(string cpf, Usuario usuario)
        {           

            if (cpf != usuario.Cpf)
            {
                return BadRequest();
            }

            _context.Entry(usuario).State = EntityState.Modified;
            _context.Entry(usuario).Property(x => x.Senha).IsModified = false;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioExists(cpf))
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


        /// <summary>
        /// Realiza o cadastro de usuário
        /// </summary>
        /// <returns>Usuário cadastrado</returns>
        /// <returns>Conflito caso cpf já exista</returns>
        
        [HttpPost]
        [AllowAnonymous]
        [Route("signup")]
        public async Task<dynamic> PostUsuario(Usuario usuario)
        {
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
                user = usuario,
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
        public async Task<dynamic> Login([FromBody]Usuario model)
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
        /// Realiza a deleção do usuário através de seu cpf
        /// </summary>
        /// <returns>Usuário deletado</returns>
        /// <returns>Not found caso usuário do cpf não seja encontrado</returns>

        [HttpDelete("/api/Usuarios/{cpf}")]
        [Authorize]
        public async Task<ActionResult<Usuario>> DeleteUsuario(string cpf)
        {
            var usuario = await _context.Usuario.FindAsync(cpf);
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
        private bool UsuarioExists(string id)
        {
            return _context.Usuario.Any(e => e.Cpf == id);
        }
    }
}