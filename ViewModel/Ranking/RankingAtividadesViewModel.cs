using System.Collections.Generic;
using BackEnd.Models;
using BackEnd.ViewModel.Premiacao;

public class RankingAtividadesViewModel
{
  public List<RankingViewModel> Ranking { get; set; }

  public List<AtividadeUsuario> Atividades { get; set; }

    public List<PremiacaoViewModel> Premiacoes { get; set; }

}