using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta<List<ERol>> ObtenerRol()
        {
            List<ERol> Lista = NTipos.getInstance().ObtenerRol();
            //Lista = NTipos.getInstance().ObtenerRol();

            if (Lista != null)
            {
                return new Respuesta<List<ERol>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<ERol>>() { estado = false, objeto = null };
            }
        }
    }
}