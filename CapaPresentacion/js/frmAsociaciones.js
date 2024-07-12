
var table;
$(document).ready(function () {

    dtAsociaa();
})

$('#btnNuevoR').on('click', function () {

    $("#custom-width-modal").modal("show");
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