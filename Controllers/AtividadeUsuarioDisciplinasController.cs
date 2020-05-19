using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using Microsoft.AspNetCore.Authorization;
using System.Security.Cryptography.X509Certificates;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.ComponentModel;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AtividadeUsuarioDisciplinasController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public AtividadeUsuarioDisciplinasController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/AtividadeUsuarioDisciplinas
        [HttpGet("/api/AtividadeUsuarioDisciplina")]
        public async Task<ActionResult<IEnumerable<AtividadeUsuarioDisciplina>>> GetAtividadeUsuarioDisciplina()
        {
            return await _context.AtividadeUsuarioDisciplina.ToListAsync();
        }

        // GET: api/AtividadeUsuarioDisciplinas/5
        [HttpGet("/api/AtividadeUsuarioDisciplina/{id}")]
        [Authorize]
        public async Task<ActionResult<AtividadeUsuarioDisciplina>> GetAtividadeUsuarioDisciplina( int id)
        {

            var resultado = from AtividadeUsuarioDisciplina in _context.AtividadeUsuarioDisciplina
                            join UsuarioDisciplina in _context.UsuarioDisciplina on AtividadeUsuarioDisciplina.UsuarioDisciplinaIdUsuarioDisciplina equals UsuarioDisciplina.IdUsuarioDisciplina
                            where AtividadeUsuarioDisciplina.AtividadeIdAtividade == id
                            select new
                            {
                                Nome = UsuarioDisciplina.UsuarioCpfNavigation.NomeSobrenome,
                                Cpf = UsuarioDisciplina.UsuarioCpfNavigation.Cpf,
                                Status = AtividadeUsuarioDisciplina.Status,
                                Total = AtividadeUsuarioDisciplina.Total
                            };
           
            return Ok(resultado);
        }

        // PUT: api/AtividadeUsuarioDisciplinas/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAtividadeUsuarioDisciplina(int id, AtividadeUsuarioDisciplina atividadeUsuarioDisciplina)
        {
            if (id != atividadeUsuarioDisciplina.IdAtividadeDisciplina)
            {
                return BadRequest();
            }

            _context.Entry(atividadeUsuarioDisciplina).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AtividadeUsuarioDisciplinaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/AtividadeUsuarioDisciplinas
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<AtividadeUsuarioDisciplina>> PostAtividadeUsuarioDisciplina(AtividadeUsuarioDisciplina atividadeUsuarioDisciplina)
        {
            _context.AtividadeUsuarioDisciplina.Add(atividadeUsuarioDisciplina);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAtividadeUsuarioDisciplina", new { id = atividadeUsuarioDisciplina.IdAtividadeDisciplina }, atividadeUsuarioDisciplina);
        }

        // DELETE: api/AtividadeUsuarioDisciplinas/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<AtividadeUsuarioDisciplina>> DeleteAtividadeUsuarioDisciplina(int id)
        {
            var atividadeUsuarioDisciplina = await _context.AtividadeUsuarioDisciplina.FindAsync(id);
            if (atividadeUsuarioDisciplina == null)
            {
                return NotFound();
            }

            _context.AtividadeUsuarioDisciplina.Remove(atividadeUsuarioDisciplina);
            await _context.SaveChangesAsync();

            return atividadeUsuarioDisciplina;
        }

        private bool AtividadeUsuarioDisciplinaExists(int id)
        {
            return _context.AtividadeUsuarioDisciplina.Any(e => e.IdAtividadeDisciplina == id);
        }
    }
}
