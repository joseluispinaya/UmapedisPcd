using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class NPagoBono
    {
        #region "PATRON SINGLETON"
        private static NPagoBono daoEmpleado = null;
        private NPagoBono() { }
        public static NPagoBono getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new NPagoBono();
            }
            return daoEmpleado;
        }
        #endregion

        public int RegistrarBono(EPagoBono oUsuario)
        {
            return DPagoBono.getInstance().RegistrarBono(oUsuario);
        }

        public List<EPagoBono> DetallePagosPersona(int Idpersonapcd, int Idgesti)
        {
            return DPagoBono.getInstance().DetallePagosPersona(Idpersonapcd, Idgesti);
        }

        public EPagoBono BuscarPagoBoboId(int idpcd)
        {
            return DPagoBono.getInstance().BuscarPagoBoboId(idpcd);
        }
    }
}
