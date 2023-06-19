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
    public class EpisodesController : Controller
    {
        private TestUCRContext _testUCRContext = new TestUCRContext();


        public EpisodesController(TestUCRContext testUCRContext)
        {
            _testUCRContext = testUCRContext;
        }

        [HttpGet]
        public ActionResult Index(int id)
        {

            var episodes = _testUCRContext.CHAPTERs.Where(e => e.idSerie == id).ToList();
            return View("Index", episodes);
        }

        // GET: MovieController/Details/5
        public ActionResult Details(int id)
        {
            var idChapter = _testUCRContext.CHAPTERs.Find(id);
            return View(idChapter);
        }

        // GET: MovieController/Create
        public ActionResult Create(int idSerie)
        {
            var episode = new AddEpisode
            {
                idSerie = idSerie
            };

            return View(episode);
        }

        // POST: MovieController/Create
        [HttpPost]
[ValidateAntiForgeryToken]
public async Task<ActionResult> CreateAsync(AddEpisode episode)
{
            if (ModelState.IsValid)
            {
                var rs = await Task.Run(() =>
        {
            var parameters = new[]
{
    new SqlParameter("@userID", 1001),
    new SqlParameter("@numChapter", episode.numChapter.ToString()),
    new SqlParameter("@nameC", episode.nameC),
    new SqlParameter("@duration", episode.duration),
    new SqlParameter("@season", episode.season.ToString()),
    new SqlParameter("@idSerie", episode.idSerie.ToString()),
    new SqlParameter("@img", episode.img),
    new SqlParameter("@description", episode.description)
};

            var query = "EXEC InsertChapter " +
                "@userID, " +
                "@numChapter, " +
                "@nameC, " +
                "@duration, " +
                "@season, " +
                "@idSerie, " +
                "@img, " +
                "@description";

            var rsInsertChapter = _testUCRContext.Database.ExecuteSqlRaw(query, parameters);

            return rsInsertChapter;
        });

                return RedirectToAction("Index", "Series");
            }

    return View();
    }

        // GET: MovieController/Edit/5
        public ActionResult Edit(int id)
        {
            var editChapter = _testUCRContext.CHAPTERs.Find(id);

            if (editChapter == null)
            {
                return NotFound(); // Opcional: manejar cuando no se encuentra la película
            }

            return View(editChapter);
        }

        // POST: MovieController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, CHAPTER chapter)
        {
            if (id != chapter.idChapter)
            {
                return BadRequest(); // Opcional: manejar cuando el ID no coincide con el ID de la película
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _testUCRContext.Update(chapter);
                    _testUCRContext.SaveChanges();
                    return RedirectToAction("Index", "Series");
                }
                catch
                {
                    return View(chapter);
                }
            }

            return View(chapter);
        }

        // GET: MovieController/Delete/5
        public ActionResult Delete(int id)
        {
            var deleteChapter = _testUCRContext.CHAPTERs.Find(id);
            return View(deleteChapter);
        }

        // POST: MovieController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id, CHAPTER chapter)
        {
            try
            {
                chapter = _testUCRContext.CHAPTERs.FirstOrDefault(c => c.idChapter == id);
                if (chapter == null)
                {
                    return NotFound(); // Opcional: manejar cuando la película no se encuentra
                }

                _testUCRContext.Remove(chapter);
                _testUCRContext.SaveChanges();
                return RedirectToAction("Index", "Series");
            }
            catch
            {
                return View();
            }
        }

    }

}
