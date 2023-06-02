using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;

namespace ProyectoLenguajes.Controllers
{
    public class UserController : Controller
    {
        //instance of db context
        private TestUCRContext db = new TestUCRContext();

        public IActionResult Index()
        {

            return View();
        }

        public ActionResult MovieDetails(int id)
        {
            var movie = db.MOVIEs.Find(id);
            db.MOVIEs.Where(m => m.idMovie == id);
            return View(movie);
        }
    }
}
