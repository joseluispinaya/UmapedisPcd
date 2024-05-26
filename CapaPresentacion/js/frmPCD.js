var table;


const videop = document.getElementById('videoapcd');
const canvasp = document.getElementById('canvasapcd');
const fotop = document.getElementById('footopcd');

$(document).ready(function () {
    //sendDataAjax();
    dtObtenerPcd();
    cargarAsociacion();
    cargarTipodis();
    //$('#listaRegistrosRow').hide();
    $('#nuevoRegistroRow').hide();
    //$('#nuevoRegistrosinTutor').hide();

    $("#tutorrr").hide();
    $(".content.invoice.camaraapcd").hide();

});

function dtObtenerPcd() {
    if ($.fn.DataTable.isDataTable("#tbPcd")) {
        $("#tbPcd").DataTable().destroy();
        $('#tbPcd tbody').empty();
    }

    table = $("#tbPcd").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmPCD.aspx/ObtenerPersonaPCD',
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function (d) {
                return JSON.stringify(d);
            },
            "dataSrc": function (json) {
                if (json.d.estado) {
                    return json.d.objeto;
                } else {
                    return [];
                }
            }
        },
        "columns": [
            { "data": "Idpersodisca", "visible": false, "searchable": false },
            {
                "data": "ImageFull", render: function (data) {
                    return `<img style="height:40px" src=${data} class="rounded mx-auto d-block"/>`
                }
            },
            { "data": "oAsociacion.Descripcion" },
            { "data": "Nombres" },
            { "data": "Apellidos" },
            { "data": "oTutor.Nombres" },
            {
                "data": "EstadoBono", render: function (data) {
                    if (data == true)
                        return '<span class="badge badge-info">Habilitado</span>';
                    else
                        return '<span class="badge badge-danger">No Habilitado</span>';
                }
            },
            {
                "data": "Estado", render: function (data) {
                    if (data == true)
                        return '<span class="badge badge-info">Activo</span>';
                    else
                        return '<span class="badge badge-danger">No Activo</span>';
                }
            },
            {
                "data": "Idtutor", render: function (data, type, row) {
                    let tutorButton = '';
                    if (data == 0) {
                        tutorButton = '<button class="btn btn-secondary btn-agregar-tutor btn-sm mr-2"><i class="fas fa-user-plus"></i> Add Tutor</button>';
                    } else {
                        tutorButton = '<button class="btn btn-warning btn-editar-tutor btn-sm mr-2"><i class="fas fa-user-edit"></i> Edit Tutor</button>';
                    }

                    return `<button class="btn btn-success btn-detalle btn-sm mr-2" title="Ver Detalle"><i class="fas fa-list"></i></button>
                            <button class="btn btn-primary btn-editar btn-sm mr-2" title="Editar PCD"><i class="fas fa-pencil-alt"></i></button>
                            <button class="btn btn-danger btn-eliminar btn-sm mr-2" title="Eliminar PCD"><i class="fas fa-trash-alt"></i></button>
                            ${tutorButton}`;
                },
                "orderable": false,
                "searchable": false,
                "width": "150px"
            }
        ],
        "order": [[0, "desc"]],
        "dom": "Bfrtip",
        "buttons": [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte PCD',
                exportOptions: {
                    columns: [2, 3, 4, 5, 6, 7]
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}

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

function limpiarText() {

    //$("#txtIdUsuario").val(0);
    $("#txtcipcd").val("");
    $("#txtNrocarnetdis").val("");
    $("#txtPorsentaje").val("");
    $("#txtNombrespcd").val("");
    $("#txtApellidospcd").val("");
    $("#cbosexo").val("Masculino");
    $("select#cboTipoDisca").prop('selectedIndex', 0);
    $("select#cboAsocia").prop('selectedIndex', 0);
    $("#txtFotopcd").val("");
    $('#imgUsuarioPcd').attr('src', "Imagenes/Sinfotop.jpg");
    //$("#txtApellidospcd").val("");
    //$("#txtcituto").val("");
    //$("#txtNomTuto").val("");
    //$("#txtParentesco").val("");
    //$("#txtNrocel").val("");
    //$('#imgUsuarioPcd').attr('src', "Imagenes/Sinfotop.jpg");
}

$('#btnListaPcd').on('click', function () {
    $('#listaRegistrosRow').show();
    $('#nuevoRegistroRow').hide();
    //$('#nuevoRegistrosinTutor').hide();
    
})

$('#btnNuevore').on('click', function () {
    limpiarText();
    $('#nuevoRegistroRow').show();
    $('#listaRegistrosRow').hide();
    //$('#nuevoRegistrosinTutor').hide();

})

$('#btnNuevoSintuto').on('click', function () {
    swal("Mensaje", "Falta Implementar funcionalidad", "warning");
    //$('#nuevoRegistrosinTutor').show();
    //$('#listaRegistrosRow').hide();
    //$('#nuevoRegistroRow').hide();
})

$("#tbPcd tbody").on("click", ".btn-detalle", function (e) {
    e.preventDefault();
    let filaSeleccionada;
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    var url = 'rptPersonaPCD.aspx?id=' + model.Idpersodisca;
    window.open(url, '', 'height=600,width=800,scrollbars=0,location=1,toolbar=0');

    //console.log(model);
})

$("#tbPcd tbody").on("click", ".btn-editar", function (e) {
    e.preventDefault();
    let filaSeleccionada;
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    console.log(model);
})

$("#tbPcd tbody").on("click", ".btn-eliminar", function (e) {
    e.preventDefault();
    let filaSeleccionada;
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    console.log(model);
})

$("#tbPcd tbody").on("click", ".btn-agregar-tutor", function (e) {
    e.preventDefault();
    let filaSeleccionada;
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    console.log(model);
})

$("#tbPcd tbody").on("click", ".btn-editar-tutor", function (e) {
    e.preventDefault();
    let filaSeleccionada;
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    console.log(model);
})

let isTutore = false;

$("#checTutor").change(function () {
    // Verificar si el checkbox está marcado
    if ($(this).is(":checked")) {
        // Si está marcado, mostrar el elemento #ext
        $("#tutorrr").show();
        isTutore = true;
    } else {
        // Si no está marcado, ocultar el elemento #ext
        $("#tutorrr").hide();
        isTutore = false;
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
    const canvasWidth = 220;
    const canvasHeight = 170;
    canvasp.width = canvasWidth;
    canvasp.height = canvasHeight;
    context.drawImage(videop, 0, 0, canvasWidth, canvasHeight);
    const data = canvasp.toDataURL("image/jpeg");
    fotop.setAttribute("src", data);
    isCameraImagep = true;
    document.getElementById('txtFotopcd').value = "";
})

function base64ToByteArray(base64String) {
    const binaryString = window.atob(base64String);
    const byteArray = new Uint8Array(binaryString.length);
    for (let i = 0; i < binaryString.length; i++) {
        byteArray[i] = binaryString.charCodeAt(i);
    }
    return Array.from(byteArray);
}

function registerDataAjaxOpc() {
    const fileInput = document.getElementById('txtFotopcd');
    const file = fileInput.files[0];

    var modeltu = {
        Ciapoderado: $("#txtcituto").val(),
        Nombres: $("#txtNomTuto").val(),
        Parentesco: $("#txtParentesco").val(),
        Celular: $("#txtNrocel").val()
    }

    var modelo = {
        Ciperso: $("#txtcipcd").val(),
        Codcarnetdisca: $("#txtNrocarnetdis").val(),
        Porsentaje: $("#txtPorsentaje").val(),
        Nombres: $("#txtNombrespcd").val(),
        Apellidos: $("#txtApellidospcd").val(),
        Sexo: $("#cbosexo").val(),
        Idtipodisca: $("#cboTipoDisca").val(),
        Idasoci: $("#cboAsocia").val(),
        oTutor: (isTutore == true ? modeltu : null)
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
        isCameraImagep = false;

        const context = canvasp.getContext("2d");
        context.clearRect(0, 0, canvasp.width, canvasp.height);
        fotop.setAttribute("src", "");
    } else if (isCameraImagep) {
        const dataURL = canvasp.toDataURL("image/jpeg");
        const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
        const byteArray = base64ToByteArray(base64Data);

        var request = {
            oPersonapcd: modelo,
            imageBytes: byteArray
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
    //console.log("model ", modelo);
    
}

function sendDataToServer(request) {
    $.ajax({
        type: "POST",
        url: "frmPCD.aspx/GuardarPcd",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d.Estado) {
                //swal("Mensaje", "Registro Exitoso credenciales enviado a su correo", "success");
                console.log("id: ", response.d.Valor);
                swal("Mensaje", response.d.Mensage, "success");
                $('#listaRegistrosRow').show();
                $('#nuevoRegistroRow').hide();
                //dtUsuarios();
                limpiarText();
            } else {
                swal("Mensaje", response.d.Mensage, "error");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

$('#btnGuardarCambiospcd').on('click', function () {

    registerDataAjaxOpc();
})