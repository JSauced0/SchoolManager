using System;
using System.Collections.Generic;

namespace Escuela.API.Models
{
    public partial class Grados
    {
        public Grados()
        {
            Asignaciones = new HashSet<Asignaciones>();
            Grupos = new HashSet<Grupos>();
        }

        public int Id { get; set; }
        public string Grado { get; set; }

        public virtual ICollection<Asignaciones> Asignaciones { get; set; }
        public virtual ICollection<Grupos> Grupos { get; set; }
    }
}
