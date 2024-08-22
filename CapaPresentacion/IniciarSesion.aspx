<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="CapaPresentacion.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Umapedis Login</title>
    <%--<link href="assets/style.css" rel="stylesheet" />--%>
    <link href="assets/loginstilo.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet"/>

</head>
<body>
    <div class="main">
        <input type="checkbox" id="chk" aria-hidden="true" />

        <div class="login">
            <label for="chk" aria-hidden="true">LOGIN</label>
            <input class="input" type="text" name="email" id="username" placeholder="Usuario" value="manuel@yopmail.com" />
            <input class="input" type="password" name="pswd" id="password" placeholder="Contraseña" value="87bd06" />
            <input class="input" type="text" name="txtcatchap" id="capcha" placeholder="ingrese CAPTCHA"/>
            <p id="muestracapchap" class="labeljo"></p>
            <button type="button" id="btnIniciarSesion">Iniciar</button>
        </div>

        <div class="register">
            <label for="chk" aria-hidden="true">Recuperar</label>
            <input class="input" type="text" name="txtnroci" placeholder="Nro C.I."/>
            <input class="input" type="email" name="email" id="cooree" placeholder="Ingrese su Correo" />
            <%--<h3 class="labeljo">Revice su Correo Electronico</h3>--%>
            <button type="button" id="btnRecupe">Recuperar</button>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="assets/plugins/loadingoverlay/loadingoverlay.js"></script>
    <script src="js/IniciarSesion.js" type="text/javascript"></script>
    
    <%--<link href="assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css"/>
    <script src="assets/plugins/bootstrap-sweetalert/sweet-alert.min.js"></script>--%>
</body>
</html>
