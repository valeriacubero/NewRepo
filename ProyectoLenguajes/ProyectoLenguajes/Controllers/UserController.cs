using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using System.Security.Claims;

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

            foreach (var g in gender)
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

            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetMovieCast @id", new SqlParameter("@id", id)).ToList();


            var reviews = new List<UserMovie>();
            reviews = db.UserMovies.FromSqlRaw("EXEC GetMovieReviews @id", new SqlParameter("@id", id)).ToList();


            var movieFinal = new MovieFinal() { movie = movie, actors = actors, reviews = reviews };

            return View(movieFinal);
        }

        [HttpPost]
        public ActionResult Comment(string text, int id)
        {
            var userId = User.FindFirstValue(ClaimTypes.Name);//aqui me traigo el id del usuario que está logeado por asi decirlo

            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@userAccount", userId));//le asigno el usuario que está logeado
            parameter.Add(new SqlParameter("@idMovie", id));//suponiendo que de verdad me trae el id de la pelicula, se lo asigno
            parameter.Add(new SqlParameter("@review", text));//le asiigno el comentario si es que no viene null al llamarlo

            var rs = Task.Run(() => db.Database
                .ExecuteSqlRaw(@"exec CommentedMovie @userAccount, @idMovie, @review", parameter.ToArray()));//se lo meto al SP uwu

            return View();
        }

        
    }
}
