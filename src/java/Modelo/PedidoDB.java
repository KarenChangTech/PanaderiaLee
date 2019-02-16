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
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Trabajo Ing Intel
 */
public class PedidoDB {
    public static ArrayList<EncaPedido> obtenerEncaPedidos() {
        ArrayList<EncaPedido> lista = new ArrayList<EncaPedido>();
        try {
            CallableStatement cl = Coneccion.getConexion().prepareCall("select * from encabezado_pedido ORDER BY codigo_pedido");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                EncaPedido p=new EncaPedido(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getFloat(4), rs.getFloat(5), rs.getFloat(6));
            lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Fallo en productoDB");
        }
        return lista;
    }
    
     public static ArrayList<DetallePedido> obtenerUnEncaPedidos(int id) {
        ArrayList<DetallePedido> lista = new ArrayList<DetallePedido>();
        try {
            CallableStatement cl = Coneccion.getConexion().prepareCall(" select * from detalle_pedido where codigo_pedido="+id);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                DetallePedido p=new DetallePedido(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getFloat(5), rs.getFloat(6));
            lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("PedidoDB");
        }
        return lista;
    }
     
     public static boolean insertarPedido(EncaPedido en, ArrayList<DetallePedido> de) {
        boolean rpta = false;
        try {
            Connection cn = Coneccion.getConexion();
            CallableStatement cl = cn.prepareCall("call PKPROYECTO.spInsertaEncabP (?,?,?,?,?)");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setInt(2, en.getCODIGO_PROVEEDOR());
            cl.setFloat(3, en.getSUBTOTAL());
            cl.setFloat(4, en.getIMPUESTO());
            cl.setFloat(5, en.getTOTAL());
            int i = cl.executeUpdate();
            int i2 = 0;

            en.setCODIGO_PEDIDO(cl.getInt(1));
            

            CallableStatement cl2 = cn.prepareCall("call PKPROYECTO.spInsertaDetalleP (?,?,?,?,?,?)");
            for (DetallePedido aux : de) {
                cl2.setInt(1, en.getCODIGO_PEDIDO());
                cl2.setInt(2, aux.getCODIGO_PRODUCTO());
                cl2.setString(3, aux.getNOMBRE_INSUMO());
                cl2.setFloat(4, aux.getCANTIDAD());
                cl2.setFloat(5, aux.getSUBTOTAL_LINEA());
                cl2.setFloat(6, aux.getCOSTO_UNITARIO());
                i2 = cl2.executeUpdate();
            }
            if(i2 == 1){
                rpta = true;
            }
        } catch (Exception e) {
            System.out.println("Error en Pedido DB");
        }

        return rpta;
    }
}
