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
    public class AlumnosController : ControllerBase
    {
        private readonly EscuelaContext _context;
        private readonly IQueryable<Alumnos> alumnos;
        public AlumnosController(EscuelaContext context){
            _context = context;
            alumnos = _context.Alumnos
                .Include(a => a.GrupoNavigation)
                .Include(a => a.GrupoNavigation.GradoNavigation)
                .Include(a => a.GrupoNavigation.MaestroNavigation);
        }

        // GET api/alumnos
        [HttpGet]
        public async Task<ActionResult<List<Alumnos>>> GetAlumnos()
        {
            return await alumnos.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Alumnos>>> GetAlumno(int id)
        {
            return await alumnos.Where(a => a.Id == id).ToListAsync();
        }

        // POST api/values
        [HttpPost]
        public async Task PostAlumno(Alumnos alumno)
        {
            _context.Alumnos.Add(alumno);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutAlumno(Alumnos alumno)
        {
            _context.Alumnos.Update(alumno);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteAlumno(int id)
        {
            var alumno = await _context.Alumnos.FirstOrDefaultAsync(a => a.Id == id);
            alumno.Activo = false;
            _context.Alumnos.Update(alumno);
            await _context.SaveChangesAsync();
        }
    }
}
