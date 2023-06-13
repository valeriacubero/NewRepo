using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using ProyectoLenguajes.Models.DTO;
using ProyectoLenguajes.Repositories.Abstract;
using System.Data;
using System.Security.Claims;

namespace ProyectoLenguajes.Controllers
{
    public class AdminController : Controller
    {
        private TestUCRContext db = new TestUCRContext();
        private readonly IUserAuthenticationService _service;
        public AdminController(IUserAuthenticationService service)
        {
            this._service = service;
        }

        [Authorize(Roles = "admin")]
        public IActionResult Index()
        {
            var personList = new List<ACCOUNT>();
            //var error = new Errors();
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.Name);
                var d = ViewBag.Error = userId;

                personList = db.ACCOUNTs.FromSqlRaw("exec dbo.GetUsersAccounts").ToList();
                return View(personList);

            }
            catch (Exception ex)
            {
                /*var result = db.ERRORs.FromSqlRaw("exec dbo.GetUsersAccounts").ToList();
                var a = ViewBag.Error = result[0].error.ToString();*/
                return View(personList);
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(RegistrationModel model)
        {
            //var error = new Errors();
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                var userId = User.FindFirstValue(ClaimTypes.Name);

                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@userID", userId));
                parameter.Add(new SqlParameter("@name", model.Name));
                parameter.Add(new SqlParameter("@email", model.Email));
                parameter.Add(new SqlParameter("@roll", "user"));
                parameter.Add(new SqlParameter("@userName", model.UserName));
                parameter.Add(new SqlParameter("@password", model.Password));

                var rs = Task.Run(() => db.Database
                .ExecuteSqlRaw(@"exec InsertAccounts @userID, @name, @email, @roll, @userName, @password", parameter.ToArray()));

                model.Role = "user";
                var result = await _service.RegistrationAsync(model); //se llama el metodo que hicimos
                TempData["msg"] = result.Message;

                return RedirectToAction(nameof(Create));
            }
            catch (Exception ex)
            {
                /*var rr = db.ERRORs.FromSqlRaw("exec InsertAccounts @userID, @name, @email, @roll, @userName, @password").ToList();
                var a = ViewBag.Error = rr[0].error.ToString();*/
                return View();
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult Details(int id)
        {
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        [Authorize(Roles = "admin")]
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
                .ExecuteSqlRaw(@"exec UpdateAccount @userID, @idAccount, @name, @email, @username, @password, @img", parameter.ToArray()));

                var result = await _service.UpdateUserAsync(acc, act.userName); //se llama el metodo que hicimos
                TempData["msg"] = result.Message;

                return RedirectToAction(nameof(Edit));

            }
            catch (Exception e)
            {
                /*var rr = db.ERRORs.FromSqlRaw("exec UpdateAccount @userID, @idAccount, @name, @email, @username, @password, @img").ToList();
                var a = ViewBag.Error = rr[0].error.ToString();*/
                return View();
            }
        }

        [Authorize(Roles = "admin")]
        public ActionResult Delete(int id)
        {
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id, ACCOUNT acc)
        {
            try
            {
                ACCOUNT act = db.ACCOUNTs.Find(acc.idAccount);
                var roll = act.roll.ToString();
                if (roll == "user")
                {
                    var result = await _service.DeleteUserAsync(act); //se llama el metodo que hicimos
                    TempData["msg"] = result.Message;

                    var userId = User.FindFirstValue(ClaimTypes.Name);

                    var parameter = new List<SqlParameter>();
                    parameter.Add(new SqlParameter("@userID", userId));
                    parameter.Add(new SqlParameter("@idAccount", act.idAccount));

                    var rs = Task.Run(() => db.Database
                    .ExecuteSqlRaw(@"exec DeleteAccount @userID, @idAccount", parameter.ToArray()));
                }
                var a = ViewBag.Error = "You Don't have permission";
                return RedirectToAction(nameof(Delete));
            }
            catch (Exception ex)
            {
                /*var rr = db.ERRORs.FromSqlRaw("exec DeleteAccount @userID, @idAccount").ToList();
                var a = ViewBag.Error = rr[0].error.ToString();*/
                return View();
            }
        }

    }
}
