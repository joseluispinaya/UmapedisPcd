using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class NTipos
    {
        #region "PATRON SINGLETON"
        private static NTipos instancia = null;
        private NTipos() { }
        public static NTipos getInstance()
        {
            if (instancia == null)
            {
                instancia = new NTipos();
            }
            return instancia;
        }
        #endregion

        //metodo IA
        public List<ERol> ObtenerRol()
        {
            return DTipos.getInstance().ObtenerRol();
            //try
            //{
            //    return DTipos.getInstance().ObtenerRol();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<ERol> ObtenerRoles()
        {
            try
            {
                return DTipos.getInstance().ObtenerRoles();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
