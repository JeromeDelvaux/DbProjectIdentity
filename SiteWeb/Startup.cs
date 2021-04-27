using ConnectionTools.DataBase;
using ContactManagerWithIdentity.Identity.Stores;
using ContactManagerWithIdentity.Model.Global.Entities;
using ContactManagerWithIdentity.Model.Global.Services;
using ContactManagerWithIdentity.Model.Repository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SiteWeb
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
            services.AddControllersWithViews();

            services.AddSingleton(sp => new Connection(SqlClientFactory.Instance, @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ContactDbIdentity;Integrated Security=True;"));
            services.AddScoped<IUserRepository<Utilisateurs>, UtilisateurService>();
            services.AddScoped<IRoleRepository<Roles>, RoleServices>();
            services.AddScoped<IUserRoleRepository, IUserRoleRepository>();

            services.AddTransient<IUserStore<Utilisateurs>, UtilisateurStore>();
            services.AddTransient<IRoleStore<Roles>, RoleStore>();

            services.AddIdentity<Utilisateurs, Roles>()
                    .AddDefaultTokenProviders();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
