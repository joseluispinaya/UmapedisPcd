
const videop = document.getElementById('videoapcd');
const canvasp = document.getElementById('canvasapcd');
const fotop = document.getElementById('footopcd');

$(document).ready(function () {
    cargarAsociacion();
    cargarTipodis();
    $('#listaRegistrosRow').hide();
    $('#nuevoRegistroRow').hide();
    $('#nuevoRegistrosinTutor').hide();

    $("#tutorrr").hide();
    $(".content.invoice.camaraapcd").hide();

});

function cargarAsociacion() {
    $("#cboAsocia").html("");

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
                        $("<option>").attr({ "value": row.Idasoci }).text(row.Descripcion).appendTo("#cboAsocia");
                    }

                })
            }

        }
    });
}
function cargarTipodis() {
    $("#cboTipoDisca").html("");

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
                        $("<option>").attr({ "value": row.Idtipodisca }).text(row.Descripcion).appendTo("#cboTipoDisca");
                    }

                })
            }

        }
    });
}

$('#btnListaPcd').on('click', function () {
    $('#listaRegistrosRow').show();
    $('#nuevoRegistroRow').hide();
    $('#nuevoRegistrosinTutor').hide();
    
})

$('#btnNuevore').on('click', function () {
    $('#nuevoRegistroRow').show();
    $('#listaRegistrosRow').hide();
    $('#nuevoRegistrosinTutor').hide();

})

$('#btnNuevoSintuto').on('click', function () {
    $('#nuevoRegistrosinTutor').show();
    $('#listaRegistrosRow').hide();
    $('#nuevoRegistroRow').hide();

})

$("#checTutor").change(function () {
    // Verificar si el checkbox está marcado
    if ($(this).is(":checked")) {
        // Si está marcado, mostrar el elemento #ext
        $("#tutorrr").show();
    } else {
        // Si no está marcado, ocultar el elemento #ext
        $("#tutorrr").hide();
    }
});

let cameraStreamp;

function mostrarCamara() {
    //var video = document.getElementById('videoa');

    navigator.mediaDevices.getUserMedia({ audio: false, video: true })
        .then(stream => {
            cameraStreamp = stream;
            videop.srcObject = stream;
        })
        .catch(error => {
            console.error('Error accessing the camera:', error);
            swal("Mensaje", "Verifique conexion de la Camara", "warning");
        });
}
function detenerCamara() {
    if (cameraStreamp) {
        const tracks = cameraStreamp.getTracks(); // Obtener las pistas de la transmisión de la cámara
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
            $('#imgUsuarioPcd').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        $('#imgUsuarioPcd').attr('src', "Imagenes/Sinfotop.jpg");
    }
}

$('#txtFotopcd').change(function () {
    mostrarImagenSeleccionada(this);
});

$('#btntomarfotopcd').on('click', function () {

    $(".content.invoice.camaraapcd").show();
    $(".content.invoice.seleccpcd").hide();
    mostrarCamara();
})

$('#btnselectfotopcd').on('click', function () {

    detenerCamara();
    //foto.setAttribute("src", "Imagenes/Sinfotop.jpg");
    $(".content.invoice.camaraapcd").hide();
    $(".content.invoice.seleccpcd").show();
})

let isCameraImagep = false;

$('#btncapturarpcd').on('click', function () {

    const context = canvasp.getContext("2d");
    //const size = 100;
    const canvasWidth = 220;
    const canvasHeight = 170;

    // Ajustar el tamaño del canvas al tamaño deseado de la imagen
    canvasp.width = canvasWidth;
    canvasp.height = canvasHeight;

    //context.drawImage(video, 0, 0, size, size);
    context.drawImage(videop, 0, 0, canvasWidth, canvasHeight);
    //context.drawImage(video, 0, 0, 220, 170);
    const data = canvasp.toDataURL("image/jpeg");
    fotop.setAttribute("src", data);
    // Indicar que la imagen proviene de la cámara IA
    isCameraImagep = true;

    // Limpiar la selección del archivo
    document.getElementById('txtFotopcd').value = "";
})