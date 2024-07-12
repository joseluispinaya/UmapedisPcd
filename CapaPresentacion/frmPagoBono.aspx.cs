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
        public static Respuesta<int> Iniciar()
        {
            int currentYearLocal = DateTime.Now.Year;
            //int currentYearLocal = 2021;

            int GestionAcc = NUsuario.getInstance().ObtenerGestionAct();
            if (GestionAcc != currentYearLocal)
            {
                return new Respuesta<int>() { estado = false };
            }
            //Configuracion.oUsuario = new EUsuario() { IdUsuario = IdUsuario };


            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            var itemsg = Listage.FirstOrDefault(x => x.Descripcion == currentYearLocal.ToString());
            if (itemsg == null)
            {
                return new Respuesta<int>() { estado = false };
            }
            else
            {
                return new Respuesta<int>() { estado = true ,valor = GestionAcc.ToString()};
            }
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
        // gestion pasada
        [WebMethod]
        public static Respuesta<List<EPagoBono>> ObtenerDetalleBonoPCDpasado(int Idpcd)
        {
            int currentYearLocal = DateTime.Now.Year;
            int gestpasado = currentYearLocal - 1;
            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            var itemsg = Listage.FirstOrDefault(x => x.Descripcion == gestpasado.ToString());

            List<EPagoBono> Lista = NPagoBono.getInstance().DetallePagosPersona(Idpcd, itemsg.Idges);

            float totalMonto = Lista?.Sum(pago => pago.Monto) ?? 0;
            string totalactualpasa = " " + totalMonto.ToString("F2") + " Bs";

            if (Lista != null)
            {
                return new Respuesta<List<EPagoBono>>() { estado = true, objeto = Lista, valor = totalactualpasa };
            }
            else
            {
                return new Respuesta<List<EPagoBono>>() { estado = false, objeto = null };
            }
        }
        //sin usar
        [WebMethod]
        public static Respuesta<List<EMeses>> ObtenerMeses()
        {
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
        public static Respuesta<List<EMeses>> ObtenerMesesPasa(int Idpcd)
        {
            string di = "0";
            int currentYearLocal = DateTime.Now.Year;
            int gestpasado = currentYearLocal - 1;
            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            var itemsg = Listage.FirstOrDefault(x => x.Descripcion == gestpasado.ToString());

            List<EPagoBono> ListaBo = NPagoBono.getInstance().DetallePagosPersona(Idpcd, itemsg.Idges);
            var dic = ListaBo.FirstOrDefault(x => x.Idmes == 12);
            if (dic != null)
            {
                di = "1";
            }

            // Obtener la lista completa de meses
            List<EMeses> Lista = NTipos.getInstance().ObtenerMeses();

            if (Lista != null)
            {
                // Filtrar la lista para obtener solo el mes de diciembre
                List<EMeses> diciembre = Lista.Where(mes => mes.Idmes == 12).ToList();

                return new Respuesta<List<EMeses>>() { estado = true, objeto = diciembre, valor = di };
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
                EPagoBono obj = new EPagoBono
                {
                    IdUsuario = IdUsuario,
                    Idpersodisca = oPersonapcd.Idpersodisca,
                    oEGestion = new EGestion() { Descripcion = currentYearLocal.ToString() },
                    //oEGestion = new EGestion() { Descripcion = "2023" },
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
        public static RespuestaZ<int> GuardarBonoPruebaante(EPagoBono oPersonapcd)
        {
            try
            {
                int currentYearLocal = DateTime.Now.Year;

                int IdUsuario = Configuracion.oUsuario.IdUsuario;
                EPagoBono obj = new EPagoBono
                {
                    IdUsuario = IdUsuario,
                    Idpersodisca = oPersonapcd.Idpersodisca,
                    //oEGestion = new EGestion() { Descripcion = currentYearLocal.ToString() },
                    oEGestion = new EGestion() { Descripcion = "2023" },
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
        public static Respuesta<List<EPagoBono>> ObtenerDetalleGeneralP(int Idpcd)
        {
            try
            {
                List<EPagoBono> Lista = NPagoBono.getInstance().ObtenerInfoGenera(Idpcd);
                float total = Lista?.Sum(p => p.Monto) ?? 0;
                var totcade = total.ToString("F2") + " Bs";
                if (Lista != null)
                {
                    return new Respuesta<List<EPagoBono>>() { estado = true, objeto = Lista, valor = totcade };
                }
                else
                {
                    return new Respuesta<List<EPagoBono>>() { estado = false, objeto = null };
                }
            }
            catch (Exception ex)
            {
                return new Respuesta<List<EPagoBono>>() { estado = false, objeto = null, valor = $"Error : {ex.Message}" };
            }
        }

        [WebMethod]
        public static Respuesta<List<EPagoBono>> ObtenerDetalledeGeneral(int Idpcd, int IdGest)
        {

            List<EPagoBono> Lista = NPagoBono.getInstance().DetallePagosPersona(Idpcd, IdGest);

            float totalMonto = Lista?.Sum(pago => pago.Monto) ?? 0;
            string totalactualpasa = totalMonto.ToString("F2") + " Bs";

            if (Lista != null)
            {
                return new Respuesta<List<EPagoBono>>() { estado = true, objeto = Lista, valor = totalactualpasa };
            }
            else
            {
                return new Respuesta<List<EPagoBono>>() { estado = false, objeto = null };
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