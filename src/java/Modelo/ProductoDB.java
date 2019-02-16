/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Coneccion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Trabajo Ing Intel
 */
public class ProductoDB {
    public static ArrayList<Producto> obtenerTodos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {

            CallableStatement cl = Coneccion.getConexion().prepareCall("select * from producto where estado=1 order by codigo_producto");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2),
                        rs.getFloat(3), rs.getFloat(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getFloat(8),rs.getInt(9),rs.getInt(10));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    public static ArrayList<Producto> obtenerMP() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {

            CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.consultaProductoFam(?)}");
            cl.setInt(2, 1);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                
                while (rs.next()) {
                   Producto p = new Producto(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getFloat(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getFloat(8),rs.getInt(9),rs.getInt(10)); 
                   lista.add(p);     
                }
               
        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    public static ArrayList<Producto> obtenerProductoF() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {

            CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.consultaProductoFam(?)}");
            cl.setInt(2, 2);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                
                while (rs.next()) {
                   Producto p = new Producto(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getFloat(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getFloat(8),rs.getInt(9),rs.getInt(10)); 
                   lista.add(p);     
                }

        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    public static ArrayList<Producto> obtenerProductoEmp() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {

            CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.consultaProductoFam(?)}");
            cl.setInt(2, 3);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                
                while (rs.next()) {
                   Producto p = new Producto(rs.getInt(1), rs.getString(2),
                        rs.getInt(3), rs.getFloat(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getFloat(8),rs.getInt(9),rs.getInt(10)); 
                   lista.add(p);     
                }

        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    
    public static boolean insertarProducto(Producto p){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.ingresaProducto(?,?,?,?,?,?)");
               cl.setString(1, p.getNombre_producto());
               cl.setFloat(2, p.getCantidad());
               cl.setFloat(3, p.getCosto_unitario());
               cl.setInt(4, p.getCodigo_familia());
               cl.setInt(5, p.getMinimo());
               cl.setInt(6, p.getMaximo());
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){}
    
    return rpta;
}
    
     public static boolean actualizaProducto(Producto p){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.actualizaProducto(?,?,?,?,?,?,?)");
               cl.setInt(1, p.getCodigo_producto());
               cl.setString(2, p.getNombre_producto());
               cl.setFloat(3, p.getCantidad());
               cl.setFloat(4, p.getCosto_unitario());
               cl.setInt(5, p.getCodigo_familia());
                cl.setFloat(6, p.getMinimo());
               cl.setFloat(7, p.getMaximo());
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){
            
        }
        return rpta;
    }
     
       public static boolean eliProducto(int p){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.eliminaProducto(?)");
               cl.setInt(1, p); 
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){
        
        }
    
    return rpta;
}
       
       public static Producto consultaUnProducto(int id){
         Producto p=new Producto();
         try {
                CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.consultaProducto(?)}");
                cl.setInt(2, id);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                
                if (rs.next()) {
                    p=new Producto(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getFloat(4));
                    return p;
                } else {
                    
                    System.out.println("Error al leer el proveedor");
                }
                
            } catch (Exception e) {
                System.out.println(e);
               
            }
         return p;
     }
    
}
