using System;
using System.Collections.Generic;

namespace Escuela.API.Models
{
    public partial class Grupos
    {
        public Grupos()
        {
            Alumnos = new HashSet<Alumnos>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public int Grado { get; set; }
        public int Maestro { get; set; }

        public virtual Grados GradoNavigation { get; set; }
        public virtual Maestros MaestroNavigation { get; set; }
        public virtual ICollection<Alumnos> Alumnos { get; set; }
    }
}
