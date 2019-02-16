/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;
import java.sql.*;

/**
 *
 * @author Trabajo Ing Intel
 */
public class Coneccion {
    
    public static Connection getConexion(){
        Connection cn = null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","USUARIO1","ORACLE");
            cn.createStatement();
            System.out.println("Conexion Satisfactoria");
        
        }catch(Exception ex){
            System.out.println("Error de Conexion" + ex );
        }
        return cn;
    }
    
}
