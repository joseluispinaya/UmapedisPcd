using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CapaPresentacion
{
    public partial class frmReporteBono : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static Respuesta<List<ResumenPagoBono>> ObtenerResum()
        {
            List<ResumenPagoBono> Lista = NPagoBono.getInstance().ObtenerResumen();

            if (Lista != null)
            {
                return new Respuesta<List<ResumenPagoBono>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<ResumenPagoBono>>() { estado = false, objeto = null };
            }
        }
    }
}