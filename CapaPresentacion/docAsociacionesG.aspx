<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docAsociacionesG.aspx.cs" Inherits="CapaPresentacion.docAsociacionesG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Asociaciones</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
        }
        .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            /*border: 1px solid #000;*/
            padding: 20px;
            box-sizing: border-box;
        }
        .header img {
            width: 100%;
        }
        .section {
            margin-top: 10px;
            margin-bottom: 10px;
            padding: 5px;
            text-align: center;
            background-color: #00b050;
            font-weight: bold;
        }
        .table-responsive {
            display: block;
            width: 100%;
            overflow-x: auto;
        }

        .table {
            width: 100%;
            max-width: 100%;
            /*margin-bottom: 1rem;*/
            margin-bottom: 10px;
            background-color: transparent;
            border-collapse: collapse;
        }
            .table td, .table th {
                padding: 8px;
                border-top: 1px solid #dee2e6;
            }
        /*tbody {
            color: #797979;
        }*/
    </style>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <div style="font-size: 11px; text-align: right;">
            <center>
                <button type="button" id="Imprimir" onclick="javascript:imprSelec('seleccionImprimir')">IMPRIMIR</button>
            </center>
            <br/>
   </div>
    <div id="seleccionImprimir">
        <div class="container">
            <div class="header">
                <img id="logouma" src="assets/images/uma2.png" alt="Header Image"/>
            </div>
            <%--<div class="header" style="padding-top: 10px;">
                <table style="width: 100%;" border="0">
                    <tr>
                        <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>FECHA EMISION:</strong></td>
                        <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>ASOCIACION:</strong></td>
                        <td style="border-top:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="left"><strong>RESPONSABLE:</strong></td>
                    </tr>
                    <tr>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span id="fechaemision">14-jun-2024</span></td>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span id="asocia">Nombre de la asociacion</span></td>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;" align="center"><span id="respon">Nombre del responsable</span></td>
                    </tr>
                </table>
            </div>
            <div class="section">LISTA DE PCD DE LA ASOCIACION</div>
            <div class="table-responsive">
                <table id="tbDetalles" class="table">
                    <thead>
                        <tr>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Discapacidad</th>
                            <th>Cobra Bono</th>
                            <th>Tutor</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>--%>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="js/docAsociacionesG.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">


        function imprSelec(nombre) {
            var printContents = document.getElementById(nombre).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
        function hide() {
            document.getElementById('Imprimir').style.visibility = "hidden";
        }
    </script>
</body>
</html>
