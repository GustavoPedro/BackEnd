using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using BackEnd.Filters;
using Microsoft.AspNetCore.Authorization;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DisciplinasController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public DisciplinasController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/Disciplinas
        [HttpGet("/api/Disciplina")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<ActionResult<IEnumerable<Disciplina>>> GetDisciplina()
        {
            return await _context.Disciplina.ToListAsync();
        }

        // GET: api/Disciplinas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Disciplina>> GetDisciplina(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);

            if (disciplina == null)
            {   
                return NotFound();
            }

            return disciplina;
        }

        // PUT: api/Disciplinas/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        [Authorize(Roles = "Professor,Adm")]
        [TokenEmailFilter]
        public async Task<IActionResult> PutDisciplina(int id, Disciplina disciplina)
        {
            if (id != disciplina.IdDisciplina)
            {
                return BadRequest();
            }

            _context.Entry(disciplina).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DisciplinaExists(id))
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

        // POST: api/Disciplinas
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        [Authorize(Roles = "Professor,Adm")]
        [TokenEmailFilter]
        public async Task<ActionResult<Disciplina>> PostDisciplina(Disciplina disciplina)
        {
            _context.Disciplina.Add(disciplina);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDisciplina", new { id = disciplina.IdDisciplina }, disciplina);
        }

        // DELETE: api/Disciplinas/5
        [HttpDelete("{id}")]
        [Authorize(Roles = "Professor,Adm")]
        [TokenEmailFilter]
        public async Task<ActionResult<Disciplina>> DeleteDisciplina(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);
            if (disciplina == null)
            {
                return NotFound();
            }

            _context.Disciplina.Remove(disciplina);
            await _context.SaveChangesAsync();

            return disciplina;
        }

        private bool DisciplinaExists(int id)
        {
            return _context.Disciplina.Any(e => e.IdDisciplina == id);
        }
    }
}
