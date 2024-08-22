
var table;

const MODELO_BASE = {
    IdUsuario: 0,
    Nombres: "",
    Apellidos: "",
    Correo: "",
    Profecion: "",
    IdRol: 0,
    Estado: true,
    ImageFull: ""
}

const video = document.getElementById('videoa');
const canvas = document.getElementById('canvasa');
const foto = document.getElementById('footo');

//const espacioArri = document.getElementById('ocultar');

$(document).ready(function () {
    //sendDataAjax();
    dtUsuarios();
    cargarRoles();
    $(".content.invoice.camaraa").hide();
    //$(".content.invoice.selecc").hide();

});

function dtUsuarios() {
    // Verificar si el DataTable ya está inicializado
    if ($.fn.DataTable.isDataTable("#tbUsuario")) {
        // Destruir el DataTable existente
        $("#tbUsuario").DataTable().destroy();
        // Limpiar el contenedor del DataTable
        $('#tbUsuario tbody').empty();
    }

    table = $("#tbUsuario").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmUsuario.aspx/ObtenerUsuario',
            "type": "POST", // Cambiado a POST
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function (d) {
                return JSON.stringify(d);
            },
            "dataSrc": function (json) {
                //console.log("Response from server:", json.d.objeto);
                if (json.d.estado) {
                    return json.d.objeto; // Asegúrate de que esto apunta al array de datos
                } else {
                    return [];
                }
            }
        },
        "columns": [
            { "data": "IdUsuario", "visible": false, "searchable": false },
            {
                "data": "ImageFull", render: function (data) {
                    return `<img style="width: 40px; height: 40px; border-radius: 50%;" src="${data}" class="mx-auto d-block"/>`;
                }
            },
            { "data": "oRol.NomRol" },
            { "data": "Nombres" },
            { "data": "Apellidos" },
            { "data": "Correo" },
            { "data": "Profecion" },
            {
                "data": "Estado", render: function (data) {
                    if (data == true)
                        return '<span class="badge badge-info">Activo</span>';
                    else
                        return '<span class="badge badge-danger">No Activo</span>';
                }
            },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-sm mr-2"><i class="fas fa-pencil-alt"></i></button>',
                "orderable": false,
                "searchable": false,
                "width": "50px"
            }
        ],
        "order": [[0, "desc"]],
        "dom": "Bfrtip",
        "buttons": [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte Usuarios',
                exportOptions: {
                    columns: [2, 3, 4, 5, 6, 7] // Ajusta según las columnas que desees exportar
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}
function dtUsersIIa() {
    table = $("#tbUsuario").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmUsuario.aspx/ObtenerRolGe',
            "type": "POST", // Cambiado a POST
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function (d) {
                return JSON.stringify(d);
            },
            "dataSrc": function (json) {
                //console.log("Response from server:", json.d.objeto);
                if (json.d.estado) {
                    return json.d.objeto; // Asegúrate de que esto apunta al array de datos
                } else {
                    return [];
                }
            }
        },
        "columns": [
            { "data": "Idrol" },
            { "data": "NomRol" },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-sm mr-2"><i class="fas fa-pencil-alt"></i></button>' +
                    '<button class="btn btn-danger btn-eliminar btn-sm"><i class="fas fa-trash-alt"></i></button>',
                "orderable": false,
                "searchable": false,
                "width": "80px"
            }
        ],
        "order": [[0, "desc"]],
        "dom": "Bfrtip",
        "buttons": [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte Usuarios',
                exportOptions: {
                    columns: [0, 1] // Ajusta según las columnas que desees exportar
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}


function dtUsersIa() {
    table = $("#tbUsuario").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmUsuario.aspx/ObtenerRolGe',
            "type": "POST", // Cambiado a POST
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function (d) {
                return JSON.stringify(d);
            },
            "dataSrc": "d.objeto"
        },
        "columns": [
            { "data": "Idrol" },
            { "data": "NomRol" },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-sm mr-2"><i class="fas fa-pencil-alt"></i></button>' +
                    '<button class="btn btn-danger btn-eliminar btn-sm"><i class="fas fa-trash-alt"></i></button>',
                "orderable": false,
                "searchable": false,
                "width": "80px"
            }
        ],
        "order": [[0, "desc"]],
        "dom": "Bfrtip",
        "buttons": [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte Usuarios',
                exportOptions: {
                    columns: [0, 1] // Ajusta según las columnas que desees exportar
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
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

//validar input

$.fn.inputFilter = function (inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
        if (inputFilter(this.value) || event.key === "Backspace" || event.key === " ") {
            this.oldValue = this.value;
            this.oldSelectionStart = this.selectionStart;
            this.oldSelectionEnd = this.selectionEnd;
        } else if (this.hasOwnProperty("oldValue")) {
            this.value = this.oldValue;
            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        } else {
            this.value = "";
        }
    });
};

$("#txtNombres").inputFilter(function (value) {
    return /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/u.test(value);
});
$("#txtApellidos").inputFilter(function (value) {
    return /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/u.test(value);
});
$("#txtOcupacion").inputFilter(function (value) {
    return /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/u.test(value);
});


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
            swal("Mensaje", "Verifique conexion de la Camara", "warning");
        });
}

function detenerCamara() {
    if (cameraStream) {
        const tracks = cameraStream.getTracks(); // Obtener las pistas de la transmisión de la cámara
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



$('#btntomarfoto').on('click', function () {

    $(".content.invoice.camaraa").show();
    $(".content.invoice.selecc").hide();
    mostrarCamara();
})

$('#btnselectfoto').on('click', function () {

    detenerCamara();
    //foto.setAttribute("src", "Imagenes/Sinfotop.jpg");
    $(".content.invoice.camaraa").hide();
    $(".content.invoice.selecc").show();
})

function limpiarR() {
    detenerCamara();
    $(".content.invoice.camaraa").hide();
    $(".content.invoice.selecc").show();
}

let isCameraImage = false;

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
    // Indicar que la imagen proviene de la cámara IA
    isCameraImage = true;

    // Limpiar la selección del archivo
    document.getElementById('txtFoto').value = "";
})

function base64ToByteArray(base64String) {
    const binaryString = window.atob(base64String);
    const byteArray = new Uint8Array(binaryString.length);
    for (let i = 0; i < binaryString.length; i++) {
        byteArray[i] = binaryString.charCodeAt(i);
    }
    return Array.from(byteArray);
}
// Función para registrar los datos y enviar al servidor
function registerDataAjaxOpc() {
    const fileInput = document.getElementById('txtFoto');
    const file = fileInput.files[0];
    const modelo = structuredClone(MODELO_BASE);

    modelo["IdUsuario"] = parseInt($("#txtIdUsuario").val());
    modelo["Nombres"] = $("#txtNombres").val();
    modelo["Apellidos"] = $("#txtApellidos").val();
    modelo["Correo"] = $("#txtCorreo").val();
    modelo["Profecion"] = $("#txtOcupacion").val();
    modelo["IdRol"] = $("#cboRol").val();

    if (file) {
        var maxSize = 2 * 1024 * 1024; // 2 MB en bytes
        if (file.size > maxSize) {
            swal("Error", "La imagen seleccionada es demasiado grande.", "error");
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var arrayBuffer = e.target.result;
            var bytes = new Uint8Array(arrayBuffer);

            var request = {
                oUsuario: modelo,
                imageBytes: Array.from(bytes)
            };
            console.log("envio file");
            sendDataToServer(request);
        };

        reader.readAsArrayBuffer(file);

        // Indicar que la imagen proviene del archivo
        isCameraImage = false;

        // Limpiar la imagen del canvas
        const context = canvas.getContext("2d");
        context.clearRect(0, 0, canvas.width, canvas.height);
        foto.setAttribute("src", "");
    } else if (isCameraImage) {
            const dataURL = canvas.toDataURL("image/jpeg");
            const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
            const byteArray = base64ToByteArray(base64Data);

                var request = {
                    oUsuario: modelo,
                    imageBytes: byteArray
                };
                console.log("envio camara");
                sendDataToServer(request);
    } else {
        // No se seleccionó ni archivo ni imagen de la cámara
                var request = {
                    oUsuario: modelo,
                    imageBytes: null
                };
                console.log("envio sin imagen");
                sendDataToServer(request);
    }
}
function registerDataAjaxOpssc() {
    const fileInput = document.getElementById('txtFoto');
    const file = fileInput.files[0];
    const modelo = structuredClone(MODELO_BASE);

    modelo["IdUsuario"] = parseInt($("#txtIdUsuario").val());
    modelo["Nombres"] = $("#txtNombres").val();
    modelo["Apellidos"] = $("#txtApellidos").val();
    modelo["Correo"] = $("#txtCorreo").val();
    modelo["Profecion"] = $("#txtOcupacion").val();
    modelo["IdRol"] = $("#cboRol").val();

    if (file) {
        var maxSize = 2 * 1024 * 1024; // 2 MB en bytes
        if (file.size > maxSize) {
            swal("Error", "La imagen seleccionada es demasiado grande.", "error");
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var arrayBuffer = e.target.result;
            var bytes = new Uint8Array(arrayBuffer);

            var request = {
                oUsuario: modelo,
                imageBytes: Array.from(bytes)
            };
            console.log("envio file");
            sendDataToServer(request);
        };

        reader.readAsArrayBuffer(file);
    } else {
        const dataURL = canvas.toDataURL("image/jpeg");
        const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
        const byteArray = base64ToByteArray(base64Data);

        let request;
        if (byteArray.length > 0) {
            request = {
                oUsuario: modelo,
                imageBytes: byteArray
            };
        } else {
            request = {
                oUsuario: modelo,
                imageBytes: null
            };
        }
        console.log("envio camara");
        sendDataToServer(request);
    }
}

function registerDataAjax() {
    const modelo = structuredClone(MODELO_BASE);
    modelo["IdUsuario"] = parseInt($("#txtIdUsuario").val())
    modelo["Nombres"] = $("#txtNombres").val()
    modelo["Apellidos"] = $("#txtApellidos").val()
    modelo["Correo"] = $("#txtCorreo").val()
    modelo["Profecion"] = $("#txtOcupacion").val()
    modelo["IdRol"] = $("#cboRol").val()

    const dataURL = canvas.toDataURL("image/jpeg");

    const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
    const byteArray = base64ToByteArray(base64Data);

    let request;
    if (byteArray.length > 0) {
        request = {
            oUsuario: modelo,
            imageBytes: byteArray
        };
    } else {
        request = {
            oUsuario: modelo,
            imageBytes: null
        };
    }

    sendDataToServer(request);
}

//funcion para editar registro
function editDataAjaxOpc() {
    const fileInput = document.getElementById('txtFoto');
    const file = fileInput.files[0];
    const modelo = structuredClone(MODELO_BASE);

    modelo["IdUsuario"] = parseInt($("#txtIdUsuario").val());
    modelo["Nombres"] = $("#txtNombres").val();
    modelo["Apellidos"] = $("#txtApellidos").val();
    modelo["Correo"] = $("#txtCorreo").val();
    modelo["Profecion"] = $("#txtOcupacion").val();
    modelo["IdRol"] = $("#cboRol").val();
    modelo["Estado"] = ($("#cboEstado").val() == "1" ? true : false);

    if (file) {
        var maxSize = 2 * 1024 * 1024; // 2 MB en bytes
        if (file.size > maxSize) {
            swal("Error", "La imagen seleccionada es demasiado grande.", "error");
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var arrayBuffer = e.target.result;
            var bytes = new Uint8Array(arrayBuffer);

            var request = {
                oUsuario: modelo,
                imageBytes: Array.from(bytes)
            };
            console.log("envio file");
            sendDataToServerEdit(request);
        };

        reader.readAsArrayBuffer(file);

        // Indicar que la imagen proviene del archivo
        isCameraImage = false;

        // Limpiar la imagen del canvas
        const context = canvas.getContext("2d");
        context.clearRect(0, 0, canvas.width, canvas.height);
        foto.setAttribute("src", "");
    } else if (isCameraImage) {
        const dataURL = canvas.toDataURL("image/jpeg");
        const base64Data = dataURL.replace(/^data:image\/(png|jpeg);base64,/, "");
        const byteArray = base64ToByteArray(base64Data);

        var request = {
            oUsuario: modelo,
            imageBytes: byteArray
        };
        console.log("envio camara");
        sendDataToServerEdit(request);
    } else {
        // No se seleccionó ni archivo ni imagen de la cámara
        var request = {
            oUsuario: modelo,
            imageBytes: null
        };
        console.log("envio sin imagen");
        sendDataToServerEdit(request);
    }
}

function sendDataToServerEdit(request) {
    $.ajax({
        type: "POST",
        url: "frmUsuario.aspx/EditarI",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            // Mostrar overlay de carga antes de enviar la solicitud
            $(".modal-body").LoadingOverlay("show");
        },
        success: function (response) {
            $(".modal-body").LoadingOverlay("hide");
            if (response.d.Estado) {
                $('#modalrol').modal('hide');
                //swal("Mensaje", "Se Actualizo de manera correcta", "success")
                swal("Mensaje", response.d.Mensage, response.d.Valor);
                dtUsuarios();
                limpiarR();
            } else {
                //swal("Mensaje", "No se pudo Actualizar el usuario", "warning")
                swal("Mensaje", response.d.Mensage, "error");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            $(".modal-body").LoadingOverlay("hide");
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
        
    });
}
function sendDataToServer(request) {
    $.ajax({
        type: "POST",
        url: "frmUsuario.aspx/Guardar",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d) {
                $('#modalrol').modal('hide');
                swal("Mensaje", "Registro Exitoso credenciales enviado a su correo", "success");
                dtUsuarios();
                limpiarR();
                //dtUsers();
                //limpiar();
            } else {
                swal("Mensaje", "Error al registrar", "warning");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

function mostrarModal(modelo, cboEstadoDeshabilitado = true) {
    // Verificar si modelo es null
    modelo = modelo ?? MODELO_BASE;

    $("#txtIdUsuario").val(modelo.IdUsuario);
    $("#txtNombres").val(modelo.Nombres);
    $("#txtApellidos").val(modelo.Apellidos);
    $("#txtCorreo").val(modelo.Correo);
    $("#txtOcupacion").val(modelo.Profecion);
    $("#cboRol").val(modelo.IdRol == 0 ? $("#cboRol option:first").val() : modelo.IdRol);
    /*$("#cboEstado").val(modelo.Estado == true ? $("#cboEstado option:first").val() : modelo.Estado);*/
    $("#cboEstado").val(modelo.Estado == true ? 1 : 0);
    $("#imgUsuarioM").attr("src", modelo.ImageFull == "" ? "Imagenes/Sinfotop.jpg" : modelo.ImageFull);

    // Configurar el estado de cboEstado según cboEstadoDeshabilitado
    $("#cboEstado").prop("disabled", cboEstadoDeshabilitado);

    $("#txtCorreo").prop("disabled", !cboEstadoDeshabilitado);

    //if (cboEstadoDeshabilitado) {
    //    $("#txtCorreo").prop("disabled", false);
    //} else {
    //    $("#txtCorreo").prop("disabled", true);
    //}
    
    //foto.setAttribute("src", modelo.ImageFull == "" ? "Imagenes/Sinfotop.jpg" : modelo.ImageFull);

    $("#txtFoto").val("");
    $("#modalrol").modal("show");
}

$("#tbUsuario tbody").on("click", ".btn-editar", function (e) {
    e.preventDefault();

    let filaSeleccionada;

    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    //console.log(model);
    mostrarModal(model, false);
    //mostrarModal(data);
})

$('#btnNuevoRol').on('click', function () {
    //$("#modalrol").modal("show");
    mostrarModal(null, true);
    //mostrarModal();
})

$('#btnGuardarCambios').on('click', function () {

    const inputs = $("input.model").serializeArray();
    const inputs_sin_valor = inputs.filter((item) => item.value.trim() == "")

    if (inputs_sin_valor.length > 0) {
        const mensaje = `Debe completar el campo : "${inputs_sin_valor[0].name}"`;
        toastr.warning("", mensaje)
        $(`input[name="${inputs_sin_valor[0].name}"]`).focus()
        return;
    }

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var correo = $("#txtCorreo").val();

    if (correo === "" || !emailRegex.test(correo)) {
        swal("Mensaje", "Ingrese un correo válido", "warning");
        return;
    }


    if (parseInt($("#txtIdUsuario").val()) == 0) {
        //swal("Mensaje", "Guardado.", "success")
        //registerDataAjax();
        registerDataAjaxOpc();
    } else {
        //swal("Mensaje", "Falta para Actualizar personal.", "warning")
        editDataAjaxOpc();
    }
})

$('#btnImprimirusu').on('click', function () {

    $('#ocultar').hide();
    window.print();
    $('#ocultar').show();
    //const espacioArri = document.getElementById('ocultar');
});