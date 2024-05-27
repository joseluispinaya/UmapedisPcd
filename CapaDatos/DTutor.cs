using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaEntidad;

namespace CapaDatos
{
    public class DTutor
    {
        #region "PATRON SINGLETON"
        public static DTutor _instancia = null;

        private DTutor()
        {

        }

        public static DTutor getInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DTutor();
            }
            return _instancia;
        }
        #endregion

        public List<ETutor> ObtenerTutores()
        {
            List<ETutor> rptListaUsuario = new List<ETutor>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerTutores", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaUsuario.Add(new ETutor()
                                {
                                    Idtutor = Convert.ToInt32(dr["Idtutor"]),
                                    Ciapoderado = dr["Ciapoderado"].ToString(),
                                    Nombres = dr["Nombrereapoderado"].ToString(),
                                    Parentesco = dr["Parentesco"].ToString(),
                                    Celular = dr["Celular"].ToString()
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener los Tutores", ex);
            }

            return rptListaUsuario;
        }
    }
}
