﻿using System;
using System.Collections.Generic;

namespace Escuela.API.Models
{
    public partial class Materias
    {
        public Materias()
        {
            Asignaciones = new HashSet<Asignaciones>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Asignaciones> Asignaciones { get; set; }
    }
}
