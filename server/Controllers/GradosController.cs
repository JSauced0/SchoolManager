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
    public class GradosController : ControllerBase
    {
        private readonly EscuelaContext _context;
        private readonly IQueryable<Grados> grados;

        public GradosController(EscuelaContext context){
            _context = context;
            grados = _context.Grados;
        }

        // GET api/grados
        [HttpGet]
        public async Task<ActionResult<List<Grados>>> GetGrados()
        {
            return await grados.ToListAsync();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Grados>>> GetGrado(int id)
        {
            return await grados.Where(a => a.Id == id).ToListAsync();
        }

        // POST api/values
        [HttpPost]
        public async Task PostGrado(Grados grado)
        {
            _context.Grados.Add(grado);
            await _context.SaveChangesAsync();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public async Task PutGrado(Grados grado)
        {
            _context.Grados.Update(grado);
            await _context.SaveChangesAsync();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public async Task DeleteGrado(int id)
        {
            _context.Grados.Remove(grados.FirstOrDefault(a => a.Id == id));
            await _context.SaveChangesAsync();
        }
    }
}
