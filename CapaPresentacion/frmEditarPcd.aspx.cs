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
    public partial class frmEditarPcd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static RespuestaZ<bool> EditarPcd(EPersonasDisca oPersonapcd)
        {
            try
            {
                List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();
                var items = Lista.FirstOrDefault(x => x.Idpersodisca == oPersonapcd.Idpersodisca);

                if (items == null)
                {
                    return new RespuestaZ<bool>() { Estado = false, Mensage = "No se encontro el PCD" };
                }

                bool Respuesta = true;
                var respuesta = new RespuestaZ<bool>
                {
                    Estado = Respuesta,
                    Mensage = Respuesta ? "PCD actualizado correctamente" : "Error al actualizar el CI ya Existe",
                    Valor = Respuesta ? "success" : "warning"
                };
                return respuesta;
            }
            catch (Exception ex)
            {
                return new RespuestaZ<bool> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message };
            }

        }
    }
}