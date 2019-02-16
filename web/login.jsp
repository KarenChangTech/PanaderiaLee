<%-- 
    Document   : login
    Created on : Nov 30, 2017, 3:44:21 PM
    Author     : Trabajo Ing Intel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="estilo2.css" type="text/css"/>

    </head>
    <body>
      
        <section id="empre">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <h2 align="center">Iniciar Sesión</h2>
            <table border="0" width="300" align="center">
                <form action="ServletLogin" method="post">
                    
                    <input type="hidden" name="accion" value="logueo">
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" placeholder="Username" name="txtUsu" required/></td>
                    </tr>
                    <tr>
                        <td>Contraseña: </td>
                        <td> <input type="password" placeholder="Password" name="txtPas" required/></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" name="btn" value="Iniciar Sesion"/>
                        </th>
                    </tr>
                    </tr>
                </form>
            </table>

           
            <h4 align="center">
                <%
                    if (request.getAttribute("msj") != null) {
                        out.println(request.getAttribute("msj"));
                    }
                %>
            </h4>
        </section>
    </body>
</html>
