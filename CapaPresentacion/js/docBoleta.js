

$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const idpersonal = urlParams.get('id');

    if (idpersonal !== null) {
        obtenerDetalle(idpersonal);
    } else {
        swal("Mensaje", "No hay parámetro recibido. El formulario se cerrará.", "warning");
        window.close();
    }
});

function obtenerDetalle($idpersonal) {
    var request = {
        Idpcd: $idpersonal,
    };

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/ObtenerDetallePagoActual",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $('#logouma').attr('src', "assets/images/uma2.png");
                $("#fechaemision").text(data.d.objeto.FechaRegistro);
                $("#mes").text(data.d.objeto.oEMeses.Descripcion);
                $("#nrorecibo").text(data.d.objeto.Codigo);
                $("#titular").text(data.d.objeto.oEPersonasDisca.Nombres);
                $("#nrocibeneficiario").text(data.d.objeto.oEPersonasDisca.Ciperso);
                $("#codcre").text(data.d.objeto.oEPersonasDisca.Codcarnetdisca);
                $("#nombretutor").text(data.d.objeto.oEPersonasDisca.oTutor.Nombres);
                $("#nrocitutor").text(data.d.objeto.oEPersonasDisca.oTutor.Ciapoderado);
                $("#parentesco").text(data.d.objeto.oEPersonasDisca.oTutor.Parentesco);
                $("#sellofuncionario").html(data.d.objeto.oUsuario.Nombres + "<br/>SELLO Y FIRMA CAJERO(A)");

                // Duplicate the content of the first container to the second one
                $("#seleccion2").html($("#seleccion").html());
            } else {
                swal("Mensaje", "Ocurrio un error. El formulario se cerrará.", "warning");
                window.close();
            }
        }
    });
}