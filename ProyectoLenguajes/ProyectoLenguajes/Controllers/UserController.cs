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
        //Instance of db context
        private TestUCRContext db = new TestUCRContext();
        private readonly IUserAuthenticationService _service;
        public UserController(IUserAuthenticationService service)
        {
            this._service = service;
        }

        /*
         * This method returns the index view of the client with the sliders by gender
         * Valeria Cubero
         */
        public IActionResult Index()
        {
            var list = new List<MoviesAndSeries>();
            var gender = new List<GENDER>();
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();

            //get all gender in database
            gender = db.GENDERs.FromSqlRaw("SELECT * FROM GENDER").ToList();

            foreach (var g in gender)
            {
                //search the movies and series in each gender
                moviesList = db.MOVIEs.FromSqlRaw("EXEC GetMoviesByGender @typeG", new SqlParameter("@typeG", g.typeG)).ToList();
                seriesList = db.SERIEs.FromSqlRaw("EXEC GetSeriesByGender @typeG", new SqlParameter("@typeG", g.typeG)).ToList();
                //add to model all the list
                list.Add(new MoviesAndSeries() { genderName = g.typeG, movies = moviesList, series = seriesList });
            }

            //send the list
            return View(list);
        }

        /*
         * This method return the information of the movie selected and returns the view 
         * with the information. In this the client can see the actors and can see and 
         * make comments.
         * Valeria Cubero
         */
        public ActionResult MovieDetails(int id, int? page)
        {
            //get the movie with the id selected
            var movie = db.MOVIEs.Find(id);
            db.MOVIEs.Where(m => m.idMovie == id);

            //calculate the average punctuation
            db.Database.ExecuteSqlRaw("EXEC CalculateMoviePunctuation @id", new SqlParameter("@id", id));

            //get the actors of the movie
            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetMovieCast @id", new SqlParameter("@id", id)).ToList();

            //get the reviews of the movie
            var reviews = new List<UserMovie>();
            reviews = db.UserMovies.FromSqlRaw("EXEC GetMovieReviews @id", new SqlParameter("@id", id)).ToList();

            //comment pagination control
            int itemsPerPage = 10;
            int totalPages = (int)Math.Ceiling((double)reviews.Count / 10);
            totalPages = Math.Max(totalPages, 1);
            int currentPage = page ?? 1;
            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.Min(startIndex + itemsPerPage, reviews.Count);
            var commentsPerPage = reviews.GetRange(startIndex, endIndex - startIndex);

            //create a new final model to sent to the view
            var movieFinal = new MovieFinal() { movie = movie, actors = actors, commentsPerPage = commentsPerPage,
                totalPages = totalPages, currentPage = currentPage};

            //send the information of the movie to the view
            return View(movieFinal);
        }

        /*
         * This method return the information of the serie selected and returns the view 
         * with the information. In this the client can see the actors, see the chapters
         * and can see and make comments.
         * Valeria Cubero
         */
        public ActionResult SerieDetails(int id, int? page)
        {
            //get the movie with the id selected
            var serie = db.SERIEs.Find(id);
            db.SERIEs.Where(m => m.idSerie == id);

            //calculate the average punctuation
            db.Database.ExecuteSqlRaw("EXEC CalculateSeriePunctuation @id", new SqlParameter("@id", id));

            //get the actors of the serie
            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetSerieCast @id", new SqlParameter("@id", id)).ToList();

            //get the reviews of the serie
            var reviews = new List<UserSerie>();
            reviews = db.UserSeries.FromSqlRaw("EXEC GetSerieReviews @id", new SqlParameter("@id", id)).ToList();

            //comment pagination control
            int itemsPerPage = 10;
            int totalPages = (int)Math.Ceiling((double)reviews.Count / 10);
            totalPages = Math.Max(totalPages, 1);
            int currentPage = page ?? 1;
            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.Min(startIndex + itemsPerPage, reviews.Count);
            var commentsPerPage = reviews.GetRange(startIndex, endIndex - startIndex);

            //get the chapters of the serie
            var chapters = new List<CHAPTER>();
            chapters = db.CHAPTERs.FromSqlRaw("EXEC GetSerieChapters @id", new SqlParameter("@id", id)).ToList();

            //create a new final model to sent to the view
            var serieFinal = new SerieFinal() { serie = serie, actors = actors, chapters = chapters, commentsPerPage = commentsPerPage,
                totalPages = totalPages, currentPage = currentPage };

            //send the information of the serie to the view
            return View(serieFinal);
        }

        /*
         * This method return de searchings view and the information to fill the
         * sugestions for the inputs. Besides return the view in which the client
         * can make searchings by gender or name of the movie or serie.
         * Valeria Cubero
         */
        public ActionResult Search()
        {
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();
            var gendersList = new List<GENDER>();

            //get all genders, movies and series
            gendersList = db.GENDERs.FromSqlRaw("EXEC GetAllGenders").ToList();
            moviesList = db.MOVIEs.FromSqlRaw("EXEC GetAllMovies").ToList();
            seriesList = db.SERIEs.FromSqlRaw("EXEC GetAllSeries").ToList();

            //a new model to send the three lists
            var MS = new MoviesAndSeriesSearch() { genders = gendersList, movies = moviesList, series = seriesList };
            
            //send the lists to the view
            return View(MS);
        }

        /*
         * This method return de the view with the sliders that contains the series and movies
         * in the gender selected.
         * Valeria Cubero
         */
        public ActionResult searchByGender(string gender)
        {
            var list = new MoviesAndSeries();
            var moviesList = new List<MOVIE>();
            var seriesList = new List<SERIE>();

            //get the movies and series with selected gender
            moviesList = db.MOVIEs.FromSqlRaw("EXEC GetMoviesByGender @typeG", new SqlParameter("@typeG", gender)).ToList();
            seriesList = db.SERIEs.FromSqlRaw("EXEC GetSeriesByGender @typeG", new SqlParameter("@typeG", gender)).ToList();

            //save the lists and the gender name
            list = new MoviesAndSeries() { genderName = gender, movies = moviesList, series = seriesList };

            //send the information to the view
            return View(list);
        }

        /*
         * This method return de the view MovieDetails with the movie selected by name.
         * Valeria Cubero
         */
        public ActionResult searchByMovieName(string name, int? page)
        {
            //get the movie with the selected name
            var movie = db.MOVIEs.FirstOrDefault(m => m.name == name);

            //calculate the average punctuation
            db.Database.ExecuteSqlRaw("EXEC CalculateMoviePunctuation @id", new SqlParameter("@id", movie.idMovie));

            //get the actors list
            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetMovieCast @id", new SqlParameter("@id", movie.idMovie)).ToList();

            //get the reviews list
            var reviews = new List<UserMovie>();
            reviews = db.UserMovies.FromSqlRaw("EXEC GetMovieReviews @id", new SqlParameter("@id", movie.idMovie)).ToList();
            
            //comment pagination control
            int itemsPerPage = 10;
            int totalPages = (int)Math.Ceiling((double)reviews.Count / 10);
            totalPages = Math.Max(totalPages, 1);
            int currentPage = page ?? 1;
            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.Min(startIndex + itemsPerPage, reviews.Count);
            var commentsPerPage = reviews.GetRange(startIndex, endIndex - startIndex);

            //save the information in model
            var movieFinal = new MovieFinal()
            {
                movie = movie,
                actors = actors,
                commentsPerPage = commentsPerPage,
                totalPages = totalPages,
                currentPage = currentPage
            };

            //send to MovieDetails view the movie
            return View("MovieDetails", movieFinal);
        }

        /*
         * This method return de the view SerieDetails with the serie selected by name.
         * Valeria Cubero
         */
        public ActionResult searchBySerieName (string name, int? page)
        {
            //get the serie with the selected name
            var serie = db.SERIEs.FirstOrDefault(s => s.name == name);

            //calculate the average punctuation
            db.Database.ExecuteSqlRaw("EXEC CalculateSeriePunctuation @id", new SqlParameter("@id", serie.idSerie));

            //get the actors list
            var actors = new List<ACTOR>();
            actors = db.ACTORs.FromSqlRaw("EXEC GetSerieCast @id", new SqlParameter("@id", serie.idSerie)).ToList();

            //get the reviews list
            var reviews = new List<UserSerie>();
            reviews = db.UserSeries.FromSqlRaw("EXEC GetSerieReviews @id", new SqlParameter("@id", serie.idSerie)).ToList();

            //comment pagination control
            int itemsPerPage = 10;
            int totalPages = (int)Math.Ceiling((double)reviews.Count / 10);
            totalPages = Math.Max(totalPages, 1);
            int currentPage = page ?? 1;
            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.Min(startIndex + itemsPerPage, reviews.Count);
            var commentsPerPage = reviews.GetRange(startIndex, endIndex - startIndex);

            //get the chapters list
            var chapters = new List<CHAPTER>();
            chapters = db.CHAPTERs.FromSqlRaw("EXEC GetSerieChapters @id", new SqlParameter("@id", serie.idSerie)).ToList();

            //save the information in model
            var serieFinal = new SerieFinal()
            {
                serie = serie,
                actors = actors,
                chapters = chapters,
                commentsPerPage = commentsPerPage,
                totalPages = totalPages,
                currentPage = currentPage
            };

            //send to SerieDetails view the serie
            return View("SerieDetails", serieFinal);
        }

        /*
         * This method get the comment an rate of the user, besides it get the
         * movie id and the user name. Then it save the information in the 
         * database.
         * Valeria Cubero
         */
        public ActionResult Comment(string text, int id, int stars)
        {
            //get the actal user name
            var userId = User.FindFirstValue(ClaimTypes.Name);

            //save the parameters
            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@idAccount", userId));
            parameter.Add(new SqlParameter("@idMovie", id));
            parameter.Add(new SqlParameter("@review", text));
            parameter.Add(new SqlParameter("@stars", stars));

            //execute the stored procedure to save the comments
            db.Database.ExecuteSqlRaw("EXEC CommentMovie @idAccount, @idMovie, @review, @stars", parameter.ToArray());

            return Json(new { mensaje = "Succesfull" });
        }

        /*
         * This method get the comment an rate of the user, besides it get the
         * serie id and the user name. Then it save the information in the 
         * database.
         * Valeria Cubero
         */
        public ActionResult CommentSerie(string text, int id, int stars)
        {
            //get the actal user name
            var userId = User.FindFirstValue(ClaimTypes.Name);

            //save the parameters
            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@idAccount", userId));
            parameter.Add(new SqlParameter("@idSerie", id));
            parameter.Add(new SqlParameter("@review", text));
            parameter.Add(new SqlParameter("@stars", stars));

            //execute the stored procedure to save the comments
            db.Database.ExecuteSqlRaw("EXEC CommentSerie @idAccount, @idSerie, @review, @stars", parameter.ToArray());

            return Json(new { mensaje = "Succesfull" });
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
