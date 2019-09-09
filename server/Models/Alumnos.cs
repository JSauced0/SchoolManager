using System;
using System.Collections.Generic;

namespace Escuela.API.Models
{
    public partial class Alumnos
    {
        public int Id { get; set; }
        public string Expediente { get; set; }
        public string Nombre { get; set; }
        public int Grupo { get; set; }

        public virtual Grupos GrupoNavigation { get; set; }
    }
}
