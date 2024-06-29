<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="CapaPresentacion.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/cardzero.css" rel="stylesheet"/>
    <style>
        .container-carousel {
            position: relative;
            width: 500px;
            height: 300px;
            background-color: #e0e0e0;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.66);
            border-radius: 15px;
            overflow: hidden;
        }

        .carruseles {
            width: 1000%;
            height: 100%;
            display: flex;
        }

        .slider-section {
            width: calc(100% / 10);
            height: 100%;
        }

            .slider-section img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 15px;
            }

        .btn-left,
        .btn-right {
            display: flex;
            position: absolute;
            top: 50%;
            font-size: 1.5rem;
            background-color: transparent;
            border-radius: 50%;
            padding: 5px;
            font-weight: 600;
            cursor: pointer;
            color: #ffffff81;
            transform: translate(0,-50%);
            transition: .5s ease;
            user-select: none;
        }

            .btn-left:hover,
            .btn-right:hover {
                background-color: #333333d4;
                color: #fff;
            }

        .btn-left {
            left: 10px;
        }

        .btn-right {
            right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Panel de Inicio
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <div class="row">
        <div class="col-lg-7">
            <div class="card">
                <div class="card-header bg-primary">
                    <h4 class="card-title m-0">UNIDAD MUNICIPAL DE ATENCION A PERSONAS CON DISCAPACIDAD</h4>
                </div>
                <div class="card-body d-flex justify-content-center align-items-center">

                    <div class="container-carousel">
                        <div class="carruseles" id="slider">
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/13.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/12.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/13.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/12.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                        </div>
                        <div class="btn-left"><i class="fas fa-chevron-left"></i></div>
                        <div class="btn-right"><i class="fas fa-chevron-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="card">
                <div class="card-header bg-primary">
                    <h4 class="card-title m-0">G.A.M.R.</h4>
                </div>
                <div class="card-body d-flex justify-content-center align-items-center">
                    <div class="cardui">
                        <div class="cardui-image">
                            <img src="assets/images/umapp.png" alt="">
                        </div>
                        <div class="profile-imageu">
                            <img src="assets/images/av-1.jpg" alt="">
                        </div>
                        <div class="cardui-content">
                            <h3>UMAPEDIS</h3>
                            <p>DIRECCION DG AG</p>
                            <strong>CONTACTO:  </strong>
                            <label>73999544</label><br>
                            <strong>CORREO: </strong>
                            <label>Umapedis@gmail.com</label><br>
                            <strong>RESPONSABLE:  </strong>
                            <label>SILVIA VILLA NUEVA</label>
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

    <%--<div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <h4 class="card-title m-0">UNIDAD MUNICIPAL DE ATENCION A PERSONAS CON DISCAPACIDAD</h4>
                </div>
                <div class="card-body d-flex justify-content-center align-items-center">
                    
                    <div class="container-carousel">
                        <div class="carruseles" id="slider">
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/13.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/12.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/13.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/12.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/14.jpg">
                            </section>
                            <section class="slider-section">
                                <img src="assets/images/baner/15.jpg">
                            </section>
                        </div>
                        <div class="btn-left"><i class="fas fa-chevron-left"></i></div>
                        <div class="btn-right"><i class="fas fa-chevron-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script src="js/Inicio.js" type="text/javascript"></script>
</asp:Content>
