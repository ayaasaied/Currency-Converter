
using AutoMapper;
using CurrencyConvertorAdmin.Core;
using CurrencyConvertorAdmin.Infrastructure;
using CurrencyConvertorAdmin.Infrastructure.Repositry;
using CurrencyConvertorAdmin.Infrastructure.unitofwork;
using CurrencyConvertorAdmin.Services.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CurrencyConvertorAdmin.API
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
           // services.AddAutoMapper(typeof(Startup));
           services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());


           

           

            services.AddMvc();

            services.AddControllersWithViews();
            services.AddControllers().AddNewtonsoftJson(options =>
            options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);       
            services.AddCors();

            services.AddControllers();
            services.AddDbContext<ApplicationDBContext>(options =>
               options.UseSqlServer(
                   Configuration.GetConnectionString("DefaultConnection"),
                       b => b.MigrationsAssembly(typeof(ApplicationDBContext).Assembly.FullName)));
            services.AddScoped<IAccountService, AccountRepository>();    
            services.AddIdentity<IdentityUser, IdentityRole>(optios =>
            {
                optios.Password.RequireUppercase = false;

            }).AddEntityFrameworkStores<ApplicationDBContext>();
            // services.AddScoped<IcurrencyRepositry, CurrencyRepository>();
            // services.AddScoped<ICurrencyService, CurrencyRepository>();

            services.AddScoped<IUnitOfWorks, UnitofWorks>();
            //services.AddScoped<IExchangehistoryRepositry, ExchangehistoryRepository>();


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "CurrencyConvertorAdmin.API", Version = "v1" });
            });

         
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "CurrencyConvertorAdmin.API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseCors(c => c.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin());

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
