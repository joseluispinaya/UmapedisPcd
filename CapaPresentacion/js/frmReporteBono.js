
var table;
var tableDe;
var tableDeme;

$(document).ready(function () {
    //cargarGestiones();
    cargarGestiones("cboGestiR");
    cargarGestiones("cboGestiRa");
    cargarMesesa();
    dtResumen();
    dtObtenerPcdSi();

});

function consultaGestMes() {

    if ($.fn.DataTable.isDataTable("#tbpormes")) {
        $("#tbpormes").DataTable().destroy();
        $('#tbpormes tbody').empty();
    }
    var request = {
        IdGest: $("#cboGestiRa").val(),
        Idmes: $("#cboMesR").val()
    };

    var selectedText = $('#cboMesR option:selected').text();

    tableDeme = $("#tbpormes").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmReporteBono.aspx/ObtenerConsultaGesMes',
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function () {
                return JSON.stringify(request);
            },
            "dataSrc": function (json) {
                if (json.d.estado) {
                    $("#txtdetallemes").text("Total Mes " + selectedText + json.d.valor);
                    return json.d.objeto;
                } else {
                    return [];
                }
            },
            "error": function (xhr, status, error) {
                console.error("Error al obtener los datos: ", error);
            }
        },
        "columns": [
            { "data": "Codigo" },
            { "data": "Monto" },
            { "data": "FechaRegistro" },
            { "data": "oEPersonasDisca.Nombres" },
            { "data": "oUsuario.Nombres" }
        ],
        "dom": "rt",
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}


$('#btnConsultarM').on('click', function () {

    consultaGestMes();
})


$('#btnImprimiM').on('click', function () {

    $('#ocultar').hide();
    $('#omitirhabilmes').hide();
    window.print();
    $('#ocultar').show();
    $('#omitirhabilmes').show();

})


function cargarMesesa() {
    $("#cboMesR").html("");

    $.ajax({
        type: "POST",
        url: "frmReporteBono.aspx/ObtenerMeses",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cboMesR");

                })
            }

        }
    });
}

$('#btnEjemploa').on('click', function () {

    $('#ocultar').hide();
    $('#omitirhabil').hide();
    window.print();
    $('#ocultar').show();
    $('#omitirhabil').show();

})

function dtObtenerPcdSi() {

    if ($.fn.DataTable.isDataTable("#tbpcdbosi")) {
        $("#tbpcdbosi").DataTable().destroy();
        $('#tbpcdbosi tbody').empty();
    }
    var request = {
        IdEstado: $("#cboEstadoBon").val()
    };

    var selectedText = $('#cboEstadoBon option:selected').text();

    tableDe = $("#tbpcdbosi").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmReporteBono.aspx/ObtenerPersonaPCDEstado',
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function () {
                return JSON.stringify(request);
            },
            "dataSrc": function (json) {
                if (json.d.estado) {
                    $("#txtdetallein").text("Informe de " + selectedText + " para el Bono");
                    return json.d.objeto;
                } else {
                    return [];
                }
            },
            "error": function (xhr, status, error) {
                console.error("Error al obtener los datos: ", error);
            }
        },
        "columns": [
            { "data": "oAsociacion.Descripcion" },
            { "data": "oTipoDisca.Descripcion" },
            { "data": "Ciperso" },
            { "data": "Nombres" },
            { "data": "Apellidos" },
            { "data": "oTutor.Nombres" },
            {
                "data": "Estado", render: function (data) {
                    if (data == true)
                        return '<span class="badge badge-info">Activo</span>';
                    else
                        return '<span class="badge badge-danger">No Activo</span>';
                }
            }
        ],
        "dom": "rt",
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}

$("#cboEstadoBon").change(dtObtenerPcdSi);


function cargarGestiones(selectId) {
    $("#" + selectId).html("");

    $.ajax({
        type: "POST",
        url: "frmReporteBono.aspx/ObtenerGestiones",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                if (selectId === "cboGestiR") {
                    $("<option>").attr({ "value": 0 }).text("-- SELECCIONE TODO --").appendTo("#" + selectId);
                }
                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idges }).text(row.Descripcion).appendTo("#" + selectId);
                });
            }
        }
    });
}

//sin usar
function cargarGestionesori() {
    $("#cboGestiR").html("");

    $.ajax({
        type: "POST",
        url: "frmReporteBono.aspx/ObtenerGestiones",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $("<option>").attr({ "value": 0 }).text("-- SELECCIONE TODO --").appendTo("#cboGestiR");
                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idges }).text(row.Descripcion).appendTo("#cboGestiR");

                })
            }

        }
    });
}

// Asignar el evento change al select
$("#cboGestiR").change(dtResumen);


function dtResumen() {
    if ($.fn.DataTable.isDataTable("#tbreporr")) {
        $("#tbreporr").DataTable().destroy();
        $('#tbreporr tbody').empty();
    }

    var request = {
        Idges: $("#cboGestiR").val() == null ? "0" : $("#cboGestiR").val()
    };

    table = $("#tbreporr").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmReporteBono.aspx/ObtenerResum',
            "type": "POST", // Cambiado a POST
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function () {
                return JSON.stringify(request);
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
            { "data": "Idges", "visible": false, "searchable": false },
            { "data": "Descripcion" },
            { "data": "Ene" },
            { "data": "Feb" },
            { "data": "Mar" },
            { "data": "Abr" },
            { "data": "May" },
            { "data": "Jun" },
            { "data": "Jul" },
            { "data": "Ago" },
            { "data": "Sep" },
            { "data": "Oct" },
            { "data": "Nov" },
            { "data": "Dic" },
            { "data": "Total" }
        ],
        "order": [[0, "desc"]],
        "dom": "Bfrtip",
        "buttons": [
            {
                text: 'Exportar Excel',
                extend: 'excelHtml5',
                title: '',
                filename: 'Reporte General',
                exportOptions: {
                    columns: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14] // Ajusta según las columnas que desees exportar
                }
            },
            'pageLength'
        ],
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}