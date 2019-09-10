using System;
using System.Collections.Generic;

namespace WebApp.Models
{
    public partial class Materias
    {
        public Materias()
        {
            Asignaciones = new HashSet<Asignaciones>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }

        public virtual ICollection<Asignaciones> Asignaciones { get; set; }
    }
}
