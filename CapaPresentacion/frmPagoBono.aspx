<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmPagoBono.aspx.cs" Inherits="CapaPresentacion.frmPagoBono" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <button id="btnImprimirpcdebono" type="button" class="btn btn-sm btn-primary">
                                    <i class="fa fa-print"></i> Imprimir
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr class="m-b-10 m-t-5" />
                    <div class="row" id="mostrarbonopa">
                        <div class="col-sm-4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card" id="cardhi">
                                        <div class="card-body user-card">
                                            <input id="txtidPcdbono" class="model" name="Idpcdbon" value="0" type="hidden" />
                                            <input id="txtmontoo" class="model" name="Idpn" value="250" type="hidden" />
                                            <div class="media-main">
                                                <a class="float-left" href="#">
                                                    <img id="imgbonotopot" class="thumb-lg rounded-circle" src="assets/images/users/avatar-2.jpg" alt="">
                                                </a>
                                                <div class="info pl-3">
                                                    <h4 class="mt-3" id="rptnamebo">Pauline I. Bird</h4>
                                                    <p class="text-muted" id="rptapellibo">Family Member</p>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <%--<p class="text-muted info-text">been the industry's standard dummy te</p>--%>
                                            <div class="row m-b-0 m-t-5">
                                                <div class="col-4 text-right">
                                                    <address>
                                                        <strong>Nro CI:</strong><br>
                                                        <strong>Nro Cred:</strong><br>
                                                        <strong>% Disca:</strong><br>
                                                        <strong>Afialiado:</strong><br>
                                                        <strong>Tipo:</strong><br>
                                                        <strong>Tutor:</strong>
                                                    </address>
                                                </div>
                                                <div class="col-8">
                                                    <address>
                                                        <label id="lblcipcd" class="sin-margin-bottom"></label><br>
                                                        <label id="lblcrede" class="sin-margin-bottom"></label><br>
                                                        <label id="lblporceb" class="sin-margin-bottom"></label><br>
                                                        <label id="lblasocib" class="sin-margin-bottom"></label><br>
                                                        <label id="lbltipob" class="sin-margin-bottom"></label><br>
                                                        <label id="lbltutpcd" class="sin-margin-bottom"></label>
                                                    </address>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- card-body -->
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

                                                    <div class="card">

                                                        <div class="card-body">
                                                            <h4 class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <td><strong>Gestion</strong></td>
                                                                    <td class="text-center"><strong>Monto</strong></td>
                                                                    <td class="text-center"><strong>Cant Pagos</strong>
                                                                    </td>
                                                                    <td class="text-right"><strong>Total</strong></td>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>2022</td>
                                                                    <td class="text-center">250 Bs</td>
                                                                    <td class="text-center">8</td>
                                                                    <td class="text-right">2000 Bs</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2023</td>
                                                                    <td class="text-center">250 Bs</td>
                                                                    <td class="text-center">8</td>
                                                                    <td class="text-right">2000 Bs</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2024</td>
                                                                    <td class="text-center">250 Bs</td>
                                                                    <td class="text-center">8</td>
                                                                    <td class="text-right">2000 Bs</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="thick-line"></td>
                                                                    <td class="thick-line"></td>
                                                                    <td class="thick-line text-center">
                                                                        <strong>Subtotal</strong></td>
                                                                    <td class="thick-line text-right">6000 Bs</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="no-line"></td>
                                                                    <td class="no-line"></td>
                                                                    <td class="no-line text-center">
                                                                        <strong>Descuento</strong></td>
                                                                    <td class="no-line text-right">0.0 Bs</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="no-line"></td>
                                                                    <td class="no-line"></td>
                                                                    <td class="no-line text-center">
                                                                        <strong>Total</strong></td>
                                                                    <td class="no-line text-right">
                                                                        <h4 class="m-0">6000 Bs</h4>
                                                                    </td>
                                                                </tr>
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

                                                    <div class="card">

                                                        <div class="card-body">
                                                            <h4 class="m-b-10 m-t-10">Detalle pago Pasado</h4>
                                                            <div class="table-responsive">
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <td><strong>Gestion</strong></td>
                                                                            <td class="text-center"><strong>Monto</strong></td>
                                                                            <td class="text-center"><strong>Cant Pagos</strong>
                                                                            </td>
                                                                            <td class="text-right"><strong>Total</strong></td>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>2022</td>
                                                                            <td class="text-center">250 Bs</td>
                                                                            <td class="text-center">8</td>
                                                                            <td class="text-right">2000 Bs</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>2023</td>
                                                                            <td class="text-center">250 Bs</td>
                                                                            <td class="text-center">8</td>
                                                                            <td class="text-right">2000 Bs</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>2024</td>
                                                                            <td class="text-center">250 Bs</td>
                                                                            <td class="text-center">8</td>
                                                                            <td class="text-right">2000 Bs</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="thick-line"></td>
                                                                            <td class="thick-line"></td>
                                                                            <td class="thick-line text-center">
                                                                                <strong>Subtotal</strong></td>
                                                                            <td class="thick-line text-right">6000 Bs</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="no-line"></td>
                                                                            <td class="no-line"></td>
                                                                            <td class="no-line text-center">
                                                                                <strong>Descuento</strong></td>
                                                                            <td class="no-line text-right">0.0 Bs</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="no-line"></td>
                                                                            <td class="no-line"></td>
                                                                            <td class="no-line text-center">
                                                                                <strong>Total</strong></td>
                                                                            <td class="no-line text-right">
                                                                                <h4 class="m-0">6000 Bs</h4>
                                                                            </td>
                                                                        </tr>
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
                                <div class="tab-pane fade" id="message-2" role="tabpanel" aria-labelledby="message-tab-2">
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
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
