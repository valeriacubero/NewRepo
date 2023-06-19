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
    public class SeriesController : Controller
    {
        private readonly TestUCRContext _testUCRContext;

        public SeriesController(TestUCRContext testUCRContext)
        {
            _testUCRContext = testUCRContext;
        }


        public ActionResult Episodes(int id)
        {
            var episodes = _testUCRContext.CHAPTERs.Where(e => e.idSerie == id).ToList();
            return PartialView("Index", episodes);
        }


        // GET: SeriesController
        [HttpGet]
        public ActionResult Index()
        {
            var series = _testUCRContext.SERIEs.FromSqlRaw("SELECT * FROM SERIE").ToList();
            return View(series);
        }



        private SERIE GetSerieById(int id)
        {
            // Aquí debes implementar la lógica para obtener la serie por su ID desde tu origen de datos
            // Puedes utilizar Entity Framework, una base de datos, una API, o cualquier otro método para obtener los datos

            // Ejemplo de código de obtención de la serie por su ID desde una base de datos utilizando Entity Framework
            return _testUCRContext.SERIEs.FirstOrDefault(s => s.idSerie == id);
        }


        // GET: SeriesController/Details/5
        public ActionResult Details(int id)
        {
            // Obtener el objeto SERIE desde algún lugar
            SERIE serie = _testUCRContext.SERIEs.Find(id);

            // Obtener la lista de capítulos desde algún lugar
            List<CHAPTER> chapters = _testUCRContext.CHAPTERs.Where(e => e.idSerie == id).ToList();

            // Asignar los capítulos al modelo
            serie.CHAPTERs = chapters;

            // Pasar el modelo a la vista
            return View(serie);

        }

        // GET: SeriesController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SeriesController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateAsync(AddSerie serie)
        {
            if (ModelState.IsValid)
            {

                List<ActorList> aCTORs = new List<ActorList>();
                aCTORs.Add(new ActorList(serie.nameA1, serie.lastName1, serie.birth1));

                if (!string.IsNullOrEmpty(serie.nameA2) && !string.IsNullOrEmpty(serie.lastName2) && serie.birth2 != null)
                {
                    aCTORs.Add(new ActorList(serie.nameA2, serie.lastName2, (DateTime)serie.birth2));
                }

                if (!string.IsNullOrEmpty(serie.nameA3) && !string.IsNullOrEmpty(serie.lastName3) && serie.birth3 != null)
                {
                    aCTORs.Add(new ActorList(serie.nameA3, serie.lastName3, (DateTime)serie.birth3));
                }



                List<GenderList> gENDERs = new List<GenderList>();
                gENDERs.Add(new GenderList(serie.typeG1));
                if (!string.IsNullOrEmpty(serie.typeG2))
                {
                    gENDERs.Add(new GenderList(serie.typeG2));
                }
                if (!string.IsNullOrEmpty(serie.typeG3))
                {
                    gENDERs.Add(new GenderList(serie.typeG3));
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

                    var parameterNameS = new SqlParameter("@nameS", serie.nameS);
                    var parameterSeasons = new SqlParameter("@seasons", serie.seasons);
                    var parameterYear = new SqlParameter("@year", serie.year);
                    var parameterDirector = new SqlParameter("@director", serie.director);
                    var parameterDistributor = new SqlParameter("@distributor", serie.distributor);
                    var parameterImg = new SqlParameter("@img", serie.img);
                    var parameterDescription = new SqlParameter("@description", serie.description);
                    var parameterTrailer = new SqlParameter("@trailer", serie.trailer);

                    var rsInsertSerie = _testUCRContext.Database.ExecuteSqlRaw("EXEC InsertSerie " +
                                                                               "@userID = 1001, " +
                                                                               "@nameS = @nameS, " +
                                                                               "@seasons = @seasons, " +
                                                                               "@year = @year, " +
                                                                               "@director = @director, " +
                                                                               "@distributor = @distributor, " +
                                                                               "@img = @img, " +
                                                                               "@description = @description, " +
                                                                               "@trailer = @trailer, " +
                                                                               "@actors = @actors, " +
                                                                               "@genders = @genders;",
                                                                               parameterNameS,
                                                                               parameterSeasons,
                                                                               parameterYear,
                                                                               parameterDirector,
                                                                               parameterDistributor,
                                                                               parameterImg,
                                                                               parameterDescription,
                                                                               parameterTrailer,
                                                                               parameterActors,
                                                                               parameterGenders);

                    return rsInsertSerie;
                });

                return RedirectToAction(nameof(Index));

            }

            return View();
        }

        // GET: SeriesController/Edit/5
        public ActionResult Edit(int id)
        {
            var editSerie = _testUCRContext.SERIEs.Find(id);

            if (editSerie == null)
            {
                return NotFound(); // Opcional: manejar cuando no se encuentra la película
            }

            return View(editSerie);
        }

        // POST: SeriesController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, SERIE serie)
        {
            if (id != serie.idSerie)
            {
                return BadRequest(); // Opcional: manejar cuando el ID no coincide con el ID de la película
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _testUCRContext.Update(serie);
                    _testUCRContext.SaveChanges();
                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View(serie);
                }
            }

            return View(serie);
        }

        // GET: SeriesController/Delete/5
        public ActionResult Delete(int id)
        {
            var deleteSerie = _testUCRContext.SERIEs.Find(id);
            return View(deleteSerie);
        }

        // POST: SeriesController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id, SERIE serie)
        {
            try
            {
                serie = _testUCRContext.SERIEs.FirstOrDefault(m => m.idSerie == id);
                if (serie == null)
                {
                    return NotFound(); // Opcional: manejar cuando la película no se encuentra
                }

                _testUCRContext.Remove(serie);
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
