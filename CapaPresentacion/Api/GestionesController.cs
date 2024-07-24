using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion.Api
{
    [RoutePrefix("api/gestiones")] // Establece una ruta base
    public class GestionesController : ApiController
    {
        [HttpGet] // Método GET para obtener todas las gestiones
        [Route("")]
        public IHttpActionResult Get()
        {
            try
            {
                var Listage = NTipos.getInstance().ObtenerGestion();
                return Ok(Listage);
            }
            catch (Exception exception)
            {
                return InternalServerError(exception);
            }
        }

        [HttpGet] // Método GET para obtener combo
        [Route("combo")]
        public IHttpActionResult GetCombo()
        {
            try
            {
                var Listage = NTipos.getInstance().ObtenerGestion();
                return Ok(Listage);
            }
            catch (Exception exception)
            {
                return BadRequest(exception.Message);
            }
        }
        

    }
}