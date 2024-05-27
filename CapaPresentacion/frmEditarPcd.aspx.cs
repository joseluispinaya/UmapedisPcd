using System;
using System.Collections.Generic;
using System.IO;
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
        public static RespuestaZ<bool> EditarPcd(EPersonasDisca oPersonapcd, byte[] imageBytes)
        {
            try
            {
                var imageUrl = string.Empty;

                List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();
                var items = Lista.FirstOrDefault(x => x.Idpersodisca == oPersonapcd.Idpersodisca);

                if (items == null)
                {
                    return new RespuestaZ<bool>() { Estado = false, Mensage = "No se encontro el PCD" };
                }
                if (imageBytes != null && imageBytes.Length > 0)
                {
                    var stream = new MemoryStream(imageBytes);
                    string folder = "/ImagePcd/";
                    imageUrl = Utilidadesj.getInstance().UploadPhoto(stream, folder);

                    if (!string.IsNullOrEmpty(items.Foto))
                    {
                        File.Delete(HttpContext.Current.Server.MapPath(items.Foto));
                    }
                }
                else
                {
                    imageUrl = items.Foto;
                }

                bool cobra = false;
                int pors = Convert.ToInt32(oPersonapcd.Porsentaje);
                if (pors >= 51)
                {
                    cobra = true;
                }

                items.Idpersodisca = oPersonapcd.Idpersodisca;
                items.Idasoci = oPersonapcd.Idasoci;
                items.Idtipodisca = oPersonapcd.Idtipodisca;
                items.Ciperso = oPersonapcd.Ciperso;
                items.Codcarnetdisca = oPersonapcd.Codcarnetdisca;
                items.Porsentaje = oPersonapcd.Porsentaje;
                items.Nombres = oPersonapcd.Nombres;
                items.Apellidos = oPersonapcd.Apellidos;
                items.Sexo = oPersonapcd.Sexo;
                items.Foto = imageUrl;
                items.EstadoBono = cobra;

                bool Respuesta = NPersonasDisca.getInstance().ActualizarPcd(items);
                //bool Respuesta = true;
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