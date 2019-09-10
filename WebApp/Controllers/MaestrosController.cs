using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Escuela.API.Models;
using Microsoft.EntityFrameworkCore;

namespace Escuela.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MaestrosController : ControllerBase
    {
        private readonly EscuelaContext _context;
        private readonly IQueryable<Maestros> maestros;

        public MaestrosController(EscuelaContext context){
            _context = context;
            maestros = _context.Maestros;
        }

        // GET api/maestros
        [HttpGet]
        public async Task<ActionResult<List<Maestros>>> GetMaestro()
        {
            return await maestros.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Maestros>>> GetMaestro(int id)
        {
            return await maestros.Where(a => a.Id == id).ToListAsync();
        }

        // POST api/values
        [HttpPost]
        public async Task PostMaestro(Maestros maestro)
        {
            _context.Maestros.Add(maestro);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutMaestro(Maestros maestro)
        {
            _context.Maestros.Update(maestro);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteMaestro(int id)
        {
            var maestro = await _context.Maestros.FirstOrDefaultAsync(a => a.Id == id);
            maestro.Activo = false;
            _context.Maestros.Update(maestro);
            await _context.SaveChangesAsync();
        }
    }
}
