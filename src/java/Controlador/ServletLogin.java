/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Utils.Coneccion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         String accion = request.getParameter("accion");
        if (accion.equals("logueo")) {
            String usu = request.getParameter("txtUsu");
            String pas = request.getParameter("txtPas");
            try {
                CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.loginC(?,?)}");
                cl.setString(2, usu);
                cl.setString(3, pas);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);

                if (rs.next()) {
                    HttpSession sesionV = request.getSession();//variables de sesion
                    sesionV.setAttribute("perfil", (String) rs.getString(6));//el 5 es el perfil
                    sesionV.setAttribute("nom", (String) rs.getString(2));
                    sesionV.setAttribute("ape", (String) rs.getString(3));
                    request.getRequestDispatcher("Menu.jsp").forward(request, response);

                } else {
                    
request.setAttribute("msj", "Error de usuario o contraseña");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }else{
          request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
        
           }
      
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
