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
        [HttpGet]
        [Route("buscar/{nroci}")]
        public IHttpActionResult Get(string nroci)
        {
            var obj = NPersonasDisca.getInstance().BuscarPcdApp(nroci);
            if (obj == null)
            {
                return NotFound();
            }
            return Ok(obj);
        }

        [HttpPost]
        [Route("Login")]
        public IHttpActionResult InicioSession(LoginDTO loginDTO)
        {
            var obj = NPersonasDisca.getInstance().LoginPcdApp(loginDTO.Ciperso, loginDTO.Codcarnetdisca);
            if (obj != null)
            {
                if (!obj.EstadoBono)
                {
                    return BadRequest("Info credenciales PCD no Cobra.");
                }

                return Ok(obj);
            }
            else
            {
                return BadRequest("Informacion de CI o Nro Credencial incorrectos.");
            }
        }

        [HttpPost]
        [Route("Loginusua")]
        public IHttpActionResult LoginUsua(LoginDTO loginDTO)
        {
            //string ClaveEncri = Utilidadesj.getInstance().ConvertirSha256(Clave);
            string clavEncri = Utilidadesj.getInstance().ConvertirSha256(loginDTO.Codcarnetdisca);

            var obj = NUsuario.getInstance().LoginUsuarioApp(loginDTO.Ciperso, clavEncri);

            if (obj != null)
            {
                if (!obj.Estado)
                {
                    return BadRequest("Usuario Suspendido.");
                }
                return Ok(obj);
            }
            else
            {
                return BadRequest("Email o contraseña incorrectos.");
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