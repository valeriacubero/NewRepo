using IconAPI.Data;
using IconAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IconAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IconsController : ControllerBase
    {
        private readonly TestUCRContext _context = new TestUCRContext();
        // GET: api/<IconsController>
        [HttpGet]
        public ActionResult<List<Icon>> Get() //https://localhost:7249/api/Icons
        {
            try
            {
                return Ok(_context.Icons.ToList());

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET api/<IconsController>/5
        [HttpGet("{id}")]
        public ActionResult<Icon> Get(int id)
        {
            try
            {
                return Ok(_context.Icons.Where(c => c.idIcon == id).FirstOrDefault());

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);//BadRequest
            }
        }

        // POST api/<IconsController>
        [HttpPost]
        public ActionResult Post(Icon icon)
        {
            try
            {
                _context.Icons.Add(icon);
                _context.SaveChanges();
                return Ok(icon);// _context.Person
            }
            catch
            {
                return BadRequest("problemas al crear el objeto");
            }
        }

        // PUT api/<IconsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, Icon icon)
        {
            try
            {
                _context.Icons.Update(icon);
                _context.SaveChanges();
                return Ok(icon);// _context.Person
            }
            catch
            {
                return BadRequest("problemas al crear el objeto");
            }
        }

        // DELETE api/<IconsController>/5
        [HttpDelete("{id}")]
        public ActionResult<Icon> Delete(int id)
        {
            try
            {
                var icon = _context.Icons.Where(c => c.idIcon == id).FirstOrDefault();
                _context.Icons.Remove(icon);
                _context.SaveChanges();
                return Ok(icon);

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);//BadRequest
            }
        }
    }
}
