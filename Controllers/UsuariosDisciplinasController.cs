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
        public async Task<ActionResult<IEnumerable<UsuarioDisciplinaSearchViewModel>>> GetUsuariosDisciplinas()
        {
            
            return await _context.Usuario
                    .Select(usr => new UsuarioDisciplinaSearchViewModel
                    {
                        Email = usr.Email,
                        Nome = usr.NomeSobrenome,
                        Disciplinas = _context.Disciplina.Where(disc => usr.UsuarioDisciplina.Select(usrdisc => usrdisc.DisciplinaIdDisciplina).Contains(disc.IdDisciplina)).ToList()
                    }                
                )
                .ToListAsync();
        }

        /// <summary>
        /// Realiza a consulta de de um usuário específico e as disciplinas que ele pertence filtrando por email
        /// <returns>Retorna usuário em suas disciplinas</returns>
        /// </summary>
        [HttpGet("{email}")]
        [Authorize]
        public async Task<ActionResult<object>> GetUsuarioDisciplina(string email)
        {
            // Busca todas as disciplinas em que o usuário está
            var usuarioDisciplina = await _context.Usuario
                .Where(usr => usr.Email == email)
                .Select(usr => new UsuarioDisciplinaSearchViewModel
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

        /// <summary>
        /// Atualiza usuário em disciplina a partir do usuario na disciplina informado e do id da disciplina que se deseja trocar        
        /// </summary>
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
                if (!UsuarioDisciplinaExists(usuarioDisciplina.UsuarioCpf,IdDisciplina))
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

        /// <summary>
        /// Cadastra usuário em uma disciplina
        /// </summary>
        [HttpPost]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<ActionResult<UsuarioDisciplina>> PostUsuarioDisciplina(UsuarioDisciplinaCreateAndUpdateViewModel usuarioDisciplinaViewModel)
        {
            try
            {

                UsuarioDisciplina usuarioDisciplina = _mapper.Map<UsuarioDisciplina>(usuarioDisciplinaViewModel);
                _context.UsuarioDisciplina.Add(usuarioDisciplina);

                await _context.SaveChangesAsync();

                usuarioDisciplina.UsuarioCpfNavigation = await _context.Usuario.Where(usr => usr.Cpf == usuarioDisciplina.UsuarioCpf).FirstOrDefaultAsync();


                return CreatedAtAction("GetUsuarioDisciplina", new { email = usuarioDisciplina.UsuarioCpfNavigation.Email }, usuarioDisciplina);
            }
            catch (DbUpdateException)
            {
                if (UsuarioDisciplinaExists(usuarioDisciplinaViewModel.UsuarioCpf,usuarioDisciplinaViewModel.DisciplinaIdDisciplina))
                {
                    return Conflict(new { msg = "O usuário informado já existe na disciplina" });
                }
                else if (!CpfOrDisciplinaNotExists(usuarioDisciplinaViewModel.UsuarioCpf, usuarioDisciplinaViewModel.DisciplinaIdDisciplina))
                {
                    return BadRequest(new { msg = "O usuário ou disciplina informada não existe" });
                }
                else
                {
                    throw;
                }
            }

        }

        /// <summary>
        /// Deleta usuário de uma disciplina
        /// </summary>
        [HttpDelete()]
        [Authorize(Roles = "Professor,Adm")]
        public async Task<ActionResult<UsuarioDisciplina>> DeleteUsuarioDisciplina(string cpf,int id)
        {
            var usuarioDisciplina = await _context.UsuarioDisciplina.Where(usr => usr.UsuarioCpf == cpf && usr.DisciplinaIdDisciplina == id).FirstOrDefaultAsync();
            if (usuarioDisciplina == null)
            {
                return NotFound(new { msg = "Usuário não encontrado na disciplina" });
            }

            _context.UsuarioDisciplina.Remove(usuarioDisciplina);
            await _context.SaveChangesAsync();

            return usuarioDisciplina;
        }

        private bool UsuarioDisciplinaExists(string cpf,int idDisciplina)
        {
            return _context.UsuarioDisciplina.Any(e => e.UsuarioCpf == cpf && e.DisciplinaIdDisciplina == idDisciplina);
        }

        private bool CpfOrDisciplinaNotExists(string cpf, int idDisciplina)
        {
            bool exists = true;
            if (!_context.Usuario.Any(usrdisc => usrdisc.Cpf == cpf)) 
            {
                exists = false;
            }
            if (!_context.Disciplina.Any(usrdisc => usrdisc.IdDisciplina == idDisciplina))
            {
                exists = false;
            }
            return exists;
        }
    }
}
