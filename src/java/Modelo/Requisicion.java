/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author Trabajo Ing Intel
 */
public class Requisicion {
    private int codigo_rebajado;
    private int codigo_producto;
    private String nombre_prod;
    private Date fecha;
    private float unidades;

    public Requisicion(int codigo_rebajado, int codigo_producto, String nombre_prod, Date fecha, float unidades) {
        this.codigo_rebajado = codigo_rebajado;
        this.codigo_producto = codigo_producto;
        this.nombre_prod = nombre_prod;
        this.fecha = fecha;
        this.unidades = unidades;
    }

    public Requisicion(int codigo_producto, Date fecha, float unidades) {
        this.codigo_producto = codigo_producto;
        this.fecha = fecha;
        this.unidades = unidades;
    }

    public Requisicion(int codigo_producto, float unidades) {
        this.codigo_producto = codigo_producto;
        this.unidades = unidades;
    }

    public int getCodigo_rebajado() {
        return codigo_rebajado;
    }

    public void setCodigo_rebajado(int codigo_rebajado) {
        this.codigo_rebajado = codigo_rebajado;
    }

    public int getCodigo_producto() {
        return codigo_producto;
    }

    public void setCodigo_producto(int codigo_producto) {
        this.codigo_producto = codigo_producto;
    }

    public String getNombre_prod() {
        return nombre_prod;
    }

    public void setNombre_prod(String nombre_prod) {
        this.nombre_prod = nombre_prod;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public float getUnidades() {
        return unidades;
    }

    public void setUnidades(float unidades) {
        this.unidades = unidades;
    }

    

    
}
