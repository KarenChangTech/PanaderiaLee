<%-- 
    Document   : CrearRequisicion
    Created on : Dec 5, 2017, 12:32:51 PM
    Author     : Trabajo Ing Intel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    String nom=request.getParameter("nom");
    String cantidad=request.getParameter("can");
    String costoU=request.getParameter("costoUni");
    String min=request.getParameter("min");
    String max=request.getParameter("max");
    String fam=request.getParameter("fam");
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Requisicion</title>
          <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
         <link rel="stylesheet" href="estilo2.css" type="text/css"/>
    </head>
    <body>
        <ul>
  <li><a  href="Menu.jsp">PROVEEDORES</a></li>
  <li><a href="Pedido.jsp">PEDIDOS</a></li>
  <li><a  href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp" class="active">REQUISICION</a></li>
    <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        <div align="center">
        <h1>Crear una Requisicion</h1>
        <form method="post" action="ServletControlador">
             <input type="hidden" name="accion" value="addRequi">
             <input type="hidden" name="idProd" value="<%=id%>">
            <table>
                <tr>
                    <th>Producto:</th>
                     <th><%=nom%></th>
                </tr>
                <tr>
                    <th>Precio unitario:</th>
                     <th><%=costoU%></th>
                </tr>
                <tr>
                    <th>Existencia:</th>
                     <th><%=cantidad%></th>
                </tr>
                <tr>
                    <th>Cantidad a rebajar:</th>
                    <th><input type="text" name="txtcant"></th>
                </tr>
                <tr>
                    <th></th>
                    <th><input type="submit" value="Realizar Requisicion"></th>
                </tr>
            </table>
        </form>
        </div>
   
    </body>
</html>
