using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ProyectoLenguajes.Models.DTO;
using ProyectoLenguajes.Repositories.Abstract;

namespace ProyectoLenguajes.Controllers
{
    public class UserAuthenticationController : Controller
    {
        private readonly IUserAuthenticationService _service;
        public UserAuthenticationController(IUserAuthenticationService service)
        {
            this._service = service;
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
                return RedirectToAction("Index", "Home");
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
