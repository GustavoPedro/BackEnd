using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Serialization;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;
using Pomelo.EntityFrameworkCore.MySql.Storage;
using BackEnd.Models;
using Microsoft.OpenApi.Models;
using Microsoft.Extensions.PlatformAbstractions;
using System.IO;
using BackEnd.ViewModel;
using AutoMapper;
using BackEnd.Filters;
using BackEnd.ViewModel.Atividade;
using BackEnd.ViewModel.Escola;
using BackEnd.ViewModel.Disciplinas;
using BackEnd.ViewModel.AtividadeUsuarioDisciplina;

namespace BackEnd
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors();
            services.AddScoped<TokenEmailFilter>();
            services.AddControllers().AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            });

            services.AddDbContextPool<DatabaseContext>(options => options
                // replace with your connection string
                .UseMySql(Configuration.GetConnectionString("MySql"), mySqlOptions => mySqlOptions
                    .ServerVersion(new ServerVersion(new Version(8, 0, 18), ServerType.MySql))
            ));

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Api PI", Version = "v1", Description = "Aplica��o de gest�o comportamental dos alunos", Contact = new OpenApiContact { Email = "https://github.com/GustavoPedro/BackEnd", Name = "Gustavo, Fabricio e Fernando" } });
                string caminhoAplicacao =
                 PlatformServices.Default.Application.ApplicationBasePath;
                string nomeAplicacao =
                    PlatformServices.Default.Application.ApplicationName;
                string caminhoXmlDoc =
                    Path.Combine(caminhoAplicacao, $"{nomeAplicacao}.xml");

                c.IncludeXmlComments(caminhoXmlDoc);
            });

            var key = Encoding.ASCII.GetBytes(Settings.Secret);
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

            var config = new AutoMapper.MapperConfiguration(cfg =>
            {
                cfg.CreateMap<UsuarioViewModel, Usuario>();
                cfg.CreateMap<UsuarioDisciplinaCreateAndUpdateViewModel, UsuarioDisciplina>();
                cfg.CreateMap<DisciplinaViewModel, Disciplina>();
                cfg.CreateMap<AtividadeViewModel, Atividade>();
                cfg.CreateMap<EscolaViewModel, Escola>();
                cfg.CreateMap<AtividadeUsuarioViewModel, AtividadeUsuario>();
            });

            IMapper mapper = config.CreateMapper();

            services.AddSingleton(mapper);



        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Api PI V1");
            });

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseCors(x => x
              .AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader());

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
