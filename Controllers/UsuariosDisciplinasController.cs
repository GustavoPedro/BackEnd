using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;
using BackEnd.ViewModel;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosDisciplinasController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly IMapper _mapper;

        public UsuariosDisciplinasController(DatabaseContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        /// <summary>
        /// Realiza a consulta de todos os usuários e suas respectivas disciplinas
        /// </summary>
        /// <returns>Retorna usuários em suas disciplinas</returns>
        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<UsuarioDIsciplinaSearchViewModel>>> GetUsuariosDisciplinas()
        {
            
            return await _context.Usuario
                    .Select(usr => new UsuarioDIsciplinaSearchViewModel
                    {
                        Email = usr.Email,
                        Nome = usr.NomeSobrenome,
                        Disciplinas = _context.Disciplina.Where(disc => usr.UsuarioDisciplina.Select(usrdisc => usrdisc.DisciplinaIdDisciplina).Contains(disc.IdDisciplina)).ToList()
                    }                
                )
                .ToListAsync();
        }

        /// <summary>
        /// Realiza a consulta de de um usuário específico sua respectiva disciplina
        /// <returns>Retorna usuário em sua respectiva disciplina</returns>
        /// </summary>
        [HttpGet("{IdUsuarioDisciplina}")]
        [Authorize]
        public async Task<ActionResult<object>> GetUsuarioDisciplina(int IdUsuarioDisciplina)
        {
            var usuarioDisciplina = await _context.Usuario
                .Where(usr => usr.UsuarioDisciplina.Select(usrdisc => usrdisc.IdUsuarioDisciplina).Contains(IdUsuarioDisciplina))
                .Select(usr => new UsuarioDIsciplinaSearchViewModel
                {
                    Email = usr.Email,
                    Nome = usr.NomeSobrenome,
                    Disciplinas = _context.Disciplina.Where(disc => usr.UsuarioDisciplina.Select(usrdisc => usrdisc.DisciplinaIdDisciplina).Contains(disc.IdDisciplina)).ToList()
                }
                )
                .FirstOrDefaultAsync();

            if (usuarioDisciplina == null)
            {
                return NotFound(new { msg = "Usuário não encontrado na disciplina" });
            }

            return usuarioDisciplina;
        }

        // PUT: api/UsuariosDisciplinas/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{IdUsuarioDisciplina}")]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<IActionResult> PutUsuarioDisciplina([FromQuery] int IdUsuarioDisciplina, [FromBody] int IdDisciplina)
        {
            UsuarioDisciplina usuarioDisciplina = await _context.UsuarioDisciplina.FindAsync(IdUsuarioDisciplina);
            usuarioDisciplina.DisciplinaIdDisciplina = IdDisciplina;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioDisciplinaExists(IdUsuarioDisciplina))
                {
                    return NotFound(new { msg = "Usuário não encontrado na disciplina" });
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(200, new { msg = $"Usuário {usuarioDisciplina.UsuarioCpfNavigation.NomeSobrenome} alterado de disciplina com sucesso" });
        }

        // POST: api/UsuariosDisciplinas
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<ActionResult<UsuarioDisciplina>> PostUsuarioDisciplina(UsuarioDisciplinaCreateAndUpdateViewModel usuarioDisciplinaViewModel)
        {
            UsuarioDisciplina usuarioDisciplina = _mapper.Map<UsuarioDisciplina>(usuarioDisciplinaViewModel);
            _context.UsuarioDisciplina.Add(usuarioDisciplina);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUsuarioDisciplina", new { id = usuarioDisciplina.IdUsuarioDisciplina }, usuarioDisciplina);
        }

        // DELETE: api/UsuariosDisciplinas/5
        [HttpDelete("{IdUsuarioDisciplina}")]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<ActionResult<UsuarioDisciplina>> DeleteUsuarioDisciplina(int IdUsuarioDisciplina)
        {
            var usuarioDisciplina = await _context.UsuarioDisciplina.FindAsync(IdUsuarioDisciplina);
            if (usuarioDisciplina == null)
            {
                return NotFound(new { msg = "Usuário não encontrado na disciplina" });
            }

            _context.UsuarioDisciplina.Remove(usuarioDisciplina);
            await _context.SaveChangesAsync();

            return usuarioDisciplina;
        }

        private bool UsuarioDisciplinaExists(int id)
        {
            return _context.UsuarioDisciplina.Any(e => e.IdUsuarioDisciplina == id);
        }
    }
}
