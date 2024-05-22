using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class EPersonasDisca
    {
        public int Idpersodisca { get; set; }
        public int IdUsuario { get; set; }
        public EUsuario oUsuario { get; set; }
        public int Idasoci { get; set; }
        public EAsociacion oAsociacion { get; set; }
        public int Idtipodisca { get; set; }
        public ETipoDisca oTipoDisca { get; set; }
        public int Idtutor { get; set; }
        public ETutor oTutor { get; set; }
        public string Ciperso { get; set; }
        public string Codcarnetdisca { get; set; }
        public string Porsentaje { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Sexo { get; set; }
        public string Foto { get; set; }
        public bool EstadoBono { get; set; }
        public bool Estado { get; set; }

        public string ImageFull => string.IsNullOrEmpty(Foto)
            ? $"/Imagenes/Sinfotop.jpg"
            : Foto;
    }
}
