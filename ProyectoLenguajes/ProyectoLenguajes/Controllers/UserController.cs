using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using System.Security.Claims;
using System.Security.Principal;
using Microsoft.AspNetCore.Identity;

namespace ProyectoLenguajes.Controllers
{
    public class UserController : Controller
    {
        //instance of db context
        private TestUCRContext db = new TestUCRContext();

        public IActionResult Index()
        {
            var list = new List<MoviesAndSeries>();
            var gender = new List<GENDER>();
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();

            gender = db.GENDERs.FromSqlRaw("SELECT * FROM GENDER").ToList();

            foreach (var g in gender)
            {
                moviesList = db.MOVIEs.FromSqlRaw("EXEC GetMoviesByGender @typeG", new SqlParameter("@typeG", g.typeG)).ToList();
                seriesList = db.SERIEs.FromSqlRaw("EXEC GetSeriesByGender @typeG", new SqlParameter("@typeG", g.typeG)).ToList();
                list.Add(new MoviesAndSeries() { genderName = g.typeG, movies = moviesList, series = seriesList });
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

        public ActionResult SerieDetails(int id)
        {
            var serie = db.SERIEs.Find(id);
            db.SERIEs.Where(m => m.idSerie == id);

            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetSerieCast @id", new SqlParameter("@id", id)).ToList();


            var reviews = new List<UserSerie>();
            reviews = db.UserSeries.FromSqlRaw("EXEC GetSerieReviews @id", new SqlParameter("@id", id)).ToList();

            var chapters = new List<CHAPTER>();
            chapters = db.CHAPTERs.FromSqlRaw("EXEC GetSerieChapters @id", new SqlParameter("@id", id)).ToList();

            var serieFinal = new SerieFinal() { serie = serie, actors = actors, reviews = reviews, chapters = chapters };

            return View(serieFinal);
        }

        
        public ActionResult Comment(string text, int id, int stars)
        {
            var userId = User.FindFirstValue(ClaimTypes.Name);


            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@idAccount", userId));
            parameter.Add(new SqlParameter("@idMovie", id));
            parameter.Add(new SqlParameter("@review", text));
            parameter.Add(new SqlParameter("@stars", stars));

            db.Database.ExecuteSqlRaw("EXEC CommentMovie @idAccount, @idMovie, @review, @stars", parameter.ToArray());

            return Json(new { mensaje = "Datos recibidos correctamente" });
        }

        public ActionResult CommentSerie(string text, int id, int stars)
        {
            var userId = User.FindFirstValue(ClaimTypes.Name);


            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@idAccount", userId));
            parameter.Add(new SqlParameter("@idSerie", id));
            parameter.Add(new SqlParameter("@review", text));
            parameter.Add(new SqlParameter("@stars", stars));

            db.Database.ExecuteSqlRaw("EXEC CommentSerie @idAccount, @idSerie, @review, @stars", parameter.ToArray());

            return Json(new { mensaje = "Datos recibidos correctamente" });
        }


    }
}
