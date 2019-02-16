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
public class RequisicionDB {
    public static ArrayList<Requisicion> obtenerRequisiciones() {
        ArrayList<Requisicion> lista = new ArrayList<Requisicion>();
         try {
                CallableStatement cl = Coneccion.getConexion().prepareCall("{ ? = call PKPROYECTO.fn_listaRequi}");
                cl.registerOutParameter(1, OracleTypes.CURSOR);
                cl.execute();
                ResultSet rs = (ResultSet) cl.getObject(1);
                    while (rs.next()) {
                                    Requisicion r=new Requisicion(rs.getInt(1), rs.getInt(2),rs.getString(3), rs.getDate(5),rs.getFloat(4));
                                lista.add(r);
                                }
                
            } catch (Exception e) {
                System.out.println(e);
                System.out.println("Fallo en requisicionDB");
            }
        return lista;
    }
    
    
    public static boolean insertaRequi(Requisicion r){
        boolean rpta = false;
        try{
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.ingresaRequisicion(?,?)");
               cl.setInt(1, r.getCodigo_producto());
               cl.setFloat(2, r.getUnidades());
            int i=cl.executeUpdate();
            if(i==1){
                rpta = true;
            }else{
                rpta = false;
            }
        }catch(Exception e){}
    
    return rpta;
}
}
