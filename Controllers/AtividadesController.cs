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
    public class AtividadesController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public AtividadesController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/Atividades
        [HttpGet("/api/Atividades")]
        public async Task<ActionResult<IEnumerable<Atividade>>> GetAtividade()
        {
            return await _context.Atividade.ToListAsync();
        }

        // GET: api/Atividades/5
        [HttpGet("/api/Atividades/{id}")]
        public async Task<ActionResult<Atividade>> GetAtividade(int id)
        {
            var atividade = await _context.Atividade.FindAsync(id);

            if (atividade == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar a atividade" });
            }

            return atividade;
        }

        // PUT: api/Atividades/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("/api/Atividades/{id}")]
        [Authorize(Roles = "Professor, Adm")]
        public async Task<IActionResult> PutAtividade(int id, Atividade atividade)
        {
            if (id != atividade.IdAtividade)
            {
                return BadRequest(new { msg = "Não foi possivel encontrar a atividade informada" });
            }

            _context.Entry(atividade).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AtividadeExists(id))
                {
                    return NotFound(new { msg = "Não foi possível encontrar a atividade" });
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(200, new { msg = $"Atividade {atividade.Atividade1} alterada com sucesso" });
        }

        // POST: api/Atividades
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost("/api/Atividades")]
        [Route("/api/Atividades")]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<ActionResult<Atividade>> PostAtividade(Atividade atividade)
        {
            _context.Atividade.Add(atividade);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AtividadeExists(atividade.IdAtividade))
                {
                    return Conflict(new { msg = "Esta atividade já está cadastrada no sistema!" });
                }

                else
                {
                    throw;
                }
            }
            return CreatedAtAction("GetAtividade", new { id = atividade.IdAtividade }, atividade);
        }

        // DELETE: api/Atividades/5
        [HttpDelete("/api/Atividades/{id}")]
        public async Task<ActionResult<Atividade>> DeleteAtividade(int id)
        {
            var atividade = await _context.Atividade.FindAsync(id);
            if (atividade == null)
            {
                return NotFound(new { msg = " Não foi possivel encontrar esta atividade" });
            }

            _context.Atividade.Remove(atividade);
            await _context.SaveChangesAsync();

            return atividade;
        }

        private bool AtividadeExists(int id)
        {
            return _context.Atividade.Any(e => e.IdAtividade == id);
        }
    }
}
