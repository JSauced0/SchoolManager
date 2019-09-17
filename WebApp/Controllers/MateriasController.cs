using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MateriasController : ControllerBase
    {
        private readonly EscuelaContext _context;

        private readonly IQueryable<Materias> materias;

        public MateriasController(EscuelaContext context){
            _context = context;
            materias = _context.Materias;
        }

        // GET api/materias
        [HttpGet]
        public async Task<ActionResult<List<Materias>>> GetMaterias()
        {
            return Ok( new { materias = await materias.ToListAsync()});
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Materias>> GetMateria(int id)
        {
            return Ok( new { materias = await materias.FirstOrDefaultAsync(a => a.Id == id)});
        }

        // POST api/values
        [HttpPost]
        public async Task PostMateria(Materias materia)
        {
            _context.Materias.Add(materia);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutMateria(Materias materia)
        {
            _context.Materias.Update(materia);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteMateria(int id)
        {
            var materia = await _context.Materias.FirstOrDefaultAsync(a => a.Id == id);
            materia.Activo = false;
            _context.Materias.Update(materia);
            await _context.SaveChangesAsync();
        }
    }
}
