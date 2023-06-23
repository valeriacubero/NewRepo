using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;

namespace ProyectoLenguajes.Controllers
{
    public class GenderController : Controller
    {

        private readonly TestUCRContext _testUCRContext;

        public GenderController(TestUCRContext testUCRContext)
        {
            _testUCRContext = testUCRContext;
        }

        // GET: GenderController
        public ActionResult Index()
        {
            var genders = _testUCRContext.GENDERs.FromSqlRaw("SELECT * FROM GENDER").ToList();
            return View(genders);
        }

        // GET: GenderController/Details/5
        public ActionResult Details(int id)
        {
            var gender = _testUCRContext.GENDERs.Find(id);
            return View(gender);
        }

        // GET: GenderController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GenderController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GENDER gender)
        {
            if (ModelState.IsValid)
            {
                _testUCRContext.GENDERs.Add(gender);
                _testUCRContext.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

            return View(gender);
        }

        // GET: GenderController/Edit/5
        public ActionResult Edit(int id)
        {
            var editGender = _testUCRContext.GENDERs.Find(id);

            if (editGender == null)
            {
                return NotFound(); // Opcional: manejar cuando no se encuentra la película
            }

            return View(editGender);
        }

        // POST: GenderController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, GENDER gender)
        {
            if (id != gender.idGender)
            {
                return BadRequest(); // Opcional: manejar cuando el ID no coincide con el ID de la película
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _testUCRContext.Update(gender);
                    _testUCRContext.SaveChanges();
                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View(gender);
                }
            }

            return View(gender);
        }

        // GET: GenderController/Delete/5
        public ActionResult Delete(int id)
        {
            var deleteChapter = _testUCRContext.CHAPTERs.Find(id);
            return View(deleteChapter);
        }

        // POST: GenderController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id ,GENDER gender)
        {
            try
            {
                gender = _testUCRContext.GENDERs.FirstOrDefault(c => c.idGender == id);
                if (gender == null)
                {
                    return NotFound(); // Opcional: manejar cuando la película no se encuentra
                }

                _testUCRContext.Remove(gender);
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
