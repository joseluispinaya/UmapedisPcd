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
    public partial class frmUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static bool Guardar(EUsuario oUsuario, byte[] imageBytes)
        {
            bool Respuesta = false;
            var imageUrl = string.Empty;
            string clavegenerada = Utilidadesj.getInstance().GenerarClave();
            string ClaveEncri = Utilidadesj.getInstance().ConvertirSha256(clavegenerada);

            if (imageBytes != null && imageBytes.Length > 0)
            {
                var stream = new MemoryStream(imageBytes);
                string folder = "/Imagenes/";
                imageUrl = Utilidadesj.getInstance().UploadPhoto(stream, folder);
            }
            EUsuario obj = new EUsuario
            {
                Nombres = oUsuario.Nombres,
                Apellidos = oUsuario.Apellidos,
                Correo = oUsuario.Correo,
                Clave = ClaveEncri,
                Foto = imageUrl,
                Profecion = oUsuario.Profecion,
                IdRol = oUsuario.IdRol
            };
            Respuesta = NUsuario.getInstance().RegistrarUsuario(obj);
            if (Respuesta)
            {
                bool ok = Utilidadesj.getInstance().EnviaElCorreod(obj.Correo, clavegenerada, obj.Correo);
            }
            return Respuesta;
        }

        //no usado
        [WebMethod]
        public static bool Editar(EUsuario oUsuario, byte[] imageBytes)
        {
            bool Respuesta = false;
            var imageUrl = string.Empty;
            List<EUsuario> Lista = NUsuario.getInstance().ObtenerUsuarios();
            var items = Lista.FirstOrDefault(x => x.IdUsuario == oUsuario.IdUsuario);

            if (imageBytes != null && imageBytes.Length > 0)
            {
                var stream = new MemoryStream(imageBytes);
                string folder = "/Imagenes/";
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
            items.IdUsuario = oUsuario.IdUsuario;
            items.Nombres = oUsuario.Nombres;
            items.Apellidos = oUsuario.Apellidos;
            items.Correo = oUsuario.Correo;
            items.Foto = imageUrl;
            items.Profecion = oUsuario.Profecion;
            items.IdRol = oUsuario.IdRol;
            items.Estado = oUsuario.Estado;

            Respuesta = NUsuario.getInstance().ActualizarUsuarioIa(items);
            return Respuesta;

        }

        [WebMethod]
        public static RespuestaZ<bool> EditarI(EUsuario oUsuario, byte[] imageBytes)
        {
            try
            {
                var imageUrl = string.Empty;

                List<EUsuario> Lista = NUsuario.getInstance().ObtenerUsuarios();
                var items = Lista.FirstOrDefault(x => x.IdUsuario == oUsuario.IdUsuario);

                if (items == null)
                {
                    return new RespuestaZ<bool>() { Estado = false, Mensage = "No se encontro el Usuario" };
                }

                if (imageBytes != null && imageBytes.Length > 0)
                {
                    var stream = new MemoryStream(imageBytes);
                    string folder = "/Imagenes/";
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

                items.IdUsuario = oUsuario.IdUsuario;
                items.Nombres = oUsuario.Nombres;
                items.Apellidos = oUsuario.Apellidos;
                items.Correo = oUsuario.Correo;
                items.Foto = imageUrl;
                items.Profecion = oUsuario.Profecion;
                items.IdRol = oUsuario.IdRol;
                items.Estado = oUsuario.Estado;

                bool Respuesta = NUsuario.getInstance().ActualizarUsuarioIa(items);
                //bool Respuesta = true;

                //return new RespuestaZ<bool>() { Estado = Respuesta, Mensage = Respuesta ? "Usuario actualizado correctamente" : "Error al actualizar el Correo ya Existe" };
                var respuesta = new RespuestaZ<bool>
                {
                    Estado = Respuesta,
                    Mensage = Respuesta ? "Usuario actualizado correctamente" : "Error al actualizar el Correo ya Existe",
                    Valor = Respuesta ? "success" : "warning"
                };

                return respuesta;
            }
            catch (Exception ex)
            {
                return new RespuestaZ<bool> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message };
            }

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

        [WebMethod]
        //[ScriptMethod(UseHttpGet = true)]
        public static Respuesta<List<ERol>> ObtenerRolGe()
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

        [WebMethod]
        public static Respuesta<List<EUsuario>> ObtenerUsuario()
        {
            List<EUsuario> Lista = NUsuario.getInstance().ObtenerUsuarios();
            //Lista = NUsuario.getInstance().ObtenerUsuarios();

            if (Lista != null)
            {
                return new Respuesta<List<EUsuario>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<EUsuario>>() { estado = false, objeto = null };
            }
        }
        public static string UploadPhotoIa(MemoryStream stream)
        {
            string rutaa = "";

            try
            {
                stream.Position = 0;

                var guid = Guid.NewGuid().ToString();
                var file = $"{guid}.jpg";
                string folder = "/Imagenes/";
                var fullPath = $"/Imagenes/{file}";
                rutaa = fullPath;
                var path = Path.Combine(HttpContext.Current.Server.MapPath(folder), file);


                File.WriteAllBytes(path, stream.ToArray());

                return rutaa;
            }
            catch
            {
                return rutaa;
            }
        }
    }
}