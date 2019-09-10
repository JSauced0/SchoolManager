using System;
using System.Collections.Generic;

namespace WebApp.Models
{
    public partial class Asignaciones
    {
        public int Id { get; set; }
        public int Grado { get; set; }
        public int Materia { get; set; }

        public virtual Grados GradoNavigation { get; set; }
        public virtual Materias MateriaNavigation { get; set; }
    }
}
