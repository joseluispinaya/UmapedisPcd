<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEditarPcd.aspx.cs" Inherits="CapaPresentacion.frmEditarPcd" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>UMAPEDIS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <link href="assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css"/>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

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
        .photocm {
            width: 140px;
            height: 110px;
        }
    </style>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <div id="wrapper">
        <div class="accountbg"></div>
        <div class="content">
            <div class="" style="height: 40px">
                <div class="page-header-title">
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="text-center m-t-0 m-b-10">Editar PCD</h4>
                                <input id="txtIdpcdmo" class="model" name="IdUpcd" value="0" type="hidden" />
                                <div class="form-row">
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="txtcipcdmo" class="col-form-label col-form-label-sm">Nro CI</label>
                                        <input type="text" class="form-control input-sm model" id="txtcipcdmo" name="Nro ci">
                                    </div>
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="txtNrocarnetdismo" class="col-form-label col-form-label-sm">Nro carnet PCD</label>
                                        <input type="text" class="form-control input-sm model" id="txtNrocarnetdismo" name="Nro carnet">
                                    </div>
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="txtPorsentajemo" class="col-form-label col-form-label-sm">Porsentaje</label>
                                        <input type="text" class="form-control input-sm model" id="txtPorsentajemo" name="Porsentaje">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="txtNombrespcdmo" class="col-form-label col-form-label-sm">Nombres</label>
                                        <input type="text" class="form-control input-sm model" id="txtNombrespcdmo" name="Nombres PCD">
                                    </div>
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="txtApellidospcdmo" class="col-form-label col-form-label-sm">Apellidos</label>
                                        <input type="text" class="form-control input-sm model" id="txtApellidospcdmo" name="Apellidos PCD">
                                    </div>
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="cbosexomo" class="col-form-label col-form-label-sm">Sexo</label>
                                        <select class="form-control form-control-sm" id="cbosexomo">
                                            <option value="Masculino">Masculino</option>
                                            <option value="Femenino">Femenino</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="cboTipoDiscamo" class="col-form-label col-form-label-sm">Tipo Discapacidad</label>
                                        <select class="form-control form-control-sm" id="cboTipoDiscamo"></select>
                                    </div>
                                    <div class="form-group mb-0 col-sm-4">
                                        <label for="cboAsociamo" class="col-form-label col-form-label-sm">Asociacion</label>
                                        <select class="form-control form-control-sm" id="cboAsociamo"></select>
                                    </div>
                                    <div class="form-group mb-0 col-sm-4 text-center">
                                        <label for="cbosexoxmo" class="col-form-label col-form-label-sm">Opcion foto</label><br />
                                        <button id="btntomarfotopcdmo" type="button" class="btn waves-effect btn-secondary"><i class="fas fa-camera"></i></button>
                                        <button id="btnselectfotopcdmo" type="button" class="btn waves-effect btn-secondary"><i class="far fa-folder-open"></i></button>
                                    </div>
                                </div>

                                <div class="form-group text-center m-t-10">
                                    <div class="col-12">
                                        <button id="btnGuardarCambiospcdmo" type="button" class="btn btn-success waves-effect waves-light">Guardar</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="text-center m-t-0 m-b-10">Editar Foto de PCD</h4>
                                <div class="form-group text-center">
                                    <p>Seccion de Imagen</p>
                                </div>
                                <section class="content invoice camaraapcdmo">
                                    <div class="row">
                                        <div class="col-sm-6 text-center">
                                            <div class="video-wrap">
                                                <video id="videoapcdmo" class="video" autoplay muted></video>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <canvas id="canvasapcdmo" class="canvas" style="display: none;"></canvas>
                                            <img src="Imagenes/Sinfotop.jpg" id="footopcdmo" class="photocm" alt="photo" />
                                        </div>

                                    </div>
                                    <div class="form-group m-b-0">
                                        <div class="offset-sm-3 col-sm-9">
                                            <button id="btncapturarpcdmo" type="button" class="btn btn-danger waves-effect waves-light">Capturar</button>
                                        </div>
                                    </div>
                                </section>
                                <section class="content invoice seleccpcdmo">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label col-form-label-sm">Seleccione Foto</label>
                                        <div class="col-sm-8">
                                            <input type="file" id="txtFotopcdmo" accept="image/*" class="filestyle" data-buttonbefore="true">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-sm-12 text-center">
                                            <img id="imgUsuarioPcdmo" src="Imagenes/Sinfotop.jpg" alt="Foto usuario" style="height: 120px; max-width: 120px; border-radius: 50%;">
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/modernizr.min.js"></script>
    <script src="assets/js/detect.js"></script>
    <script src="assets/js/fastclick.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/jquery.blockUI.js"></script>
    <script src="assets/js/waves.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>

    <script src="assets/plugins/bootstrap-sweetalert/sweet-alert.min.js"></script>
    <script src="assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
    <script src="assets/js/app.js"></script>

    <script src="assets/plugins/loadingoverlay/loadingoverlay.js"></script>

    <script src="js/frmEditarPcd.js" type="text/javascript"></script>
</body>
</html>
