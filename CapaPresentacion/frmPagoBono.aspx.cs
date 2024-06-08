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
    public partial class frmPagoBono : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta<List<EPagoBono>> ObtenerDetalleBonoPCD(int Idpcd)
        {
            int currentYearLocal = DateTime.Now.Year;

            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            var itemsg = Listage.FirstOrDefault(x => x.Descripcion == currentYearLocal.ToString());

            List<EPagoBono> Lista = NPagoBono.getInstance().DetallePagosPersona(Idpcd, itemsg.Idges);

            if (Lista != null)
            {
                return new Respuesta<List<EPagoBono>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<EPagoBono>>() { estado = false, objeto = null };
            }
        }

        [WebMethod]
        public static Respuesta<List<EMeses>> ObtenerMeses()
        {
            //List<EMeses> selecnuevo = new List<EMeses>();

            //List<EPagoBono> ListaBo = NPagoBono.getInstance().DetallePagosPersona(1, 2);

            //foreach (var meses in ListaBo)
            //{

            //}

            List<EMeses> Lista = NTipos.getInstance().ObtenerMeses();

            if (Lista != null)
            {
                return new Respuesta<List<EMeses>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<EMeses>>() { estado = false, objeto = null };
            }
        }

        [WebMethod]
        public static Respuesta<List<EMeses>> ObtenerMesesFiltra(int Idpcd)
        {
            //int currentYearUtc = DateTime.UtcNow.Year;
            int currentYearLocal = DateTime.Now.Year;
            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            var itemsg = Listage.FirstOrDefault(x => x.Descripcion == currentYearLocal.ToString());

            if (itemsg == null)
            {
                return new Respuesta<List<EMeses>>() { estado = false, objeto = null };
            }

            List<EMeses> selecnuevo = new List<EMeses>();
            List<EMeses> Lista = NTipos.getInstance().ObtenerMeses();
            //List<EPagoBono> ListaBo = NPagoBono.getInstance().DetallePagosPersona(1002, 2);
            List<EPagoBono> ListaBo = NPagoBono.getInstance().DetallePagosPersona(Idpcd, itemsg.Idges);

            //float totalMontos = ListaBo.Sum(pago => pago.Monto);
            float totalMonto = ListaBo?.Sum(pago => pago.Monto) ?? 0;
            string totalactual = " " + totalMonto.ToString("F2") + " Bs";

            // Obtener los Ids de los meses que están en ListaBo
            var mesesPagados = ListaBo.Select(b => b.Idmes).ToList();

            // Filtrar los meses para excluir los que están en ListaBo
            selecnuevo = Lista.Where(m => !mesesPagados.Contains(m.Idmes)).ToList();

            if (Lista != null)
            {
                return new Respuesta<List<EMeses>>() { estado = true, objeto = selecnuevo, valor = totalactual };
            }
            else
            {
                return new Respuesta<List<EMeses>>() { estado = false, objeto = null };
            }
        }

        [WebMethod]
        public static RespuestaZ<int> GuardarBono(EPagoBono oPersonapcd)
        {
            try
            {
                if (oPersonapcd.Idmes == 12)
                {
                    return new RespuestaZ<int> { Estado = false, Mensage = "No puede Registrar Mes de Diciembre." };
                }
                int currentYearLocal = DateTime.Now.Year;

                int IdUsuario = Configuracion.oUsuario.IdUsuario;
                //oEGestion = new EGestion() { Descripcion = oPersonapcd.oEGestion.Descripcion},
                EPagoBono obj = new EPagoBono
                {
                    IdUsuario = IdUsuario,
                    Idpersodisca = oPersonapcd.Idpersodisca,
                    oEGestion = new EGestion() { Descripcion = currentYearLocal.ToString() },
                    Idmes = oPersonapcd.Idmes,
                    Monto = oPersonapcd.Monto
                };

                int Respues = NPagoBono.getInstance().RegistrarBono(obj);
                //int Respues = 1;

                if (Respues != 0)
                {
                    return new RespuestaZ<int> { Estado = true, Mensage = "Registro exitoso.", Valor = Respues.ToString() };
                }
                else
                {
                    return new RespuestaZ<int> { Estado = false, Mensage = "Ocurrió un error al registrar el pago." };
                }
            }
            catch (Exception ex)
            {
                return new RespuestaZ<int> { Estado = false, Mensage = "Ocurrió un error: " + ex.Message };
            }
        }

        [WebMethod]
        public static Respuesta<EPagoBono> ObtenerDetallePagoActual(int Idpcd)
        {
            try
            {
                var oPago = NPagoBono.getInstance().BuscarPagoBoboId(Idpcd);

                return oPago != null
                    ? new Respuesta<EPagoBono> { estado = true, objeto = oPago }
                    : new Respuesta<EPagoBono> { estado = false, objeto = null };
            }
            catch (Exception ex)
            {
                return new Respuesta<EPagoBono>
                {
                    estado = false,
                    objeto = null,
                    valor = "Ocurrió un error: " + ex.Message
                };
            }
        }
    }
}