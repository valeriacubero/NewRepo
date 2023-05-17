using Microsoft.AspNetCore.Mvc;

namespace ProyectoLenguajes.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
