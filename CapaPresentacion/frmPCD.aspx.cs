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

        [WebMethod]
        public static RespuestaZ<int> GuardarPcd(EPersonasDisca oPersonapcd, byte[] imageBytes)
        {
            try
            {
                var imageUrl = string.Empty;

                if (imageBytes != null && imageBytes.Length > 0)
                {
                    var stream = new MemoryStream(imageBytes);
                    string folder = "/ImagePcd/";
                    imageUrl = Utilidadesj.getInstance().UploadPhoto(stream, folder);
                }

                int IdUsuario = Configuracion.oUsuario.IdUsuario;
                bool cobra = false;
                int pors = Convert.ToInt32(oPersonapcd.Porsentaje);
                if (pors >= 51)
                {
                    cobra = true;
                }

                EPersonasDisca obj = new EPersonasDisca
                {
                    IdUsuario = IdUsuario,
                    Idasoci = oPersonapcd.Idasoci,
                    Idtipodisca = oPersonapcd.Idtipodisca,
                    Ciperso = oPersonapcd.Ciperso,
                    Codcarnetdisca = oPersonapcd.Codcarnetdisca,
                    Porsentaje = oPersonapcd.Porsentaje,
                    Nombres = oPersonapcd.Nombres,
                    Apellidos = oPersonapcd.Apellidos,
                    Sexo = oPersonapcd.Sexo,
                    Foto = imageUrl,
                    EstadoBono = cobra,
                    oTutor = oPersonapcd.oTutor
                };
                int Respues = NPersonasDisca.getInstance().RegistrarPCD(obj);
                //int Respues = 2;

                if (Respues == 0)
                {
                    return new RespuestaZ<int> { Estado = false, Mensage = "Ocurrió un error al registrar la persona con discapacidad." };
                }
                else if (Respues == -1)
                {
                    return new RespuestaZ<int> { Estado = false, Mensage = "El número de cédula de la persona ya existe en el registro." };
                }
                else
                {
                    return new RespuestaZ<int> { Estado = true, Mensage = "Registro exitoso.", Valor = Respues.ToString() };
                }
            }
            catch (Exception ex)
            {
                return new RespuestaZ<int> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message };
            }
        }

        [WebMethod]
        public static Respuesta<List<EPersonasDisca>> ObtenerPersonaPCD()
        {
            List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();
            //Lista = NUsuario.getInstance().ObtenerUsuarios();

            if (Lista != null)
            {
                return new Respuesta<List<EPersonasDisca>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<EPersonasDisca>>() { estado = false, objeto = null };
            }
        }
        [WebMethod]
        public static Respuesta<EPersonasDisca> ObtenerDetalleP(int Idpcd)
        {
            List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();
            var items = Lista.FirstOrDefault(x => x.Idpersodisca == Idpcd);

            if (items != null)
                return new Respuesta<EPersonasDisca>() { estado = true, objeto = items };
            else
                return new Respuesta<EPersonasDisca>() { estado = false, objeto = null };
        }
        //para report
        [WebMethod]
        public static Respuesta<EPersonasDisca> ObtenerDetaRpt(string Ncip)
        {
            List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();
            var items = Lista.FirstOrDefault(x => x.Ciperso == Ncip);

            if (items != null)
                return new Respuesta<EPersonasDisca>() { estado = true, objeto = items };
            else
                return new Respuesta<EPersonasDisca>() { estado = false, objeto = null };
        }

        [WebMethod]
        public static Respuesta<ETutor> ObtenerTutorP(int IdTutor)
        {
            List<ETutor> Lista = NTutor.getInstance().ObtenerTutores();
            var items = Lista.FirstOrDefault(x => x.Idtutor == IdTutor);

            if (items != null)
                return new Respuesta<ETutor>() { estado = true, objeto = items };
            else
                return new Respuesta<ETutor>() { estado = false, objeto = null };
        }

        [WebMethod]
        public static RespuestaZ<bool> GuardarTutor(ETutor oTutor, int Idpcd)
        {
            try
            {
                if (Idpcd == 0)
                {
                    return new RespuestaZ<bool>() { Estado = false, Mensage = "No se encontro el PCD a Relacionar" };
                }
                ETutor obj = new ETutor
                {
                    //Idtutor = oTutor.Idtutor,
                    Ciapoderado = oTutor.Ciapoderado,
                    Nombres = oTutor.Nombres,
                    Parentesco = oTutor.Parentesco,
                    Celular = oTutor.Celular
                };

                bool Respuesta = NTutor.getInstance().RegistrarTutor(Idpcd, obj);
                //bool Respuesta = true;
                var respuesta = new RespuestaZ<bool>
                {
                    Estado = Respuesta,
                    Mensage = Respuesta ? "Tutor Registrado correctamente" : "Ocurrio un error intente mas tarde",
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