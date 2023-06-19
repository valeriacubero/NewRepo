using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models.Domain;
using ProyectoLenguajes.Repositories.Abstract;
using ProyectoLenguajes.Repositories.Implementation;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<DatabaseContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("conn")));
builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
    .AddEntityFrameworkStores<DatabaseContext>()
    .AddDefaultTokenProviders();
builder.Services.AddScoped<MyUserManager>();//////////
builder.Services.AddScoped<TestUCRContext>();
builder.Services.AddScoped<IUserAuthenticationService, UserAuthenticationService>();
builder.Services.ConfigureApplicationCookie(op => op.LoginPath = "/UserAuthentication/Login"); //cookies

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseAuthentication();
app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    /*pattern: "{controller=User}/{action=Index}/{id?}"*/
    pattern: "{controller=UserAuthentication}/{action=Login}/{id?}");

app.Run();