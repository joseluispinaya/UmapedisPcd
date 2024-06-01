


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
    cargarMesesPasado();
    ObtenerDetab();
    //cargarMesesFil();
});

function cargarMesesFil() {

    $("#cbomeesbo").html("");

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
                $("<option>").attr({ "value": 0 }).text("-- Seleccionar mes --").appendTo("#cbomeesbo");

                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cbomeesbo");
                })
                //console.log(data.d.objeto);
            }

        }
    });
}

function cargarMeses() {
    $("#cbomeesbo").html("");

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
                $("<option>").attr({ "value": 0 }).text("-- Seleccionar mes --").appendTo("#cbomeesbo");

                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cbomeesbo");
                })
            }

        }
    });
}

function cargarMesesPasado() {
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
                $("<option>").attr({ "value": 0 }).text("-- Seleccionar mes --").appendTo("#cbomeesbopasa");

                $.each(data.d.objeto, function (i, row) {
                    $("<option>").attr({ "value": row.Idmes }).text(row.Descripcion).appendTo("#cbomeesbopasa");
                })
            }

        }
    });
}

//buecar pcd y reporte
$('#btnBuscarpcdbono').on('click', function () {

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
                    //$('#mostrarbonopa').show();
                } else {
                    swal("Mensaje", "PCD no esta Habilitado para el Bono.", "warning");
                }
                
            } else {
                swal("Mensaje", "No se encontró el PCD.", "warning");
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
                //swal("Mensaje", "Registro Exitoso credenciales enviado a su correo", "success");
                console.log("id: ", response.d.Valor);
                swal("Mensaje", response.d.Mensage, "success");
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

    var selectedMonth = $("#cbomeesbo").val();
    if (selectedMonth == "0") {
        swal("Mensaje", "Por favor, seleccione un mes válido.", "warning");
        return;
    }
    sendDataBono();
});