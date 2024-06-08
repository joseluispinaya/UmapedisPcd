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
    public class DPagoBono
    {
        #region "PATRON SINGLETON"
        public static DPagoBono _instancia = null;

        private DPagoBono()
        {

        }

        public static DPagoBono getInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DPagoBono();
            }
            return _instancia;
        }
        #endregion

        public int RegistrarBono(EPagoBono oUsuario)
        {
            int respuesta = 0;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_RegistrarBono", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@IdUsuario", oUsuario.IdUsuario);
                        cmd.Parameters.AddWithValue("@Idpersodisca", oUsuario.Idpersodisca);
                        cmd.Parameters.AddWithValue("@ges", oUsuario.oEGestion.Descripcion);
                        cmd.Parameters.AddWithValue("@Idmes", oUsuario.Idmes);
                        cmd.Parameters.AddWithValue("@Monto", oUsuario.Monto);
                        SqlParameter outputParam = new SqlParameter("@Resultado", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(outputParam);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        respuesta = Convert.ToInt32(outputParam.Value);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el usuario. Intente más tarde.", ex);
            }

            return respuesta;
        }

        public List<EPagoBono> DetallePagosPersona(int Idpersonapcd, int Idgesti)
        {
            List<EPagoBono> rptListaBono = new List<EPagoBono>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_DetallePagoBonoPCD", con))
                    {
                        cmd.Parameters.AddWithValue("@Idpersodisca", Idpersonapcd);
                        cmd.Parameters.AddWithValue("@Idges", Idgesti);
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaBono.Add(new EPagoBono()
                                {
                                    Idbono = Convert.ToInt32(dr["Idbono"]),
                                    Idmes = Convert.ToInt32(dr["Idmes"]),
                                    oEMeses = new EMeses
                                    {
                                        Idmes = Convert.ToInt32(dr["Idmes"]),
                                        Descripcion = dr["Descripcion"].ToString()
                                    },
                                    //Monto = Convert.ToSingle(dr["Monto"]),
                                    Monto = float.Parse(dr["Monto"].ToString()),
                                    FechaRegistro = Convert.ToDateTime(dr["FechaRegistro"].ToString()).ToString("dd/MM/yyyy"),
                                    Fecha = Convert.ToDateTime(dr["FechaRegistro"]),
                                    oUsuario = new EUsuario
                                    {
                                        Nombres = dr["NomAdmin"].ToString()
                                    },
                                    Estado = Convert.ToBoolean(dr["Estado"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los detalles del pago de bono", ex);
            }

            return rptListaBono;
        }
        public EPagoBono BuscarPagoBoboId(int idpcd)
        {
            EPagoBono objusu = null;

            try
            {
                using (var con = ConexionBD.getInstance().ConexionDB())
                using (var comando = new SqlCommand("RtbonoNul", con))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Idbono", idpcd);

                    con.Open();

                    using (var dr = comando.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            objusu = new EPagoBono
                            {
                                Idbono = Convert.ToInt32(dr["Idbono"]),
                                FechaRegistro = Convert.ToDateTime(dr["FechaRegistro"].ToString()).ToString("dd/MM/yyyy"),
                                oEMeses = new EMeses() { Descripcion = dr["Descripcion"].ToString() },
                                Codigo = dr["Codigo"].ToString(),
                                oEPersonasDisca = new EPersonasDisca() { 
                                    Nombres = dr["Pcd"].ToString(), 
                                    Ciperso = dr["Ciperso"].ToString(),
                                    Codcarnetdisca = dr["Codcarnetdisca"].ToString(),
                                    oTutor = new ETutor()
                                    {
                                        Nombres = dr["Nombrereapoderado"].ToString(),
                                        Ciapoderado = dr["Ciapoderado"].ToString(),
                                        Parentesco = dr["Parentesco"].ToString(),
                                    }
                                },
                                oUsuario = new EUsuario() { 
                                    Nombres = dr["NomAdmin"].ToString(),
                                }
                            };
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                // Manejo de excepciones específicas de SQL
                // Log(sqlEx); // Implementa tu método de logging aquí
                throw new Exception("Error en la base de datos", sqlEx);
            }
            catch (Exception ex)
            {
                // Manejo de excepciones generales
                // Log(ex); // Implementa tu método de logging aquí
                throw new Exception("Error general", ex);
            }

            return objusu;
        }
    }
}
