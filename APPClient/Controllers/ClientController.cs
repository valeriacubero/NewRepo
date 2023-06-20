using APPClient.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;

namespace APPClient.Controllers
{
    public class ClientController : Controller
    {
        // GET: ClientController
        public ActionResult Index()
        {
            var movieList = new List<MOVIE>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7218/api/Movies");
                //HTTP GET
                var responseTask = client.GetAsync("Movies");
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadFromJsonAsync<List<MOVIE>>();
                    readTask.Wait();

                    movieList = readTask.Result;
                }
                else //si la api arroja algun error
                {
                    return BadRequest("problemas");
                }
            }
            return View(movieList);
        }

        // GET: ClientController/Details/5
        public ActionResult Details(int id)
        {
            using (var client = new HttpClient())
            {
                var url = "https://localhost:7218/api/Movies/" + id;

                //HTTP POST
                var responseTask = client.GetAsync(url);
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadFromJsonAsync<MOVIE>();
                    readTask.Wait();

                    var movie = readTask.Result;
                    return View(movie);

                }
                else //si la api arroja algun error
                {
                    return BadRequest("problemas");
                }
            }
        }

        // GET: ClientController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ClientController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MOVIE movie)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    var url = "https://localhost:7218/api/Movies";

                    //HTTP POST
                    var postTask = client.PostAsJsonAsync<MOVIE>(url, movie);
                    postTask.Wait();

                    var result = postTask.Result;
                    if (result.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                    return View();
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
                return View();
            }
        }

        // GET: ClientController/Edit/5
        public ActionResult Edit(int id)
        {
            using (var client = new HttpClient())
            {
                var url = "https://localhost:7218/api/Movies/" + id;

                //HTTP POST
                var responseTask = client.GetAsync(url);
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadFromJsonAsync<MOVIE>();
                    readTask.Wait();

                    var movie = readTask.Result;
                    return View(movie);

                }
                else //si la api arroja algun error
                {
                    return BadRequest("problemas");
                }
            }
        }

        // POST: ClientController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, MOVIE movie)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    var url = "https://localhost:7218/api/Movies/" + id;

                    //HTTP POST
                    var postTask = client.PutAsJsonAsync<MOVIE>(url, movie);
                    postTask.Wait();

                    var result = postTask.Result;
                    if (result.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                    return View();
                }
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
                return View();
            }        
        }

        // GET: ClientController/Delete/5
        public ActionResult Delete(int id)
        {
            using (var client = new HttpClient())
            {
                var url = "https://localhost:7218/api/Movies/" + id;

                //HTTP POST
                var responseTask = client.GetAsync(url);
                responseTask.Wait();

                var result = responseTask.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadFromJsonAsync<MOVIE>();
                    readTask.Wait();

                    var movie = readTask.Result;
                    return View(movie);

                }
                else //si la api arroja algun error
                {
                    return BadRequest("problemas");
                }
            }
        }

        // POST: ClientController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, MOVIE movie)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    string url = ("https://localhost:7218/api/Movies/" + id);
                                                                                    
                    var responseTask = client.DeleteAsync(url);
                    responseTask.Wait();

                    var result = responseTask.Result;

                    string text = "";
                    if (result.IsSuccessStatusCode)
                    {
                        text = "Datos eliminados";
                        var readTask = result.Content.ReadFromJsonAsync<MOVIE>();
                        readTask.Wait();

                    }
                    else //si la api arroja algun error
                    {
                        text = "Datos NO eliminados";
                        return BadRequest("problemas");
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
