﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmReporteBono.aspx.cs" Inherits="CapaPresentacion.frmReporteBono" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav.nav-tabs + .tab-content {
            margin-bottom: 10px !important;
            padding: 10px !important; /* Ajusta el valor de padding según lo necesites */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel de Reportes
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card card-primary">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="page-header m-t-0">Consultas Reporte</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab-2" data-toggle="tab" href="#home-2" role="tab" aria-controls="home-2" aria-selected="false">
                                        <span class="d-block d-sm-none"><i class="fa fa-home"></i></span>
                                        <span class="d-none d-sm-block">Por Gestion</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab-2" data-toggle="tab" href="#profile-2" role="tab" aria-controls="profile-2" aria-selected="true">
                                        <span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
                                        <span class="d-none d-sm-block">Por Mes</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="message-tab-2" data-toggle="tab" href="#message-2" role="tab" aria-controls="message-2" aria-selected="false">
                                        <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                                        <span class="d-none d-sm-block">PCD Habilitados</span>
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
                                                            <label class="sr-only" for="lbldetalletotau">Detalle</label>
                                                            <label>Seleccione Gestion</label>
                                                            <%--<label class="form-control input-sm" readonly="readonly" id="lbldetalletotactu"></label>--%>
                                                        </div>

                                                        <div class="form-group m-l-10">
                                                            <select class="form-control form-control-sm" id="cboGestiR"></select>
                                                        </div>
                                                        <%--<button id="btnBuscarGes" type="button" class="btn btn-success waves-effect waves-light m-l-15">Buscar</button>--%>
                                                    </div>
                                                    <br />
                                                    <h4 id="iddetalletotre" class="m-b-10 m-t-10">Detalle pago</h4>
                                                            <table id="tbreporr" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Gestion</th>
                                                                        <th>Ene</th>
                                                                        <th>Feb</th>
                                                                        <th>Mar</th>
                                                                        <th>Abr</th>
                                                                        <th>May</th>
                                                                        <th>Jun</th>
                                                                        <th>Jul</th>
                                                                        <th>Ago</th>
                                                                        <th>Sep</th>
                                                                        <th>Oct</th>
                                                                        <th>Nov</th>
                                                                        <th>Dic</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                    <%--<div class="card">

                                                        <div class="card-body">
                                                            
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
                                                <div class="card-header bg-primary">
                                                    <div class="form-horizontal" id="omitirhabilmes">
                                                        <div class="form-group row m-b-0">
                                                            <div class="col-sm-2 text-center">
                                                                <h3 class="card-title m-0">Gestion</h3>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <select class="form-control form-control-sm" id="cboGestiRa">
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-2 text-center">
                                                                <h3 class="card-title m-0">Mes</h3>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <select class="form-control form-control-sm" id="cboMesR">
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <button type="button" id="btnConsultarM" class="btn btn-sm btn-success">
                                                                    <i class="fas fa-search"></i> Consultar
                                                                </button>
                                                                <button type="button" id="btnImprimiM" class="btn btn-sm btn-success" style="margin-left: 30px;">
                                                                    <i class="fas fa-print"></i> Imprimir
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <h5 id="txtdetallemes" class="m-b-15 m-t-0">Hola</h5>
                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <table id="tbpormes" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Codigo</th>
                                                                        <th>Monto</th>
                                                                        <th>Fecha Pago</th>
                                                                        <th>Nombres PCD</th>
                                                                        <th>Nombre Cajero</th>
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
                                <div class="tab-pane fade" id="message-2" role="tabpanel" aria-labelledby="message-tab-2">
                                    
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-header bg-primary">
                                                    <div class="form-horizontal" id="omitirhabil">
                                                        <div class="form-group row m-b-0">
                                                            <div class="col-sm-2">
                                                            </div>
                                                            <div class="col-sm-4 text-right">
                                                                <h3 class="card-title m-0"><i class="fas fa-user"></i> Seleccione Consulta</h3>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <select class="form-control form-control-sm" id="cboEstadoBon">
                                                                    <option value="0">Mostrar Todos PCD</option>
                                                                    <option value="1">PCD Habilitados</option>
                                                                    <option value="2">PCD Inhabilitados</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <button type="button" id="btnEjemploa" class="btn btn-sm btn-success">
                                                                    <i class="fas fa-tags"></i> Imprimir
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <h5 id="txtdetallein" class="m-b-15 m-t-0"></h5>
                                                    <div class="row">
                                                        <div class="col-sm-12">

                                                            <table id="tbpcdbosi" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Asociacion</th>
                                                                        <th>Discapacidad</th>
                                                                        <th>Nro CI</th>
                                                                        <th>Nombres</th>
                                                                        <th>Apellidos</th>
                                                                        <th>Tutor</th>
                                                                        <th>Estado</th>
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
    <script src="js/frmReporteBono.js" type="text/javascript"></script>
</asp:Content>
