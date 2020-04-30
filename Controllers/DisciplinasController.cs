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
using AutoMapper;
using BackEnd.ViewModel.Disciplinas;
using BackEnd.ViewModel;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DisciplinasController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly IMapper _mapper;

        public DisciplinasController(DatabaseContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // GET: api/Disciplinas
        [HttpGet("/api/Disciplina")]
        [Authorize]        
        public async Task<ActionResult<IEnumerable<Disciplina>>> GetDisciplina()
        {
            var result = from Disciplina in _context.Disciplina
                         select new
                         {
                             id = Disciplina.IdDisciplina,
                             descricao = Disciplina.Descricao,
                             mateira = Disciplina.Materia,
                             turno = Disciplina.Turno,
                             professorResponsavel = Disciplina.UsuarioDisciplina.Where(usrdisc => usrdisc.UsuarioCpfNavigation.TipoUsuario == "Professor")
                             .Select(usr => new {
                                 NomeSobrenome = usr.UsuarioCpfNavigation.NomeSobrenome,
                                 Cpf = usr.UsuarioCpfNavigation.Cpf
                             }).FirstOrDefault(),
                             UsuarioDisciplina = _context.UsuarioDisciplina
                                                 .Where(usr => usr.DisciplinaIdDisciplina == Disciplina.IdDisciplina && usr.UsuarioCpfNavigation.TipoUsuario == "Aluno")
                                                 .Include(usrdisc => usrdisc.UsuarioCpfNavigation)
                                                 .Select(usrdisc => new { NomeSobrenome = usrdisc.UsuarioCpfNavigation.NomeSobrenome, Cpf = usrdisc.UsuarioCpf, TipoUsuario = usrdisc.UsuarioCpfNavigation.TipoUsuario })
                                                 .ToList()                           
                         };
            return Ok(result);
        }

        // GET: api/Disciplinas/5
        [HttpGet("/api/Disciplina/{id}")]
        public async Task<ActionResult<Disciplina>> GetDisciplina(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);

            if (disciplina == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar a disciplina" });
            }

            return disciplina;
        }

        // PUT: api/Disciplinas/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("/api/Disciplina/{id}")]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<IActionResult> PutDisciplina(int id, Disciplina disciplina)
        {
            if (id != disciplina.IdDisciplina)
            {
                return BadRequest(new { msg = "Não foi possivel encontrar a disciplina informada" });
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
                    return NotFound(new { msg = "Não foi possível encontrar a disciplina" });
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(200, new { msg = $"Disciplina {disciplina.Materia} alterada com sucesso" });
        }

        /// <summary>
        /// Realiza o cadastro de uma disciplina
        /// </summary>
        /// <returns>Disciplina cadastrada</returns>
        /// <returns>Conflito caso IdDisciplina já exista</returns>

        [HttpPost]
        [Route("/api/Disciplina")]
        [Authorize(Roles = "Professor,Adm")]
        [TokenEmailFilter]
        public async Task<dynamic> PostDisciplina([FromBody] DisciplinaViewModel model)
        {
            Disciplina disciplina = _mapper.Map<Disciplina>(model);
            _context.Disciplina.Add(disciplina);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DisciplinaExists(disciplina.IdDisciplina))
                {
                    return Conflict(new { message = "Esta disciplina já existe" });
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDisciplina", new { id = disciplina.IdDisciplina }, disciplina);
        }


        // POST: api/Disciplina/InserirAluno
        [HttpPost]
        [Route("/api/Disciplina/InserirAluno")]
        [Authorize(Roles = "Professor,Adm")]
        [TokenEmailFilter]
        public async Task<dynamic> PostInserirAluno([FromBody] UsuarioDisciplinaCreateAndUpdateViewModel model)
        {
            UsuarioDisciplina usuarioDisciplina = _mapper.Map<UsuarioDisciplina>(model);
            _context.UsuarioDisciplina.Add(usuarioDisciplina);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (!DisciplinaExists(usuarioDisciplina.DisciplinaIdDisciplina))
                {
                    return NotFound(new { msg = "Não foi possível encontrar a disciplina" });
                }
                else
                {
                    throw;
                }
            }

            CreatedAtAction("GetDisciplina", new { id = usuarioDisciplina.IdUsuarioDisciplina }, usuarioDisciplina);
            return StatusCode(200, new { msg = $"Cpf {usuarioDisciplina.UsuarioCpf} cadastrado com sucesso" });
        }

        // DELETE: api/Disciplinas/5
        [HttpDelete("/api/Disciplina/{id}")]
        [Authorize(Roles = "Professor,Adm")]       
        public async Task<ActionResult<Disciplina>> DeleteDisciplina(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);
            if (disciplina == null)
            {
                return NotFound(new { msg = "Não foi possível encontrar a disciplina" });
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
