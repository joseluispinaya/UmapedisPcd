using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class NTipos
    {
        #region "PATRON SINGLETON"
        private static NTipos instancia = null;
        private NTipos() { }
        public static NTipos getInstance()
        {
            if (instancia == null)
            {
                instancia = new NTipos();
            }
            return instancia;
        }
        #endregion

        //metodo IA
        public List<ERol> ObtenerRol()
        {
            return DTipos.getInstance().ObtenerRol();
        }
        public List<EMeses> ObtenerMeses()
        {
            return DTipos.getInstance().ObtenerMeses();
        }
        public List<EGestion> ObtenerGestion()
        {
            return DTipos.getInstance().ObtenerGestion();
        }

        public bool RegistrarAsociacion(EAsociacion asocia)
        {
            return DTipos.getInstance().RegistrarAsociacion(asocia);
        }

        public bool ActualizarAsociacion(EAsociacion asocia)
        {
            return DTipos.getInstance().ActualizarAsociacion(asocia);
        }

        public List<EAsociacion> ObtenerAsociacion()
        {
            return DTipos.getInstance().ObtenerAsociacion();
        }

        //filtrar
        public List<EAsociacion> AsosciconPcd()
        {
            List<EAsociacion> rptListaAsociCompleta = new List<EAsociacion>();
            try
            {
                var Lista = DTipos.getInstance().ObtenerAsociacion();
                var ListaPcd = DPersonasDisca.getInstance().ObtenerPersonasPcd();

                foreach (var asociaconpcd in Lista)
                {
                    var personasEnAsociacion = ListaPcd.Where(pcd => pcd.Idasoci == asociaconpcd.Idasoci).ToList();

                    rptListaAsociCompleta.Add(new EAsociacion()
                    {
                        Idasoci = asociaconpcd.Idasoci,
                        Descripcion = asociaconpcd.Descripcion,
                        Responsable = asociaconpcd.Responsable,
                        Activo = asociaconpcd.Activo,
                        oListaPcd = personasEnAsociacion
                    });
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener la lista completa de asociaciones", ex);
            }
            return rptListaAsociCompleta;
        }
        public List<ETipoDisca> ObtenerTiposDisca()
        {
            return DTipos.getInstance().ObtenerTiposDisca();
        }
        public List<ERol> ObtenerRoles()
        {
            try
            {
                return DTipos.getInstance().ObtenerRoles();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
