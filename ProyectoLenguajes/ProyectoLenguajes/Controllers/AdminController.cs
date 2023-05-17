using Microsoft.AspNetCore.Mvc;
using ProyectoLenguajes.Models.DTO;

namespace ProyectoLenguajes.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        //public IActionResult Registration() //AJUSTAR EL METODO PARA QUE EL ADMIN CREE USUARIOS
        //{
        //    return View();
        //}

        //[HttpPost]
        //public async Task<IActionResult> Registration(RegistrationModel model)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }
        //    model.Role = "admin";
        //    var result = await _service.RegistrationAsync(model); //se llama el metodo que hicimos
        //    TempData["msg"] = result.Message;
        //    return RedirectToAction(nameof(Registration));
        //}

    }
}
