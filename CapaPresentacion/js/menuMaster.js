

$(document).ready(function () {
    oBtenerDetalleUsuario();
});

$(document).on('click', '#close', function (e) {
    e.preventDefault();
    CerrarSesion();
    //swal("Mensaje", "Se Cerro la Session", "success")
});


function oBtenerDetalleUsuario() {

    $.ajax({
        type: "POST",
        url: "Inicio.aspx/ObtenerDetalleUsuario",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {

            if (response.d.estado) {
                $("#nombreusuariome").append(response.d.objeto.Apellidos);
                $("#rolnomme").text(response.d.objeto.oRol.NomRol);
                $("#imgUsuarioMe").attr("src", response.d.objeto.ImageFull);
                $("#imageUserMe").attr("src", response.d.objeto.ImageFull);
                $("#rolusuariome").append(response.d.objeto.oRol.NomRol);
                //$("#rolusuario").html("<i class='fa fa-circle text-success'></i> " + response.d.objeto.oRol.Descripcion);
            } else {
                window.location.href = 'IniciarSesion.aspx';
            }

        }
    });
}

function CerrarSesion() {
    //console.log("registra",request);

    $.ajax({
        type: "POST",
        url: "Inicio.aspx/CerrarSesion",
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d == true) {
                window.location.href = 'IniciarSesion.aspx';
            }
        }
    });
}