<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmConsultasBono.aspx.cs" Inherits="CapaPresentacion.frmConsultasBono" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cardui {
            font-family: "Candara", sans-serif;
            width: 310px;
            overflow: hidden;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
        }

        .cardui-image img {
            width: 100%;
            height: 160px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            object-fit: cover;
        }

        .profile-imageu img {
            z-index: 1;
            width: 120px;
            height: 120px;
            position: relative;
            margin-top: -75px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 100px;
            border: 8px solid #fff;
            transition-duration: 0.4s;
            transition-property: transform;
        }

            .profile-imageu img:hover {
                transform: scale(1.1);
            }

        .cardui-content h3 {
            font-size: 25px;
            text-align: center;
            margin: 0;
        }
        .cardui-content p {
            font-size: 16px;
            text-align: center;
            margin-top: 5px;
            padding: 0 20px 0 20px;
        }

        .cardui-content strong {
            display: inline;
            margin-bottom: 5px;
            padding: 0 5px 5px 20px;
        }

        .cardui-content label {
            display: inline;
            margin-bottom: 5px;
        }
        .iconocs {
            text-align: center;
            padding-top: 15px;
            padding-bottom: 30px;
        }

            .iconocs a {
                text-decoration: none;
                font-size: 20px;
                color: #0ABDE3;
                padding: 0 14px;
                transition-duration: 0.4s;
                transition-property: transform;
            }

                .iconocs a:hover {
                    color: #000;
                    transform: scale(1.5);
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel de Consultas Bono
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-horizontal m-b-10" id="omitirpagoo">

                        <div class="form-group row m-b-0">
                            <div class="col-sm-3">
                                <h4 class="m-b-0 m-t-0">Buscar PCD</h4>
                            </div>

                            <label for="inputPassh" class="col-sm-2 control-label text-right">Ingrse CI</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control input-sm" id="txtcipcono" name="Nro ci">
                            </div>
                            <div class="col-sm-5">
                                <button id="btnBuscarpcdbno" type="button" class="btn btn-sm btn-success">Buscar</button>
                                <button id="btnImprimirpcdebno" type="button" class="btn btn-sm btn-primary">
                                    <i class="fa fa-print"></i> Imprimir
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr class="m-b-10 m-t-5" />
                    <div class="row" id="mostrarboopa">
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="cardui">
                                        <div class="cardui-image">
                                            <img src="assets/images/umapp.png" alt="">
                                        </div>
                                        <div class="profile-imageu">
                                            <img src="assets/images/users/avatar-2.jpg" alt="">
                                        </div>
                                        <div class="cardui-content">
                                            <h3>Andrea Soliz</h3>
                                            <p>Datos del Usuario PCD.</p>
                                            <strong>Nro CI:  </strong>
                                            <label>7399954</label><br>
                                            <strong>Tutor: </strong>
                                            <label>Armando Apaza</label><br>
                                            <strong>Nro Crede:  </strong>
                                            <label>487544</label><br>
                                            <strong>Tipo: </strong>
                                            <label>Mental</label><br>
                                            <strong>Asociacion:  </strong>
                                            <label>Horizonte</label>
                                        </div>
                                        <div class="iconocs">
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                        </div>
                                    </div>
                                    </div>

                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
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
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                </div>
                                <div class="tab-pane fade" id="profile-2" role="tabpanel" aria-labelledby="profile-tab-2">
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
                                    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
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
</asp:Content>
