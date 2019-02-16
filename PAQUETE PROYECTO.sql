CREATE OR REPLACE PACKAGE PKPROYECTO
as
--FUNCIONES---
function consultaProductoFam(vid in number) return sys_refcursor;
function loginC(usu in varchar2,con in varchar2) return sys_refcursor;
function calculaTotalProducto(vprec in number, vcant in number) return number;
function calculaCantidadProducto(vid in number, vcant in number)return number;
function fn_listaRequi return sys_refcursor;
function consultaProveedor(vid in number) return sys_refcursor;
function consultaProducto(vid in number) return sys_refcursor;
--PROCEDIMIENTOS--
procedure actualizaPro(vid in number,vnom in varchar2,vdir in varchar2,vtel in varchar2,vemail in varchar2);
procedure ingresaPro(vnom in varchar2,vdir in varchar2,vtel in varchar2,vemail in varchar2);
 procedure eliPro(vid in number);
 procedure actualizaProducto(vid in number,vnom in varchar2,vcan in number,vcosto in number,vfam in number,vmin in number,vmax in number);
  procedure ingresaProducto(vnom in varchar2,vcan in number,vcost in float,vfam in number,vmin in number, vmax in number);
procedure eliminaProducto(vid in number);
 procedure ingresaRequisicion(vprod in number,vcan in number);
  procedure spInsertaEncabP(vid out number,vprov in number,vsub in float,vim in float,vtot in float);
  procedure spInsertaDetalleP(vid in number,vidp in number,nom in varchar2,cant in number,sub in float,cos in float);
  procedure SPACTUALIZASTOCK(VID IN NUMBER, CANT IN NUMBER);
  PROCEDURE SP_AUDI_REQUI(VID IN NUMBER,CANT IN NUMBER,NCANT IN NUMBER);
END PKPROYECTO;



CREATE OR REPLACE PACKAGE BODY PKPROYECTO
as
--FUNCIONES---
function consultaProductoFam(vid in number) 
     return sys_refcursor 
     is 
    VSQL VARCHAR2(700);
    DATOS sys_refcursor;
    begin
    VSQL:='select * from producto where CODIGO_FAMILIA=:vid and estado=1 ORDER BY CODIGO_PRODUCTO';
    open DATOS for VSQL USING vid;
    return DATOS;
    end;
    ----------------------------------------------------------------------------------------------------------
    function loginC(usu in varchar2,con in varchar2) return sys_refcursor is 
    usuario sys_refcursor;
    begin
    open usuario for select * from usuario where username=usu and contrasena=con;
    return (usuario);
    end;
    -----------------------------------------------------------------------------------------------------------
    function calculaTotalProducto(vprec in number, vcant in number)
    return number
    as
    res number;
    begin
    res:=0;
    res:=vprec*vcant;
    return res;
    end;
    -----------------------------------------------------------------------------------------------------------------
    function fn_listaRequi 
    return sys_refcursor 
    is 
    Datos sys_refcursor;
    begin
    open Datos for 
                  select r.codigo_rebajo,r.codigo_producto,p.nombre_producto,r.unidades,r.fecha 
                  from requision_insumos r,producto p
                  where p.codigo_producto=r.codigo_producto order by r.codigo_rebajo;
    return (Datos);
    end;
    -----------------------------------------------------------------------------------------------------------------
    function calculaCantidadProducto(vid in number, vcant in number)
      return number
      as
      res number;
      cantidad number;
      begin
      res:=0;
      select cantidad into cantidad from producto where codigo_producto=vid;
      res:=cantidad-vcant;
      return res;
      end;
      --------------------------------------------------------------------------------------------------------
      function consultaProveedor(vid in number) 
     return sys_refcursor 
     is 
    proveedor sys_refcursor;
    begin
    open proveedor for select * from proveedor where CODIGO_PROVEEDOR=vid;
    return (proveedor);
    end;
    ----------------------------------------------------------------------------------------------------------
    function consultaProducto(vid in number) 
     return sys_refcursor 
     is 
    producto sys_refcursor;
    begin
    open producto for select * from producto where CODIGO_PRODUCTO=vid;
    return (producto);
    end;
    ---PROCEDIMIENTOS---
    procedure actualizaPro(vid in number,vnom in varchar2,vdir in varchar2,vtel in varchar2,vemail in varchar2)
    as
     VMSJ VARCHAR2(500);
     VCODIGO NUMBER;
    begin
    update proveedor set nombre=vnom,direccion=vdir,telefono=vtel,email=vemail where codigo_proveedor=vid;
    EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
   WHEN OTHERS THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
    end;
    -------------------------------------------------------------------------------------------------------------------
    procedure ingresaPro(vnom in varchar2,vdir in varchar2,vtel in varchar2,vemail in varchar2)
    as
    VMSJ VARCHAR2(500);
    VCODIGO NUMBER;
    begin
    insert into proveedor (codigo_proveedor,nombre,direccion,telefono,email)
    values (idProve.nextval,vnom,vdir,vtel,vemail);
    EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
   WHEN OTHERS THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
    end;
    -------------------------------------------------------------------------------------------------
    procedure eliPro(vid in number)
    as
    begin
    delete proveedor where codigo_proveedor=vid;
    end;
 --------------------------------------------------------------------------------------------------
 procedure ingresaProducto(vnom in varchar2,vcan in number,vcost in float,vfam in number,vmin in number, vmax in number)
    as
    vtotal number;
    begin
    vtotal:=0;
    vtotal:=PKPROYECTO.calculaTotalProducto(vcost,vcan);
    insert into producto (codigo_producto,nombre_producto,cantidad,costo_unitario,codigo_familia,minimo,maximo,precio_total)
    values (idProdu.nextval,vnom,vcan,vcost,vfam,vmin,vmax,vtotal);
    end;
    
    ---------------------------------------------------------------------------------------------------------------
    procedure actualizaProducto(vid in number,vnom in varchar2,vcan in number,vcosto in number,vfam in number,vmin in number,vmax in number)
    as
    total number;
    VMSJ VARCHAR2(500);
     VCODIGO NUMBER;
    begin
    total:=vcan*vcosto;
    update producto set nombre_producto=vnom,cantidad=vcan,costo_unitario=vcosto,codigo_familia=vfam,minimo=vmin,maximo=vmax,precio_total=total where codigo_producto=vid;
    EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
   WHEN OTHERS THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
    end; 
    
    -------------------------------------------------------------------------------------------------------------
    procedure eliminaProducto(vid in number)
    as
    begin
    update producto set estado=0 where CODIGO_PRODUCTO=vid;
    end;
    ---------------------------------------------------------------------------------------------------------------
    procedure ingresaRequisicion(vprod in number,vcan in number)
    as
    VMSJ VARCHAR2(500);
    VCODIGO NUMBER;
    vtotal number;
    ncantidad number;
    begin
    ncantidad:=0;
    ncantidad:=PKPROYECTO.calculaCantidadProducto(vprod,vcan);
    
    insert into requision_insumos (codigo_rebajo,codigo_producto,fecha,unidades)
    values (idRequi.nextval,vprod,sysdate,vcan);
    update producto set cantidad=ncantidad where codigo_producto=vprod;
    EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
   WHEN OTHERS THEN 
     VCODIGO  := SQLCODE;
     VMSJ := SQLERRM;
     INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
    end;
    --------------------------------------------------------------------------------------------------------------
    procedure spInsertaEncabP(vid out number,vprov in number,vsub in float,vim in float,vtot in float)
          as
          begin
          select idEncaP.nextval into vid from dual;
          insert into Encabezado_pedido values (vid,vprov,TO_DATE(sysdate, 'dd/mm/yyyy hh24:mi:ss'),vsub,vim,vtot);
          end;
  --------------------------------------------------------------------------------------------------------------
  procedure spInsertaDetalleP(vid in number,vidp in number,nom in varchar2,cant in number,sub in float,cos in float)
          as
           VMSJ VARCHAR2(500);
          VCODIGO NUMBER;
          begin
          insert into detalle_pedido values(vid,vidp,nom,cant,sub,cos);
          EXCEPTION 
             WHEN NO_DATA_FOUND THEN 
               VCODIGO  := SQLCODE;
               VMSJ := SQLERRM;
               INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
             WHEN OTHERS THEN 
               VCODIGO  := SQLCODE;
               VMSJ := SQLERRM;
               INSERT INTO auditoria_errores(CODIGO, MSJ, FECHA ) VALUES (VCODIGO, VMSJ, SYSDATE);
          end;
          -------------------------------------------------------------------------------------------------------------------
          procedure SPACTUALIZASTOCK(VID IN NUMBER, CANT IN NUMBER)
       AS
       VCANT NUMBER;
       NERR NUMBER;
       VMSJ VARCHAR2(600);
       VMAX NUMBER;
       VMIN NUMBER;
       BEGIN
       SELECT CANTIDAD,maximo,minimo INTO VCANT,VMAX,VMIN FROM PRODUCTO WHERE CODIGO_PRODUCTO=VID;
       VCANT:=VCANT+CANT;
       IF VCANT>VMAX THEN
       UPDATE PRODUCTO SET CANTIDAD=VCANT, CONDICION=0 WHERE CODIGO_PRODUCTO=VID;
       ELSE
       UPDATE PRODUCTO SET CANTIDAD=VCANT, CONDICION=1 WHERE CODIGO_PRODUCTO=VID;
       END IF;
       END;
      ----------------------------------------------------------------------------------------------------------
      PROCEDURE SP_AUDI_REQUI(VID IN NUMBER,CANT IN NUMBER,NCANT IN NUMBER)
       AS
       VMIN NUMBER;
       VCANT NUMBER;
       BEGIN
        INSERT INTO control_requi ( FECHA, USUARIO, ID_PROD, OLD_CANT,NEW_CANT)
       VALUES (SYSDATE,USER,VID,CANT,NCANT); 
       SELECT CANTIDAD,minimo INTO VCANT,VMIN FROM PRODUCTO WHERE CODIGO_PRODUCTO=VID;
       IF NCANT<VMIN THEN
       UPDATE PRODUCTO SET CONDICION=0 WHERE CODIGO_PRODUCTO=VID;
       ELSE
       UPDATE PRODUCTO SET CONDICION=1 WHERE CODIGO_PRODUCTO=VID;
       END IF;
       END;
END PKPROYECTO;