using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using Microsoft.AspNetCore.Authorization;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AtividadeUsuariosController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public AtividadeUsuariosController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/AtividadeUsuarios
        [HttpGet("/api/AtividadeUsuario")]
        public async Task<ActionResult<IEnumerable<AtividadeUsuario>>> GetAtividadeUsuario()
        {
            return await _context.AtividadeUsuario.ToListAsync();
        }

        [HttpGet("/api/AtividadeUsuarioEDisciplinas/{email}")]
        public async Task<AtividadeUsuarioEDisciplinaViewModel> GetAtividadeUsuarioEDisciplina(string email)
        {
            List<AtividadeUsuario> atividadesUsuario = await _context.AtividadeUsuario
            .Include(ativ => ativ.IdAtividadeNavigation)
            .Where(ativ => ativ.IdUsuarioDisciplinaNavigation.UsuarioCpfNavigation.Email == email)
            .ToListAsync();
            List<Disciplina> disciplinas = await _context
            .Disciplina
            .Where(disc => disc.UsuarioDisciplina.Select(usrdisc => usrdisc.UsuarioCpfNavigation.Email).Contains(email))
            .ToListAsync();
            AtividadeUsuarioEDisciplinaViewModel ativ = new AtividadeUsuarioEDisciplinaViewModel();
            ativ.AtividadesUsuario = atividadesUsuario;
            ativ.Disciplinas = disciplinas;
            return ativ;
        }

        // GET: api/AtividadeUsuarios/5
        [HttpGet("/api/AtividadeUsuario/{id}")]
        [Authorize]
        public async Task<ActionResult<AtividadeUsuario>> GetAtividadeUsuario(int id)
        {

            var resultado = from AtividadeUsuario in _context.AtividadeUsuario
                            join UsuarioDisciplina in _context.UsuarioDisciplina on AtividadeUsuario.IdUsuarioDisciplina equals UsuarioDisciplina.IdUsuarioDisciplina
                            where AtividadeUsuario.IdAtividade == id
                            select new
                            {
                                IdAtividadeUsuario = AtividadeUsuario.IdAtividadeUsuario,
                                IdAtividade = AtividadeUsuario.IdAtividade,
                                Nome = UsuarioDisciplina.UsuarioCpfNavigation.NomeSobrenome,
                                Cpf = UsuarioDisciplina.UsuarioCpfNavigation.Cpf,
                                Status = AtividadeUsuario.Status,
                                Total = AtividadeUsuario.Total,                                
                                IdUsuarioDisciplina = AtividadeUsuario.IdUsuarioDisciplina
                            };

            return Ok(resultado);
        }

        // PUT: api/AtividadeUsuarios/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAtividadeUsuario(int id, AtividadeUsuario AtividadeUsuario)
        {
            if (id != AtividadeUsuario.IdAtividadeUsuario)
            {
                return BadRequest();
            }

            _context.Entry(AtividadeUsuario).State = EntityState.Modified;
            _context.Entry(AtividadeUsuario).Property(x => x.IdAtividade).IsModified = false;
            _context.Entry(AtividadeUsuario).Property(x => x.IdUsuarioDisciplina).IsModified = false;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AtividadeUsuarioExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(200, new { msg = $"A atividade {AtividadeUsuario.IdAtividadeUsuario} alterada com sucesso para os usuários" });
        }

        // POST: api/AtividadeUsuarios
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<AtividadeUsuario>> PostAtividadeUsuario(AtividadeUsuario AtividadeUsuario)
        {
            _context.AtividadeUsuario.Add(AtividadeUsuario);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAtividadeUsuario", new { id = AtividadeUsuario.IdAtividadeUsuario }, AtividadeUsuario);
        }

        // DELETE: api/AtividadeUsuarios/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<AtividadeUsuario>> DeleteAtividadeUsuario(int id)
        {
            var AtividadeUsuario = await _context.AtividadeUsuario.FindAsync(id);
            if (AtividadeUsuario == null)
            {
                return NotFound();
            }

            _context.AtividadeUsuario.Remove(AtividadeUsuario);
            await _context.SaveChangesAsync();

            return AtividadeUsuario;
        }

        private bool AtividadeUsuarioExists(int id)
        {
            return _context.AtividadeUsuario.Any(e => e.IdAtividadeUsuario == id);
        }
    }
}
