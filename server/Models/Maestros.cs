using System;
using System.Collections.Generic;

namespace Escuela.API.Models
{
    public partial class Maestros
    {
        public Maestros()
        {
            Grupos = new HashSet<Grupos>();
        }

        public int Id { get; set; }
        public string Expediente { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public string Numero { get; set; }

        public virtual ICollection<Grupos> Grupos { get; set; }
    }
}
