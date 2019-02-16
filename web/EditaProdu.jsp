<%-- 
    Document   : EditaProdu
    Created on : Dec 1, 2017, 9:04:00 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int id=Integer.parseInt(request.getParameter("id"));
    String nom=request.getParameter("nom");
    String dir=request.getParameter("dir");
    String tel=request.getParameter("tel");
    String ema=request.getParameter("email");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
         <link rel="stylesheet" href="estilo2.css" type="text/css"/>
    </head>
    <body>
        <ul>
  <li><a  href="Menu.jsp">PROVEEDORES</a></li>
  <li><a href="Pedido.jsp">PEDIDOS</a></li>
  <li><a href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp">REQUISICION</a></li>
     <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        
        <h1 align="center">Actualizar Proveedor</h1>
                <form action="ServletControlador" method="post">
                    <table border="0" width="300" align="center">
                    <input type="hidden" name="accion" value="ediPrv">
                    <tr>
                        <td>ID Proveedor:</td>
                        <td><input type="text" placeholder="Correo" name="txtidp" value="<%=id%>" required readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td> <input type="text" placeholder="Nombre" name="txtNomp" value="<%=nom%>" required/></td>
                    </tr>
                     <tr>
                        <td>Telefono </td>
                        <td> <input type="text" placeholder="Telefono" name="txtTelp" value="<%=tel%>" required/></td>
                    </tr>
                     <tr>
                        <td>Email: </td>
                        <td> <input type="text" placeholder="Correo" name="txtEmailp" value="<%=ema%>" required/></td>
                    </tr>
                     <tr>
                        <td>Direccion: </td>
                        <td>  <input type="text" placeholder="Dire" name="txtDirp" value="<%=dir%>" required/> </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" name="btn" value="Actualizar"/>
                            
                        </th>
                    </tr>
                    </tr>
                   </table>  
                </form>
           
        
    </body>
</html>
