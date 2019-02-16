<%-- 
    Document   : EditaProducto
    Created on : Dec 1, 2017, 11:16:10 AM
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
        
        
        <h1 align="center">Actualizacion de Informacion de Producto</h1>
                <form action="ServletControlador" method="post">
                    <table border="0" width="300" align="center">
                    <input type="hidden" name="accion" value="ediProducto">
                    <input type="hidden" name="txtfamilia" value="1">
                    <tr>
                        <td>Id: </td>
                        <td> <input type="text"  name="txtidProd" value="<%=id%>"  required readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td> <input type="text"  name="txtNompr" value="<%=nom%>"  required/></td>
                    </tr>
                     <tr>
                        <td>Familia: </td>
                        <td> <input type="text"  name="txtFam" value="<%=fam%>" required readonly = "readonly"/></td>
                    </tr>
                     <tr>
                        <td>Cantidad: </td>
                        <td> <input type="text"  name="txtCanpr" value="<%=cantidad%>" required readonly="readonly"/></td>
                    </tr>
                     <tr>
                        <td>Costo Unitario: </td>
                        <td> <input type="text"  name="txtCostUpr" value="<%=costoU%>" required/></td>
                    </tr>
                     <tr>
                        <td>Minimo: </td>
                        <td>  <input type="text"  name="txtMin" value="<%=min%>" required/> </td>
                    </tr>
                     <tr>
                        <td>Maximo: </td>
                        <td>  <input type="text"  name="txtMax" value="<%=max%>" required/> </td>
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
