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
    public class ActorController : Controller
    {
        private readonly TestUCRContext _testUCRContext;

    public ActorController(TestUCRContext testUCRContext)
    {
        _testUCRContext = testUCRContext;
    }


   


    // GET: SeriesController
    [HttpGet]
    public ActionResult Index()
    {
        var actors = _testUCRContext.ACTORs.FromSqlRaw("SELECT * FROM ACTOR").ToList();
        return View(actors);
    }



   
    public ActionResult Details(int id)
    {
            var actor = _testUCRContext.ACTORs.Find(id);
            return View(actor);

        }

    
    // GET: SeriesController/Edit/5
    public ActionResult Edit(int id)
    {
            var editActor = _testUCRContext.ACTORs.Find(id);

            if (editActor == null)
            {
                return NotFound(); // Opcional: manejar cuando no se encuentra la película
            }

            return View(editActor);
        }

    // POST: SeriesController/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Edit(int id, ACTOR actor)
    {
        if (id != actor.idActor)
        {
            return BadRequest(); // Opcional: manejar cuando el ID no coincide con el ID de la película
        }

        if (ModelState.IsValid)
        {
            try
            {
                _testUCRContext.Update(actor);
                _testUCRContext.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View(actor);
            }
        }

        return View(actor);
    }

    
    }
}
