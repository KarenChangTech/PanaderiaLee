<%-- 
    Document   : eliminaProveedor
    Created on : Dec 1, 2017, 10:47:49 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.ProveedorDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int id=Integer.parseInt(request.getParameter("id"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        
        <%
        
       
        try {
                Boolean esta = ProveedorDB.eliProv(id);
                if (esta) {
                    response.sendRedirect("Menu.jsp");
                } else {

                    request.setAttribute("msj", "Error al eliminar Proveedor");
                    request.getRequestDispatcher("Menu.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        
        
        
        %>
    </body>
</html>
