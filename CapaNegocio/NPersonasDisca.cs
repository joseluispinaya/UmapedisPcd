using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class NPersonasDisca
    {
        #region "PATRON SINGLETON"
        private static NPersonasDisca daoEmpleado = null;
        private NPersonasDisca() { }
        public static NPersonasDisca getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new NPersonasDisca();
            }
            return daoEmpleado;
        }
        #endregion

        public int RegistrarPCD(EPersonasDisca personaDisca)
        {
            return DPersonasDisca.getInstance().RegistrarPCD(personaDisca);
        }

        public bool ActualizarPcd(EPersonasDisca personaDisca)
        {
            return DPersonasDisca.getInstance().ActualizarPcd(personaDisca);
        }
        public List<EPersonasDisca> ObtenerPersonasPcd()
        {
            return DPersonasDisca.getInstance().ObtenerPersonasPcd();
        }
    }
}
