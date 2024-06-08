<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docBoleta.aspx.cs" Inherits="CapaPresentacion.docBoleta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Boleta</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 10px;
        }
        .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px;
            margin-bottom: 20px; /* Add some space between the two containers */
            box-sizing: border-box;
        }
        .header img {
            width: 100%;
        }
        .section {
            margin-top: 10px;
            padding: 5px;
            border: 1px solid #000;
            background-color: #00b050;
            color: #fff;
            font-weight: bold;
        }
        .section-content {
            border: 1px solid #000;
            padding: 5px;
        }
        .section-content div {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
        }
        .section-content div span {
            width: 32%;
            border-bottom: 1px solid #000;
            text-align: center;
        }
        .section-content .full-width {
            width: 100%;
            border-bottom: 1px solid #000;
        }
        .signature {
            display: flex;
            justify-content: space-between;
            padding: 40px 0 0 0;
        }
        .signature div {
            text-align: center;
            width: 45%;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <div style="font-size: 11px; text-align: right;">
            <center>
                <button type="button" id="Imprimir" onclick="javascript:imprSelec('seleccionContainer')">IMPRIMIR</button>
            </center>
            <br/>
   </div>
    <div id="seleccionContainer">
        <div class="container" id="seleccion">
            <div class="header">
                <img id="logouma" src="assets/images/uma2.png" alt="Header Image"/>
            </div>
            <div class="header" style="padding-top: 10px;">
                <table style="width: 100%;" border="0">
                    <tr>
                        <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>FECHA EMISION:</strong></td>
                        <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>MES:</strong></td>
                        <td style="border-top:1px solid #000; border-left:1px solid #000;" align="left"><strong>NRO DE RECIBO:</strong></td>
                    </tr>
                    <tr>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span id="fechaemision">19-jun-2023</span></td>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span id="mes">Enero</span></td>
                        <td style="border-bottom:1px solid #000; border-left:1px solid #000;" align="center"><span id="nrorecibo">NRO REG. 012</span></td>
                    </tr>
                </table>
            </div>
            <div class="section">I.- DATOS DE LA TRANSACCION</div>
            <div class="section-content">
                <table style="width: 100%;" border="0">
                    <tr>
                        <td align="left"><strong>TOTAL PAGADO Bs.  250.00.-</strong></td>
                        <td align="left"><span id="fpagole">Doscientos Cincuenta 00/100 Bolivianos</span></td>
                    </tr>
                </table>
            </div>
            <div class="section">II.- DATOS DEL BENEFICIARIO</div>
            <div class="section-content">
                <table style="width: 100%;" border="0">
                    <tr>
                        <td><strong>TITULAR:</strong></td>
                        <td><span id="titular">CLAUDIA MARA LUNA</span></td>
                        <td rowspan="3" align="center" style="border: 1px solid #000; vertical-align: top;">FIRMA PCD</td>
                        <td rowspan="3" align="center" style="border: 1px solid #000; vertical-align: top;">HUELLA</td>
                    </tr>
                    <tr>
                        <td><strong>NRO CI:</strong></td>
                        <td><span id="nrocibeneficiario">11121314</span></td>
                    </tr>
                    <tr>
                        <td><strong>COD:</strong></td>
                        <td><span id="codcre">12141516</span></td>
                    </tr>
                </table>
            </div>
            <div class="section">III.- DATOS DEL APODERADO</div>
            <div class="section-content">
                <table style="width: 100%;" border="0">
                    <tr>
                        <td align="center"><strong>NOMBRE TUTOR:</strong></td>
                        <td align="center"><strong>NRO DE CI:</strong></td>
                        <td align="center"><strong>PARENTESCO:</strong></td>
                        <td rowspan="2" align="center" style="border: 1px solid #000; vertical-align: top;">FIRMA TUTOR</td>
                    </tr>
                    <tr>
                        <td align="center"><span id="nombretutor">MARIA LUNA</span></td>
                        <td align="center"><span id="nrocitutor">1114181</span></td>
                        <td align="center"><span id="parentesco">MADRE</span></td>
                    </tr>
                </table>
            </div>
    
            <%--<br />--%>
            <div class="signature">
                <div id="selloencargado">Bianca Suarez<br/>SELLO Y FIRMA DIRECTOR UNIDAD</div>
                <div id="sellofuncionario"></div>
            </div>
        </div>
        <!-- Second container -->
        <div class="container" id="seleccion2">
            <!-- This will be a duplicate of the above content -->
        </div>
    </div>

    <script src="assets/js/jquery.min.js"></script>
    <script src="js/docBoleta.js" type="text/javascript"></script>

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
