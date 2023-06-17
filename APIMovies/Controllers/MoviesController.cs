using APIMovies.Data;
using APIMovies.Data2;
using APIMovies.Models;
using Microsoft.AspNetCore.Mvc;
using System;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIMovies.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly TestUCRContext _context = new TestUCRContext();
        private readonly TestContext _context2 = new TestContext();
        // GET: api/<MoviesController>
        [HttpGet]
        public ActionResult<List<MOVIE>> Get()
        {
            try
            {
                //_context2.MOVIEs.AddRange(_context.MOVIEs.ToList());
                //_context2.SaveChanges();
                //return Ok(_context2.MOVIEs.ToList());
                var moviesToAdd = _context.MOVIEs.ToList();

                foreach (var movie in moviesToAdd)
                {
                    if (!_context2.MOVIEs.Any(m => m.idMovie == movie.idMovie))
                    {
                        _context2.MOVIEs.Add(movie);
                    }
                }

                _context2.SaveChanges();

                return Ok(_context2.MOVIEs.ToList());

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET api/<MoviesController>/5
        [HttpGet("{id}")]
        public ActionResult<MOVIE> Get(int id)
        {
            try
            {
                return Ok(_context2.MOVIEs.Where(c => c.idMovie == id).FirstOrDefault());

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);//BadRequest
            }
        }

        // POST api/<MoviesController>
        [HttpPost]
        public ActionResult Post(MOVIE movie)
        {
            try
            {
                _context2.MOVIEs.Add(movie);
                _context2.SaveChanges();
                return Ok(movie);
            }
            catch
            {
                return BadRequest("problemas al crear el objeto");
            }
        }

        // PUT api/<MoviesController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, MOVIE movie)
        {
            try
            {
                _context2.MOVIEs.Update(movie);
                _context2.SaveChanges();
                return Ok(movie);
            }
            catch
            {
                return BadRequest("problemas al crear el objeto");
            }
        }

        // DELETE api/<MoviesController>/5
        [HttpDelete("{id}")]
        public ActionResult<MOVIE> Delete(int id)
        {
            try
            {
                var movie = _context2.MOVIEs.Where(c => c.idMovie == id).FirstOrDefault();
                _context2.MOVIEs.Remove(movie);
                _context2.SaveChanges();
                return Ok();

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);//BadRequest
            }
        }
    }
}
