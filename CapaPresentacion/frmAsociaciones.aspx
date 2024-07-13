<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmAsociaciones.aspx.cs" Inherits="CapaPresentacion.frmAsociaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilos personalizados para evitar conflictos con Bootstrap */
        .background1-left-column {
            background: linear-gradient(180deg, #21c8f6, #637bff);
        }

        .containera-custom {
            display: flex;
            flex-wrap: wrap; /* Para que las tarjetas se envuelvan en múltiples filas */
            justify-content: center;
            align-items: center;
            gap: 1.5rem; /* Espacio entre tarjetas */
            padding: 1rem;
        }

        .carda-custom {
            background-color: #fff;
            border-radius: 1rem;
            box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.4);
            display: flex;
            margin: 1.5rem;
            overflow: hidden;
            width: 25rem;
            height: 10rem;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
            border: none;
        }

            .carda-custom h6 {
                opacity: 0.6;
                text-transform: uppercase;
                margin: 0;
            }

            .carda-custom h2 {
                margin: 1rem 0;
                color: rgb(68, 66, 66);
            }

            .carda-custom .dih {
                margin: 0.4rem 0;
            }

            .carda-custom .dihe {
                margin: 0.4rem 0;
            }

        .left-column-custom {
            color: #fff;
            padding: 1.5rem;
            max-width: 10rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
        }

            .left-column-custom h2 {
                color: #fff;
                font-size: 14px;
            }

            .left-column-custom i {
                font-size: 2rem;
            }

        .right-column-custom {
            padding: 1rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex: 1;
        }

        .buttona-custom {
            border-radius: 3rem;
            box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.2);
            color: #fff;
            font-size: 1.2rem;
            padding: 0.4rem 1.3rem;
            letter-spacing: 0.1rem;
            align-self: flex-end;
            cursor: pointer;
            border: none !important;
        }

        @media (max-width: 1030px) {
            .containera-custom {
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: auto;
            }

            .carda-custom {
                width: 100%; /* Las tarjetas ocupan todo el ancho disponible en pantallas pequeñas */
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel Asociaciones
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row" id="menuAsocia">
        <div class="col-sm-12 col-md-6">
            <div class="card text-center">
                <div class="card-heading">
                </div>
                <div class="card-body p-t-10">
                    <button id="btnListaAsoc" type="button" class="btn btn-block btn-success"><i class="fas fa-align-justify"></i> Lista</button>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-6">
            <div class="card text-center">
                <div class="card-heading">
                </div>
                <div class="card-body p-t-10">
                    <button id="btnNuevoConAso" type="button" class="btn btn-block btn-primary"><i class="fas fa-user-plus"></i> Consultar</button>
                </div>
            </div>
        </div>
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

    <!-- ========== Contenedores Consultas ========== -->
    <div class="row" id="consulRow">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <div class="form-horizontal">
                        <div class="form-group row m-b-0">
                            <div class="col-sm-6 text-center">
                                <h3 class="card-title m-0"><i class="fas fa-user"></i> Consultas Asociaciones</h3>
                            </div>
                            <div class="col-sm-6 text-left">
                                <button type="button" id="btnInpGeneA" class="btn btn-sm btn-success">
                                    <i class="fa fa-print"></i> Informe General
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="containera containera-custom">
                        <!-- Las tarjetas se añadirán aquí mediante JavaScript -->
                    </div>

                    <%--<div class="containera">
                        <div class="carda">
                            <div class="left-column background1-left-column">
                                <h6>Control de</h6>
                                <h2>GitHub</h2>
                                <i class="fas fa-hand-point-right" aria-hidden="true"></i>
                            </div>
                            <div class="right-column">
                                <div>
                                    <h4 class="dihe">Dificultad</h4>
                                    <h6>media - baja</h6>
                                </div>
                                <h4 class="dih">Aprende github en 3</h4>

                                <button type="button" class="buttona background1-left-column">Empezar</button>
                            </div>
                        </div>
                    </div>--%>
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
                        <input type="text" class="form-control input-sm model" id="txtRespo" name="Responsable">
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
