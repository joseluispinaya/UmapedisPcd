using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class EPagoBono
    {
        public int Idbono { get; set; }
        public string Codigo { get; set; }
        public int ValorCodigo { get; set; }
        public int IdUsuario { get; set; }
        public EUsuario oUsuario { get; set; }
        public int Idpersodisca { get; set; }
        public EPersonasDisca oEPersonasDisca { get; set; }
        public int Idges { get; set; }
        public EGestion oEGestion { get; set; }
        public int Idmes { get; set; }
        public EMeses oEMeses { get; set; }
        public float Monto { get; set; }
        public bool Estado { get; set; }
        public bool Estadoaltern { get; set; }
        public DateTime Fecha { get; set; }
        public string FechaRegistro { get; set; }
    }
}
