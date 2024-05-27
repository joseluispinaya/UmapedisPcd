
const videopm = document.getElementById('videoapcdmo');
const canvaspm = document.getElementById('canvasapcdmo');
const fotopm = document.getElementById('footopcdmo');
let cameraStreampm;
let isCameraImagepm = false;

$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const idpersonal = urlParams.get('id');

    $(".content.invoice.camaraapcdmo").hide();
    //$(".content.invoice.selecc").hide();

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

function mostrarCamara() {
    navigator.mediaDevices.getUserMedia({ audio: false, video: true })
        .then(stream => {
            cameraStreampm = stream;
            videopm.srcObject = stream;
            isCameraImagepm = true;
            $('#txtFotopcdmo').val("");
        })
        .catch(error => {
            console.error('Error accessing the camera:', error);
            swal("Mensaje", "Verifique conexión de la cámara", "warning");
        });
}

function detenerCamara() {
    if (cameraStreampm) {
        cameraStreampm.getTracks().forEach(track => track.stop());
        cameraStreampm = null;
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
    $(".content.invoice.camaraapcdmo").hide();
    $(".content.invoice.seleccpcdmo").show();
    isCameraImagepm = false;

    // Limpiar canvas y resetear imagen
    const context = canvaspm.getContext("2d");
    context.clearRect(0, 0, canvaspm.width, canvaspm.height);
    fotopm.setAttribute("src", "");
})



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
    $('#txtFotopcdmo').val("");
    //isCameraImagepm = true;
    //document.getElementById('txtFotopcdmo').value = "";
})


function base64ToByteArray(base64Data) {
    const binaryString = window.atob(base64Data);
    const len = binaryString.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; i++) {
        bytes[i] = binaryString.charCodeAt(i);
    }
    return bytes;
}


function editarDataAjax() {
    const fileInput = document.getElementById('txtFotopcdmo');
    const file = fileInput.files[0];

    var modelo = {
        Idpersodisca: parseInt($("#txtIdpcdmo").val()),
        Ciperso: $("#txtcipcdmo").val(),
        Codcarnetdisca: $("#txtNrocarnetdismo").val(),
        Porsentaje: $("#txtPorsentajemo").val(),
        Nombres: $("#txtNombrespcdmo").val(),
        Apellidos: $("#txtApellidospcdmo").val(),
        Sexo: $("#cbosexomo").val(),
        Idtipodisca: $("#cboTipoDiscamo").val(),
        Idasoci: $("#cboAsociamo").val(),
    }

    if (file) {
        var maxSize = 2 * 1024 * 1024; // 2 MB en bytes
        if (file.size > maxSize) {
            swal("Error", "La imagen seleccionada es demasiado grande 2 Mb permitido.", "error");
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var arrayBuffer = e.target.result;
            var bytes = new Uint8Array(arrayBuffer);

            var request = {
                oPersonapcd: modelo,
                imageBytes: Array.from(bytes)
            };
            //console.log("envio file");
            sendDataToServer(request);
        };
        reader.readAsArrayBuffer(file);
    } else if (isCameraImagepm) {
                const dataURL = canvaspm.toDataURL("image/jpeg");
                const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
                const byteArray = base64ToByteArray(base64Data);

                var request = {
                    oPersonapcd: modelo,
                    imageBytes: Array.from(byteArray)
                };
                //console.log("envio camara");
                sendDataToServer(request);
    } else {
        var request = {
            oPersonapcd: modelo,
            imageBytes: null
        };
        //console.log("envio sin imagen");
        sendDataToServer(request);
    }
}


function sendDataToServer(request) {
    $.ajax({
        type: "POST",
        url: "frmEditarPcd.aspx/EditarPcd",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            // Mostrar overlay de carga antes de enviar la solicitud
            $.LoadingOverlay("show");
        },
        success: function (response) {
            $.LoadingOverlay("hide");
            if (response.d.Estado) {
                swal("Mensaje", response.d.Mensage, response.d.Valor);
                setTimeout(function () {
                    window.opener.location.reload();
                    window.close();
                }, 3000);
                //window.opener.location.reload();
                //window.close();
            } else {
                swal("Mensaje", response.d.Mensage, "error");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            $.LoadingOverlay("hide");
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

$('#btnGuardarCambiospcdmo').on('click', function () {

    var camposvacios = false;
    var fields = $(".model").serializeArray();

    $.each(fields, function (i, field) {
        if (!field.value) {
            camposvacios = true;
            return false;
        }
    });

    if (!camposvacios) {

        if (parseInt($("#txtIdpcdmo").val()) == 0) {

            swal("Mensaje!", "Ocurrio un error Con Id del PCD Cierre e intente mas tarde", "error")

        } else {
            editarDataAjax();
            //registerDataAjaxOpc();
        }
        
    } else {
        swal("Mensaje!", "Es necesario completar todos los campos de texto para Actualizar", "warning")
    }

});