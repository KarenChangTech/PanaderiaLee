<%-- 
    Document   : EliminaProducto
    Created on : Dec 1, 2017, 11:19:33 AM
    Author     : Trabajo Ing Intel
--%>

<%@page import="Modelo.ProductoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int id=Integer.parseInt(request.getParameter("id"));
int fam=Integer.parseInt(request.getParameter("fam"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2><%=id%></h2>
        <h2><%=fam%></h2>
        <%
        
       
        try {
                Boolean esta = ProductoDB.eliProducto(id);
                if(fam==1){
                response.sendRedirect("MateriaPrima.jsp");
                }else if(fam==2){
                    response.sendRedirect("ProductoFinal.jsp");
                    }else if(fam==3){
                        response.sendRedirect("ProductoEmpaquetado.jsp"); 
                    }
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        
        
        %>
    </body>
</html>
