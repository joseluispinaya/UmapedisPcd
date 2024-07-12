<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmPagoBono.aspx.cs" Inherits="CapaPresentacion.frmPagoBono" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/cardzero.css" rel="stylesheet"/>
    <style>
        #cardhi {
            border: 2px solid #36af51 !important;
        }
        .nav.nav-tabs + .tab-content {
            margin-bottom: 10px !important;
            padding: 10px !important; /* Ajusta el valor de padding según lo necesites */
        }
        .sin-margin-bottom {
            margin-bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Pago Bono
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-horizontal m-b-10" id="omitirpagobono">

                        <div class="form-group row m-b-0">
                            <div class="col-sm-3">
                                <h4 class="m-b-0 m-t-0">Buscar PCD</h4>
                            </div>

                            <label for="inputPassh" class="col-sm-2 control-label text-right">Ingrse CI</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control input-sm" id="txtcipcdbono" name="Nro ci">
                            </div>
                            <div class="col-sm-5">
                                <button id="btnBuscarpcdbono" type="button" class="btn btn-sm btn-success">Buscar</button>
                                <button id="btnImprimirpcdebono" type="button" class="btn btn-sm btn-primary" style="margin-left: 30px;">
                                    <i class="fa fa-print"></i> Imprimir
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr class="m-b-10 m-t-5" />
                    <div class="row" id="mostrarbonopa">

                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bg-primary">
                                    <h4 class="card-title m-0">INFORMACION DE PCD</h4>
                                </div>
                                <div class="card-body d-flex justify-content-center align-items-center">
                                    <input id="txtidPcdbono" class="model" name="Idpcdbon" value="0" type="hidden" />
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
                                            <strong>Nro CI :</strong>
                                            <label id="lblcipcd">73999544</label><br>
                                            <strong>Nro Cred: </strong>
                                            <label id="lblcrede">Umapedis@gmail.com</label><br>
                                            <strong>Disca:  </strong>
                                            <label id="lblporceb">SILVI NUEVA</label><br>
                                            <strong>Afialiado:  </strong>
                                            <label id="lblasocib">SILVIA VILL</label><br>
                                            <strong>Tipo:  </strong>
                                            <label id="lbltipob">SILVIA V</label><br>
                                            <strong>Tutor:  </strong>
                                            <label id="lbltutpcd">SILVIA NUEVA</label>
                                        </div>
                                        <div class="iconocs">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-sm-8">
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab-2" data-toggle="tab" href="#home-2" role="tab" aria-controls="home-2" aria-selected="false">
                                        <span class="d-block d-sm-none"><i class="fa fa-home"></i></span>
                                        <span class="d-none d-sm-block">Pago Actual</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab-2" data-toggle="tab" href="#profile-2" role="tab" aria-controls="profile-2" aria-selected="true">
                                        <span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
                                        <span class="d-none d-sm-block">Pago Pasado</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="message-tab-2" data-toggle="tab" href="#message-2" role="tab" aria-controls="message-2" aria-selected="false">
                                        <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                                        <span class="d-none d-sm-block">Detalle General</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content bg-light">
                                <div class="tab-pane fade show active" id="home-2" role="tabpanel" aria-labelledby="home-tab-2">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">

                                                    <div class="form-inline">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="lbldetalletotactu">Detalle</label>
                                                            <label class="form-control input-sm" readonly="readonly" id="lbldetalletotactu"></label>
                                                        </div>

                                                        <div class="form-group m-l-10">
                                                            <label class="sr-only" for="exampleInputPasswcord2">Password</label>
                                                            <label class="form-control input-sm" readonly="readonly" id="lblmontobon"></label>
                                                        </div>
                                                        <div class="form-group m-l-10">
                                                            <select class="form-control form-control-sm" id="cbomeesbo"></select>
                                                        </div>
                                                        <button id="btnregisbonoactu" type="button" class="btn btn-success waves-effect waves-light m-l-15">Registrar Pago</button>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <h4 id="iddetalleactuh" class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <table id="tbpagoBono" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Mes</th>
                                                                        <th>Monto</th>
                                                                        <th>Fecha</th>
                                                                        <th>Funcionario</th>
                                                                        <th>Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <%--<div class="card">
                                                        <div class="card-body">
                                                            <h4 id="iddetalleactuh" class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <table id="tbpagoBono" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Mes</th>
                                                                        <th>Monto</th>
                                                                        <th>Fecha</th>
                                                                        <th>Funcionario</th>
                                                                        <th>Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="profile-2" role="tabpanel" aria-labelledby="profile-tab-2">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">

                                                    <div class="form-inline">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="lbldetalletotpasa">Detalle</label>
                                                            <label class="form-control input-sm" readonly="readonly" id="lbldetalletotpasa"></label>
                                                        </div>

                                                        <div class="form-group m-l-10">
                                                            <label class="sr-only" for="lblmontobonpasa">Password</label>
                                                            <label class="form-control input-sm" readonly="readonly" id="lblmontobonpasa"></label>
                                                        </div>
                                                        <div class="form-group m-l-10">
                                                            <select class="form-control form-control-sm" id="cbomeesbopasa"></select>
                                                        </div>
                                                        <button id="btnregisbonopasa" type="button" class="btn btn-success waves-effect waves-light m-l-15">Registrar Pago</button>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <h4 id="iddetallepasado" class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <table id="tbpagoBonopasad" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Mes</th>
                                                                        <th>Monto</th>
                                                                        <th>Fecha</th>
                                                                        <th>Funcionario</th>
                                                                        <th>Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>


                                                    <%--<div class="card">
                                                        <div class="card-body">
                                                            <h4 id="iddetallepasado" class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <table id="tbpagoBonopasad" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Mes</th>
                                                                        <th>Monto</th>
                                                                        <th>Fecha</th>
                                                                        <th>Funcionario</th>
                                                                        <th>Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="message-2" role="tabpanel" aria-labelledby="message-tab-2">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">

                                                    <div class="form-row">
                                                        <div class="form-group col-sm-12 text-center">
                                                            <label for="txtDocumentoClienteat" id="iddetalleGenera">Nro CI</label>
                                                        </div>

                                                    </div>

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
                                                            <h4 id="iddetallD" class="m-b-10 m-t-10">Detalle pago</h4>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="js/frmPagoBono.js" type="text/javascript"></script>
</asp:Content>
