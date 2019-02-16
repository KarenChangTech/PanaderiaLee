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
public class Producto {
    private int codigo_producto;
    private String nombre_producto;
    private float cantidad;
    private float costo_unitario;
    private int codigo_familia;
    private int minimo;
    private int maximo;
    private float precio_total;
    private int estado;
    private int condicion;
    public Producto() {
    }

    public Producto(int codigo_producto, String nombre_producto, float cantidad, float costo_unitario, int codigo_familia, int minimo, int maximo, float precio_total, int estado, int condicion) {
        this.codigo_producto = codigo_producto;
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.costo_unitario = costo_unitario;
        this.codigo_familia = codigo_familia;
        this.minimo = minimo;
        this.maximo = maximo;
        this.precio_total = precio_total;
        this.estado = estado;
        this.condicion = condicion;
    }

    

    
    public Producto(int codigo_producto, String nombre_producto, float cantidad, float costo_unitario, int codigo_familia, int minimo, int maximo, float precio_total) {
        this.codigo_producto = codigo_producto;
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.costo_unitario = costo_unitario;
        this.codigo_familia = codigo_familia;
        this.minimo = minimo;
        this.maximo = maximo;
        this.precio_total = precio_total;
    }

    public Producto(String nombre_producto, float cantidad, float costo_unitario, int codigo_familia, int minimo, int maximo) {
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.costo_unitario = costo_unitario;
        this.codigo_familia = codigo_familia;
        this.minimo = minimo;
        this.maximo = maximo;
    }

    public Producto(int codigo_producto, String nombre_producto, float cantidad, float costo_unitario, int codigo_familia, int minimo, int maximo) {
        this.codigo_producto = codigo_producto;
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.costo_unitario = costo_unitario;
        this.codigo_familia = codigo_familia;
        this.minimo = minimo;
        this.maximo = maximo;
    }

    public Producto(int codigo_producto, String nombre_producto, float cantidad, float costo_unitario) {
        this.codigo_producto = codigo_producto;
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.costo_unitario = costo_unitario;
    }

    

    public int getCodigo_producto() {
        return codigo_producto;
    }

    public void setCodigo_producto(int codigo_producto) {
        this.codigo_producto = codigo_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }

    public float getCosto_unitario() {
        return costo_unitario;
    }

    public void setCosto_unitario(float costo_unitario) {
        this.costo_unitario = costo_unitario;
    }

    public int getCodigo_familia() {
        return codigo_familia;
    }

    public void setCodigo_familia(int codigo_familia) {
        this.codigo_familia = codigo_familia;
    }

    public int getMinimo() {
        return minimo;
    }

    public void setMinimo(int minimo) {
        this.minimo = minimo;
    }

    public int getMaximo() {
        return maximo;
    }

    public void setMaximo(int maximo) {
        this.maximo = maximo;
    }

    public float getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(float precio_total) {
        this.precio_total = precio_total;
    }

    public int getCondicion() {
        return condicion;
    }

    public void setCondicion(int condicion) {
        this.condicion = condicion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
    
    
}
