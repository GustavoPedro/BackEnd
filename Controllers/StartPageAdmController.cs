using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackEnd.Models;
using BackEnd.ViewModel.Adm;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StartPageAdmController : ControllerBase
    {

        private readonly DatabaseContext _context;

        public StartPageAdmController(DatabaseContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize(Roles ="Adm")]
        public async Task<StartPageAdmViewModel> getStartPage()
        {
            StartPageAdmViewModel startPageAdmViewModel = new StartPageAdmViewModel();
            startPageAdmViewModel.QtdEntidades = new List<QtdEntidadesViewModel>();            
            int qtdAlunos = await _context.Usuario.Where(usr => usr.TipoUsuario == TipoUsuarioEnum.Aluno).CountAsync();
            int qtdProfessores = await _context.Usuario.Where(usr => usr.TipoUsuario == TipoUsuarioEnum.Professor).CountAsync();
            int qtdDisciplinas = await _context.Disciplina.CountAsync();
            int qtdAtividades = await _context.Atividade.CountAsync();
            startPageAdmViewModel.QtdEntidades.Add(new QtdEntidadesViewModel { Entidade = "Alunos", Quantidade = qtdAlunos });
            startPageAdmViewModel.QtdEntidades.Add(new QtdEntidadesViewModel { Entidade = "Professores", Quantidade = qtdProfessores });
            startPageAdmViewModel.QtdEntidades.Add(new QtdEntidadesViewModel { Entidade = "Disciplinas", Quantidade = qtdDisciplinas });
            startPageAdmViewModel.QtdEntidades.Add(new QtdEntidadesViewModel { Entidade = "Atividades", Quantidade = qtdAtividades });

            return startPageAdmViewModel;
        }
    }
}