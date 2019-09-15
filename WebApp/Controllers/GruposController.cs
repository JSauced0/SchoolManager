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
    public class GruposController : ControllerBase
    {
        private readonly EscuelaContext _context;
        private readonly IQueryable<Grupos> grupos;

        public GruposController(EscuelaContext context){
            _context = context;
            grupos = _context.Grupos
                .Include(a => a.GradoNavigation)
                .Include(a => a.MaestroNavigation);
        }

        // GET api/grupos
        [HttpGet]
        public async Task<ActionResult<List<Grupos>>> GetGrupos()
        {
            return await grupos.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Grupos>> GetGrupo(int id)
        {
            return await grupos.FirstOrDefaultAsync(a => a.Id == id);
        }

        // POST api/values
        [HttpPost]
        public async Task PostGrupo(Grupos grupo)
        {
            _context.Grupos.Add(grupo);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutGrupo(Grupos grupo)
        {
            _context.Grupos.Update(grupo);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteGrupo(int id)
        {
            var grupo = await _context.Grupos.FirstOrDefaultAsync(a => a.Id == id);
            grupo.Activo = false;
            _context.Grupos.Update(grupo);
            await _context.SaveChangesAsync();
        }
    }
}
