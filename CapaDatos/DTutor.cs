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

        public bool RegistrarTutor(int idpersodisca, ETutor oETutor)
        {
            bool respuesta = false;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_RegistrarTutordePCD", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Idpersodisca", idpersodisca);
                        cmd.Parameters.AddWithValue("@Ciapoderado", oETutor.Ciapoderado);
                        cmd.Parameters.AddWithValue("@Nombrereapoderado", oETutor.Nombres);
                        cmd.Parameters.AddWithValue("@Parentesco", oETutor.Parentesco);
                        cmd.Parameters.AddWithValue("@Celular", oETutor.Celular);
                        SqlParameter outputParam = new SqlParameter("@Resultado", SqlDbType.Bit)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(outputParam);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        respuesta = Convert.ToBoolean(outputParam.Value);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al Registrar el Tutor. Intente más tarde.", ex);
            }

            return respuesta;
        }

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
