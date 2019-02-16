<%-- 
    Document   : Menu
    Created on : Nov 30, 2017, 4:46:09 PM
    Author     : Trabajo Ing Intel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="Modelo.ProveedorDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="estiloMenu.css" type="text/css"/>
         <link rel="stylesheet" href="estilo2.css" type="text/css"/>
<%           
    ArrayList<Proveedor> lista = ProveedorDB.obtenerProducto();
        %>
    </head>
    <body>
       <ul>
  <li><a class="active" id="activo" href="Menu.jsp">PROVEEDORES</a></li>
  <li><a href="Pedido.jsp">PEDIDOS</a></li>
  <li><a href="MateriaPrima.jsp">MATERIA PRIMA</a></li>
  <li><a href="ProductoFinal.jsp">PRODUCTO FINAL</a></li>
  <li><a href="ProductoEmpaquetado.jsp">PRODUCTO EMPAQUETADO</a></li>
  <li><a href="Requisicion.jsp">REQUISICION</a></li>
   <li><a href="CierraS.jsp">CERRAR SESION</a></li>
</ul>
        
        
        
        <section id="empre">
            <!--en el primer bloque JSP es para elArrayList y se llena con producto -->
            <!--el for me permite separar la lista y mostrar cada uno por separado -->
            <br><br>
            <table border="1" align="center" width="100%" id="customers" >
                <th>Id proveedor</th>
                <th>Nombre</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Editar</th>
                <th>Eliminar</th>
                <%
                    int salto = 0;
                    for (Proveedor p : lista) {
                %>
                
                <tr>
                    <td><p><%= p.getCodigoProve()%></p></td>
             <td> <p><%= p.getNombre()%></p></td>
             <td>   <p><%= p.getDireccion()%></p></td>
               <td> <p><%= p.getTelefono()%></p></td>
              <td> <p><%= p.getEmail()%></p></td>
              <td><a href="EditaProdu.jsp?id=<%=p.getCodigoProve()%>&nom=<%=p.getNombre()%>&dir=<%= p.getDireccion()%>&tel=<%=p.getTelefono()%>&email=<%= p.getEmail()%>" class="button2">Editar</a></td>
              <td><a href="eliminaProveedor.jsp?id=<%=p.getCodigoProve()%>" class="button2">Eliminar</a></td>
            </tr> 
               
                
                    <%                        
                            }
                        
                    %>

            </table>


        </section>
                    
                    
                    <h1 align="center">Ingresar Nuevo Proveedor</h1>
                <form action="ServletControlador" method="post">
                    <table border="0" width="300" align="center">
                    <input type="hidden" name="accion" value="addPrv">
                    
                    <tr>
                        <td>Nombre: </td>
                        <td> <input type="text" placeholder="Nombre" name="txtNomp"  required/></td>
                    </tr>
                     <tr>
                        <td>Telefono </td>
                        <td> <input type="text" placeholder="Telefono" name="txtTelp"  required/></td>
                    </tr>
                     <tr>
                        <td>Email: </td>
                        <td> <input type="text" placeholder="Correo" name="txtEmailp"  required/></td>
                    </tr>
                     <tr>
                        <td>Direccion: </td>
                        <td>  <input type="text" placeholder="Dire" name="txtDirp" required/> </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" name="btn" value="Agregar"/>
                            
                        </th>
                    </tr>
                    </tr>
                   </table>  
                </form>
    </body>
</html>
