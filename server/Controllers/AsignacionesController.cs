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
    public class AsignacionesController : ControllerBase
    {
        private readonly EscuelaContext _context;

        private readonly IQueryable<Asignaciones> asignaciones;

        public AsignacionesController(EscuelaContext context){
            _context = context;
            asignaciones = _context.Asignaciones
                .Include(a => a.GradoNavigation)
                .Include(a => a.MateriaNavigation);
        }

        // GET api/asignaciones
        [HttpGet]
        public async Task<ActionResult<List<Asignaciones>>> GetAsignaciones()
        {
            return await asignaciones.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Asignaciones>>> GetGrado(int id)
        {
            return await asignaciones.Where(a => a.Id == id).ToListAsync();
        }

        // POST api/values
        [HttpPost]
        public async Task PostGrado(Asignaciones asignacion)
        {
            _context.Asignaciones.Add(asignacion);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutGrado(Asignaciones asignacion)
        {
            _context.Asignaciones.Update(asignacion);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteGrado(int id)
        {
            _context.Asignaciones.Remove(asignaciones.FirstOrDefault(a => a.Id == id));
            await _context.SaveChangesAsync();
        }
    }
}
