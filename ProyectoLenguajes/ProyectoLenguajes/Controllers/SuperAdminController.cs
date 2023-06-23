using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoLenguajes.Data;
using ProyectoLenguajes.Models;
using ProyectoLenguajes.Models.Domain;
using ProyectoLenguajes.Models.DTO;
using ProyectoLenguajes.Repositories.Abstract;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using System;
using System.Data;
using System.Security.Claims;

namespace ProyectoLenguajes.Controllers
{
    //Poner en TestUCRContext.cs:
    //    public virtual DbSet<Errors> ERRORs { get; set; }

    //    modelBuilder.Entity<Errors>(entity =>
    //    {
    //        entity.HasNoKey();
    //        entity.Property(e => e.error);
                
    //    });
public class SuperAdminController : Controller
    {
        private TestUCRContext db = new TestUCRContext(); //We call our database
        private readonly IUserAuthenticationService _service; //We call the utilities of the other base
        private readonly UserManager<ApplicationUser> userManager; //We call application user
        public SuperAdminController(IUserAuthenticationService service, UserManager<ApplicationUser> userManager)
        {
            this._service = service;
            this.userManager = userManager;
        }

        [Authorize(Roles = "superA")]
        public IActionResult Display()
        {
            var personList = new List<ACCOUNT>();
            //var error = new Errors();
            try
            {//To obtain the username of the migration database and search for it in our database
                var userId = User.FindFirstValue(ClaimTypes.Name);
                var d = ViewBag.Error = userId;

                personList = db.ACCOUNTs.FromSqlRaw("exec dbo.GetAdminsAccounts").ToList();//get only admins
                return View(personList);

            }
            catch (Exception ex)
            {
                //var result = db.ERRORs.FromSqlRaw("exec dbo.GetAllAccounts").ToList();
                //var a = ViewBag.Error = result[0].error.ToString();
                return View(personList);
            }

        }

        [Authorize(Roles = "superA")]
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
                //If it's not valid, don't believe it.
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                //to get the migration username
                var userId = User.FindFirstValue(ClaimTypes.Name);

                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@userID", userId));
                parameter.Add(new SqlParameter("@name", model.Name));
                parameter.Add(new SqlParameter("@email", model.Email));
                parameter.Add(new SqlParameter("@roll", "admin"));
                parameter.Add(new SqlParameter("@userName", model.UserName));
                parameter.Add(new SqlParameter("@password", model.Password));

                var rs = Task.Run(() => db.Database //we pass the parameters to the SP
                .ExecuteSqlRaw(@"exec InsertAccounts @userID, @name, @email, @roll, @userName, @password", parameter.ToArray()));

                model.Role = "admin";//we forcefully assign the role of admin
                var result = await _service.RegistrationAsync(model); //the method we did is called
                TempData["msg"] = result.Message;

                return RedirectToAction(nameof(Create));
            }
            catch (Exception ex)
            {
                //var rr = db.ERRORs.FromSqlRaw("exec InsertAccounts @userID, @name, @email, @roll, @userName, @password").ToList();
                //var a = ViewBag.Error = rr[0].error.ToString();
                return View();
            }
        }

        [Authorize(Roles = "superA")]
        public ActionResult Details(int id)
        {
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        [Authorize(Roles = "superA")]
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
                //get all public fields of the model
                var fields = acc.GetType().GetProperties();

                foreach (var field in fields)
                {
                    var value = field.GetValue(acc);
                    if (value == null)
                    {
                        //if a null field is found, return the view with an error message
                        TempData["msg"] = "You cannot leave fields empty.";
                        return View();
                    }
                }
                ACCOUNT act = db.ACCOUNTs.Find(acc.idAccount);//It comes with the old username

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

                var result = await _service.UpdateUserAsync(acc, act.userName); //the method we did is called
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

        [Authorize(Roles = "superA")]
        public ActionResult Delete(int id)
        {
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        // POST: PersonController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id, ACCOUNT acc)
        {
            try
            {
                ACCOUNT act = db.ACCOUNTs.Find(acc.idAccount);//to find the account with this id

                var result = await _service.DeleteUserAsync(act); //the method we did is called
                TempData["msg"] = result.Message;

                var userId = User.FindFirstValue(ClaimTypes.Name);

                var parameter = new List<SqlParameter>();
                parameter.Add(new SqlParameter("@userID", userId));
                parameter.Add(new SqlParameter("@idAccount", act.idAccount));

                //to use the SP
                var rs = Task.Run(() => db.Database
                .ExecuteSqlRaw(@"exec DeleteAccount @userID, @idAccount", parameter.ToArray()));

                return RedirectToAction(nameof(Delete));
            }
            catch (Exception ex)
            {
                //var rr = db.ERRORs.FromSqlRaw("exec DeleteAccount @userID, @idAccount").ToList();
                //var a = ViewBag.Error = rr[0].error.ToString();
                return View();
            }
        }

        //Here we uses the ICONAPI
        [Authorize(Roles = "superA")]
        public ActionResult FilterIcons()
        {
            var iconList = new List<Models.Icon>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7249/api/Icons");//The API service
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

        [Authorize(Roles = "superA")]
        public ActionResult Home()
        {
            var userNameM = User.FindFirstValue(ClaimTypes.Name);
            var userNameC = ViewBag.UserName = userNameM;
            //here we find our account
            var id = db.ACCOUNTs
    .Where(a => a.userName == userNameM)
    .Select(a => a.idAccount)
    .FirstOrDefault();
            var acc = db.ACCOUNTs.Find(id);
            return View(acc);
        }

        [Authorize(Roles = "superA")]
        public IActionResult DownloadPDF()//to the pdf of admins
        {
            var userList = new List<ACCOUNT>();
            userList = db.ACCOUNTs.FromSqlRaw("exec dbo.GetAdminsAccounts").ToList();

            var documentpdf = Document.Create(container =>
            {
                container.Page(page =>
                {

                    page.Content().PaddingVertical(10).Column(col =>
                    {
                        col.Item().Table(table =>
                        {
                            table.ColumnsDefinition(columns =>
                            {
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                                columns.RelativeColumn();
                            });//columns headers

                            table.Header(header =>
                            {
                                header.Cell().Background("#257272").Padding(2).Text("UserName").FontColor("#fff").FontSize(13);
                                header.Cell().Background("#257272").Padding(2).Text("Name").FontColor("#fff").FontSize(13);
                                header.Cell().Background("#257272").Padding(2).Text("Email").FontColor("#fff").FontSize(13);
                                header.Cell().Background("#257272").Padding(2).Text("Role").FontColor("#fff").FontSize(13);
                            });

                            //save info in pdf
                            //borderBottom defines a border
                            foreach (var user in userList)
                            {
                                table.Cell().Border(0.5f).BorderColor(Colors.Black).Padding(2).Text(user.userName).FontColor("#000").FontSize(10);
                                table.Cell().Border(0.5f).BorderColor(Colors.Black).Padding(2).Text(user.name).FontColor("#000").FontSize(10);
                                table.Cell().Border(0.5f).BorderColor(Colors.Black).Padding(2).Text(user.email).FontColor("#000").FontSize(10);
                                table.Cell().Border(0.5f).BorderColor(Colors.Black).Padding(2).Text(user.roll).FontColor("#000").FontSize(10);
                            }
                        });
                    });

                });
            }).GeneratePdf(); //returns pdf

            var stream = new MemoryStream(documentpdf); //save pdf in memory
            return File(stream, "application/pdf", "AdminsList.pdf"); //name and type of pdf
        }
        [Authorize(Roles = "superA")]
        public ActionResult AboutOf()//here he go to the about view
        {
            return View();
        }

        //we find the accounts and allow or deny your access
        [Authorize(Roles = "superA")]
        public IActionResult Options()
        {
            var personList = new List<ACCOUNT>();
            //var error = new Errors();
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.Name);
                var d = ViewBag.Error = userId;

                personList = db.ACCOUNTs.FromSqlRaw("exec dbo.GetAdminsAccounts").ToList();
                return View(personList);

            }
            catch (Exception ex)
            {
                //var result = db.ERRORs.FromSqlRaw("exec dbo.GetAllAccounts").ToList();
                //var a = ViewBag.Error = result[0].error.ToString();
                return View(personList);
            }

        }

        [Authorize(Roles = "superA")]
        public IActionResult RemoveAdminPrivilege(string userName)
        {
            //search for the user by their username
            var user = userManager.FindByNameAsync(userName).Result;

            if (user != null)
            {
                //check if user has admin role
                if (userManager.IsInRoleAsync(user, "admin").Result)
                {
                    //remove the administrator role from the user
                    userManager.RemoveFromRoleAsync(user, "admin").Wait();

                    return RedirectToAction("Options", "SuperAdmin"); //redirect to admin page
                }
            }

            return RedirectToAction("Index", "Error"); //redirect to an error page if the user does not exist or does not have the admin role
        }
        [Authorize(Roles = "superA")]
        public IActionResult AddAdminPrivilege(string userName)
        {
            //search for the user by their username
            var user = userManager.FindByNameAsync(userName).Result;

            if (user != null)
            {
                //check if user has admin role
                if (!userManager.IsInRoleAsync(user, "admin").Result)
                {
                    //assign the administrator role to the user
                    userManager.AddToRoleAsync(user, "admin").Wait();

                    return RedirectToAction("Options", "SuperAdmin"); //redirect to admin page
                }
            }

            return RedirectToAction("Index", "Error"); //redirect to an error page if the user does not exist or does not have the admin role
        }
    }
}
