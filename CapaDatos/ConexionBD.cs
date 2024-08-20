using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class ConexionBD
    {
        #region "PATRON SINGLETON"
        public static ConexionBD conexion = null;

        public ConexionBD() { }

        public static ConexionBD getInstance()
        {
            if (conexion == null)
            {
                conexion = new ConexionBD();
            }
            return conexion;
        }
        #endregion

        public SqlConnection ConexionDB()
        {
            SqlConnection conexion = new SqlConnection();
            //conexion.ConnectionString = @"Data Source=DESKTOP-UL11P00\SQLEXPRESS;Initial Catalog=Umapedis;Integrated Security=True";
            //conexion.ConnectionString = @"Data Source=SQL8004.site4now.net;Initial Catalog=db_aab64d_umapedis;User Id=db_aab64d_umapedis_admin;Password=Elzero#2024";

            conexion.ConnectionString = "Data Source=.;Initial Catalog=Umapedis;Integrated Security=True";
            return conexion;
        }
    }
}
