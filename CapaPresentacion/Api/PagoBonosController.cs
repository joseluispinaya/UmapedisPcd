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
    [RoutePrefix("api/pagobonos")]
    public class PagoBonosController : ApiController
    {
        [HttpPost]
        [Route("Login")]
        public IHttpActionResult InicioSession(LoginDTO loginDTO)
        {
            var obj = NPersonasDisca.getInstance().LoginPcdApp(loginDTO.Ciperso, loginDTO.Codcarnetdisca);
            if (obj != null)
            {
                return Ok(obj);
            }
            else
            {
                return BadRequest("Informacion de CI o Nro Credencial incorrectos.");
            }
        }

        [HttpPost]
        [Route("Consulta")]
        public IHttpActionResult ConsultaBono(ConsultaDTO consultaDTO)
        {
            var Lista = NPagoBono.getInstance().DetallePagosApi(consultaDTO.Idpersodisca, consultaDTO.Idges);
            if (Lista != null)
            {
                return Ok(Lista);
            }
            else
            {
                return BadRequest("No tiene Pagos Paara la Gestion seleccionada");
            }
        }

    }
}