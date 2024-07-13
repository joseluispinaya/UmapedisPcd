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
    public partial class frmAsociaciones : System.Web.UI.Page
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
        public static RespuestaZ<bool> Guardar(EAsociacion oAsocia)
        {
            try
            {
                bool Respuesta = NTipos.getInstance().RegistrarAsociacion(oAsocia);
                var respuesta = new RespuestaZ<bool>
                {
                    Estado = Respuesta,
                    Mensage = Respuesta ? "Registrado correctamente" : "Ocurrio un error la Asociacion ya Existe",
                    Valor = Respuesta ? "success" : "warning"
                };
                return respuesta;
            }
            catch (Exception ex)
            {
                return new RespuestaZ<bool> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message, Valor = "error" };
            }
        }

        [WebMethod]
        public static RespuestaZ<bool> Actualizar(EAsociacion oAsocia)
        {
            try
            {
                bool Respuesta = NTipos.getInstance().ActualizarAsociacion(oAsocia);
                var respuesta = new RespuestaZ<bool>
                {
                    Estado = Respuesta,
                    Mensage = Respuesta ? "Actualizado correctamente" : "Ocurrio un error la Asociacion ya Existe",
                    Valor = Respuesta ? "success" : "warning"
                };
                return respuesta;
            }
            catch (Exception ex)
            {
                return new RespuestaZ<bool> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message, Valor = "error" };
            }
        }
    }
}