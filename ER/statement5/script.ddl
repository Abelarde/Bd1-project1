
CREATE TABLE armado (
    parte_idparte  INTEGER NOT NULL,
    etapa_idetapa  INTEGER NOT NULL
);
ALTER TABLE armado
    ADD CONSTRAINT armado_etapa_fk FOREIGN KEY ( etapa_idetapa )
        REFERENCES etapa ( idetapa);

ALTER TABLE armado
    ADD CONSTRAINT armado_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

CREATE TABLE bodega (
    idbodega                 INTEGER NOT NULL,
    direccion                VARCHAR2(255),
    tipobodega_idtipobodega  INTEGER NOT NULL,
    empleado_idempleado      INTEGER NOT NULL
);


ALTER TABLE bodega ADD CONSTRAINT bodega_pk PRIMARY KEY(idbodega);
ALTER TABLE bodega
    ADD CONSTRAINT bodega_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);

ALTER TABLE bodega
    ADD CONSTRAINT bodega_tipobodega_fk FOREIGN KEY ( tipobodega_idtipobodega )
        REFERENCES tipobodega ( idtipobodega);

CREATE TABLE cliente (
    idcliente    INTEGER NOT NULL,
    nombre       VARCHAR2(255) NOT NULL,
    direccion    VARCHAR2(255),
    pais_idpais  INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY(idcliente);
ALTER TABLE cliente
    ADD CONSTRAINT cliente_pais_fk FOREIGN KEY ( pais_idpais )
        REFERENCES pais ( idpais);

CREATE TABLE clientereclamo (
    idclientereclamo   INTEGER NOT NULL,
    horafecha          DATE NOT NULL,
    cliente_idcliente  INTEGER NOT NULL,
    costototal         NUMBER(10, 2) NOT NULL
);

ALTER TABLE clientereclamo ADD CONSTRAINT clientereclamo_pk PRIMARY KEY(idclientereclamo);
ALTER TABLE clientereclamo
    ADD CONSTRAINT clientereclamo_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente);

CREATE TABLE color (
    idcolor  INTEGER NOT NULL,
    nombre   VARCHAR2(255) NOT NULL
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY(idcolor);

CREATE TABLE compra (
    idcompra               INTEGER NOT NULL,
    proveedor_idproveedor  INTEGER NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY(idcompra);
ALTER TABLE compra
    ADD CONSTRAINT compra_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor);

CREATE TABLE detalleclientereclamo ( 
    clientereclamo_idclientereclamo  INTEGER NOT NULL,
    parte_idparte                    INTEGER NOT NULL,
    empleado_idempleado              INTEGER NOT NULL
);
ALTER TABLE detalleclientereclamo
    ADD CONSTRAINT detalleclientereclamo_clientereclamo_fk FOREIGN KEY ( clientereclamo_idclientereclamo )
        REFERENCES clientereclamo ( idclientereclamo);


ALTER TABLE detalleclientereclamo
    ADD CONSTRAINT detalleclientereclamo_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);

ALTER TABLE detalleclientereclamo
    ADD CONSTRAINT detalleclientereclamo_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

CREATE TABLE detallecompra (
    parte_idparte    INTEGER NOT NULL,
    compra_idcompra  INTEGER NOT NULL
);
ALTER TABLE detallecompra
    ADD CONSTRAINT detallecompra_compra_fk FOREIGN KEY ( compra_idcompra )
        REFERENCES compra ( idcompra);

ALTER TABLE detallecompra
    ADD CONSTRAINT detallecompra_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

CREATE TABLE detallefactura (
    factura_idfactura  INTEGER NOT NULL,
    parte_idparte      INTEGER NOT NULL
);
ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_factura_fk FOREIGN KEY ( factura_idfactura )
        REFERENCES factura ( idfactura);

ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

CREATE TABLE detallereclamo (
    reclamo_idreclamo  INTEGER NOT NULL,
    parte_idparte      INTEGER NOT NULL
);
ALTER TABLE detallereclamo
    ADD CONSTRAINT detallereclamo_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

ALTER TABLE detallereclamo
    ADD CONSTRAINT detallereclamo_reclamo_fk FOREIGN KEY ( reclamo_idreclamo )
        REFERENCES reclamo ( idreclamo);

CREATE TABLE empleado (
    idempleado                         INTEGER NOT NULL,
    nombre                             VARCHAR2(255) NOT NULL,
    direccion                          VARCHAR2(255),
    telefono                           INTEGER,
    correoelectronico                  VARCHAR2(255), 
    lineaensamblaje_idlineaensamblaje  INTEGER NOT NULL,
    horaentrada                        DATE NOT NULL,
    horasalida                         DATE,
    empleado_idempleado                INTEGER
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY(idempleado);
ALTER TABLE empleado
    ADD CONSTRAINT empleado_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);

ALTER TABLE empleado
    ADD CONSTRAINT empleado_lineaensamblaje_fk FOREIGN KEY ( lineaensamblaje_idlineaensamblaje )
        REFERENCES lineaensamblaje ( idlineaensamblaje);

CREATE TABLE estadoetapa (
    idestadoetapa  INTEGER NOT NULL,
    nombre         VARCHAR2(255) NOT NULL
);

ALTER TABLE estadoetapa ADD CONSTRAINT estadoetapa_pk PRIMARY KEY(idestadoetapa);

CREATE TABLE etapa (
    idetapa  INTEGER NOT NULL,
    nombre   VARCHAR2(255) NOT NULL,
    costo    NUMBER(10, 2) NOT NULL,
    gasto    NUMBER(10, 2) NOT NULL
);

ALTER TABLE etapa ADD CONSTRAINT etapa_pk PRIMARY KEY(idetapa);

CREATE TABLE etapa_estado (
    etapa_idetapa              INTEGER NOT NULL,
    estadoetapa_idestadoetapa  INTEGER NOT NULL
);
ALTER TABLE etapa_estado
    ADD CONSTRAINT etapa_estado_estadoetapa_fk FOREIGN KEY ( estadoetapa_idestadoetapa )
        REFERENCES estadoetapa ( idestadoetapa);

ALTER TABLE etapa_estado
    ADD CONSTRAINT etapa_estado_etapa_fk FOREIGN KEY ( etapa_idetapa )
        REFERENCES etapa ( idetapa);

CREATE TABLE factura (
    idfactura          INTEGER NOT NULL,
    monto              NUMBER(10, 2) NOT NULL,
    cliente_idcliente  INTEGER NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY(idfactura);
ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente);

CREATE TABLE jornada (
    idjornada            INTEGER NOT NULL,
    nombre               VARCHAR2(255) NOT NULL,
    empleado_idempleado  INTEGER
);

ALTER TABLE jornada ADD CONSTRAINT jornada_pk PRIMARY KEY(idjornada);
ALTER TABLE jornada
    ADD CONSTRAINT jornada_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);

CREATE TABLE lineaensamblaje (
    idlineaensamblaje                              INTEGER NOT NULL,
    nombre                                         VARCHAR2(255) NOT NULL, 
    tipolineadeensamblaje_idtipolineadeensamblaje  INTEGER NOT NULL,
    empleado_idempleado                            INTEGER NOT NULL
);
ALTER TABLE producto_parte
    ADD CONSTRAINT producto_parte_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

ALTER TABLE producto_parte
    ADD CONSTRAINT producto_parte_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto);

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_pais_fk FOREIGN KEY ( pais_idpais )
        REFERENCES pais ( idpais);

ALTER TABLE puesto_empleado
    ADD CONSTRAINT puesto_empleado_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);

ALTER TABLE puesto_empleado
    ADD CONSTRAINT puesto_empleado_puesto_fk FOREIGN KEY ( puesto_idpuesto )
        REFERENCES puesto ( idpuesto);

ALTER TABLE lineaensamblaje ADD CONSTRAINT lineaensamblaje_pk PRIMARY KEY(idlineaensamblaje);

CREATE TABLE marcaproducto (
    idmarcaproducto  INTEGER NOT NULL,
    nombre           VARCHAR2(255) NOT NULL
);

ALTER TABLE marcaproducto ADD CONSTRAINT marcaproducto_pk PRIMARY KEY(idmarcaproducto);

CREATE TABLE pais (
    idpais  INTEGER NOT NULL,
    nombre  VARCHAR2(255) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY(idpais);

CREATE TABLE parte (
    idparte                 INTEGER NOT NULL,
    nombre                  VARCHAR2(255) NOT NULL,
    color_idcolor           INTEGER NOT NULL,
    tipoparte_idtipopartte  INTEGER NOT NULL
);

ALTER TABLE parte ADD CONSTRAINT parte_pk PRIMARY KEY(idparte);

CREATE TABLE parte_proveedor (
    parte_idparte          INTEGER NOT NULL,
    proveedor_idproveedor  INTEGER NOT NULL,
    garantia               INTEGER NOT NULL
);

CREATE TABLE producto (
    idproducto                     INTEGER NOT NULL,
    nombre                         VARCHAR2(255) NOT NULL,
    fechahoraterminado             DATE NOT NULL,
    empleado_idempleado            INTEGER NOT NULL,
    bodega_idbodega                INTEGER NOT NULL,
    costo                          NUMBER(10, 2) NOT NULL,
    marcaproducto_idmarcaproducto  INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY(idproducto);
ALTER TABLE lineaensamblaje
    ADD CONSTRAINT lineaensamblaje_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);
        ALTER TABLE parte
    ADD CONSTRAINT parte_tipoparte_fk FOREIGN KEY ( tipoparte_idtipopartte )
        REFERENCES tipoparte ( idtipopartte);
        ALTER TABLE reclamo
    ADD CONSTRAINT reclamo_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor);

ALTER TABLE parte4
    ADD CONSTRAINT parte4_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

ALTER TABLE parte4
    ADD CONSTRAINT parte4_parte_fkv1 FOREIGN KEY ( parte_idparte1 )
        REFERENCES parte ( idparte);

ALTER TABLE producto
    ADD CONSTRAINT producto_bodega_fk FOREIGN KEY ( bodega_idbodega )
        REFERENCES bodega ( idbodega);

ALTER TABLE producto
    ADD CONSTRAINT producto_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado);


ALTER TABLE producto_lineaensamblaje
    ADD CONSTRAINT producto_lineaensamblaje_lineaensamblaje_fk FOREIGN KEY ( lineaensamblaje_idlineaensamblaje )
        REFERENCES lineaensamblaje ( idlineaensamblaje);


ALTER TABLE producto_lineaensamblaje
    ADD CONSTRAINT producto_lineaensamblaje_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto);

ALTER TABLE producto
    ADD CONSTRAINT producto_marcaproducto_fk FOREIGN KEY ( marcaproducto_idmarcaproducto )
        REFERENCES marcaproducto ( idmarcaproducto);


ALTER TABLE lineaensamblaje
    ADD CONSTRAINT lineaensamblaje_tipolineadeensamblaje_fk FOREIGN KEY ( tipolineadeensamblaje_idtipolineadeensamblaje )
        REFERENCES tipolineadeensamblaje ( idtipolineadeensamblaje);

ALTER TABLE parte
    ADD CONSTRAINT parte_color_fk FOREIGN KEY ( color_idcolor )
        REFERENCES color ( idcolor);

ALTER TABLE parte_proveedor
    ADD CONSTRAINT parte_proveedor_parte_fk FOREIGN KEY ( parte_idparte )
        REFERENCES parte ( idparte);

ALTER TABLE parte_proveedor
    ADD CONSTRAINT parte_proveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor);

CREATE TABLE producto_lineaensamblaje (
    producto_idproducto                INTEGER NOT NULL, 
    lineaensamblaje_idlineaensamblaje  INTEGER NOT NULL
);

CREATE TABLE producto_parte (
    producto_idproducto  INTEGER NOT NULL,
    parte_idparte        INTEGER NOT NULL
);

CREATE TABLE proveedor (
    idproveedor  INTEGER NOT NULL,
    nombre       VARCHAR2(255) NOT NULL,
    telefono     INTEGER,
    compania     VARCHAR2(255) NOT NULL,
    pais_idpais  INTEGER NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY(idproveedor);

CREATE TABLE puesto (
    idpuesto  INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_pk PRIMARY KEY(idpuesto);

CREATE TABLE puesto_empleado (
    puesto_idpuesto      INTEGER NOT NULL,
    empleado_idempleado  INTEGER NOT NULL
);

CREATE TABLE reclamo (
    idreclamo              INTEGER NOT NULL,
    proveedor_idproveedor  INTEGER NOT NULL
);

ALTER TABLE reclamo ADD CONSTRAINT reclamo_pk PRIMARY KEY(idreclamo);


CREATE TABLE tipobodega (
    idtipobodega  INTEGER NOT NULL,
    nombre        VARCHAR2(255) NOT NULL
);

ALTER TABLE tipobodega ADD CONSTRAINT tipobodega_pk PRIMARY KEY(idtipobodega);

CREATE TABLE tipolineadeensamblaje (
    idtipolineadeensamblaje  INTEGER NOT NULL,
    nombre                   VARCHAR2(255) NOT NULL
);

ALTER TABLE tipolineadeensamblaje ADD CONSTRAINT tipolineadeensamblaje_pk PRIMARY KEY(idtipolineadeensamblaje);

CREATE TABLE tipoparte (
    idtipopartte  INTEGER NOT NULL,
    nombre        VARCHAR2(255) NOT NULL
);

ALTER TABLE tipoparte ADD CONSTRAINT tipoparte_pk PRIMARY KEY(idtipopartte);





































