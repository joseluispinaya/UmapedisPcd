
const videopm = document.getElementById('videoapcdmo');
const canvaspm = document.getElementById('canvasapcdmo');
const fotopm = document.getElementById('footopcdmo');


$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const idpersonal = urlParams.get('id');

    cargarAsociacion();
    cargarTipodis();

    if (idpersonal !== null) {
        obtenerDetalle(idpersonal);
    } else {
        swal("Mensaje", "No hay parámetro idpersonal. El formulario se cerrará.", "warning");
        window.close();
    }
});

function cargarAsociacion() {
    $("#cboAsociamo").html("");

    $.ajax({
        type: "POST",
        url: "frmPCD.aspx/ObtenerAsociacion",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $.each(data.d.objeto, function (i, row) {
                    if (row.Activo == true) {
                        $("<option>").attr({ "value": row.Idasoci }).text(row.Descripcion).appendTo("#cboAsociamo");
                    }

                })
            }

        }
    });
}
function cargarTipodis() {
    $("#cboTipoDiscamo").html("");

    $.ajax({
        type: "POST",
        url: "frmPCD.aspx/ObtenerTipodisca",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $.each(data.d.objeto, function (i, row) {
                    if (row.Activo == true) {
                        $("<option>").attr({ "value": row.Idtipodisca }).text(row.Descripcion).appendTo("#cboTipoDiscamo");
                    }

                })
            }

        }
    });
}

function obtenerDetalle($idpersonal) {
    var request = {
        Idpcd: $idpersonal,
    };

    $.ajax({
        type: "POST",
        url: "frmPCD.aspx/ObtenerDetalleP",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $("#txtIdpcdmo").val(data.d.objeto.Idpersodisca);
                $("#txtcipcdmo").val(data.d.objeto.Ciperso);
                $("#txtNrocarnetdismo").val(data.d.objeto.Codcarnetdisca);
                $("#txtPorsentajemo").val(data.d.objeto.Porsentaje);
                $("#txtNombrespcdmo").val(data.d.objeto.Nombres);
                $("#txtApellidospcdmo").val(data.d.objeto.Apellidos);
                $("#cboAsociamo").val(data.d.objeto.Idasoci);
                $("#cboTipoDiscamo").val(data.d.objeto.Idtipodisca);
                $("#cbosexomo").val(data.d.objeto.Sexo == "M" ? "Masculino" : "Femenino");

                $("#imgUsuarioPcdmo").attr("src", data.d.objeto.ImageFull);

            } else {
                swal("Mensaje", "No se encontró el PCD. El formulario se cerrará.", "warning");
                window.close();
            }
        }
    });
}


let cameraStreampm;

function mostrarCamara() {
    //var video = document.getElementById('videoa');

    navigator.mediaDevices.getUserMedia({ audio: false, video: true })
        .then(stream => {
            cameraStreampm = stream;
            videopm.srcObject = stream;
        })
        .catch(error => {
            console.error('Error accessing the camera:', error);
            swal("Mensaje", "Verifique conexion de la Camara", "warning");
        });
}

function detenerCamara() {
    if (cameraStreampm) {
        const tracks = cameraStreampm.getTracks(); // Obtener las pistas de la transmisión de la cámara
        tracks.forEach(track => {
            track.stop(); // Detener cada pista de la transmisión
        });
        //foto.setAttribute("src", "Imagenes/Sinfotop.jpg");
    }
}

function mostrarImagenSeleccionada(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imgUsuarioPcdmo').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        $('#imgUsuarioPcdmo').attr('src', "Imagenes/Sinfotop.jpg");
    }
}

$('#txtFotopcdmo').change(function () {
    mostrarImagenSeleccionada(this);
});

$('#btntomarfotopcdmo').on('click', function () {

    $(".content.invoice.camaraapcdmo").show();
    $(".content.invoice.seleccpcdmo").hide();
    mostrarCamara();
})

$('#btnselectfotopcdmo').on('click', function () {

    detenerCamara();
    //foto.setAttribute("src", "Imagenes/Sinfotop.jpg");
    $(".content.invoice.camaraapcdmo").hide();
    $(".content.invoice.seleccpcdmo").show();
})

let isCameraImagepm = false;

$('#btncapturarpcdmo').on('click', function () {

    const context = canvaspm.getContext("2d");
    const canvasWidth = 220;
    const canvasHeight = 170;
    canvaspm.width = canvasWidth;
    canvaspm.height = canvasHeight;
    context.drawImage(videopm, 0, 0, canvasWidth, canvasHeight);
    const data = canvaspm.toDataURL("image/jpeg");
    fotopm.setAttribute("src", data);
    isCameraImagepm = true;
    document.getElementById('txtFotopcdmo').value = "";
})

function editarDataAjax() {
    var request = {
        oPersonapcd: {
            Idpersodisca: parseInt($("#txtIdpcdmo").val()),
            Nombres: $("#txtNombrespcdmo").val(),
            Apellidos: $("#txtApellidospcdmo").val()
        }
    }

    $.ajax({
        type: "POST",
        url: "frmEditarPcd.aspx/EditarPcd",
        data: JSON.stringify(request),
        contentType: 'application/json; charset=utf-8',
        dataType: "json",
        beforeSend: function () {
            // Mostrar overlay de carga antes de enviar la solicitud
            $.LoadingOverlay("show");
        },
        success: function (response) {
            $.LoadingOverlay("hide");
            if (response.d.Estado) {
                //swal("Mensaje", "Actualización correcta.", "success");
                swal("Mensaje", response.d.Mensage, response.d.Valor);
                setTimeout(function () {
                    window.opener.location.reload();
                    window.close();
                }, 3000);

                //window.opener.location.reload();
                //window.close();
            } else {
                swal("Mensaje", response.d.Mensage, "error");
                //swal("Mensaje", "Ocurrió un error", "warning");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            $.LoadingOverlay("hide");
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

$('#btnGuardarCambiospcdmo').on('click', function () {
    editarDataAjax();
});