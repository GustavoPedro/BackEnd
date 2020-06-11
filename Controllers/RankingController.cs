using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackEnd.Filters;
using BackEnd.Models;
using BackEnd.ViewModel.Premiacao;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RankingController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public RankingController(DatabaseContext context)
        {
            _context = context;
        }

        [HttpGet("{IdDisciplina}")]
        [Authorize]
        [TokenEmailFilter]
        public async Task<RankingAtividadesViewModel> GetRanking([FromQuery] string email,int IdDisciplina)
        {
            var ranking = from usuarioDisciplina in _context.UsuarioDisciplina
                          join atividadeUsuario in _context.AtividadeUsuario
                              on usuarioDisciplina.IdUsuarioDisciplina equals atividadeUsuario.IdUsuarioDisciplina
                              into grouping
                          from atividadeUsuario in grouping.DefaultIfEmpty()
                          where usuarioDisciplina.DisciplinaIdDisciplina == IdDisciplina && usuarioDisciplina.UsuarioCpfNavigation.TipoUsuario == TipoUsuarioEnum.Aluno
                          group atividadeUsuario by new { atividadeUsuario.IdUsuarioDisciplina, usuarioDisciplina.UsuarioCpfNavigation.NomeSobrenome, usuarioDisciplina.UsuarioCpfNavigation.Email } into groupby
                          orderby groupby.Sum(gb => gb.Total) descending
                          select new RankingViewModel
                          {
                              IdUsuarioDisciplina = groupby.Key.IdUsuarioDisciplina,
                              Email = groupby.Key.Email,
                              Nome = groupby.Key.NomeSobrenome,
                              Total = groupby.Sum(gb => gb.Total)
                          };

            var atividades = await _context.AtividadeUsuario
            .Include(ativUser => ativUser.IdAtividadeNavigation)
            .Where(ativUser => ativUser.IdUsuarioDisciplinaNavigation.DisciplinaIdDisciplina == IdDisciplina && ativUser.IdUsuarioDisciplinaNavigation.UsuarioCpfNavigation.Email == email)
            .ToListAsync();

            List<PremiacaoViewModel> premiacoes = await _context.AtividadeUsuario
                .Where(ativ => ativ.Status == "Concluído" &&
                        ativ.IdAtividadeNavigation.IdDisciplina == IdDisciplina &&
                        ativ.IdAtividadeNavigation.DataEntrega.Month == DateTime.Now.Month &&
                        ativ.IdAtividadeNavigation.DataEntrega.Year == DateTime.Now.Year &&
                        ativ.IdAtividadeNavigation.Premiacao != null
                      )
                .Include(ativ => ativ.IdUsuarioDisciplinaNavigation)
                    .ThenInclude(ativ => ativ.UsuarioCpfNavigation)
                .Include(ativ => ativ.IdAtividadeNavigation)
                .Select(ativ => new PremiacaoViewModel
                {
                    IdAtividadeUsuario = ativ.IdAtividadeUsuario,
                    Aluno = ativ.IdUsuarioDisciplinaNavigation.UsuarioCpfNavigation.NomeSobrenome,
                    Premiacao = ativ.IdAtividadeNavigation.Premiacao
                })
                .ToListAsync().ConfigureAwait(true);

            return new RankingAtividadesViewModel
            {
                Ranking = ranking.ToList(),
                Atividades = atividades,
                Premiacoes = premiacoes
            };

        }
    }
}