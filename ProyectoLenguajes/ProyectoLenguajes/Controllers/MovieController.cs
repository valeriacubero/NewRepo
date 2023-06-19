using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol.Plugins;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using ProyectoLenguajes.Models.Domain;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data;


namespace ProyectoLenguajes.Controllers
{
    public class MovieController : Controller
    {
        private readonly TestUCRContext _testUCRContext;

        public MovieController(TestUCRContext testUCRContext)
        {
            _testUCRContext = testUCRContext;
        }

        // GET: MovieController
        [HttpGet]
        public ActionResult Index()
        {
            var movies = _testUCRContext.MOVIEs.FromSqlRaw("SELECT * FROM MOVIE").ToList();
            return View(movies);
        }



        // GET: MovieController/Details/5
        public ActionResult Details(int id)
        {
            var idMovie = _testUCRContext.MOVIEs.Find(id);
            return View(idMovie);
        }

        // GET: MovieController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MovieController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateAsync(AddMovie movie)
        {
            if (ModelState.IsValid)
            {

                List<ActorList> aCTORs = new List<ActorList>();
                aCTORs.Add(new ActorList(movie.nameA1, movie.lastName1, movie.birth1));

                if (!string.IsNullOrEmpty(movie.nameA2) && !string.IsNullOrEmpty(movie.lastName2) && movie.birth2 != null)
                {
                    aCTORs.Add(new ActorList(movie.nameA2, movie.lastName2, (DateTime)movie.birth2));
                }

                if (!string.IsNullOrEmpty(movie.nameA3) && !string.IsNullOrEmpty(movie.lastName3) && movie.birth3 != null)
                {
                    aCTORs.Add(new ActorList(movie.nameA3, movie.lastName3, (DateTime)movie.birth3));
                }

                

                List<GenderList> gENDERs = new List<GenderList>();
                gENDERs.Add(new GenderList(movie.typeG1));
                if (!string.IsNullOrEmpty(movie.typeG2))
                {
                    gENDERs.Add(new GenderList(movie.typeG2));
                }
                if (!string.IsNullOrEmpty(movie.typeG3))
                {
                    gENDERs.Add(new GenderList(movie.typeG3));
                }

                DataTable actorsTable = DataTableConverter.ConvertToDataTable(aCTORs);
                DataTable gendersTable = DataTableConverter.ConvertToDataTable(gENDERs);
                
                var parameterActors = new SqlParameter("@actors", SqlDbType.Structured)
                {
                    TypeName = "dbo.ActorList",
                    Value = actorsTable
                };
                var parameterGenders = new SqlParameter("@genders", SqlDbType.Structured)
                {
                    TypeName = "dbo.GenderList",
                    Value = gendersTable
                };

                var rs = await Task.Run(() =>
                {                                                               
                    var rsInsertActors = _testUCRContext.Database.ExecuteSqlRaw(" SELECT nameT, lastNameT," +
                                                                                " birthT FROM @actors;", parameterActors);
                                                                                
                    var rsInsertGenders = _testUCRContext.Database.ExecuteSqlRaw(" SELECT typeG FROM @genders;", parameterGenders);

                    var parameterNameM = new SqlParameter("@nameM", movie.name);
                    var parameterDuration = new SqlParameter("@duration", movie.duration);
                    var parameterYear = new SqlParameter("@year", movie.year);
                    var parameterDirector = new SqlParameter("@director", movie.director);
                    var parameterDistributor = new SqlParameter("@distributor", movie.distributor);
                    var parameterImg = new SqlParameter("@img", movie.img);
                    var parameterDescription = new SqlParameter("@description", movie.description);
                    var parameterTrailer = new SqlParameter("@trailer", movie.trailer);

                    var rsInsertMovie = _testUCRContext.Database.ExecuteSqlRaw("EXEC InsertMovie " +
                                                                               "@userID = 1001, " +
                                                                               "@nameM = @nameM, " +
                                                                               "@duration = @duration, "+
                                                                               "@year = @year, "+
                                                                               "@director = @director, "+
                                                                               "@distributor = @distributor, "+
                                                                               "@img = @img, "+
                                                                               "@description = @description, "+
                                                                               "@trailer = @trailer, "+
                                                                               "@actors = @actors, " +
                                                                               "@genders = @genders;",
                                                                               parameterNameM,
                                                                               parameterDuration,
                                                                               parameterYear,
                                                                               parameterDirector,
                                                                               parameterDistributor,
                                                                               parameterImg,
                                                                               parameterDescription,
                                                                               parameterTrailer,
                                                                               parameterActors,
                                                                               parameterGenders);

                    return rsInsertMovie;
                });

                return RedirectToAction(nameof(Index));

            }

            return View();
        }

        // GET: MovieController/Edit/5
        public ActionResult Edit(int id)
        {
            var editMovie = _testUCRContext.MOVIEs.Find(id);

            if (editMovie == null)
            {
                return NotFound(); // Opcional: manejar cuando no se encuentra la película
            }

            return View(editMovie);
        }

        // POST: MovieController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, MOVIE movie)
        {
            if (id != movie.idMovie)
            {
                return BadRequest(); // Opcional: manejar cuando el ID no coincide con el ID de la película
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _testUCRContext.Update(movie);
                    _testUCRContext.SaveChanges();
                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View(movie);
                }
            }

            return View(movie);
        }

        // GET: MovieController/Delete/5
        public ActionResult Delete(int id)
        {
            var deleteMovie = _testUCRContext.MOVIEs.Find(id);
            return View(deleteMovie);
        }

        // POST: MovieController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id, MOVIE movie)
        {
            try
            {
                movie = _testUCRContext.MOVIEs.FirstOrDefault(m => m.idMovie == id);
                if (movie == null)
                {
                    return NotFound(); // Opcional: manejar cuando la película no se encuentra
                }

                _testUCRContext.Remove(movie);
                _testUCRContext.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
