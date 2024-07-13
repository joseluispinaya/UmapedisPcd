
var table;

const MODELO_BASE = {
    Idasoci: 0,
    Descripcion: "",
    Responsable: "",
    Activo: true
}

$(document).ready(function () {

    $('#consulRow').hide();
    dtAsociaa();
    cargarAsociacione();
})

function cargarAsociacione() {
    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/ObtenerAsociacion",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                var asociaciones = data.d.objeto;
                var container = $('.containera-custom');

                // Limpia el contenedor antes de agregar las nuevas tarjetas
                container.html('');

                // Itera sobre cada asociación en la lista y crea una tarjeta
                asociaciones.forEach(function (asociacion) {
                    var cardHtml = `
                        <div class="carda carda-custom">
                            <div class="left-column left-column-custom background1-left-column">
                                <h6>umapedis</h6>
                                <h2>GAMR</h2>
                                <i class="fas fa-hand-point-right" aria-hidden="true"></i>
                            </div>
                            <div class="right-column right-column-custom">
                                <div>
                                    <h4 id="txtasocia" class="dihe">${asociacion.Descripcion}</h4>
                                    <h6>asociacion</h6>
                                </div>
                                <h4 id="txtrespon" class="dih">${asociacion.Responsable}</h4>
                                <button type="button" class="buttona buttona-custom background1-left-column">Empezar</button>
                            </div>
                        </div>
                    `;
                    container.append(cardHtml);
                });
            }
        }
    });
}

function cargarAsociacionerr() {
    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/ObtenerAsociacion",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                var asociaciones = data.d.objeto;
                var container = $('.containera');

                // Limpia el contenedor antes de agregar las nuevas tarjetas
                container.html('');

                // Itera sobre cada asociación en la lista y crea una tarjeta
                asociaciones.forEach(function (asociacion) {
                    var cardHtml = `
                            <div class="carda">
                                <div class="left-column background1-left-column">
                                    <h6>umapedis</h6>
                                    <h2>GAMR</h2>
                                    <i class="fas fa-hand-point-right" aria-hidden="true"></i>
                                </div>
                                <div class="right-column">
                                    <div>
                                        <h4 id="txtasocia" class="dihe">${asociacion.Descripcion}</h4>
                                        <h6>asociacion</h6>
                                    </div>
                                    <h4 id="txtrespon" class="dih">${asociacion.Responsable}</h4>
                                    <button type="button" class="buttona background1-left-column">Empezar</button>
                                </div>
                            </div>
                    `;
                    container.append(cardHtml);
                });
            }
        }
    });
}



$('#btnNuevoConAso').on('click', function () {
    $('#consulRow').show();
    $('#listaRegiRow').hide();

})

$('#btnListaAsoc').on('click', function () {
    $('#listaRegiRow').show();
    $('#consulRow').hide();

})


function dtAsociaa() {
    // Verificar si el DataTable ya está inicializado
    if ($.fn.DataTable.isDataTable("#tbAsoci")) {
        // Destruir el DataTable existente
        $("#tbAsoci").DataTable().destroy();
        // Limpiar el contenedor del DataTable
        $('#tbAsoci tbody').empty();
    }

    table = $("#tbAsoci").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmAsociaciones.aspx/ObtenerAsociacion',
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
            { "data": "Idasoci", "visible": false, "searchable": false },
            { "data": "Descripcion" },
            { "data": "Responsable" },
            {
                "data": "Activo", render: function (data) {
                    if (data == true)
                        return '<span class="badge badge-info">Activo</span>';
                    else
                        return '<span class="badge badge-danger">No Activo</span>';
                }
            },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-xs mr-2"><i class="fas fa-pencil-alt"></i></button>' +
                    '<button class="btn btn-danger btn-eliminar btn-xs"><i class="fas fa-trash-alt"></i></button>',
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
                filename: 'Reporte Asociaciones',
                exportOptions: {
                    columns: [1, 2, 3] // Ajusta según las columnas que desees exportar
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}


function mostrarModal(modelo, cboEstadoDeshabilitado = true) {
    // Verificar si modelo es null
    modelo = modelo ?? MODELO_BASE;

    $("#txtIdAsos").val(modelo.Idasoci);
    $("#txtDescripcion").val(modelo.Descripcion);
    $("#txtRespo").val(modelo.Responsable);
    $("#cboEstado").val(modelo.Activo == true ? 1 : 0);

    // Configurar el estado de cboEstado según cboEstadoDeshabilitado
    $("#cboEstado").prop("disabled", cboEstadoDeshabilitado);

    // Actualizar el título del modal
    if (cboEstadoDeshabilitado) {
        $("#custom-width-modalLabel").text("Nueva Asociacion");
    } else {
        $("#custom-width-modalLabel").text("Editar Asociacion");
    }

    $("#custom-width-modal").modal("show");
}

$("#tbAsoci tbody").on("click", ".btn-editar", function (e) {
    e.preventDefault();
    let filaSeleccionada;

    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const model = table.row(filaSeleccionada).data();
    mostrarModal(model, false);
})

$('#btnNuevoR').on('click', function () {

    mostrarModal(null, true);
})


function dataRegistrar() {
    const modelo = structuredClone(MODELO_BASE);
    modelo["Idasoci"] = parseInt($("#txtIdAsos").val());
    modelo["Descripcion"] = $("#txtDescripcion").val();
    modelo["Responsable"] = $("#txtRespo").val();
    modelo["Activo"] = ($("#cboEstado").val() == "1" ? true : false);

    var request = {
        oAsocia: modelo
    };

    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/Guardar",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            // Mostrar overlay de carga antes de enviar la solicitud modal-content
            $(".modal-content").LoadingOverlay("show");
        },
        success: function (response) {
            $(".modal-content").LoadingOverlay("hide");
            if (response.d.Estado) {
                dtAsociaa();
                $('#custom-width-modal').modal('hide');
                swal("Mensaje", response.d.Mensage, response.d.Valor);
            } else {
                swal("Mensaje", response.d.Mensage, response.d.Valor);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            $(".modal-content").LoadingOverlay("hide");
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

function dataActualizar() {
    const modelo = structuredClone(MODELO_BASE);
    modelo["Idasoci"] = parseInt($("#txtIdAsos").val());
    modelo["Descripcion"] = $("#txtDescripcion").val();
    modelo["Responsable"] = $("#txtRespo").val();
    modelo["Activo"] = ($("#cboEstado").val() == "1" ? true : false);

    var request = {
        oAsocia: modelo
    };

    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/Actualizar",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            // Mostrar overlay de carga antes de enviar la solicitud modal-content
            $(".modal-content").LoadingOverlay("show");
        },
        success: function (response) {
            $(".modal-content").LoadingOverlay("hide");
            if (response.d.Estado) {
                dtAsociaa();
                $('#custom-width-modal').modal('hide');
                swal("Mensaje", response.d.Mensage, response.d.Valor);
            } else {
                swal("Mensaje", response.d.Mensage, response.d.Valor);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            $(".modal-content").LoadingOverlay("hide");
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

$('#btnGuardarCambios').on('click', function () {

    const inputs = $("input.model").serializeArray();
    const inputs_sin_valor = inputs.filter((item) => item.value.trim() == "")

    if (inputs_sin_valor.length > 0) {
        const mensaje = `Debe completar el campo : "${inputs_sin_valor[0].name}"`;
        toastr.warning("", mensaje)
        $(`input[name="${inputs_sin_valor[0].name}"]`).focus()
        return;
    }

    if (parseInt($("#txtIdAsos").val()) == 0) {
        dataRegistrar();
    } else {
        //swal("Mensaje", "Falta para Actualizar.", "warning")
        dataActualizar();
    }
})

