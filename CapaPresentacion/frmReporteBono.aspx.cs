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
        public static Respuesta<List<EGestion>> ObtenerGestiones()
        {
            List<EGestion> Listage = NTipos.getInstance().ObtenerGestion();
            if (Listage != null)
            {
                return new Respuesta<List<EGestion>>() { estado = true, objeto = Listage };
            }
            else
            {
                return new Respuesta<List<EGestion>>() { estado = false, objeto = null };
            }
        }
        [WebMethod]
        public static Respuesta<List<ResumenPagoBono>> ObtenerResum(int Idges)
        {
            List<ResumenPagoBono> Lista = NPagoBono.getInstance().ObtenerResumen();

            if (Lista != null)
            {
                if(Idges != 0)
                {
                    Lista = Lista.Where(g => g.Idges == Idges).ToList();
                }

                return new Respuesta<List<ResumenPagoBono>>() { estado = true, objeto = Lista };
            }
            else
            {
                return new Respuesta<List<ResumenPagoBono>>() { estado = false, objeto = null };
            }
        }

        [WebMethod]
        public static Respuesta<List<EPersonasDisca>> ObtenerPersonaPCDEstado(int IdEstado)
        {
            var Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();

            List<EPersonasDisca> resultado = null;

            if (Lista != null)
            {
                if (IdEstado == 1)
                {
                    resultado = Lista.Where(p => p.EstadoBono == true).ToList();
                }
                else if (IdEstado == 2)
                {
                    resultado = Lista.Where(p => p.EstadoBono == false).ToList();
                }
                else
                {
                    resultado = Lista;
                }
            }
            bool estado = resultado != null;
            return new Respuesta<List<EPersonasDisca>>() { estado = estado, objeto = resultado };

        }

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
        public static Respuesta<List<EPagoBono>> ObtenerConsultaGesMes(int IdGest, int Idmes)
        {
            List<EPagoBono> Lista = NPagoBono.getInstance().ConsultaPagoGesMes(IdGest, Idmes);

            float totalMonto = Lista?.Sum(pago => pago.Monto) ?? 0;
            string totalactualpasa = "  " + totalMonto.ToString("F2") + " Bs";

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
        public static Respuesta<List<EPersonasDisca>> ObtenerPersonaPCDEstadoa(int IdEstado)
        {
            List<EPersonasDisca> Lista = NPersonasDisca.getInstance().ObtenerPersonasPcd();

            if (Lista != null)
            {
                if (IdEstado == 1)
                {
                    Lista = Lista.Where(p => p.EstadoBono == true).ToList();
                    return new Respuesta<List<EPersonasDisca>>() { estado = true, objeto = Lista };
                }
                else if (IdEstado == 2)
                {
                    Lista = Lista.Where(p => p.EstadoBono == false).ToList();
                    return new Respuesta<List<EPersonasDisca>>() { estado = true, objeto = Lista };
                }
                else
                {
                    return new Respuesta<List<EPersonasDisca>>() { estado = true, objeto = Lista };
                }
            }
            else
            {
                return new Respuesta<List<EPersonasDisca>>() { estado = false, objeto = null };
            }
        }
        
    }
}