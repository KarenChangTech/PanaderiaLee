<%-- 
    Document   : Pedido
    Created on : Dec 5, 2017, 11:26:33 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Modelo.ProveedorDB"%>
<%@page import="Modelo.PedidoDB"%>
<%@page import="Modelo.EncaPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%           
    ArrayList<EncaPedido> lista = PedidoDB.obtenerEncaPedidos();
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
         <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
         <link rel="stylesheet" href="estilo2.css" type="text/css"/>
    </head>
    <body>
        <ul>
  <li><a  href="Menu.jsp">PROVEEDORES</a></li>
  <li><a class="active" href="Pedido.jsp">PEDIDOS</a></li>
  <li><a  href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp" >REQUISICION</a></li>
     <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        
       <section id="empre">
          
          
               <a  href="AgregaNPedido.jsp" class="button">Agregar un Nuevo Pedido</a>
            <!--en el primer bloque JSP es para elArrayList y se llena con producto -->
            <!--el for me permite separar la lista y mostrar cada uno por separado -->
            <br>
            <table border="1" align="center" width="100%"  id="customers" >
                <th>Id Pedido</th>
                <th>Id Proveedor</th>
                <th>Nombre Proveedor</th>
                <th>Fecha</th>
                <th>Subtotal</th>
                <th>Impuesto</th>
                <th>Total</th>
                <th>Detalle</th>
                
                <%
                    int salto = 0;
                    for (EncaPedido p : lista) {
                        
                    Proveedor pro=ProveedorDB.consultaUnProveedor(p.getCODIGO_PROVEEDOR());
                    DateFormat df = new SimpleDateFormat("dd/MM/yy");
                    String startDate = df.format(p.getFECHA());
                %>
                
                <tr>
                    <td><p><%= p.getCODIGO_PEDIDO()%></p></td>
             <td> <p><%= p.getCODIGO_PROVEEDOR()%></p></td>
             <td> <p><%= pro.getNombre()%></p></td>
             <td>   <p><%= startDate%></p></td>
               <td> <p><%= p.getSUBTOTAL()%></p></td>
              <td> <p><%= p.getIMPUESTO()%></p></td>
              <td> <p><%= p.getTOTAL()%></p></td>              
              <td><a href="DetallePedidoInte.jsp?id=<%=p.getCODIGO_PEDIDO()%>&prov=<%=p.getCODIGO_PROVEEDOR()%>&fecha=<%=startDate%>&total=<%=p.getTOTAL()%>&nomPro=<%=pro.getNombre()%>" class="button2">Detalles</a></td>
            </tr> 
               
                
                    <%                        
                            }
                        
                    %>

            </table>
                 

        </section>
    </body>
</html>
