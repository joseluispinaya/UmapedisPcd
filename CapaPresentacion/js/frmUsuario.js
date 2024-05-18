
const video = document.getElementById('videoa');
const canvas = document.getElementById('canvasa');
const foto = document.getElementById('footo');

$(document).ready(function () {
    //sendDataAjax();
    cargarRoles();
    $(".content.invoice.camaraa").hide();
    //$(".content.invoice.selecc").hide();

});

function cargarPrue() {
    //$("#cboRol").html("");

    $.ajax({
        type: "POST",
        url: "frmUsuario.aspx/ObtenerRol",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $.each(data.d.objeto, function (i, row) {
                    if (row.Activo == true) {
                        $("<option>").attr({ "value": row.Idrol }).text(row.NomRol).appendTo("#cboRol");
                    }

                })
            }

        }
    });
}

function cargarRoles() {
    $("#cboRol").html("");

    $.ajax({
        type: "POST",
        url: "frmUsuario.aspx/ObtenerRol",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $.each(data.d.objeto, function (i, row) {
                    if (row.Activo == true) {
                        $("<option>").attr({ "value": row.Idrol }).text(row.NomRol).appendTo("#cboRol");
                    }

                })
            }
            
        }
    });
}


let cameraStream;

function mostrarCamara() {
    //var video = document.getElementById('videoa');

    navigator.mediaDevices.getUserMedia({ audio: false, video: true })
        .then(stream => {
            cameraStream = stream;
            video.srcObject = stream;
        })
        .catch(error => {
            console.error('Error accessing the camera:', error);
            swal("Mensaje", "Error con la Camara", "warning");
        });
}

function detenerCamara() {
    if (cameraStream) {
        const tracks = cameraStream.getTracks(); // Obtener las pistas de la transmisión de la cámara
        tracks.forEach(track => {
            track.stop(); // Detener cada pista de la transmisión
        });
    }
}

function mostrarImagenSeleccionada(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imgUsuarioM').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        $('#imgUsuarioM').attr('src', "Imagenes/Sinfotop.jpg");
    }
}

$('#txtFoto').change(function () {
    mostrarImagenSeleccionada(this);
});

$('#btnNuevoRol').on('click', function () {
    $("#modalrol").modal("show");
    //mostrarModal(null, true);
    //mostrarModal();
})

$('#btntomarfoto').on('click', function () {

    $(".content.invoice.camaraa").show();
    $(".content.invoice.selecc").hide();
    mostrarCamara();
})

$('#btnselectfoto').on('click', function () {

    detenerCamara();
    foto.setAttribute("src", "Imagenes/Sinfotop.jpg");
    $(".content.invoice.camaraa").hide();
    $(".content.invoice.selecc").show();
    //mostrarCamara();
})

$('#btncapturar').on('click', function () {

    const context = canvas.getContext("2d");
    //const size = 100;
    const canvasWidth = 220;
    const canvasHeight = 170;

    // Ajustar el tamaño del canvas al tamaño deseado de la imagen
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    //context.drawImage(video, 0, 0, size, size);
    context.drawImage(video, 0, 0, canvasWidth, canvasHeight);
    //context.drawImage(video, 0, 0, 220, 170);
    const data = canvas.toDataURL("image/jpeg");
    foto.setAttribute("src", data);
})