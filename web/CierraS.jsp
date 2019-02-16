<%-- 
    Document   : CierraS
    Created on : Dec 15, 2017, 11:14:13 AM
    Author     : Trabajo Ing Intel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      
      HttpSession sesionV = request.getSession();
      request.getSession().removeAttribute("perfil");
            request.getSession().removeAttribute("nom");
            request.getSession().removeAttribute("ape");
            request.getSession().removeAttribute("listap");
            request.getSession().removeAttribute("perove");
            sesionV.invalidate();//quita la sesion pero primero se quitan los atributos
            request.getRequestDispatcher("login.jsp").forward(request, response);//me redirecciona al index.    
      %>
    </body>
</html>
