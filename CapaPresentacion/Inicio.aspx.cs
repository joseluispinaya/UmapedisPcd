using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;

namespace CapaPresentacion
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta<EUsuario> ObtenerDetalleUsuario()
        {
            if (Configuracion.oUsuario != null)
            {
                int IdUsuario = Configuracion.oUsuario.IdUsuario;
                List<EUsuario> Lista = NUsuario.getInstance().ObtenerUsuarios();
                var items = Lista.FirstOrDefault(x => x.IdUsuario == IdUsuario);

                Configuracion.oUsuario = items;

                if (items != null)
                {
                    return new Respuesta<EUsuario>() { estado = true, objeto = items };
                }
                else
                {
                    return new Respuesta<EUsuario>() { estado = false, objeto = null };
                }
            }
            else
            {
                return new Respuesta<EUsuario>() { estado = false, objeto = null };
            }
        }
        [WebMethod]
        public static bool CerrarSesion()
        {
            Configuracion.oUsuario = null;

            return true;

        }
    }
}