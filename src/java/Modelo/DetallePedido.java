/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Trabajo Ing Intel
 */
public class DetallePedido {
private int CODIGO_PEDIDO;
private int CODIGO_PRODUCTO;
private String NOMBRE_INSUMO;
private float CANTIDAD;
private float SUBTOTAL_LINEA;
private float COSTO_UNITARIO;

    public DetallePedido(int CODIGO_PEDIDO, int CODIGO_PRODUCTO, String NOMBRE_INSUMO, float CANTIDAD, float SUBTOTAL_LINEA, float COSTO_UNITARIO) {
        this.CODIGO_PEDIDO = CODIGO_PEDIDO;
        this.CODIGO_PRODUCTO = CODIGO_PRODUCTO;
        this.NOMBRE_INSUMO = NOMBRE_INSUMO;
        this.CANTIDAD = CANTIDAD;
        this.SUBTOTAL_LINEA = SUBTOTAL_LINEA;
        this.COSTO_UNITARIO = COSTO_UNITARIO;
    }

    public DetallePedido(int CODIGO_PRODUCTO, String NOMBRE_INSUMO, float CANTIDAD, float SUBTOTAL_LINEA, float COSTO_UNITARIO) {
        this.CODIGO_PRODUCTO = CODIGO_PRODUCTO;
        this.NOMBRE_INSUMO = NOMBRE_INSUMO;
        this.CANTIDAD = CANTIDAD;
        this.SUBTOTAL_LINEA = SUBTOTAL_LINEA;
        this.COSTO_UNITARIO = COSTO_UNITARIO;
    }

    public int getCODIGO_PEDIDO() {
        return CODIGO_PEDIDO;
    }

    public void setCODIGO_PEDIDO(int CODIGO_PEDIDO) {
        this.CODIGO_PEDIDO = CODIGO_PEDIDO;
    }

    public int getCODIGO_PRODUCTO() {
        return CODIGO_PRODUCTO;
    }

    public void setCODIGO_PRODUCTO(int CODIGO_PRODUCTO) {
        this.CODIGO_PRODUCTO = CODIGO_PRODUCTO;
    }

    public String getNOMBRE_INSUMO() {
        return NOMBRE_INSUMO;
    }

    public void setNOMBRE_INSUMO(String NOMBRE_INSUMO) {
        this.NOMBRE_INSUMO = NOMBRE_INSUMO;
    }

    public float getCANTIDAD() {
        return CANTIDAD;
    }

    public void setCANTIDAD(float CANTIDAD) {
        this.CANTIDAD = CANTIDAD;
    }

    public float getSUBTOTAL_LINEA() {
        return SUBTOTAL_LINEA;
    }

    public void setSUBTOTAL_LINEA(float SUBTOTAL_LINEA) {
        this.SUBTOTAL_LINEA = SUBTOTAL_LINEA;
    }

    public float getCOSTO_UNITARIO() {
        return COSTO_UNITARIO;
    }

    public void setCOSTO_UNITARIO(float COSTO_UNITARIO) {
        this.COSTO_UNITARIO = COSTO_UNITARIO;
    }

    



}
