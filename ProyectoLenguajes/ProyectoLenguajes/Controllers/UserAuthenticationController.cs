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
            var result = await _service.RegistrationAsync(model); //the method we did is called
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
            if (result.StatusCode == 1) //it's because he could do it
            {
                // Authenticate user in session
                var user = await _userManager.FindByNameAsync(model.UserName);
                await _signInManager.SignInAsync(user, isPersistent: false);

                // Update user session with latest roles
                await _signInManager.RefreshSignInAsync(user);
                var role = await _userManager.GetRolesAsync(user);

                if (role.Count != 0)
                {
                    if (role[0].ToString() == "superA") //It's because a super admin came in
                    {
                        return RedirectToAction("Home", "SuperAdmin");
                    }
                    else if (role[0].ToString() == "admin")//It's because an admin entered
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                    else//it is because it is neither admin nor superadmin
                    {
                        return RedirectToAction("Index", "User");
                    }
                }
                else//It is because it does not have a role assigned
                {
                    return RedirectToAction(nameof(NoAdmin));
                }
            }
            else
            {
                TempData["msg"] = result.Message; //it's like a viewbag message
                return RedirectToAction(nameof(Login)); //failed to register user
            }
        }

        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await _service.LogoutAsync();
            return RedirectToAction(nameof(Login));
        }

        [Authorize]
        public ActionResult NoAdmin()
        {
            return View();
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
