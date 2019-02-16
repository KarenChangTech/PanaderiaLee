<%-- 
    Document   : ProductoEmpaquetado
    Created on : Dec 1, 2017, 11:25:16 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.ProductoDB"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Empaquetado</title>
         <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
         <link rel="stylesheet" href="estilo2.css" type="text/css"/>
<%           
    ArrayList<Producto> lista = ProductoDB.obtenerProductoEmp();
        %>
    </head>
    <body>
     <ul>
  <li><a  href="Menu.jsp">PROVEEDORES</a></li>
  <li><a href="Pedido.jsp">PEDIDOS</a></li>
  <li><a  href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a  href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a class="active" href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp">REQUISICION</a></li>
     <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        
        
         <section id="empre">
            <!--en el primer bloque JSP es para elArrayList y se llena con producto -->
            <!--el for me permite separar la lista y mostrar cada uno por separado -->
            <br><br>
            <table border="1" align="center" width="100%"  id="customers" >
                <th>Condicion</th>
                <th>Id Producto</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Costo Unitario</th>
                <th>Minimo</th>
                <th>Maximo</th>
                <th>Precio Total</th>
                 <th>Requisicion</th>
                <th>Editar</th>
                <th>Eliminar</th>
                <%
                    int salto = 0;
                    for (Producto p : lista) {
                %>
                
                <tr>
                    <%
                    if(p.getCondicion()==1){
                    %>
                    <td><img src="img/img1.png" width="20px" height="20px"></td>
                    
                    <%}else{%>
                    
                    <td><img src="img/img2.png" width="20px" height="20px"></td>
                    <%}%>
                    <td><p><%= p.getCodigo_producto()%></p></td>
             <td> <p><%= p.getNombre_producto()%></p></td>
             <td>   <p><%= p.getCantidad()%></p></td>
               <td> <p><%= p.getCosto_unitario()%></p></td>
              <td> <p><%= p.getMinimo()%></p></td>
                <td>   <p><%= p.getMaximo()%></p></td>
               <td> <p><%= p.getPrecio_total()%></p></td>
              <td><a href="CrearRequisicion.jsp?id=<%=p.getCodigo_producto()%>&nom=<%= p.getNombre_producto()%>&can=<%= p.getCantidad()%>&costoUni=<%=p.getCosto_unitario()%>&min=<%= p.getMinimo()%>&max=<%= p.getMaximo()%>&fam=3" class="button2">Requisicion</a></td>
               <td><a href="EditaProducto.jsp?id=<%=p.getCodigo_producto()%>&nom=<%= p.getNombre_producto()%>&can=<%= p.getCantidad()%>&costoUni=<%=p.getCosto_unitario()%>&min=<%= p.getMinimo()%>&max=<%= p.getMaximo()%>&fam=3" class="button2">Editar</a></td>
              <td><a href="EliminaProducto.jsp?id=<%= p.getCodigo_producto()%>&fam=3" class="button2">Eliminar</a></td>
            </tr> 
               
                
                    <%                        
                            }
                        
                    %>

            </table>

                <h1 align="center">Ingresar Nuevo Producto de Empaquetado</h1>
                <form action="ServletControlador" method="post">
                    <table border="0" width="300" align="center">
                    <input type="hidden" name="accion" value="addProducto">
                    <input type="hidden" name="txtfamilia" value="3">
                    <tr>
                        <td>Nombre: </td>
                        <td> <input type="text"  name="txtNompr"  required/></td>
                    </tr>
                     <tr>
                        <td>Cantidad: </td>
                        <td> <input type="text"  name="txtCanpr"  required/></td>
                    </tr>
                     <tr>
                        <td>Costo Unitario: </td>
                        <td> <input type="text"  name="txtCostUpr"  required/></td>
                    </tr>
                     <tr>
                        <td>Minimo: </td>
                        <td>  <input type="text"  name="txtMin" required/> </td>
                    </tr>
                     <tr>
                        <td>Maximo: </td>
                        <td>  <input type="text"  name="txtMax" required/> </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" name="btn" value="Agregar"/>
                            
                        </th>
                    </tr>
                    </tr>
                   </table>  
                </form>
        </section>
    </body>
</html>
