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
    public partial class frmPCD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static Respuesta<List<EAsociacion>> ObtenerAsociacion()
        {
            List<EAsociacion> Lista = NTipos.getInstance().ObtenerAsociacion();
            //Lista = NTipos.getInstance().ObtenerRol();

            if (Lista != null)
            {
                return new Respuesta<List<EAsociacion>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<EAsociacion>>() { estado = false, objeto = null };
            }
        }
        [WebMethod]
        public static Respuesta<List<ETipoDisca>> ObtenerTipodisca()
        {
            List<ETipoDisca> Lista = NTipos.getInstance().ObtenerTiposDisca();
            //Lista = NTipos.getInstance().ObtenerRol();

            if (Lista != null)
            {
                return new Respuesta<List<ETipoDisca>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<ETipoDisca>>() { estado = false, objeto = null };
            }
        }
    }
}