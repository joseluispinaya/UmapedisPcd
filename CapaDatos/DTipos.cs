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
