using System.Collections.Generic;

namespace CapaEntidad
{
    public class EAsociacion
    {
        public int Idasoci { get; set; }
        public string Descripcion { get; set; }
        public string Responsable { get; set; }
        public bool Activo { get; set; }
        public List<EPersonasDisca> oListaPcd { get; set; }
    }
}
