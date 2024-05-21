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
    public class DUsuario
    {
        #region "PATRON SINGLETON"
        public static DUsuario _instancia = null;

        private DUsuario()
        {

        }

        public static DUsuario getInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DUsuario();
            }
            return _instancia;
        }
        #endregion

        public bool RegistrarUsuario(EUsuario oUsuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool respuesta = true;

            try
            {
                con = ConexionBD.getInstance().ConexionDB();
                cmd = new SqlCommand("usp_RegistrarUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Nombres", oUsuario.Nombres);
                cmd.Parameters.AddWithValue("Apellidos", oUsuario.Apellidos);
                cmd.Parameters.AddWithValue("Correo", oUsuario.Correo);
                cmd.Parameters.AddWithValue("Clave", oUsuario.Clave);
                cmd.Parameters.AddWithValue("Foto", oUsuario.Foto);
                cmd.Parameters.AddWithValue("Profecion", oUsuario.Profecion);
                cmd.Parameters.AddWithValue("IdRol", oUsuario.IdRol);
                cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                con.Open();

                cmd.ExecuteNonQuery();
                respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
            }
            catch (Exception ex)
            {
                respuesta = false;
                throw new Exception("Error al obtener los roles", ex);
                //throw ex;
            }
            finally
            {
                con.Close();
            }
            return respuesta;
        }
        public bool ActualizarUsuarioIa(EUsuario oUsuario)
        {
            bool respuesta = false;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_ModificarUsuario", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@IdUsuario", oUsuario.IdUsuario);
                        cmd.Parameters.AddWithValue("@Nombres", oUsuario.Nombres);
                        cmd.Parameters.AddWithValue("@Apellidos", oUsuario.Apellidos);
                        cmd.Parameters.AddWithValue("@Correo", oUsuario.Correo);
                        cmd.Parameters.AddWithValue("@Clave", oUsuario.Clave);
                        cmd.Parameters.AddWithValue("@Foto", oUsuario.Foto);
                        cmd.Parameters.AddWithValue("@Profecion", oUsuario.Profecion);
                        cmd.Parameters.AddWithValue("@IdRol", oUsuario.IdRol);
                        cmd.Parameters.AddWithValue("@Activo", oUsuario.Estado);
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
                throw new Exception("Error al actualizar el usuario. Intente más tarde.", ex);
            }

            return respuesta;
        }
        public bool ActualizarUsuarioIi(EUsuario oUsuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool respuesta = true;

            try
            {
                con = ConexionBD.getInstance().ConexionDB();
                cmd = new SqlCommand("usp_ModificarUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("IdUsuario", oUsuario.IdUsuario);
                cmd.Parameters.AddWithValue("Nombres", oUsuario.Nombres);
                cmd.Parameters.AddWithValue("Apellidos", oUsuario.Apellidos);
                cmd.Parameters.AddWithValue("Correo", oUsuario.Correo);
                cmd.Parameters.AddWithValue("Clave", oUsuario.Clave);
                cmd.Parameters.AddWithValue("Foto", oUsuario.Foto);
                cmd.Parameters.AddWithValue("Profecion", oUsuario.Profecion);
                cmd.Parameters.AddWithValue("IdRol", oUsuario.IdRol);
                cmd.Parameters.AddWithValue("Activo", oUsuario.Estado);
                cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                con.Open();

                cmd.ExecuteNonQuery();
                respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
            }
            catch (Exception ex)
            {
                respuesta = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return respuesta;
        }
        public List<EUsuario> ObtenerUsuarios()
        {
            List<EUsuario> rptListaUsuario = new List<EUsuario>();
            SqlConnection con = null;
            SqlCommand Comando = null;
            SqlDataReader dr = null;

            try
            {
                con = ConexionBD.getInstance().ConexionDB();
                Comando = new SqlCommand("usp_ObtenerUsuario", con);

                Comando.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = Comando.ExecuteReader();

                while (dr.Read())
                {
                    rptListaUsuario.Add(new EUsuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["IdUsuario"].ToString()),
                        Nombres = dr["Nombres"].ToString(),
                        Apellidos = dr["Apellidos"].ToString(),
                        Correo = dr["Correo"].ToString(),
                        Clave = dr["Clave"].ToString(),
                        Foto = dr["Foto"].ToString(),
                        Profecion = dr["Profecion"].ToString(),
                        IdRol = Convert.ToInt32(dr["IdRol"].ToString()),
                        oRol = new ERol() { NomRol = dr["DescripcionRol"].ToString() },
                        Estado = Convert.ToBoolean(dr["Activo"])


                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los roles", ex);
                //throw ex;
            }
            finally
            {
                con.Close();
                //Conexion.CerrarConexion();
            }
            return rptListaUsuario;
        }
        public List<EUsuario> ObtenerUsuariosZ()
        {
            List<EUsuario> rptListaUsuario = new List<EUsuario>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerUsuario", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaUsuario.Add(new EUsuario()
                                {
                                    IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                    Nombres = dr["Nombres"].ToString(),
                                    Apellidos = dr["Apellidos"].ToString(),
                                    Correo = dr["Correo"].ToString(),
                                    Clave = dr["Clave"].ToString(),
                                    Foto = dr["Foto"].ToString(),
                                    Profecion = dr["Profecion"].ToString(),
                                    IdRol = Convert.ToInt32(dr["IdRol"]),
                                    oRol = new ERol() { NomRol = dr["DescripcionRol"].ToString() },
                                    Estado = Convert.ToBoolean(dr["Activo"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener los roles", ex);
            }

            return rptListaUsuario;
        }

        public int LoginUsuarioA(string Usuario, string Clave)
        {
            int respuesta = 0;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_LoginUsuario", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("Correo", Usuario);
                        cmd.Parameters.AddWithValue("Clave", Clave);
                        SqlParameter outputParam = new SqlParameter("IdUsuario", SqlDbType.Int)
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

        public int LoginUsuario(string Usuario, string Clave)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            int respuesta = 0;

            try
            {
                con = ConexionBD.getInstance().ConexionDB();
                cmd = new SqlCommand("usp_LoginUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Correo", Usuario);
                cmd.Parameters.AddWithValue("Clave", Clave);
                cmd.Parameters.Add("IdUsuario", SqlDbType.Int).Direction = ParameterDirection.Output;

                con.Open();

                cmd.ExecuteNonQuery();

                respuesta = Convert.ToInt32(cmd.Parameters["IdUsuario"].Value);
            }
            catch (Exception ex)
            {
                respuesta = 0;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return respuesta;
        }
    }
}
