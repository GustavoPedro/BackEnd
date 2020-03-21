using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
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

        [HttpGet]        
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
        [HttpGet]
        [Route("byid")]
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
                return NotFound();
            }

            return usuario;
        }

        /// <summary>
        /// Realiza a atualização de um usuário específico. Requisição necessita do cpf como parâmetro na url
        /// </summary>
        /// <returns>Status 201 em caso de sucesso</returns>
        /// <returns>Not found em caso de não encontrar Cpf</returns>
        /// <returns>Conflict em caso de email ou Cpf não forem encontrados</returns>
        [HttpPut]
        public async Task<IActionResult> PutUsuario(string cpf, Usuario usuario)
        {
            if (cpf != usuario.Cpf)
            {
                return BadRequest();
            }

            _context.Entry(usuario).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioExists(cpf))
                {
                    return NotFound();
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

            return NoContent();
        }


        /// <summary>
        /// Realiza o cadastro de usuário
        /// </summary>
        /// <returns>Usuário cadastrado</returns>
        /// <returns>Conflito caso cpf já exista</returns>
        [HttpPost]
        public async Task<ActionResult<Usuario>> PostUsuario(Usuario usuario)
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
            usuario.Senha = "";
            return CreatedAtAction("GetUsuario", new { id = usuario.Cpf }, usuario);
        }

        /// <summary>
        /// Realiza a deleção do usuário através de seu cpf
        /// </summary>
        /// <returns>Usuário deletado</returns>
        /// <returns>Not found caso usuário do cpf não seja encontrado</returns>
        [HttpDelete]
        public async Task<ActionResult<Usuario>> DeleteUsuario(string cpf)
        {
            var usuario = await _context.Usuario.FindAsync(cpf);
            if (usuario == null)
            {
                return NotFound();
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
