<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmPCD.aspx.cs" Inherits="CapaPresentacion.frmPCD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        video{
            object-fit: cover;
            width: 140px !important;
            height: 120px !important;
            border: solid 1px rgb(237, 121, 13);
            border-radius: 10px;
        }
        canvas{
            border: solid 1px rgb(237, 121, 13);
            border-radius: 10px;
        }
        .photoc {
            width: 140px;
            height: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Personas PCD
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-sm-6 col-lg-3">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Lista de Registros</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnListaPcd" type="button" class="btn btn-block btn-success"><i class="fas fa-align-justify"></i> Lista</button>
                    <%--<h2 class="m-t-0 m-b-15"><i class="mdi mdi-arrow-down-bold-circle-outline text-danger m-r-10"></i><b>8952</b></h2>--%>
                    <%--<p class="text-muted m-b-0 m-t-20"><b>48%</b> From Last 24 Hours</p>--%>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-lg-3">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Nuevo Registro</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevore" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Nuevo</button>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-lg-3">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Registro sin Tutor</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevoSintuto" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Nuevo</button>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-lg-3">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Historial PCD</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnKardex" type="button" class="btn btn-block btn-danger"><i class="fas fa-id-card"></i> Historial</button>
                </div>
            </div>
        </div>
    </div>

    <!-- ========== Contenedores ========== -->
    <div class="row" id="listaRegistrosRow">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="m-b-30 m-t-0">Lista de Registros PCD</h4>

                    <div class="row mt-3">
                        <div class="col-sm-12">

                            <table id="tbPcd" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Foto</th>
                                        <th>Asociacion</th>
                                        <th>Discapacidad</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Nro CI</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" id="nuevoRegistroRow">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-horizontal m-b-0">

                        <div class="form-group row m-b-0">
                            <div class="col-sm-3">
                                <h4 class="m-b-0 m-t-0">Nuevo Registro</h4>
                            </div>

                            <label for="inputPass" class="col-sm-3 control-label text-right">Con Tutor?</label>
                            <div class="col-sm-3">
                                <div class="checkbox checkbox-primary">
                                    <input id="checTutor" type="checkbox">
                                    <label for="checTutor">
                                        Marcar Reg !
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
                            </div>
                        </div>
                    </div>
                    <hr class="m-b-0 m-t-5" />
                    <!-- ========== FormPcd ========== -->
                    <div class="row m-t-0">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-row">
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="txtcipcd" class="col-form-label col-form-label-sm">Nro CI</label>
                                                    <input type="text" class="form-control input-sm model" id="txtcipcd" name="Nro ci">
                                                </div>
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="txtNrocarnetdis" class="col-form-label col-form-label-sm">Nro carnet PCD</label>
                                                    <input type="text" class="form-control input-sm model" id="txtNrocarnetdis" name="Nro carnet">
                                                </div>
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="txtPorsentaje" class="col-form-label col-form-label-sm">Porsentaje</label>
                                                    <input type="text" class="form-control input-sm model" id="txtPorsentaje" name="Porsentaje">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="txtNombrespcd" class="col-form-label col-form-label-sm">Nombres</label>
                                                    <input type="text" class="form-control input-sm model" id="txtNombrespcd" name="Nombres PCD">
                                                </div>
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="txtApellidospcd" class="col-form-label col-form-label-sm">Apellidos</label>
                                                    <input type="text" class="form-control input-sm model" id="txtApellidospcd" name="Apellidos PCD">
                                                </div>
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="cbosexo" class="col-form-label col-form-label-sm">Sexo</label>
                                                    <select class="form-control form-control-sm" id="cbosexo">
                                                        <option value="Masculino">Masculino</option>
                                                        <option value="Femenino">Femenino</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="cboTipoDisca" class="col-form-label col-form-label-sm">Tipo Discapacidad</label>
                                                    <select class="form-control form-control-sm" id="cboTipoDisca"></select>
                                                </div>
                                                <div class="form-group mb-0 col-sm-4">
                                                    <label for="cboAsocia" class="col-form-label col-form-label-sm">Asociacion</label>
                                                    <select class="form-control form-control-sm" id="cboAsocia"></select>
                                                </div>
                                                <div class="form-group mb-0 col-sm-4 text-center">
                                                    <label for="cbosexox" class="col-form-label col-form-label-sm">Opcion foto</label><br />
                                                    <button id="btntomarfotopcd" type="button" class="btn waves-effect btn-secondary"><i class="fas fa-camera"></i></button>
                                                    <button id="btnselectfotopcd" type="button" class="btn waves-effect btn-secondary"><i class="far fa-folder-open"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <section class="content invoice camaraapcd">
                                                <div class="row">
                                                    <div class="col-sm-6 text-center">
                                                        <div class="video-wrap">
                                                            <video id="videoapcd" class="video" autoplay muted></video>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <canvas id="canvasapcd" class="canvas" style="display: none;"></canvas>
                                                        <img src="Imagenes/Sinfotop.jpg" id="footopcd" class="photoc" alt="photo" />
                                                    </div>

                                                </div>
                                                <div class="form-group m-b-0">
                                                    <div class="offset-sm-3 col-sm-9">
                                                        <button id="btncapturarpcd" type="button" class="btn btn-danger waves-effect waves-light">Capturar</button>
                                                    </div>
                                                </div>
                                            </section>
                                            <section class="content invoice seleccpcd">
                                                <div class="form-group row">
                                                    <label for="staticEmail" class="col-sm-4 col-form-label col-form-label-sm">Seleccione Foto</label>
                                                    <div class="col-sm-8">
                                                        <input type="file" id="txtFotopcd" accept="image/*" class="filestyle" data-buttonbefore="true">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-sm-12 text-center">
                                                        <img id="imgUsuarioPcd" src="Imagenes/Sinfotop.jpg" alt="Foto usuario" style="height: 120px; max-width: 120px; border-radius: 50%;">
                                                    </div>
                                                </div>
                                            </section>
                                            <%--<div class="form-group row">
                                                <label for="staticEmail" class="col-sm-4 col-form-label col-form-label-sm">Seleccione Foto</label>
                                                <div class="col-sm-8">
                                                    <input type="file" id="txtFotopcd" accept="image/*" class="filestyle" data-buttonbefore="true">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-sm-12 text-center">
                                                    <img id="imgUsuarioPcd" src="Imagenes/Sinfotop.jpg" alt="Foto usuario" style="height: 120px; max-width: 120px; border-radius: 50%;">
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ========== FormTutor ========== -->
                    <div class="row" id="tutorrr">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="m-b-0 m-t-0">Registro Tutor PCD</h4>
                                    <div class="form-row">
                                        <div class="form-group mb-0 col-sm-3">
                                            <label for="txtcituto" class="col-form-label col-form-label-sm">Nro CI</label>
                                            <input type="text" class="form-control form-control-sm model" id="txtcituto" name="Nro ci">
                                        </div>
                                        <div class="form-group mb-0 col-sm-3">
                                            <label for="txtNomTuto" class="col-form-label col-form-label-sm">Nombre</label>
                                            <input type="text" class="form-control form-control-sm model" id="txtNomTuto" name="Nombre">
                                        </div>
                                        <div class="form-group mb-0 col-sm-3">
                                            <label for="txtParentesco" class="col-form-label col-form-label-sm">Parentesco</label>
                                            <input type="text" class="form-control form-control-sm model" id="txtParentesco" name="Parentesco">
                                        </div>
                                        <div class="form-group mb-0 col-sm-3">
                                            <label for="txtNrocel" class="col-form-label col-form-label-sm">Celular</label>
                                            <input type="text" class="form-control form-control-sm model" id="txtNrocel" name="Celular">
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" id="nuevoRegistrosinTutor">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="m-t-0">Nuevo Registro Sin Tutor</h4>

                    <div style="height: 200px"></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
    <script src="js/frmPCD.js" type="text/javascript"></script>
</asp:Content>
