<%-- 
    Document   : AgregaNPedido
    Created on : Dec 5, 2017, 8:35:08 PM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.EncaPedido"%>
<%@page import="Modelo.DetallePedido"%>
<%@page import="Modelo.ProveedorDB"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="Modelo.ProductoDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%           
    ArrayList<Producto> lista1 = ProductoDB.obtenerTodos();
    ArrayList<Proveedor> lista2 = ProveedorDB.obtenerProducto();
    ArrayList<DetallePedido> listaP = (ArrayList<DetallePedido>) session.getAttribute("listap");
    EncaPedido enca = (EncaPedido) session.getAttribute("perove");
        %>
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Pedido</title>
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
  <li><a href="Requisicion.jsp" >REQUISICION</a></li>
</ul>
        <div align="center">
            
       
        <h1>Nuevo Pedido</h1>
        <form action="ServletControlador" method="post">
            <input type="hidden" name="accion" value="addLista">
             <%    if(enca==null){%>
            <h3>Seleccione el proveedor<h3/>
               
            <select name="idprove">
         <%
                 
                    for (Proveedor p1 : lista2) {
                %>
                
                <option value="<%= p1.getCodigoProve()%>"><%= p1.getCodigoProve()%>.<%= p1.getNombre()%> </option>
                
                    <%                        
                            }
                            
                    %>
</select>
  <%  }  %>
            <h3>Seleccione el producto que desea agregar al pedido<h3/>
            <select name="idprod">
         <%
                   
                    for (Producto p : lista1) {
                %>
                
                <option value="<%= p.getCodigo_producto()%>"><%= p.getCodigo_producto()%>.<%= p.getNombre_producto()%> </option>
                
                    <%                        
                            }
                        
                    %>
                     
</select>
                     <h3>Ingrese la cantidad<h3/>
                         <input type="text" name="can"/><br/>
                         <input type="submit" value="Agregar" name="btn"/> 
                     
        </form>
 </div>
                       <%    if(enca!=null){%>
                    <div align="center">
                        
                        <table id="customers">
                            <tr>
                                <th>Id Proveedor</th>
                                <th>Nombre Proveedor</th>
                                <th>Subtotal</th>
                                <th>Impuesto</th>
                                <th>Total</th>
                           
                        </tr>
                         <tr>
                             <% if(enca!=null){  %>
                                <th><%= enca.getCODIGO_PROVEEDOR()%></th>
                                <th><%= enca.getNombreProveedor()%></th>
                                <th><%= enca.getSUBTOTAL()%></th>
                                <th><%= enca.getIMPUESTO()%></th>
                                <th><%= enca.getTOTAL()%></th>
                                
                            <% }%>    
                           
                        </tr>
                        </table>
                        
                        
                        <table id="customers">
                            <tr>
                                <th>Id Producto</th>
                                <th>Nombre Producto</th>
                                <th>Costo Unitario</th>
                                <th>Cantidad</th>
                                <th>Total Linea</th>
                            </tr>
                        <%
                        
                       
                        if (listaP != null) {
                            for (DetallePedido d : listaP) {
                    %>
                    <tr>
                        <td><%= d.getCODIGO_PRODUCTO()%></td>
                        <td><%= d.getNOMBRE_INSUMO()%></td>
                        <td><%= d.getCOSTO_UNITARIO()%></td>
                        <td><%= d.getCANTIDAD()%></td>
                        <td><%= d.getSUBTOTAL_LINEA()%></td>
                        
                    </tr>
                    <%
                                
                            }
                        }
                    %>
                    
                    </table>
                    
                    <form action="ServletControlador" method="post">
                        <input type="hidden" name="accion" value="addLista">
                        <input type="submit" value="Comprar" name="btn"/>
                        <input type="submit" value="Cancelar" name="btn"/>
                    </form>
                    </div>
                      <%}%>
                   
    </body>
</html>
