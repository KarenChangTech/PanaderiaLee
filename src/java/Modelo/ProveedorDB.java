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
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Trabajo Ing Intel
 */
public class ProveedorDB {
    public static ArrayList<Proveedor> obtenerProducto() {
        ArrayList<Proveedor> lista = new ArrayList<Proveedor>();
        try {

            CallableStatement cl = Coneccion.getConexion().prepareCall("select * from proveedor order by codigo_proveedor");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
              
                Proveedor pr=new Proveedor(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
            lista.add(pr);
            }

        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    
    public static boolean actualizaProveedor(Proveedor varp){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.actualizaPro(?,?,?,?,?)");
            cl.setInt(1, varp.getCodigoProve());
               cl.setString(2, varp.getNombre());
               cl.setString(3, varp.getDireccion());
               cl.setString(4, varp.getTelefono());
               cl.setString(5, varp.getEmail());
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
    
    public static boolean insertarProv(Proveedor p){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.ingresaPro(?,?,?,?)");
               cl.setString(1, p.getNombre());
               cl.setString(2, p.getDireccion());
               cl.setString(3, p.getTelefono());
               cl.setString(4, p.getEmail());
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){}
    
    return rpta;
}
    
    
     public static boolean eliProv(int p){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.eliPro(?)");
               cl.setInt(1, p); 
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){}
    
    return rpta;
}
     
     public static Proveedor consultaUnProveedor(int id){
         Proveedor p=new Proveedor();
         try {
                CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.consultaProveedor(?)}");
                cl.setInt(2, id);
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                
                if (rs.next()) {
                    p=new Proveedor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
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

