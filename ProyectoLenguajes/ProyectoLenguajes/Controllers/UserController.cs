using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
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
            var list = new List<GenderMovies>();
            var gender = new List<GENDER>();
            var moviesList = new List<MOVIE>();

            gender = db.GENDERs.FromSqlRaw("SELECT * FROM GENDER").ToList();

            foreach(var g in gender)
            {
                moviesList = db.MOVIEs.FromSqlRaw("EXEC GetMoviesByGender @typeG", new SqlParameter("@typeG", g.typeG)).ToList();
                list.Add(new GenderMovies() { genderName = g.typeG, movies = moviesList });
            }
            return View(list);
        }

        public ActionResult MovieDetails(int id)
        {
            var movie = db.MOVIEs.Find(id);
            db.MOVIEs.Where(m => m.idMovie == id);
            return View(movie);
        }
    }
}
