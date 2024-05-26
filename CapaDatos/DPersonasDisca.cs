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
    public class DPersonasDisca
    {
        #region "PATRON SINGLETON"
        public static DPersonasDisca _instancia = null;

        private DPersonasDisca()
        {

        }

        public static DPersonasDisca getInstance()
        {
            if (_instancia == null)
            {
                _instancia = new DPersonasDisca();
            }
            return _instancia;
        }
        #endregion

        public int RegistrarPCD(EPersonasDisca personaDisca)
        {
            int respuesta = 0;

            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand cmd = new SqlCommand("InsertarPersonaPCD", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@IdUsuario", personaDisca.IdUsuario);
                        cmd.Parameters.AddWithValue("@Idasoci", personaDisca.Idasoci);
                        cmd.Parameters.AddWithValue("@Idtipodisca", personaDisca.Idtipodisca);

                        cmd.Parameters.AddWithValue("@Ciapoderado", (object)personaDisca.oTutor?.Ciapoderado ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Nombrereapoderado", (object)personaDisca.oTutor?.Nombres ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Parentesco", (object)personaDisca.oTutor?.Parentesco ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Celular", (object)personaDisca.oTutor?.Celular ?? DBNull.Value);

                        cmd.Parameters.AddWithValue("@Ciperso", personaDisca.Ciperso);
                        cmd.Parameters.AddWithValue("@Codcarnetdisca", personaDisca.Codcarnetdisca);
                        cmd.Parameters.AddWithValue("@Porsentaje", personaDisca.Porsentaje);
                        cmd.Parameters.AddWithValue("@Nombres", personaDisca.Nombres);
                        cmd.Parameters.AddWithValue("@Apellidos", personaDisca.Apellidos);
                        cmd.Parameters.AddWithValue("@Sexo", personaDisca.Sexo);
                        cmd.Parameters.AddWithValue("@Foto", personaDisca.Foto);
                        cmd.Parameters.AddWithValue("@EstadoBono", personaDisca.EstadoBono);

                        // Añadir parámetro de salida para el Idpersodisca
                        SqlParameter outputParam = new SqlParameter("@NuevoIdpersodisca", SqlDbType.Int)
                        {
                            Direction = ParameterDirection.Output
                        };
                        cmd.Parameters.Add(outputParam);
                        // Abrir conexión y ejecutar el comando
                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Obtener el valor del parámetro de salida
                        respuesta = Convert.ToInt32(outputParam.Value);

                        // Manejar el caso de duplicado
                        //if (respuesta == -1)
                        //{
                        //    throw new Exception("El CI de la persona ya está registrado.");
                        //}
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al registrar el PCD. Intente más tarde.", ex);
            }

            return respuesta;
        }
        public List<EPersonasDisca> ObtenerPersonasPcd()
        {
            List<EPersonasDisca> rptLista = new List<EPersonasDisca>();
            try
            {
                using (SqlConnection con = ConexionBD.getInstance().ConexionDB())
                {
                    using (SqlCommand comando = new SqlCommand("sp_GetPersonasPCD", con))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                EPersonasDisca persona = new EPersonasDisca
                                {
                                    Idpersodisca = reader.GetInt32(reader.GetOrdinal("Idpersodisca")),
                                    IdUsuario = reader.GetInt32(reader.GetOrdinal("IdUsuario")),
                                    oUsuario = new EUsuario
                                    {
                                        //IdUsuario = reader.GetInt32(reader.GetOrdinal("IdUsuario")),
                                        Nombres = reader.GetString(reader.GetOrdinal("NomAdmin"))
                                    },
                                    Idasoci = reader.GetInt32(reader.GetOrdinal("Idasoci")),
                                    oAsociacion = new EAsociacion
                                    {
                                        //Idasoci = reader.GetInt32(reader.GetOrdinal("Idasoci")),
                                        Descripcion = reader.GetString(reader.GetOrdinal("DescripcionAsociacion"))
                                    },
                                    Idtipodisca = reader.GetInt32(reader.GetOrdinal("Idtipodisca")),
                                    oTipoDisca = new ETipoDisca
                                    {
                                        //Idtipodisca = reader.GetInt32(reader.GetOrdinal("Idtipodisca")),
                                        Descripcion = reader.GetString(reader.GetOrdinal("DescripcionTipodisca"))
                                    },
                                    Idtutor = reader.IsDBNull(reader.GetOrdinal("Idtutor")) ? 0 : reader.GetInt32(reader.GetOrdinal("Idtutor")),
                                    oTutor = new ETutor
                                    {
                                        //Idtutor = reader.IsDBNull(reader.GetOrdinal("Idtutor")) ? 0 : reader.GetInt32(reader.GetOrdinal("Idtutor")),
                                        //Nombres = reader.IsDBNull(reader.GetOrdinal("Nombrereapoderado")) ? "sin tutor" : reader.GetString(reader.GetOrdinal("Nombrereapoderado")),
                                        Nombres = reader.GetString(reader.GetOrdinal("Nombrereapoderado"))
                                    },
                                    Ciperso = reader.GetString(reader.GetOrdinal("Ciperso")),
                                    Codcarnetdisca = reader.GetString(reader.GetOrdinal("Codcarnetdisca")),
                                    Porsentaje = reader.GetString(reader.GetOrdinal("Porsentaje")),
                                    Nombres = reader.GetString(reader.GetOrdinal("Nombres")),
                                    Apellidos = reader.GetString(reader.GetOrdinal("Apellidos")),
                                    Sexo = reader.GetString(reader.GetOrdinal("Sexo"))[0].ToString(),
                                    Foto = reader.IsDBNull(reader.GetOrdinal("Foto")) ? null : reader.GetString(reader.GetOrdinal("Foto")),
                                    EstadoBono = reader.GetBoolean(reader.GetOrdinal("EstadoBono")),
                                    Estado = reader.GetBoolean(reader.GetOrdinal("Estado"))
                                };

                                rptLista.Add(persona);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                throw new Exception("Error al obtener las personas PCD", ex);
            }

            return rptLista;
        }
    }
}
