

$(document).ready(function () {

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const IdAso = urlParams.get('id')

    if (IdAso !== null) {
        cargarAsociacioneConPcdraa(IdAso);
        //alert("Mi primer alert");
    } else {
        cargarAsociacioneConPcdr();
    }
    //cargarAsociacioneConPcdr();
})

function cargarAsociacioneConPcdr() {
    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/ObtenerAsociacionConPcd",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                var asociaciones = data.d.objeto;
                var container = $('#seleccionImprimir .container');

                // Limpiar el contenedor antes de agregar las nuevas asociaciones, excepto la imagen de encabezado
                container.find('.header').nextAll().remove();

                asociaciones.forEach(function (asociacion) {
                    var sectionHtml = `
                        <div class="header" style="padding-top: 10px;">
                            <table style="width: 100%;" border="0">
                                <tr>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>FECHA EMISION:</strong></td>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>ASOCIACION:</strong></td>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="left"><strong>RESPONSABLE:</strong></td>
                                </tr>
                                <tr>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span>${new Date().toLocaleDateString()}</span></td>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span>${asociacion.Descripcion}</span></td>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="center"><span>${asociacion.Responsable}</span></td>
                                </tr>
                            </table>
                        </div>
                    `;

                    if (asociacion.oListaPcd.length > 0) {
                        sectionHtml += `
                            <div class="section">LISTA DE PCD DE LA ASOCIACION</div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: left;">Nombres</th>
                                            <th style="text-align: left;">Apellidos</th>
                                            <th style="text-align: left;">Discapacidad</th>
                                            <th style="text-align: left;">Cobra Bono</th>
                                            <th style="text-align: left;">Tutor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${asociacion.oListaPcd.map(pcd => `
                                            <tr>
                                                <td>${pcd.Nombres}</td>
                                                <td>${pcd.Apellidos}</td>
                                                <td>${pcd.oTipoDisca.Descripcion}</td>
                                                <td>${pcd.EstadoBono ? 'Sí' : 'No'}</td>
                                                <td>${pcd.oTutor.Nombres}</td>
                                            </tr>
                                        `).join('')}
                                    </tbody>
                                </table>
                            </div>
                        `;
                    } else {
                        sectionHtml += `
                            <div class="section">LA ASOCIACION NO TIENE PCDS</div>
                        `;
                    }

                    container.append(sectionHtml);
                });
            }
        }
    });
}


function cargarAsociacioneConPcdraa($IdAsocia) {

    var request = {
        IdAso: $IdAsocia
    };

    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/ObtenerAsociacionConPcdId",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                var asociaciones = data.d.objeto;
                var container = $('#seleccionImprimir .container');

                // Limpiar el contenedor antes de agregar las nuevas asociaciones, excepto la imagen de encabezado
                container.find('.header').nextAll().remove();

                asociaciones.forEach(function (asociacion) {
                    var sectionHtml = `
                        <div class="header" style="padding-top: 10px;">
                            <table style="width: 100%;" border="0">
                                <tr>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>FECHA EMISION:</strong></td>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>ASOCIACION:</strong></td>
                                    <td style="border-top:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="left"><strong>RESPONSABLE:</strong></td>
                                </tr>
                                <tr>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span>${new Date().toLocaleDateString()}</span></td>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span>${asociacion.Descripcion}</span></td>
                                    <td style="border-bottom:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="center"><span>${asociacion.Responsable}</span></td>
                                </tr>
                            </table>
                        </div>
                    `;

                    if (asociacion.oListaPcd.length > 0) {
                        sectionHtml += `
                            <div class="section">LISTA DE PCD DE LA ASOCIACION</div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: left;">Nombres</th>
                                            <th style="text-align: left;">Apellidos</th>
                                            <th style="text-align: left;">Discapacidad</th>
                                            <th style="text-align: left;">Cobra Bono</th>
                                            <th style="text-align: left;">Tutor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${asociacion.oListaPcd.map(pcd => `
                                            <tr>
                                                <td>${pcd.Nombres}</td>
                                                <td>${pcd.Apellidos}</td>
                                                <td>${pcd.oTipoDisca.Descripcion}</td>
                                                <td>${pcd.EstadoBono ? 'Sí' : 'No'}</td>
                                                <td>${pcd.oTutor.Nombres}</td>
                                            </tr>
                                        `).join('')}
                                    </tbody>
                                </table>
                            </div>
                        `;
                    } else {
                        sectionHtml += `
                            <div class="section">LA ASOCIACION NO TIENE PCDS</div>
                        `;
                    }

                    container.append(sectionHtml);
                });
            }
        }
    });
}

function cargarAsociacioneConPcdrOri() {
    $.ajax({
        type: "POST",
        url: "frmAsociaciones.aspx/ObtenerAsociacionConPcd",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d.estado) {
                console.log(data.d.objeto);
            }
        }
    });
}