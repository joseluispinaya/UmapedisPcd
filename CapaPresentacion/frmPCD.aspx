<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmPCD.aspx.cs" Inherits="CapaPresentacion.frmPCD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="assets/cardzero.css" rel="stylesheet"/>--%>
    <link href="assets/cardmodi.css" rel="stylesheet"/>
    <style>
        .buttons-excel{
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }
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
        #cardhi {
            border: 2px solid #36af51 !important;
        }
        @media print {
            #omitirhisb {
                display: none !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Personas PCD
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row" id="menupcd">
        <div class="col-sm-6 col-lg-4">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Lista de Registros</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnListaPcd" type="button" class="btn btn-block btn-success"><i class="fas fa-align-justify"></i> Lista</button>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-lg-4">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Nuevo Registro</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevore" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Nuevo</button>
                </div>
            </div>
        </div>


        <div class="col-sm-6 col-lg-4">
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
                <div id="overlay" class="card-body">
                    <h4 class="m-b-30 m-t-0">Lista de Registros PCD</h4>

                    <div class="row mt-3">
                        <div class="col-sm-12">

                            <table id="tbPcd" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Foto</th>
                                        <th>Asociacion</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Tutor</th>
                                        <th>Pago</th>
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
                                        Marcar si tiene Tutor
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <button id="btnGuardarCambiospcd" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
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

<!-- ========== Contenedores ========== -->
    <div class="row" id="historialpcdp">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-horizontal m-b-10" id="omitirhisb">

                        <div class="form-group row m-b-0">
                            <div class="col-sm-3">
                                <h4 class="m-b-0 m-t-0">Historial PCD</h4>
                            </div>

                            <label for="inputPassh" class="col-sm-2 control-label text-right">Ingrse CI</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control input-sm" id="txtcipcdHis" name="Nro ci">
                            </div>
                            <div class="col-sm-5">
                                <button id="btnBuscarpcd" type="button" class="btn btn-sm btn-success">Buscar</button>
                                <button id="btnImprimirhipcde" type="button" class="btn btn-sm btn-primary" style="margin-left: 30px;">
                                    <i class="fa fa-print"></i> Imprimir
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr class="m-b-10 m-t-5" />

                    <div class="row" id="logomenbre" style="display: none;">
                        <div class="col-sm-12 text-center">
                            <img src="assets/images/uma2.png" alt="Header Image" style="width: 100%;" />
                            <h4 class="m-b-0 m-t-10">UNIDAD MUNICIPAL DE ATENCION A PCD</h4>
                        </div>
                    </div>
                    

                    <div class="row" id="mostrarhiev" style="display: none;">

                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bg-primary">
                                    <h4 class="card-title m-0">INFORMACION DE PCD</h4>
                                </div>
                                <div class="card-body d-flex justify-content-center align-items-center">
                                    <input id="txtidPcdbonoH" class="model" name="Idpcdbon" value="0" type="hidden" />
                                    <input id="txtmontoo" class="model" name="Idpn" value="250" type="hidden" />
                                    <div class="cardui">
                                    <div class="cardui-image">
                                        <img src="assets/images/umapp.png" alt="">
                                    </div>
                                    <div class="profile-imageu">
                                        <img id="imgbonotopot" src="assets/images/av-1.jpg" alt="">
                                    </div>
                                    <div class="cardui-content">
                                        <h3 id="rptnamebo">UMAPEDIS</h3>
                                        <p id="rptapellibo">DIRECCION DG AG</p>
                                        <strong>Nro CI:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lblcipcd">73999544</label><br>
                                            <strong>Nro Cred:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lblcrede">Umapedis@gmail.com</label><br>
                                            <strong>Disca:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lblporceb">SILVI NUEVA</label><br>
                                            <strong>Afialiado A:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lblasocib">SILVIA VILL</label><br>
                                            <strong>Tipo:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lbltipob">SILVIA V</label><br>
                                            <strong>Tutor:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label id="lbltutpcd">SILVIA NUEVA</label>
                                        
                                    </div>
                                    <%--<div class="iconocs">
                                    </div>--%>
                                </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-8">
                            <div class="card">
                                <div class="card-header bg-primary">
                                    <h4 class="card-title m-0">Detalle Bono</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="tbpagoBonoGeneral" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Gestion</th>
                                                        <th>Nro Pagos</th>
                                                        <th>Total</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4 id="iddetallD" class="text-center m-b-10 m-t-10">Detalle pago</h4>
                                            <table id="tbpagoBonopDett" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Mes</th>
                                                        <th>Monto</th>
                                                        <th>Fecha</th>
                                                        <th>Funcionario</th>
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
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-lg" id="modalroltut" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title m-0" id="myLargeModalLabel">Tutor</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <input id="txtidtutoo" class="model" name="IdTutor" value="0" type="hidden" />
                    <input id="txtidtuPcd" class="model" name="Idpcdd" value="0" type="hidden" />
                    <div class="form-group row">
                        <label for="lblnomcompcd" class="col-sm-3 col-form-label col-form-label-sm">Nombre PCD:</label>
                        <div class="col-sm-9">
                            <label class="form-control input-sm model" readonly="readonly" id="lblnomcompcd"></label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtcituoo" class="col-sm-3 col-form-label col-form-label-sm">Nro CI</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control input-sm model" id="txtcituoo" name="Nro ci">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtNomAptut" class="col-sm-3 col-form-label col-form-label-sm">Nombre Ap.</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control input-sm model" id="txtNomAptut" name="Nombres">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtParentetutt" class="col-sm-3 col-form-label col-form-label-sm">Parentesco</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control input-sm model" id="txtParentetutt" name="Parentesco">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="txtCeltutoo" class="col-sm-3 col-form-label col-form-label-sm">Celular</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control input-sm model" id="txtCeltutoo" name="Celular">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button id="btnGuardarTtuto" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
    <script src="js/frmPCD.js" type="text/javascript"></script>
</asp:Content>
