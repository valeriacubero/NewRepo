using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ProyectoLenguajes.Models.Domain;
using ProyectoLenguajes.Models.DTO;
using ProyectoLenguajes.Repositories.Abstract;
using System.Security.Claims;

namespace ProyectoLenguajes.Controllers
{
    public class UserAuthenticationController : Controller
    {
        private readonly IUserAuthenticationService _service;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        public UserAuthenticationController(IUserAuthenticationService service, SignInManager<ApplicationUser> signInManager, UserManager<ApplicationUser> userManager)
        {
            this._service = service;
            this._signInManager = signInManager;
            this._userManager = userManager;
        }

        public IActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Registration(RegistrationModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            model.Role = "user";
            var result = await _service.RegistrationAsync(model); //se llama el metodo que hicimos
            TempData["msg"] = result.Message;

            return RedirectToAction(nameof(Registration));
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await _service.LoginAsync(model);
            if (result.StatusCode == 1) //es porque pudo hacerlo
            {
                // Autenticar al usuario en la sesión
                var user = await _userManager.FindByNameAsync(model.UserName);
                await _signInManager.SignInAsync(user, isPersistent: false);

                // Actualizar la sesión del usuario con los roles más recientes
                await _signInManager.RefreshSignInAsync(user);
                var role = await _userManager.GetRolesAsync(user);

                if (role[0].ToString() =="superA") //para meterle codigo de c#
                {
                    return RedirectToAction("Display", "SuperAdmin");
                }
                else if (role[0].ToString() == "admin")
                {
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    return RedirectToAction("Index", "User");
                }
                //return RedirectToAction("_Layout", "Shared");
            }
            else
            {
                TempData["msg"] = result.Message; //es como un viewbag message
                return RedirectToAction(nameof(Login)); //no se pudo registrar el usuario
            }
        }

        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await _service.LogoutAsync();
            return RedirectToAction(nameof(Login));
        }

        //public async Task<IActionResult> Reg()
        //{
        //    var model = new RegistrationModel
        //    {
        //        UserName = "Super_A_VJE",
        //        Name = "Super-Admin",
        //        Email = "SuperA@gmail.com",
        //        Password = "SuperA2023*",
        //    };
        //    model.Role = "superA";
        //    var result = await _service.RegistrationAsync(model);
        //    return Ok(result);

        //}
    }
}
