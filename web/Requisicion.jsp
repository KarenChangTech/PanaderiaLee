<%-- 
    Document   : Requisicion
    Created on : Dec 5, 2017, 11:24:19 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.Requisicion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.RequisicionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%           
    ArrayList<Requisicion> lista = RequisicionDB.obtenerRequisiciones();
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requisicion</title>
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
        <h2 align="center">Historial de Requisiciones</h2>
        <section id="empre">
            <!--en el primer bloque JSP es para elArrayList y se llena con producto -->
            <!--el for me permite separar la lista y mostrar cada uno por separado -->
            
            <table border="1" align="center" width="100%" id="customers" >
                <th>Id Requisicion</th>
                <th>Id Producto</th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
                <th>Fecha</th>
                
                <%
                    int salto = 0;
                    for (Requisicion p : lista) {
                %>
                
                <tr>
                    <td><p><%= p.getCodigo_rebajado()%></p></td>
             <td> <p><%= p.getCodigo_producto()%></p></td>
             <td>   <p><%= p.getNombre_prod()%></p></td>
               <td> <p><%= p.getUnidades()%></p></td>
              <td> <p><%= p.getFecha()%></p></td>
               
            </tr> 
               
                
                    <%                        
                            }
                        
                    %>

            </table>

        </section>
       
    </body>
</html>
