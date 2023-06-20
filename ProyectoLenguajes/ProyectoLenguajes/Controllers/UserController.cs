using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using System.Security.Claims;
using System.Security.Principal;
using Microsoft.AspNetCore.Identity;
using System;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using ProyectoLenguajes.Repositories.Abstract;

namespace ProyectoLenguajes.Controllers
{
    public class UserController : Controller
    {
        //instance of db context
        private TestUCRContext db = new TestUCRContext();
        private readonly IUserAuthenticationService _service;
        public UserController(IUserAuthenticationService service)
        {
            this._service = service;
        }

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
            db.Database.ExecuteSqlRaw("EXEC CalculateMoviePunctuation @id", new SqlParameter("@id", id));

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
            db.Database.ExecuteSqlRaw("EXEC CalculateSeriePunctuation @id", new SqlParameter("@id", id));

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

        public ActionResult Search()
        {
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();
            var gendersList = new List<GENDER>();

            gendersList = db.GENDERs.FromSqlRaw("EXEC GetAllGenders").ToList();
            moviesList = db.MOVIEs.FromSqlRaw("EXEC GetAllMovies").ToList();
            seriesList = db.SERIEs.FromSqlRaw("EXEC GetAllSeries").ToList();
            var MS = new MoviesAndSeriesSearch() { genders = gendersList, movies = moviesList, series = seriesList };
            
            return View(MS);
        }


        public ActionResult searchByGender(string gender)
        {
            var list = new MoviesAndSeries();
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();

            moviesList = db.MOVIEs.FromSqlRaw("EXEC GetMoviesByGender @typeG", new SqlParameter("@typeG", gender)).ToList();
            seriesList = db.SERIEs.FromSqlRaw("EXEC GetSeriesByGender @typeG", new SqlParameter("@typeG", gender)).ToList();
            list = new MoviesAndSeries() { genderName = gender, movies = moviesList, series = seriesList };

            return View(list);
        }

        public ActionResult searchByMovieName(string name)
        {

            var movie = db.MOVIEs.FirstOrDefault(m => m.name == name);

            db.Database.ExecuteSqlRaw("EXEC CalculateMoviePunctuation @id", new SqlParameter("@id", movie.idMovie));

            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetMovieCast @id", new SqlParameter("@id", movie.idMovie)).ToList();


            var reviews = new List<UserMovie>();
            reviews = db.UserMovies.FromSqlRaw("EXEC GetMovieReviews @id", new SqlParameter("@id", movie.idMovie)).ToList();


            var movieFinal = new MovieFinal() { movie = movie, actors = actors, reviews = reviews };


            return View("MovieDetails", movieFinal);
        }

        public ActionResult searchBySerieName (string name)
        {

            var serie = db.SERIEs.FirstOrDefault(s => s.name == name);

            db.Database.ExecuteSqlRaw("EXEC CalculateSeriePunctuation @id", new SqlParameter("@id", serie.idSerie));

            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetSerieCast @id", new SqlParameter("@id", serie.idSerie)).ToList();


            var reviews = new List<UserSerie>();
            reviews = db.UserSeries.FromSqlRaw("EXEC GetSerieReviews @id", new SqlParameter("@id", serie.idSerie)).ToList();

            var chapters = new List<CHAPTER>();
            chapters = db.CHAPTERs.FromSqlRaw("EXEC GetSerieChapters @id", new SqlParameter("@id", serie.idSerie)).ToList();

            var serieFinal = new SerieFinal() { serie = serie, actors = actors, reviews = reviews, chapters = chapters };

            return View("SerieDetails", serieFinal);
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

        [Authorize(Roles = "user")]
        public ActionResult Details(int id)
        {
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        [Authorize(Roles = "user")]
        public ActionResult Edit(int id)
        {
            var person = db.ACCOUNTs.Find(id);
            return View(person);
        }

        // POST: PersonController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, ACCOUNT acc)//Viene con el username nuevo
        {
            try
            {
                // Obtener todos los campos públicos del modelo
                var fields = acc.GetType().GetProperties();

                foreach (var field in fields)
                {
                    var value = field.GetValue(acc);
                    if (value == null)
                    {
                        // Si se encuentra un campo nulo, retorna la vista con un mensaje de error
                        TempData["msg"] = "No puede dejar campos vacíos.";
                        return View();
                    }
                }
                ACCOUNT act = db.ACCOUNTs.Find(acc.idAccount);//Viene con el username viejo

                var userId = User.FindFirstValue(ClaimTypes.Name);

                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@userID", userId));
                parameter.Add(new SqlParameter("@idAccount", acc.idAccount));
                parameter.Add(new SqlParameter("@name", acc.name));
                parameter.Add(new SqlParameter("@email", acc.email));
                parameter.Add(new SqlParameter("@username", acc.userName));
                parameter.Add(new SqlParameter("@password", acc.password));
                parameter.Add(new SqlParameter("@img", acc.img));

                var rs = Task.Run(() => db.Database
                .ExecuteSqlRaw(@"exec UpdateMyAccount @userID, @idAccount, @name, @email, @username, @password, @img", parameter.ToArray()));

                var result = await _service.UpdateUserAsync(acc, act.userName); //se llama el metodo que hicimos
                TempData["msg"] = result.Message;

                return RedirectToAction(nameof(Edit));

            }
            catch (Exception e)
            {
                //var rr = db.ERRORs.FromSqlRaw("exec UpdateAccount @userID, @idAccount, @name, @email, @username, @password, @img").ToList();
                //var a = ViewBag.Error = rr[0].error.ToString();
                return View();
            }
        }

        [Authorize(Roles = "user")]
        public ActionResult FilterIcons()
        {
            var iconList = new List<Models.Icon>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7249/api/Icons");
                //HTTP GET
                var responseTask = client.GetAsync("Icons");
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadFromJsonAsync<List<Models.Icon>>();
                    readTask.Wait();

                    iconList = readTask.Result;
                }
                else //si la api arroja algun error
                {
                    return BadRequest("problemas");
                }
            }

            return Json(iconList);
        }


    }
}
