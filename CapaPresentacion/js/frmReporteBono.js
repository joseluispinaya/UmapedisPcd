
var table;

$(document).ready(function () {
    //sendDataAjax();
    dtResumen();

});

function dtResumen() {
    // Verificar si el DataTable ya está inicializado
    if ($.fn.DataTable.isDataTable("#tbreporr")) {
        // Destruir el DataTable existente
        $("#tbreporr").DataTable().destroy();
        // Limpiar el contenedor del DataTable
        $('#tbreporr tbody').empty();
    }

    table = $("#tbreporr").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmReporteBono.aspx/ObtenerResum',
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