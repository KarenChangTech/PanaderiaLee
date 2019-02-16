<%-- 
    Document   : DetallePedidoInte
    Created on : Dec 5, 2017, 7:29:22 PM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.Proveedor"%>
<%@page import="Modelo.ProveedorDB"%>
<%@page import="Modelo.PedidoDB"%>
<%@page import="Modelo.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    int id=Integer.parseInt(request.getParameter("id"));
    int prov=Integer.parseInt(request.getParameter("prov"));
    String fecha=request.getParameter("fecha").toString();
    String total=request.getParameter("total");
    String nombreP=request.getParameter("nomPro");
    
    ArrayList<DetallePedido> lista = PedidoDB.obtenerUnEncaPedidos(id);
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Pedido</title>
             <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
             <link rel="stylesheet" href="estilo2.css" type="text/css"/>
    </head>
    <body>
        <ul>
  <li><a  href="Menu.jsp">PROVEEDORES</a></li>
  <li><a  href="Pedido.jsp">PEDIDOS</a></li>
  <li><a  href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp" >REQUISICION</a></li>
     <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        <section id="empre">
            <!--en el primer bloque JSP es para elArrayList y se llena con producto -->
            <!--el for me permite separar la lista y mostrar cada uno por separado -->
            <br><br>
            
            <table id="customers">
                <tr>
                <th>Proveedor</th>
                <th>Fecha</th>
                <th>Total pagado</th>
                </tr>
                <tr>
                    <td><%=nombreP%></td>
                    <td><%=fecha%></td>
                    <td><%=total%></td>
                </tr>
            </table>
            <table id="customers" >
                <th>Id Producto</th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
                <th>Costo Unitario</th>
                <th>Total Linea</th>
                
                <%
                    int salto = 0;
                    for (DetallePedido p : lista) {
                %>
                
                <tr>
             <td> <p><%= p.getCODIGO_PRODUCTO()%></p></td>
             <td>   <p><%= p.getNOMBRE_INSUMO()%></p></td>
             <td> <p><%= p.getCANTIDAD()%></p></td>
              <td> <p><%= p.getCOSTO_UNITARIO()%></p></td>
              <td> <p><%= p.getSUBTOTAL_LINEA()%></p></td>              
            </tr> 
               
                
                    <%                        
                            }
                        
                    %>

            </table>


        </section>
    </body>
</html>
