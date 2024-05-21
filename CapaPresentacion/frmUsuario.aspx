<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmUsuario.aspx.cs" Inherits="CapaPresentacion.frmUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .buttons-excel{
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }
        /*.video-wra {
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
        }
        .video {
            object-fit: cover !important;
            width: 100px !important;
            height: 100px !important;
        }
        .photo {
            width: 100px !important;
            height: 100px !important;
        }*/
        see{
            display: flex;
            margin: 0 auto;
            align-items: center;
            justify-content: center;
            width: 80%;
            height: 95vh;
            gap: 20px;
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
        .photo {
            width: 140px;
            height: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Usuarios
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-body">
                      <h4 class="m-t-0 m-b-30">Usuarios</h4>
                        <div class="row">
                            <div class="col-sm-2">
                                <button id="btnNuevoRol" type="button" class="btn btn-sm btn-success"><i class="fas fa-user-plus"></i> Nuevo</button>
                            </div>
                        </div>
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                
                                <table id="tbUsuario" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Foto</th>
                                            <th>Rol</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Correo</th>
                                            <th>Ocupacion</th>
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

<div class="modal fade bs-example-modal-lg" id="modalrol" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title m-0" id="myLargeModalLabel">Usuarios</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <input id="txtIdUsuario" class="model" name="IdUsuario" value="0" type="hidden" />
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-row">
                                <div class="form-group col-sm-6">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" class="form-control input-sm model" id="txtNombres" name="Nombres">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label for="txtApellidos">Apellidos</label>
                                    <input type="email" class="form-control input-sm model" id="txtApellidos" name="Apellidos">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-6">
                                    <label for="txtCorreo">Correo</label>
                                    <input type="text" class="form-control input-sm model" id="txtCorreo" name="Correo">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label for="cboRol">Rol</label>
                                    <select class="form-control form-control-sm" id="cboRol">
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-6">
                                    <label for="cboEstado">Estado</label>
                                    <select class="form-control form-control-sm" id="cboEstado">
                                        <option value="1">Activo</option>
                                        <option value="0">No Activo</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label for="txtOcupacion">Ocupacion</label>
                                    <input type="text" class="form-control input-sm model" id="txtOcupacion" name="ocupacion"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 text-center">
                                    <label for="txtFoto">Opcion Foto</label> <br />
                                    <button id="btntomarfoto" type="button" class="btn waves-effect btn-secondary"> <i class="fas fa-camera"></i> </button>
                                    <button id="btnselectfoto" type="button" class="btn waves-effect btn-secondary"> <i class="far fa-folder-open"></i> </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group text-center">
                                    <p>Seccion Imagen</p>
                                </div>
                            <section class="content invoice camaraa">
                                <div class="row">
                                    <div class="col-sm-6 text-center">
                                        <div class="video-wrap">
                                            <video id="videoa" class="video" autoplay muted></video>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <canvas id="canvasa" class="canvas" style="display: none;"></canvas>
                                        <img src="Imagenes/Sinfotop.jpg" id="footo" class="photo" alt="photo" />
                                    </div>

                                </div>
                                <div class="form-group m-b-0">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button id="btncapturar" type="button" class="btn btn-danger waves-effect waves-light">Capturar</button>
                                    </div>
                                </div>
                            </section>

                            <section class="content invoice selecc">
                                <div class="form-group">
                                    <p>Seleccione Foto</p>
                                    <input type="file" id="txtFoto" accept="image/*" class="filestyle" data-buttonbefore="true">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-sm-12 text-center">
                                        <img id="imgUsuarioM" src="Imagenes/Sinfotop.jpg" alt="Foto usuario" style="height:150px; max-width:150px; border-radius: 50%;">
                                    </div>
                                </div>
                            </section>
                            <%--<div class="form-group">
                                <p>Seleccione Foto</p>
                                <input type="file" id="txtFoto" accept="image/*" class="filestyle" data-buttonbefore="true">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 text-center">
                                    <img id="imgUsuarioM" src="Imagenes/Sinfotop.jpg" alt="Foto usuario" style="max-width: 100px; border-radius: 50%;" class="mx-auto">
                                </div>
                            </div>--%>
                        </div>

                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
    <script src="js/frmUsuario.js" type="text/javascript"></script>
</asp:Content>
