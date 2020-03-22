using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using Microsoft.AspNetCore.Authorization;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EscolasController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public EscolasController(DatabaseContext context)
        {
            _context = context;
        }      

        // GET: api/Escolas/5
        /// <summary>
        /// Realiza a consulta de uma escola específica pelo seu CNPJ
        /// </summary>

        [HttpGet]
        [Route("{cnpj}")]
        public async Task<ActionResult<Escola>> GetEscola(string cnpj)
        {
            var escola = await _context.Escola.Where(us => us.Cnpj == cnpj).
                Select(us => new Escola
                {
                    Cnpj = us.Cnpj,
                    Nome = us.Nome,
                    Telefone = us.Telefone
                }).FirstOrDefaultAsync();

            if (escola == null)
            {
                return NotFound(new {msg = "Escola não encontrada"});
            }

            return escola;
        }

        // PUT: api/Escolas/5
        /// <summary>
        /// Realiza a atualização de uma escola específica. Necessário informar o CNPJ como parâmetro na URL
        /// </summary>
        
        [HttpPut("{cnpj}")]
        [Authorize(Roles = "Adm")]
        public async Task<IActionResult> PutEscola(string cnpj, Escola escola)
        {
            if (cnpj != escola.Cnpj)
            {
                return BadRequest();
            }

            _context.Entry(escola).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EscolaExists(cnpj))
                {
                    return NotFound(new {msg = "Não foi possível encontrar escola com o Cnpj informado" });
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Escolas
        /// <summary>
        /// Realiza o cadastro de uma escola
        /// </summary>
        
        [HttpPost]
        [Authorize(Roles = "Adm")]
        public async Task<ActionResult<Escola>> PostEscola(Escola escola)
        {
            _context.Escola.Add(escola);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (EscolaExists(escola.Cnpj))
                {
                    return Conflict(new { msg = "O Cnpj informado já existe" });
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetEscola", new { id = escola.Cnpj }, escola);
        }

        // DELETE: api/Escolas/5
        /// <summary>
        /// Realiza a deleção de uma escola pelo seu CNPJ
        /// </summary>

        [HttpDelete("{cnpj}")]
        [Authorize(Roles = "Adm")]
        public async Task<ActionResult<Escola>> DeleteEscola(string cnpj)
        {
            var escola = await _context.Escola.FindAsync(cnpj);
            if (escola == null)
            {
                return NotFound();
            }

            _context.Escola.Remove(escola);
            await _context.SaveChangesAsync();

            return escola;
        }

        private bool EscolaExists(string cnpj)
        {
            return _context.Escola.Any(e => e.Cnpj == cnpj);
        }
    }
}
