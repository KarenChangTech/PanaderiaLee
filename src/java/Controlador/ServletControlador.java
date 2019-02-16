/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.DetallePedido;
import Modelo.EncaPedido;
import Modelo.PedidoDB;
import Modelo.Producto;
import Modelo.ProductoDB;
import Modelo.Proveedor;
import Modelo.ProveedorDB;
import Modelo.Requisicion;
import Modelo.RequisicionDB;
import Utils.Coneccion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Trabajo Ing Intel
 */
public class ServletControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String btn = request.getParameter("btn");
         if (accion.equals("ediPrv")) {
            int codP = Integer.parseInt(request.getParameter("txtidp"));
            String nom = request.getParameter("txtNomp");
            String dir = request.getParameter("txtDirp");
            String tel = request.getParameter("txtTelp");
            String ema = request.getParameter("txtEmailp");
            Proveedor p = new Proveedor(codP, nom, dir, tel, ema);
            try {
                Boolean esta = ProveedorDB.actualizaProveedor(p);
                if (esta) {
                    response.sendRedirect("Menu.jsp");
                } else {

                    request.setAttribute("msj", "Error al actualizar Proveedor");
                    request.getRequestDispatcher("Menu.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } else if (accion.equals("addPrv")) {

            String nom = request.getParameter("txtNomp");
            String dir = request.getParameter("txtDirp");
            String tel = request.getParameter("txtTelp");
            String ema = request.getParameter("txtEmailp");
            Proveedor p = new Proveedor(nom, dir, tel, ema);
            try {
                Boolean esta = ProveedorDB.insertarProv(p);
                if (esta) {
                    response.sendRedirect("Menu.jsp");
                } else {

                    request.setAttribute("msj", "Error al ingresar Proveedor");
                    request.getRequestDispatcher("Menu.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } else if(accion.equals("addProducto")){
            int fam=Integer.parseInt(request.getParameter("txtfamilia"));
            Producto p=new Producto(request.getParameter("txtNompr"), 
                                    Float.parseFloat(request.getParameter("txtCanpr")),
                                    Float.parseFloat(request.getParameter("txtCostUpr")),
                                    fam,
                                    Integer.parseInt(request.getParameter("txtMin")),
                                    Integer.parseInt(request.getParameter("txtMax")));
            try {
                Boolean esta = ProductoDB.insertarProducto(p);
                
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
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        }else if (accion.equals("ediProducto")) {
            int codP = Integer.parseInt(request.getParameter("txtidProd"));
            int fam = Integer.parseInt(request.getParameter("txtFam"));
            float cantidad = Float.parseFloat(request.getParameter("txtCanpr"));
            float costoU = Float.parseFloat(request.getParameter("txtCostUpr"));
            int min = Integer.parseInt(request.getParameter("txtMin"));
            int max = Integer.parseInt(request.getParameter("txtMax"));
            String nom = request.getParameter("txtNompr");
            
            Producto p=new Producto(codP, nom, cantidad, costoU, fam, min, max);
            try {
                Boolean esta = ProductoDB.actualizaProducto(p);
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
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        }else if(accion.equals("addRequi")){
            int id=Integer.parseInt(request.getParameter("idProd"));
            float cant=Float.parseFloat(request.getParameter("txtcant"));
            
            Requisicion r=new Requisicion(id, cant);
            try {
                Boolean esta = RequisicionDB.insertaRequi(r);
                 response.sendRedirect("Requisicion.jsp"); 
            } catch (Exception e) {
                System.out.println(e);
                request.setAttribute("msj", "Error de SISTEMA");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        }else if(accion.equals("addLista")){
            HttpSession sesion = request.getSession();
            if(btn.equals("Agregar")){
            
            int idProd=Integer.parseInt(request.getParameter("idprod"));
            
            float cant=Float.parseFloat(request.getParameter("can"));
            Producto p=ProductoDB.consultaUnProducto(idProd);
           
             ArrayList<DetallePedido> carrito;
            EncaPedido en;
             if (sesion.getAttribute("listap") == null) {
            carrito = new ArrayList<DetallePedido>();
        } else {     
            carrito = (ArrayList<DetallePedido>) sesion.getAttribute("listap");
        }
            if (sesion.getAttribute("perove") == null) {
            int idProv=Integer.parseInt(request.getParameter("idprove"));
            Proveedor proveedor1=ProveedorDB.consultaUnProveedor(idProv);
            en = new EncaPedido(idProv,proveedor1.getNombre());
        } else {
            en = (EncaPedido) sesion.getAttribute("perove");
        }
             Float totalL=cant*p.getCosto_unitario();
             DetallePedido detalle=new DetallePedido(idProd, p.getNombre_producto(), cant, totalL, p.getCosto_unitario());
             int indice = -1;
        for (int i = 0; i < carrito.size(); i++) {
            DetallePedido det = carrito.get(i);
            if (det.getCODIGO_PRODUCTO() == p.getCodigo_producto()) {
                indice = i;
                break;
            }
        }
        if (indice == -1) {
            carrito.add(detalle);
        }
        Float totalPedido = Float.parseFloat("0");
        Float impuesto = Float.parseFloat("0");
        Float totalPedidoF = Float.parseFloat("0");
        for (int i = 0; i < carrito.size(); i++) {
            DetallePedido det = carrito.get(i);
            totalPedido=totalPedido+det.getSUBTOTAL_LINEA();
        }
        impuesto=totalPedido*0.13f;
        totalPedidoF=totalPedido*1.13f;
        en.setSUBTOTAL(totalPedido);
        en.setIMPUESTO(impuesto);
        en.setTOTAL(totalPedidoF);
        sesion.setAttribute("listap", carrito);
        sesion.setAttribute("perove", en);     
        response.sendRedirect("AgregaNPedido.jsp");     
             
             
            }else if(btn.equals("Cancelar")){
                sesion.removeAttribute("listap");
                sesion.removeAttribute("perove");
                response.sendRedirect("AgregaNPedido.jsp");
            }else if(btn.equals("Comprar")){
                EncaPedido enca=(EncaPedido) sesion.getAttribute("perove");
                 ArrayList<DetallePedido> carrito= (ArrayList<DetallePedido>) sesion.getAttribute("listap");
                 Boolean rpta=PedidoDB.insertarPedido(enca, carrito);
                 sesion.removeAttribute("listap");
                 sesion.removeAttribute("perove");
                
                 response.sendRedirect("Pedido.jsp");
                 
            }
        }
            else {
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
