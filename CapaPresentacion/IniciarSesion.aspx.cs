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
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.AppendHeader("Cache-Control", "no-store");
        }

        [WebMethod]
        public static int Iniciar(string Usuario, string Clave)
        {
            string ClaveEncri = Utilidadesj.getInstance().ConvertirSha256(Clave);

            int IdUsuario = NUsuario.getInstance().LoginUsuarioA(Usuario, ClaveEncri);
            Configuracion.oUsuario = new EUsuario() { IdUsuario = IdUsuario };
            return IdUsuario;
        }

        [WebMethod]
        public static Respuesta<bool> EnviarCorreoDe(string correo)
        {
            bool Respuesta = false;
            string clavegenerada = Utilidadesj.getInstance().GenerarClave();
            string ClaveEncri = Utilidadesj.getInstance().ConvertirSha256(clavegenerada);

            List<EUsuario> Lista = NUsuario.getInstance().ObtenerUsuarios();
            var items = Lista.FirstOrDefault(x => x.Correo == correo);
            if (items == null)
            {
                return new Respuesta<bool>() { estado = false, valor = "No se encontro el Usuario" };
            }

            items.Clave = ClaveEncri;

            bool RespuestaC = NUsuario.getInstance().ActualizarUsuarioIa(items);
            if (RespuestaC)
            {
                Respuesta = Utilidadesj.getInstance().EnviaElCorreod(items.Correo, clavegenerada, items.Correo);
                return new Respuesta<bool>() { estado = Respuesta };
            }

            return new Respuesta<bool>() { estado = false };
            //public bool EnviaElCorreod(string toEmail, string clave, string usuario)
        }
    }
}