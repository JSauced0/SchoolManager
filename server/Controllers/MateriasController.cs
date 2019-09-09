﻿using System;
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
            return await materias.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Materias>>> GetGrado(int id)
        {
            return await materias.Where(a => a.Id == id).ToListAsync();
        }

        // POST api/values
        [HttpPost]
        public async Task PostGrado(Materias materia)
        {
            _context.Materias.Add(materia);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutGrado(Materias materia)
        {
            _context.Materias.Update(materia);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteGrado(int id)
        {
            var materia = await _context.Materias.FirstOrDefaultAsync(a => a.Id == id);
            materia.Activo = false;
            _context.Materias.Update(materia);
            await _context.SaveChangesAsync();
        }
    }
}