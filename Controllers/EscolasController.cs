﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EscolasController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public EscolasController(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/Escolas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Escola>>> GetEscola()
        {
            return await _context.Escola.ToListAsync();
        }

        // GET: api/Escolas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Escola>> GetEscola(string id)
        {
            var escola = await _context.Escola.FindAsync(id);

            if (escola == null)
            {
                return NotFound();
            }

            return escola;
        }

        // PUT: api/Escolas/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEscola(string id, Escola escola)
        {
            if (id != escola.Cnpj)
            {
                return BadRequest();
            }

            _context.Entry(escola).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EscolaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Escolas
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Escola>> PostEscola(Escola escola)
        {
            _context.Escola.Add(escola);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (EscolaExists(escola.Cnpj))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetEscola", new { id = escola.Cnpj }, escola);
        }

        // DELETE: api/Escolas/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Escola>> DeleteEscola(string id)
        {
            var escola = await _context.Escola.FindAsync(id);
            if (escola == null)
            {
                return NotFound();
            }

            _context.Escola.Remove(escola);
            await _context.SaveChangesAsync();

            return escola;
        }

        private bool EscolaExists(string id)
        {
            return _context.Escola.Any(e => e.Cnpj == id);
        }
    }
}
