using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DTipos
    {
        #region "PATRON SINGLETON"
        public static DTipos _instancia = null;

        private DTipos()
        {

        }

        public static DTipos getInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DTipos();
            }
            return _instancia;
        }
        #endregion

        public List<ERol> ObtenerRoles()
        {
            List<ERol> rptListaRol = new List<ERol>();
            SqlConnection con = null;
            SqlCommand Comando = null;
            SqlDataReader dr = null;

            try
            {
                con = ConexionBD.getInstance().ConexionDB();
                Comando = new SqlCommand("usp_ObtenerRoles", con);

                Comando.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = Comando.ExecuteReader();

                while (dr.Read())
                {
                    rptListaRol.Add(new ERol()
                    {
                        Idrol = Convert.ToInt32(dr["IdRol"].ToString()),
                        NomRol = dr["Descripcion"].ToString(),
                        Activo = Convert.ToBoolean(dr["Activo"].ToString())
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return rptListaRol;
        }
        public List<ERol> ObtenerRol()
        {
            List<ERol> rptListaRol = new List<ERol>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerRoles", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaRol.Add(new ERol()
                                {
                                    Idrol = Convert.ToInt32(dr["IdRol"]),
                                    NomRol = dr["Descripcion"].ToString(),
                                    Activo = Convert.ToBoolean(dr["Activo"])
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

            return rptListaRol;
        }

        public List<EMeses> ObtenerMeses()
        {
            List<EMeses> rptListaRol = new List<EMeses>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerMeses", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaRol.Add(new EMeses()
                                {
                                    Idmes = Convert.ToInt32(dr["Idmes"]),
                                    Descripcion = dr["Descripcion"].ToString()
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener los meses", ex);
            }

            return rptListaRol;
        }

        public List<EGestion> ObtenerGestion()
        {
            List<EGestion> rptListaRol = new List<EGestion>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerGestion", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaRol.Add(new EGestion()
                                {
                                    Idges = Convert.ToInt32(dr["Idges"]),
                                    Descripcion = dr["Descripcion"].ToString()
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener los meses", ex);
            }

            return rptListaRol;
        }

        //metodos para asociacion

        public bool RegistrarAsociacion(EAsociacion asocia)
        {
            bool respuesta = false;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_RegistrarAsociacion", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Descripcion", asocia.Descripcion);
                        cmd.Parameters.AddWithValue("@Responsable", asocia.Responsable);

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
                throw new Exception("Error al registrar. Intente más tarde.", ex);
            }

            return respuesta;
        }

        public bool ActualizarAsociacion(EAsociacion asocia)
        {
            bool respuesta = false;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("usp_ModificarAsociacion", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Idasoci", asocia.Idasoci);
                        cmd.Parameters.AddWithValue("@Descripcion", asocia.Descripcion);
                        cmd.Parameters.AddWithValue("@Responsable", asocia.Responsable);
                        cmd.Parameters.AddWithValue("@Activo", asocia.Activo);

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
                throw new Exception("Error al actualizar. Intente más tarde.", ex);
            }

            return respuesta;
        }
        public List<EAsociacion> ObtenerAsociacion()
        {
            List<EAsociacion> rptListaRol = new List<EAsociacion>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerAsociaciones", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaRol.Add(new EAsociacion()
                                {
                                    Idasoci = Convert.ToInt32(dr["Idasoci"]),
                                    Descripcion = dr["Descripcion"].ToString(),
                                    Responsable = dr["Responsable"].ToString(),
                                    Activo = Convert.ToBoolean(dr["Activo"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener las asociaciones", ex);
            }

            return rptListaRol;
        }

        // fin metodos asociacion
        public List<ETipoDisca> ObtenerTiposDisca()
        {
            List<ETipoDisca> rptListaRol = new List<ETipoDisca>();

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("usp_ObtenerTiposDisca", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader dr = comando.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                rptListaRol.Add(new ETipoDisca()
                                {
                                    Idtipodisca = Convert.ToInt32(dr["Idtipodisca"]),
                                    Descripcion = dr["Descripcion"].ToString(),
                                    Activo = Convert.ToBoolean(dr["Activo"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
                throw new Exception("Error al obtener los tiposdisca", ex);
            }

            return rptListaRol;
        }
    }
}
