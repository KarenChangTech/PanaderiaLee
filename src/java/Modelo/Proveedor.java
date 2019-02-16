
package Modelo;


public class Proveedor {
private int codigoProve;
private String nombre,direccion,telefono,email;

    public Proveedor() {
    }

    public Proveedor(String nombre, String direccion, String telefono, String email) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public Proveedor(int codigoProve, String nombre, String direccion, String telefono, String email) {
        this.codigoProve = codigoProve;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public int getCodigoProve() {
        return codigoProve;
    }

    public void setCodigoProve(int codigoProve) {
        this.codigoProve = codigoProve;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    

}
