

var table;
var tablepa;

function ObtenerDetab() {
    var d = new Date();
    var actual = 'Gestion ' + d.getFullYear();
    var pasado = 'Gestion ' + (d.getFullYear() - 1);

    $("#lbldetalletotactu").text(actual);
    $("#lblmontobon").text("Monto 250 Bs");

    $("#lbldetalletotpasa").text(pasado);
    $("#lblmontobonpasa").text("Monto 250 Bs");
}

$(document).ready(function () {
    //cargarMeses();
    //$('#historialpcdp').show();
    $('#mostrarbonopa').hide();
    //cargarMesesPasado();
    ObtenerDetab();
});



function dtListaBonoPcd() {
    if ($.fn.DataTable.isDataTable("#tbpagoBono")) {
        $("#tbpagoBono").DataTable().destroy();
        $('#tbpagoBono tbody').empty();
    }

    var request = { Idpcd: parseInt($("#txtidPcdbono").val()) }

    table = $("#tbpagoBono").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmPagoBono.aspx/ObtenerDetalleBonoPCD',
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function () {
                return JSON.stringify(request);
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
            { "data": "Idbono", "visible": false, "searchable": false },
            { "data": "oEMeses.Descripcion" },
            { "data": "MontoCadena" },
            { "data": "FechaRegistro" },
            { "data": "oUsuario.Nombres" },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-xs" title="Ver Detalle">Detalle</button>',
                "orderable": false,
                "searchable": false,
                "width": "30px"
            }
        ],
        "dom": "rt",
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}

function dtListaBonoPasadoPcd() {
    if ($.fn.DataTable.isDataTable("#tbpagoBonopasad")) {
        $("#tbpagoBonopasad").DataTable().destroy();
        $('#tbpagoBonopasad tbody').empty();
    }

    var ges = new Date();
    var gpasado = 'Detalle Gestión ' + (ges.getFullYear() - 1) + " - Total: ";

    var request = { Idpcd: parseInt($("#txtidPcdbono").val()) }

    tablepa = $("#tbpagoBonopasad").DataTable({
        responsive: true,
        "ajax": {
            "url": 'frmPagoBono.aspx/ObtenerDetalleBonoPCDpasado',
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "dataType": "json",
            "data": function () {
                return JSON.stringify(request);
            },
            "dataSrc": function (json) {
                if (json.d.estado) {
                    // Asignar el valor total a la etiqueta h4
                    $("#iddetallepasado").text(gpasado + json.d.valor);
                    return json.d.objeto;
                } else {
                    return [];
                }
            },
            "error": function (xhr, status, error) {
                console.error("Error al obtener los datos: ", error);
                // Opcional: mostrar un mensaje de error al usuario
            }
        },
        "columns": [
            { "data": "Idbono", "visible": false, "searchable": false },
            { "data": "oEMeses.Descripcion" },
            { "data": "MontoCadena" },
            { "data": "FechaRegistro" },
            { "data": "oUsuario.Nombres" },
            {
                "defaultContent": '<button class="btn btn-primary btn-editar btn-xs" title="Ver Detalle">Detalle</button>',
                "orderable": false,
                "searchable": false,
                "width": "30px"
            }
        ],
        "dom": "rt",
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
        }
    });
}


function cargarMesesFil() {

    $("#cbomeesbo").html("");

    var d = new Date();
    var actual = 'Detalle Gestion ' + d.getFullYear();

    var request = { Idpcd: parseInt($("#txtidPcdbono").val()) }

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/ObtenerMesesFiltra",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $("#iddetalleactuh").text(actual + " Total:" + data.d.valor);

                $("<option>").attr({ "value": 0 }).text("-- Seleccionar mes --").appendTo("#cbomeesbo");

                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cbomeesbo");
                })
                //console.log(data.d.objeto);
            }

        }
    });
}

function cargarMesesPasadok() {
    $("#cbomeesbopasa").html("");

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/ObtenerMeses",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                $("<option>").attr({ "value": 0, "disabled": true }).text("-- Seleccionar mes --").appendTo("#cbomeesbopasa");

                $.each(data.d.objeto, function (i, row) {
                    var option = $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion);
                    if (i > 0) {
                        option.prop("disabled", true);
                    }
                    option.appendTo("#cbomeesbopasa");
                });

                $("#cbomeesbopasa").change(function () {
                    var selectedIndex = this.selectedIndex;
                    if (selectedIndex > 0 && selectedIndex < data.d.objeto.length) {
                        $("#cbomeesbopasa option").eq(selectedIndex + 1).prop("disabled", false);
                    }
                });
            }
        }
    });
}


function cargarMesesPasado() {
    $("#cbomeesbopasa").html("");
    var request = { Idpcd: parseInt($("#txtidPcdbono").val()) }

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/ObtenerMesesPasa",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                /*$("<option>").attr({ "value": 0 }).text("-- Seleccionar mes --").appendTo("#cbomeesbopasa");*/

                if (data.d.valor === "1") {
                    $("#cbomeesbopasa").attr("disabled", "disabled");
                    $("#btnregisbonopasa").attr("disabled", "disabled");
                } else {
                    $("#cbomeesbopasa").removeAttr("disabled");
                    $("#btnregisbonopasa").removeAttr("disabled");
                }

                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cbomeesbopasa");
                })
            }

        }
    });
}


function limpiartxt() {

    $("#tbpagoBono tbody").html("");

}
//buecar pcd y reporte

function cargarDatosPcd() {

    //$("#tbpagoBono tbody").html("");
    //$("#cbomeesbo").html("");
    var request = {
        Ncip: $("#txtcipcdbono").val().trim()
    };

    $.ajax({
        type: "POST",
        url: "frmPCD.aspx/ObtenerDetaRpt",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                if (data.d.objeto.EstadoBono == true) {
                    $("#txtidPcdbono").val(data.d.objeto.Idpersodisca);
                    $("#imgbonotopot").attr("src", data.d.objeto.ImageFull);
                    $("#rptnamebo").text(data.d.objeto.Nombres);
                    $("#rptapellibo").text(data.d.objeto.Apellidos);
                    $("#lblcipcd").text(data.d.objeto.Ciperso);
                    $("#lblcrede").text(data.d.objeto.Codcarnetdisca);
                    $("#lblporceb").text(data.d.objeto.Porsentaje);
                    $("#lblasocib").text(data.d.objeto.oAsociacion.Descripcion);
                    $("#lbltipob").text(data.d.objeto.oTipoDisca.Descripcion);
                    $("#lbltutpcd").text(data.d.objeto.oTutor.Nombres);
                    cargarMesesFil();
                    dtListaBonoPcd();
                    cargarMesesPasado();
                    dtListaBonoPasadoPcd();
                    $('#mostrarbonopa').show();
                } else {
                    $('#mostrarbonopa').hide();
                    swal("Mensaje", "PCD no esta Habilitado para el pago de Bono.", "warning");
                }

            } else {
                $('#mostrarbonopa').hide();
                swal("Mensaje", "No se encontró el PCD.", "warning");
            }
        }
    });
}

$('#btnBuscarpcdbono').on('click', function () {

    $("#tbpagoBono tbody").html("");
    $("#tbpagoBonopasad tbody").html("");
    $("#cbomeesbo").html("");

    if ($("#txtcipcdbono").val().trim() == "") {
        $('#mostrarbonopa').hide();
        swal("Mensaje", "Ingrese el Nro Ci para Buscar", "warning");
        return;
    }

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/Iniciar",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                //var gest = data.d.valor;
                cargarDatosPcd();
            } else {
                $('#mostrarbonopa').hide();
                swal("Mensaje", "Actualice la fecha de su PC.", "warning");
            }

        }
    });
});

function sendDataBono() {

    var request = {
        oPersonapcd: {
            Idpersodisca: parseInt($("#txtidPcdbono").val()),
            Idmes: $("#cbomeesbo").val(),
            Monto: parseFloat($("#txtmontoo").val())
        }
    };

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/GuardarBono",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d.Estado) {
                $("#txtcipcdbono").val("");
                $("#txtidPcdbono").val("0");
                $('#mostrarbonopa').hide();
                //console.log("id: ", response.d.Valor);
                var url = 'docBoleta.aspx?id=' + response.d.Valor;
                window.open(url, '', 'height=600,width=800,scrollbars=0,location=1,toolbar=0');
                //var url = 'docVenta.aspx?id=' + response.d.Valor;
                //swal("Mensaje", response.d.Mensage, "success");
            } else {
                swal("Mensaje", response.d.Mensage, "error");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });
}

$('#btnregisbonoactu').on('click', function () {


    if (parseInt($("#txtidPcdbono").val()) == 0) {
        swal("Mensaje", "No se puede Registrar sin Buscar PCD.", "warning");
        return;
    }
    var selectedMonth = $("#cbomeesbo").val();
    if (selectedMonth == "0") {
        swal("Mensaje", "Por favor, seleccione un mes válido.", "warning");
        return;
    }

    var selectedText = $('#cbomeesbo option:selected').text();

    swal({
        title: "Mensaje de Confirmacion?",
        text: "Estas seguro de realizar el registro del mes de " + selectedText,
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: 'btn-warning',
        confirmButtonText: "Si, Registrar!",
        cancelButtonText: "No, Cancelar",
        closeOnConfirm: false
    }, function () {
        swal.close();
        sendDataBono();
        //swal("Deleted!", "Si realizaste el registro.", "success");
    });

    //sendDataBono();
});

$('#btnregisbonopasa').on('click', function () {

    var request = {
        oPersonapcd: {
            Idpersodisca: parseInt($("#txtidPcdbono").val()),
            Idmes: $("#cbomeesbopasa").val(),
            Monto: parseFloat($("#txtmontoo").val())
        }
    };

    $.ajax({
        type: "POST",
        url: "frmPagoBono.aspx/GuardarBonoPruebaante",
        data: JSON.stringify(request),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d.Estado) {
                $("#txtcipcdbono").val("");
                $("#txtidPcdbono").val("0");
                $('#mostrarbonopa').hide();
                //console.log("id: ", response.d.Valor);
                //var url = 'docBoleta.aspx?id=' + response.d.Valor;
                //window.open(url, '', 'height=600,width=800,scrollbars=0,location=1,toolbar=0');
                var mensajee = response.d.Mensage + ' Id: ' + response.d.Valor;

                swal("Mensaje", mensajee, "success");
            } else {
                swal("Mensaje", response.d.Mensage, "error");
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        }
    });

});

$('#btnImprimirpcdebono').on('click', function () {

    //var idbonoc = '2';
    //var url = 'docBoleta.aspx?id=' + idbonoc;
    //window.open(url, '', 'height=600,width=800,scrollbars=0,location=1,toolbar=0');
});