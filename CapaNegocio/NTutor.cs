using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class NTutor
    {
        #region "PATRON SINGLETON"
        private static NTutor daoEmpleado = null;
        private NTutor() { }
        public static NTutor getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new NTutor();
            }
            return daoEmpleado;
        }
        #endregion

        public bool RegistrarTutor(int idpersodisca, ETutor oETutor)
        {
            return DTutor.getInstance().RegistrarTutor(idpersodisca, oETutor);
        }
        public List<ETutor> ObtenerTutores()
        {
            return DTutor.getInstance().ObtenerTutores();
        }
    }
}
