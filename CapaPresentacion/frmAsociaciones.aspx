<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmAsociaciones.aspx.cs" Inherits="CapaPresentacion.frmAsociaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<style>
        #menuAsocia {
            margin: 0 auto;
            padding: 0;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Asociaciones
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row" id="menuAsocia">
        <div class="col-sm-12 col-md-6">
            <div class="card text-center">
                <div class="card-heading">
                    <%--<h4 class="card-title text-muted font-weight-light mb-0">Asociaciones</h4>--%>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnListaAsoc" type="button" class="btn btn-block btn-success"><i class="fas fa-align-justify"></i> Lista</button>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-6">
            <div class="card text-center">
                <div class="card-heading">
                    <%--<h4 class="card-title text-muted font-weight-light mb-0">Nuevo Registro</h4>--%>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevoConAso" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Consultar</button>
                </div>
            </div>
        </div>

        <%--<div class="col-sm-12 col-md-4">
            <div class="card text-center">
                <div class="card-heading">
                    <h4 class="card-title text-muted font-weight-light mb-0">Consultas</h4>
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevoConAso" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Consultar</button>
                </div>
            </div>
        </div>--%>
    </div>

    <!-- ========== Contenedores Lista ========== -->
    <div class="row" id="listaRegiRow">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <div class="form-horizontal">
                        <div class="form-group row m-b-0">
                            <div class="col-sm-6 text-center">
                                <h3 class="card-title m-0"><i class="fas fa-user"></i> Asociaciones</h3>
                            </div>
                            <div class="col-sm-6 text-left">
                                <button type="button" id="btnNuevoR" class="btn btn-sm btn-success">
                                    <i class="fas fa-user-plus"></i> Nuevo Registro
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="overlay" class="card-body">

                    <div class="row mt-3">
                        <div class="col-sm-12">

                            <table id="tbAsoci" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Asociacion</th>
                                        <th>Responsable</th>
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


    <div id="custom-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title m-0" id="custom-width-modalLabel">Asociacion</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <input id="txtIdAsos" class="model" name="IdAsociacion" value="0" type="hidden" />
                <div class="form-row">
                    <div class="form-group col-sm-4">
                        <label for="txtDescripcion">Nombre</label>
                        <input type="text" class="form-control input-sm model" id="txtDescripcion" name="Descripcion">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="txtRespo">Responsable</label>
                        <input type="text" class="form-control input-sm model" id="txtRespo" name="Descripcion">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="cboEstado">Estado</label>
                        <select class="form-control form-control-sm" id="cboEstado">
                            <option value="1">Activo</option>
                            <option value="0">No Activo</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cerrar</button>
                <button id="btnGuardarCambios" type="button" class="btn btn-primary waves-effect waves-light">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="js/frmAsociaciones.js" type="text/javascript"></script>
</asp:Content>
