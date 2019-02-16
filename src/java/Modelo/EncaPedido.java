/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author Trabajo Ing Intel
 */
public class EncaPedido {
     private int CODIGO_PEDIDO;
private int CODIGO_PROVEEDOR;
private Date FECHA;
private float SUBTOTAL;
private float IMPUESTO;
private float TOTAL;
String nombreProveedor;

    public EncaPedido(int CODIGO_PEDIDO, int CODIGO_PROVEEDOR, Date FECHA, float SUBTOTAL, float IMPUESTO, float TOTAL) {
        this.CODIGO_PEDIDO = CODIGO_PEDIDO;
        this.CODIGO_PROVEEDOR = CODIGO_PROVEEDOR;
        this.FECHA = FECHA;
        this.SUBTOTAL = SUBTOTAL;
        this.IMPUESTO = IMPUESTO;
        this.TOTAL = TOTAL;
    }

    public EncaPedido(int CODIGO_PROVEEDOR, float SUBTOTAL) {
        this.CODIGO_PROVEEDOR = CODIGO_PROVEEDOR;
        this.SUBTOTAL = SUBTOTAL;
    }

    public EncaPedido(int CODIGO_PROVEEDOR, String nombreProveedor) {
        this.CODIGO_PROVEEDOR = CODIGO_PROVEEDOR;
        this.nombreProveedor = nombreProveedor;
    }

    
    public EncaPedido(int CODIGO_PROVEEDOR) {
        this.CODIGO_PROVEEDOR = CODIGO_PROVEEDOR;
    }

   

    public EncaPedido() {
    }

    
    
    public int getCODIGO_PEDIDO() {
        return CODIGO_PEDIDO;
    }

    public void setCODIGO_PEDIDO(int CODIGO_PEDIDO) {
        this.CODIGO_PEDIDO = CODIGO_PEDIDO;
    }

    public int getCODIGO_PROVEEDOR() {
        return CODIGO_PROVEEDOR;
    }

    public void setCODIGO_PROVEEDOR(int CODIGO_PROVEEDOR) {
        this.CODIGO_PROVEEDOR = CODIGO_PROVEEDOR;
    }

    public Date getFECHA() {
        return FECHA;
    }

    public void setFECHA(Date FECHA) {
        this.FECHA = FECHA;
    }

    public float getSUBTOTAL() {
        return SUBTOTAL;
    }

    public void setSUBTOTAL(float SUBTOTAL) {
        this.SUBTOTAL = SUBTOTAL;
    }

    public float getIMPUESTO() {
        return IMPUESTO;
    }

    public void setIMPUESTO(float IMPUESTO) {
        this.IMPUESTO = IMPUESTO;
    }

    public float getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(float TOTAL) {
        this.TOTAL = TOTAL;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }
    
    
}
