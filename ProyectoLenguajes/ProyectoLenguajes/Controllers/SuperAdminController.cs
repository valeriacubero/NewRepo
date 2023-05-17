using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using System;
using System.Data;

namespace ProyectoLenguajes.Controllers
{
    public class SuperAdminController : Controller
    {
        [Authorize(Roles = "superA")]
        public IActionResult Display()
        {
            var personList = new List<ACCOUNT>();
            personList = db.ACCOUNTs.FromSqlRaw("exec dbo.GetPersons").ToList();
            ViewBag.persona = personList.FirstOrDefault();
            return View(personList);
        }
        private TestUCRContext db = new TestUCRContext();

    }
}
