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

        public List<EPagoBono> ObtenerInfoGenera(int idPcd)
        {
            return DPagoBono.getInstance().ObtenerInfoGenera(idPcd);
        }
        public EPagoBono BuscarPagoBoboId(int idpcd)
        {
            return DPagoBono.getInstance().BuscarPagoBoboId(idpcd);
        }
        public List<ResumenPagoBono> ObtenerResumen()
        {
            return DPagoBono.getInstance().ObtenerResumen();
        }

        public List<EPagoBono> ConsultaPagoGesMes(int Idgesti, int IdMes)
        {
            return DPagoBono.getInstance().ConsultaPagoGesMes(Idgesti, IdMes);
        }
    }
}
